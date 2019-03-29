class Sentence < ApplicationRecord
	has_many :bodies
	has_many :feedbacks
	has_many :responsibles
	has_many :parts

  def capitalize_everything(attribute)
    words = attribute.split
    words.map{ |word| word.capitalize }.join(" ")
  end

  def spanish_date
    # %w{enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre}[Date.today.month]
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
    # raise
  end

  def name_displayed
    "Sentencia del #{capitalize_everything(institution)} del #{spanish_date} [#{parts.first.first_name} vs. #{parts.last.first_name}]"
  end



	# include PgSearch
	#   pg_search_scope :global_search,
	#     against: [ :name, :category, :institution ],
	#     associated_against: {
	#       body: [ :content ]
	#     },
	#     using: {
	#       tsearch: { prefix: true }
	#     }
end
