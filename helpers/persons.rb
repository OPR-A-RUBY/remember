# persons.rb
get '/persons' do 
	erb :persons
end	

# Для создании новой персоны - выход на пустую форму для ввода данных
get '/person/new' do
  erb :person_new
end

# Для обработки введённых данных о новой персоне и сохранении информации в БД
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


# Получение данных об одной из персон и вывод её в форму для редактирования
get '/person/:id_person' do
  db = get_db
  @person = db.execute "SELECT * FROM Persons WHERE id=? ", [params[:id_person]]
  erb :person_edit
end


# Удаление информации из БД (перенос информации в другую таблицу БД)
get '/person/delete' do
  erb :person_delete
end
