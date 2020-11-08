class Post < ApplicationRecord
    has_many :comments, :dependent => :destroy #Post gali tureti daug komentaru
    validates :title, presence: true, length: {minimum: 5} #nurodau pavadinima, kad reikalinga uzpildyti ir nurodau ilgi min 5 simboliai
end
