class ProductBill < ApplicationRecord
  belongs_to :product
  belongs_to :bill
  belongs_to :size
end
