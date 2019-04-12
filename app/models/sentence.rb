class Sentence < ApplicationRecord
	has_many :bodies
	has_many :feedbacks
	has_many :responsibles
	has_many :parts
  has_many :notifieds

  def capitalize_everything(attribute)
    words = attribute.split
    words.map{ |word| word.capitalize }.join(" ")
  end

  def spanish_date
    english_date = date.strftime('%b %d, %Y')
    spanish = {
      'Jan': 'enero',
      'Feb': 'febrero',
      'Mar': 'marzo',
      'Apr': 'abril',
      'May': 'mayo',
      'Jun': 'junio',
      'Jul': 'julio',
      "Aug": 'agosto',
      'Sep': 'septiembre',
      'Oct': 'octubre',
      'Nov': 'noviembre',
      'Dec': 'diciembre'
    }
    english_month = english_date[0..2]
    if spanish.include?(english_month.to_sym)
      spanish_month = spanish[english_month.to_sym]
      "#{date.day} de #{spanish_month} del #{date.year}"
    else
      spanish_month
      english_date
    end
  end

  # def institution_split
  #   judicial_district = self.institution.split.last(3)
  #   if judicial_district[0] == 'Primer'
  #     acronym = '1DJ'
  #   else
  #     judicial_district.join(" ")
  #   end
  # end


  def name_displayed
    "#{capitalize_everything(institution)} #{category} del #{spanish_date} #{entry_point} [#{capitalize_everything(parts.first.name)} vs. #{capitalize_everything(parts.last.name)}]"
  end
end


