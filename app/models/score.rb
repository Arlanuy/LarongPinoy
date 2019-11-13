class Score < ApplicationRecord
  belongs_to :scoreable, polymorphic: true
  define_attribute_methods

end
