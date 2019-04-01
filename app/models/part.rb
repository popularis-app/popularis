class Part < ApplicationRecord
  belongs_to :sentence


  def capitalize_everything(attribute)
    words = attribute.split
    words.map{ |word| word.capitalize }.join(" ")
  end


  def first_name
    if name.blank?
      ""
    elsif name.first(2) == 'La' || 'El' || 'Juez'
      name.split.second.capitalize
    else
      name.split.first.capitalize
    end
  end
end
