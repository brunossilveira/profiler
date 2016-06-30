require 'csv'

class Mapper
  attr_reader :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def map
    result = {
      locals: [],
      long_distance: [],
      sms: [],
      internet: []
    }

    CSV.foreach(file_name, { headers: :first_row, col_sep: ';' }) do |csv|
      row = csv.to_hash
      service = row['Tpserv']

      types.keys.each do |key|
        result[key] << Row.new(row['Duração']) if row['Tpserv'].include? types[key]
      end
    end

    result
  end

  def types
    {
      locals: 'Chamadas Locais',
      long_distance: 'Chamadas Longa Distância',
      sms: 'TIM Torpedo',
      internet: 'TIM Wap Fast'
    }
  end
end
