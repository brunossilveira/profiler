require 'time'

class Call
  attr_reader :minutes, :seconds

  def initialize(value)
    value = value.to_s.split('m').map { |v| v.sub(/\D+/, '') } || []

    @minutes = value.size > 1 ? value.first : '00'
    @seconds = value.size > 1 ? value.last : '00'
  end

  def total_in_seconds
    convert
  end

  private

  def convert
    time = Time.parse("00:#{minutes}:#{seconds}")

    time.to_i - beginning.to_i
  end

  def beginning
    Time.parse('00:00')
  end
end
