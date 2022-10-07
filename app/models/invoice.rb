class Invoice < ApplicationRecord
  validates :company_name, :price, :paid_with, presence: true

  # belongs_to :user

  CATEGORIES = ['Amber Bakery', 'RoExport', 'Monolith', 'Lithuanian Beer', 'Asorti Food', 'Marion', 'Cake World', 'Cypro Food',
                 'Imperial', 'Sitella Fruits', 'Ambassador Bakery', 'Dancle Romanian' ].sort
  PAID = ["Card", "Cash"]
end
