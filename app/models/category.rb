class Category < ApplicationRecord
    has_many :products
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment :image, presence: true
    do_not_validate_attachment_file_type :image

    #apply default scope for all query of Category
    default_scope {where is_deleted: false}
end
