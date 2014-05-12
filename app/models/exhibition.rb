class Exhibition < ActiveRecord::Base
  has_many :listItems
  has_many :lists, through: :listItems
end
