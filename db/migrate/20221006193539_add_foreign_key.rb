class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_reference :invoices, :users, foreign_key: true
  end
end
