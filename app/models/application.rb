class Application < ApplicationRecord
    belongs_to :user
    
    has_many :steps
    has_many :contacts

    has_one :note
    has_one :job_offer
end
