class Task < ApplicationRecord
 belongs_to :project

 validates :title, :item, :deadline, presence: true
end
