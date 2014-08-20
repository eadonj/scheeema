class Philosopher < ActiveRecord::Base
  has_and_belongs_to_many :paradigms
  has_many :exemplar_paradigms, class_name: "Paradigm", foreign_key: "exemplar_id"

  has_many :students, through: :apprenticeships
  has_many :apprenticeships

  has_one :esoteric_tool_set
  has_one :feathered_quill, through: :esoteric_tool_set
end
