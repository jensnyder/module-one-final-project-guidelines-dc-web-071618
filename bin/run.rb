require_relative '../config/environment'

ActiveRecord::Base.logger = nil

new_cli = CommandLineInterface.new
new_cli.greet
new_cli.run
