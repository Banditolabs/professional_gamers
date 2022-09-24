class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy #destroy allows you to take action on destroy while delete does not
    has_rich_text :body
end
