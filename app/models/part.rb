class Part < ApplicationRecord
  belongs_to :sentence


  def capitalize_everything(attribute)
    words = attribute.split
    words.map{ |word| word.capitalize }.join(" ")
  end


  def first_name
    if name.blank?
      ""
    else
      name.split.first.capitalize
    end
  end
end
