# persons.rb
get '/persons' do 
	erb :persons
end	

get '/person/new' do
  erb :person_new
end

post '/person/new' do
	@par = params
	
	db = get_db
	@user = db.execute "SELECT * FROM Users WHERE login=? ", [$debug_user]
	@persons = db.execute "SELECT * FROM Persons WHERE id_user=? ", [@user[0]['id']]
  erb :persons
end

get '/person/edit' do
  erb :person_edit
end

get '/person/delete' do
  erb :person_delete
end