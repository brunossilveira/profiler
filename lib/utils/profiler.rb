class Profiler
  attr_reader :data, :sms, :internet, :locals, :long_distance

  def initialize(data)
    @data = data
    @sms, @internet, @locals, @long_distance = nil
  end

  def process
    process_sms
    process_internet
    process_locals
    process_long_distance
  end

  private

  def process_sms
    sum = 0
    data[:sms].each do |row|
      sum = sum + row.total_in_seconds
    end

    sms = convert_sum(sum)
  end

  def process_internet
    sum = 0
    data[:internet].each do |row|
      sum = sum + row.total_in_seconds
    end

    sms = convert_sum(sum)
  end

  def process_locals

  end

  def process_long_distance

  end

  def convert_sum(sum)
    Time.at(sum).utc.strftime("%H:%M:%S")
  end
end
