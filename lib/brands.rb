class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  validates(:name, {:presence => true})
  before_save(:capitalize_name)

  private

  def capitalize_name
    self.name=(self.name.split.map { |x| x.capitalize }.join(" "))
  end
end
