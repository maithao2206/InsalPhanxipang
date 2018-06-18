class Bill < ApplicationRecord
  belongs_to :user
  has_many :product_bills
  scope :find_by_bill, -> billid {where bill_id: billid}
end
