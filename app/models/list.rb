class List < ActiveRecord::Base
  has_many :listItems
  has_many :exhibitions, through: :listItems
end
