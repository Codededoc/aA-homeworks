# table name: houses
#
# name        :string


class House < ActiveRecord::Base

  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'

  validates :address, presence: true
  # def persons
  #   Person.where(house_id: self.id)
  # end

end
