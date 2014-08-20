class Student < ActiveRecord::Base
  has_many :apprenticeships
  has_many :masters, through: :apprenticeships, class_name: 'Philosopher'
end
