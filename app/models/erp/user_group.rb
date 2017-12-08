module Erp
  class UserGroup < ApplicationRecord
    validates :name, presence: true
    has_many :users
    #belongs_to :user, class_name: 'Erp::User', foreign_key: :manager_id, optional: true

    # Filters
    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []

      #keywords
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end

      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?

      return query
    end

    def self.search(params)
      query = self.order("created_at DESC")
      query = self.filter(query, params)

      return query
    end

    # data for dataselect ajax
    def self.dataselect(keyword='')
      query = self.all

      if keyword.present?
        keyword = keyword.strip.downcase
        query = query.where('LOWER(name) LIKE ?', "%#{keyword}%")
      end

      query = query.limit(8).map{|user_group| {value: user_group.id, text: user_group.name} }
    end

    # update permissions
    def update_permissions(permissions_params)
      arr = permissions_params.to_json
      self.permissions = arr
      self.save
    end

    # get permissions
    def get_permissions
      permissions = UserGroup.permissions_array
      saved_permissions = self.permissions.present? ? JSON.parse(self.permissions) : {}

      permissions.each do |h_group|
        h_group[1].each do |h_engine|
          h_engine[1].each do |h_controller|
            h_controller[1].each do |h_permission|
              if saved_permissions[h_group[0].to_s].present? and
                saved_permissions[h_group[0].to_s][h_engine[0].to_s].present? and
                saved_permissions[h_group[0].to_s][h_engine[0].to_s][h_controller[0].to_s].present?
                saved_permissions[h_group[0].to_s][h_engine[0].to_s][h_controller[0].to_s][h_permission[0].to_s].present? and
                  permissions[h_group[0]][h_engine[0]][h_controller[0]][h_permission[0]][:value] = saved_permissions[h_group[0].to_s][h_engine[0].to_s][h_controller[0].to_s][h_permission[0].to_s]['value']
              end
            end
          end
        end
      end

      permissions
    end

    # Permission array
    def self.permissions_array
      arr = {
        # Inventory
        inventory: {
          order_stock_checks: {
            schecks: {
              check: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              approve_order: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
            }
          },
          qdeliveries: {
            deliveries: {
              index: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              create: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              update: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              sales_orders: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              purchase_orders: {
                value: 'yes',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
            }
          },          
        },        
        system: {
          system: {
            system: {
              settings: {
                value: 'no',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              backup: {
                value: 'no',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
              restore: {
                value: 'no',
                options: [
                  {value: 'yes', text: 'Có'},
                  {value: 'no', text: 'Không'},
                ],
              },
            },
          },
        },
      }

      arr
    end
  end
end