# app/comp-scorer/configuration.rb -- handles configuration

require 'singleton'

module CompScorer

  # class Dirs
  #
  # Provides an interface to the data and reports directories.  Is responsible
  # for configuring itself (single instance) from the standard configuration
  # file.
  #
  class Dirs
    include Singleton

    def initialize
      begin
        data = File.read( Constants::BASIC_CONFIG_FILE_NAME )
      rescue
        Err.no_configuration_file
      end
      data = YAML.load( data )
      dirs = data['directories']
      if dirs.nil?
        Err.no_directory_information(label: 'directories')
      end
      @data_directory = dirs['data']
      @reports_directory = dirs['reports']
      if @data_directory.nil?
        Err.no_directory_information(label: 'directories/data')
      end
      if @reports_directory.nil?
        Err.no_directory_information(label: 'directories/reports')
      end
    end
    def data
      @data_directory
    end
    def report
      @reports_directory
    end
  end  # class Dirs

  class Configuration
  end
end
