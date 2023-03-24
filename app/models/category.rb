class Category < ApplicationRecord
    validates :category_name, presence: true,
                              uniqueness: true
    belongs_to :user
    has_many :tasks
end
