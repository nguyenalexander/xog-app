class AnimalsTags < ActiveRecord::Base
  belongs_to :animal
  belongs_to :tag
end
