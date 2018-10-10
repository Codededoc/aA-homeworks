# table name: persons
#
# name        :string     not null
# house_id    :integer    not null

class Person < ActiveRecord::Base

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'

  validates :name, :house_id, presence: true

  def house
    House.find(self.house_id)
  end

end
