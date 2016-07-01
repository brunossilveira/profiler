require 'csv'

class Mapper
  attr_reader :file_name, :phone_number

  def initialize(file_name, phone_number)
    @file_name = file_name
    @phone_number = phone_number

    raise 'File not found' unless File.exists?(file_name)
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

      if row['NumAcs'] == phone_number
        types.keys.each do |key|
          result[key] << Row.new(row['Duração'], row['Destino']) if row['Tpserv'].include? types[key]
        end
      end
    end

    result
  end

  private

  def types
    {
      locals: 'Chamadas Locais',
      long_distance: 'Chamadas Longa Distância',
      sms: 'TIM Torpedo',
      internet: 'TIM Wap Fast'
    }
  end
end
