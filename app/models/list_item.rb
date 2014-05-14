class ListItem < ActiveRecord::Base
  default_scope { order('updated_at DESC').limit(10) }

  belongs_to :exhibition
  belongs_to :list
end
