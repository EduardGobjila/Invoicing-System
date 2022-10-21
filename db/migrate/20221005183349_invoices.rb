class Invoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :paid_with, :string
    add_reference :invoices, :user, foreign_key: true
  end
end
