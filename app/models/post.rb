# frozen_string_literal: true

class Post < ApplicationRecord
  # Post gali tureti daug komentaru
  has_many :comments, dependent: :destroy
  # nurodau pavadinima, kad reikalinga uzpildyti ir nurodau ilgi min 5 simboliai
  validates :title, presence: true, length: { minimum: 5 }
end
