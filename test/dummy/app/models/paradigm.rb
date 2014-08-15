class Paradigm < ActiveRecord::Base
  has_and_belongs_to_many :philosophers
  has_many :mentions
  belongs_to :examplar, class_name: "Philosopher", foreign_key: "exemplar_id"
end
