class Step < ApplicationRecord
    belongs_to :application

    validates :date, presence: true
    # validate :date_must_be_after_now

    def date_must_be_after_now
        errors.add(:date, "must be after now") unless date.present? && date >= Date.today
    end

end
