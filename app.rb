#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'
require_relative './helpers/for_db.rb' # Методы для работы с БАЗОЙ ДАННЫХ

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School !!!</a>"
end

get '/about' do
	erb :about
end	