class Parser
  attr_reader :options

  FILE_FORMAT = /.+[.].+/
  NUMBER_FORMAT = /(\d{3})-(\d{4})-(\d{4})/

  def initialize(args)
    @options = args
  end

  def parse!
    abort Messages::NO_ARGUMENT_ERROR if options.empty?
    abort Messages::WRONG_NUMBER_OF_ARGUMENTS_ERROR if options.count > 2
    abort Messages::WRONG_FILE_FORMAT_ERROR unless file_format_correct?
    abort Messages::WRONG_NUMBER_FORMAT_ERROR unless number_format_correct?

    { file_name: options.first, phone_number: options.last }
  end

  private

  def file_format_correct?
    options.first =~ FILE_FORMAT
  end

  def number_format_correct?
    options.last =~ NUMBER_FORMAT
  end
end
