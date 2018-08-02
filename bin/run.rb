require_relative '../config/environment'

# ActiveRecord::Base.logger.level = 1

new_cli = CommandLineInterface.new
new_cli.greet
new_cli.run
