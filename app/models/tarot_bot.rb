class TarotBot < ApplicationRecord
    has_many :tarot_answers, dependent: :destroy
end
