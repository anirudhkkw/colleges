class Student < ActiveRecord::Base
  belongs_to :mentor
  has_and_belongs_to_many :college
end