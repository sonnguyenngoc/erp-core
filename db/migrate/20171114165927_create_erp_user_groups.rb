class CreateErpUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_user_groups do |t|
      t.string :name
      t.text :description
      t.references :manager, index: true, references: :erp_users

      t.timestamps
    end
  end
end
