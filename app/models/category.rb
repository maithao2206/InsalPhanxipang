class Category < ApplicationRecord
    has_many :products
    #apply default scope for all query of Category
    default_scope {where is_deleted: false}
end
