require 'csv'

class ProfilerService

  attr_reader :options

  def initialize(*args)
    @options = args
  end

  def call
    parsed_options = Parser.new(options).parse!
    result = Mapper.new(parsed_options[:file_name]).map

    require 'pry';binding.pry
    puts result

    #Read and convert from file
    #analyse data
  end
end
