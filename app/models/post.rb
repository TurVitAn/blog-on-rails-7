class Post < ApplicationRecord
  belongs_to :author
  has_many :elements, dependent: :destroy
end
