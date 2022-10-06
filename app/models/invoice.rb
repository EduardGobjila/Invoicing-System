class Invoice < ApplicationRecord
  validates :company_name, :price, :paid_with, presence: true

  belongs_to :users
end
