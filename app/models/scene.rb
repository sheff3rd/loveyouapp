class Scene < ApplicationRecord
  has_one_attached :thumbnail
  has_one_attached :soundtrack
end
