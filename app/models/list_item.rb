class ListItem < ActiveRecord::Base
  belongs_to :exhibition
  belongs_to :list
end
