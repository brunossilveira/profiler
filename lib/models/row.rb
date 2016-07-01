require 'time'

class Row
  attr_accessor :total
  attr_reader :data, :type

  def initialize(data, type)
    @data = data.to_s.split('m').map { |v| v.sub(/\D+/, '') } || []
    @type = type

    convert
  end

  private

  def convert
    if data.size == 2
      @total = convert_time(data.first, data.last)
    elsif data.size == 1
      @total = convert_bytes(data.first)
    else
      @total = 1
    end
  end

  def convert_bytes(value)
    value.gsub(',', '.').to_f
  end

  def convert_time(minutes, seconds)
    time = Time.parse("00:#{minutes}:#{seconds}")

    time.to_i - beginning.to_i
  end

  def beginning
    Time.parse('00:00')
  end
end
