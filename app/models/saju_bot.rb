class SajuBot < ApplicationRecord
	has_many :saju_answers, dependent: :destroy
end
