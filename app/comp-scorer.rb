# app/comp-scorer.rb -- the main file

require 'comp-scorer/err'
require 'comp-scorer/configuration'

CompScorer::Dirs.init

module CompScorer
  module Constants
    BASIC_CONFIG_FILE_NAME = "comp-scorer.conf"
  end

  class App
    def App.run
      puts "Hello world"
    end
  end
end

CompScorer::App.run
