class Kitten < ApplicationRecord
validates :name, :cuteness, :softness, :age, presence: true  
end
