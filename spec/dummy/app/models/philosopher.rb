class Philosopher < ActiveRecord::Base
  has_and_belongs_to_many :paradigms
  has_many :exemplar_paradigms, class_name: "Paradigm", foreign_key: "exemplar_id"
end
