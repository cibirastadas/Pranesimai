# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post # Nustatau sarysi tarp comment ir post
end
