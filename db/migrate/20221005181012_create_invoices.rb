class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :company_name
      t.string :invoice_number
      t.float :price

      t.timestamps
    end
  end
end
