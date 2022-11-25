class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :gym_id, :client_id, :charge
  belongs_to :client
end
