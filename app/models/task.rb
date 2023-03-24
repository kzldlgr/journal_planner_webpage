class Task < ApplicationRecord
    validates :task_name, presence: true,
                          uniqueness: true
    validates :task_body, presence: true,
                          length: { minimum: 5}
    validates :status, presence: true
    validates :category_id, presence: true
    validates :start_time, presence: true

    belongs_to :category
end
