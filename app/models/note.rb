class Note < ApplicationRecord
    belongs_to :user, class_name: 'User'
    belongs_to :room
    
    validates :comment,length: { maximum:200 }, presence: true
end
