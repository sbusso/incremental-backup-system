require 'ostruct'
require 'logger'
require 'yaml'

class Backup
	
	SETTINGS_FILE = File.join(File.dirname(__FILE__), "settings.yml")
	SETTINGS			= YAML.load_file(Backup::SETTINGS_FILE)
	
	LOG 					= Logger.new(File.join(File.expand_path(File.dirname(__FILE__)), "../log/backup.log"), 10, 256000)
	LOG.level 		= Logger::INFO
	
end

Dir["#{File.expand_path(File.dirname(__FILE__))}/*"].each do |file|
  require "#{file}" if file =~ /\.rb$/ && file !~ /backup.rb/ && file !~ /settings.yml/
end