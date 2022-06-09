# persons.rb
get '/persons' do 
	erb :persons
end	


get '/person/new' do
  erb :person_new
end


post '/person/new' do
	@par = params
	if params['name'].size == 0
		@error = '"Фамилия Имя Отчество" - не должно быть пустым.' 
		return erb :person_new
	end	
	db = get_db
	persons = [
		[
		 		params['name'], 
		    $user[0]['id'],
		    params['b_date'],
    	  params['d_date'],
    	  params['photo_link'],
    	  params['discription']
    ]	  
  ]
	seed_db_Persons db, persons # Запись данных в Базу данных
	@persons = db.execute "SELECT * FROM Persons WHERE id_user=? ", [$user[0]['id']]
  erb :persons
end


get '/person/:id_person' do
  db = get_db
  @person = db.execute "SELECT * FROM Persons WHERE id=? ", [params[:id_person]]
  erb :person_edit
end


get '/person/delete' do
  erb :person_delete
end