#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

require_relative './helpers/for_db.rb' # Методы для работы с БАЗОЙ ДАННЫХ
require_relative './helpers/initialize.rb' 
require_relative './helpers/persons.rb'
require_relative './helpers/users.rb' 

get '/' do
	db = get_db
	@persons = db.execute "SELECT * FROM Persons WHERE id_user=? ", [$user[0]['id']]

	erb :index
end

get '/about' do
	erb :about
end	

$debug_user = 'Opr' # Отладочный пользователь
db = get_db
$user = db.execute "SELECT * FROM Users WHERE login=? ", [$debug_user]