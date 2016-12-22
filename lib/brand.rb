class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:description, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalization)

private

define_method(:capitalization) do
    self.description=(description().titlecase())
  end

end
