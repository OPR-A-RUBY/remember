#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'

require_relative './helpers/for_db.rb' # Методы для работы с БАЗОЙ ДАННЫХ
require_relative './helpers/initialize.rb' 

get '/' do
	erb :index
end

get '/about' do
	erb :about
end	