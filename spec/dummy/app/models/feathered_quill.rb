class FeatheredQuill < ActiveRecord::Base
  has_one :esoteric_tool_set
  has_one :philospher, through: :esoteric_tool_set
end
