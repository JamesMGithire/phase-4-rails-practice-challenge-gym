class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_memebrships
  has_many :memberships
  def total_memebrships
    self.object.memberships.count
  end
end
