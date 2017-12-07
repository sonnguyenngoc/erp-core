class CreateErpEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_employees do |t|
      t.string :code
      t.datetime :birthdate
      t.decimal :salary
      t.string :tax_code
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
