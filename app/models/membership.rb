class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, presence: true
    validates :charge, presence: true
    validates :client_id, presence: true, uniqueness: { scope: :gym_id, error: "client cannot have more than one mebership in the same gym"}
end
