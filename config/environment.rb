require 'bundler'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
