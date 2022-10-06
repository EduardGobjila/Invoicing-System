class AddingToInvoices < ActiveRecord::Migration[7.0]
  def create
      add_foreign_key :invoices, :users
  end
end
