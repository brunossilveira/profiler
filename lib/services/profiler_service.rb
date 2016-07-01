require 'csv'

class ProfilerService

  attr_reader :options

  def initialize(*args)
    @options = args
  end

  def call
    parsed_options = Parser.new(options).parse!
    result = Mapper.new(parsed_options[:file_name], parsed_options[:phone_number]).map

    profiler = Profiler.new(result)
    profiler.process

    printf "Informações para o número #{parsed_options[:phone_number]}\n"
    printf "SMS: #{profiler.sms}\n"
    printf "Internet: #{profiler.internet * 1000} bytes\n"
    printf "Chamadas Locais:\n"
    printf "  Celular: #{profiler.locals[:cellphone]}\n"
    printf "  Telefone Fixo: #{profiler.locals[:landline]}\n"
    printf "Chamadas Longa Distância:\n"
    printf "  Celular: #{profiler.long_distance[:cellphone]}\n"
    printf "  Telefone Fixo: #{profiler.long_distance[:landline]}\n"
  end
end
