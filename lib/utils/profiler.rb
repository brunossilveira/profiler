class Profiler
  attr_accessor :sms, :internet, :locals, :long_distance
  attr_reader :data

  def initialize(data)
    @data = data
    @sms, @internet = nil
    @locals = { cellphone: 0, landline: 0 }
    @long_distance = { cellphone: 0, landline: 0 }
  end

  def process
    process_sms
    process_internet
    process_locals
    process_long_distance

    self
  end

  private

  def process_sms
    @sms = data[:sms].count
  end

  def process_internet
    sum = 0

    data[:internet].each do |row|
      sum = sum + row.total
    end

    @internet = sum
  end

  def process_locals
    cellphone = 0
    landline = 0

    data[:locals].each do |row|
      if row.type.include? 'MOVEL'
        cellphone = cellphone + row.total
      else
        landline = landline + row.total
      end
    end

    locals[:cellphone] = convert_sum(cellphone)
    locals[:landline] = convert_sum(landline)
  end

  def process_long_distance
    cellphone = 0
    landline = 0

    data[:long_distance].each do |row|
      if row.type.include? 'MOVEL'
        cellphone = cellphone + row.total
      else
        landline = landline + row.total
      end
    end

    long_distance[:cellphone] = convert_sum(cellphone)
    long_distance[:landline] = convert_sum(landline)
  end

  def convert_sum(sum)
    Time.at(sum).utc.strftime("%H:%M:%S")
  end
end
