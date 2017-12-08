class CreateErpDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_departments do |t|
      t.string :name
      t.text :description
      t.references :manager, index: true, references: :erp_users

      t.timestamps
    end
  end
end
