class Apprenticeship < ActiveRecord::Base
  belongs_to :student
  belongs_to :master, class_name: 'Philosopher', foreign_key: 'philosopher_id'
end
