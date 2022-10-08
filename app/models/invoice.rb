class Invoice < ApplicationRecord
  validates :company_name, :price, :paid_with, presence: true

  # belongs_to :user

  CATEGORIES = ['Amber Bakery', 'RoExport', 'Monolith', 'Lithuanian Beer', 'Asorti Food', 'Marion', 'Cake World', 'Cypro Food',
                 'Imperial', 'Sitella Fruits', 'Ambassador Bakery', 'Dancle Romanian', 'Noble Wine', 'Baltic Foods', 'Ulan',
                'Lackmann', 'Leon', 'Bills', 'Holland Bazar', 'Tahtakale', 'Rambynas', 'Salary', 'Import', 'Other',
                'Foods 444', 'Lithuanica' ].sort
  PAID = ["Card", "Cash"]
end
