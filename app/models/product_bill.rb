class ProductBill < ApplicationRecord
  belongs_to :product
  belongs_to :bill
  belongs_to :size
  scope :find_by_bill_id, -> billid {where bill_id: billid}
end
