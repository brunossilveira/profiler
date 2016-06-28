require 'csv'

class ProfilerService

  attr_reader :file_name

  def initialize(*args)
    @file_name = args[0]
    @phone_number = args[1]
  end

  def call
    require 'pry';binding.pry
    csv_text = File.read(File.join(Dir.pwd, file_name))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Moulding.create!(row.to_hash)
    end
  end
end
