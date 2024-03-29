# app/comp-scorer/err.rb -- handles all error messages

module CompScorer
  class ConfigurationError < StandardError; end
end

module CompScorer; class Err
  def Err.assert(condition)
    unless condition
      raise "Assertion failed"
    end
  end

  def Err.no_configuration_file
    filename = Constants::BASIC_CONFIG_FILE_NAME
    msg = %{
      Cannot read basic configuration file #{filename}. It should contain
      directory information like so:
     
        directories:
          data: ~/speech_comp/data
          reports: ~/tmp/reports
    }.trim
    raise CompScorer::ConfigurationError, msg
  end

  def Err.no_directory_information(args)
    assert args.key?(:label)
    msg = "No directory information provided: #{args[:label]}"
    raise CompScorer::ConfigurationError, msg
  end
end; end
