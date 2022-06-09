# Получить базу данных
def get_db 
  db = SQLite3::Database.new 'remebe_db.sqlite3'
  db.results_as_hash = true
  return db
end

# Проверить "Есть ли такой user в базе"
def is_user_exist? db, name 
  # debug_pause ({'name' => name})                                          # -=DEBUG=- #
  db.execute("SELECT * FROM Users WHERE name=?", [name]).length > 0 
end
       
# Внести в базу user 
def seed_db_Users db, users 
  users.each do |user|
    if !is_user_exist? db, user[0]
      db.execute "INSERT INTO 
      Users 
      (
        'name',
        'login',
        'pass_main',
    	'pass_guest'
      ) 
      VALUES (
        ?, 
        ?, 
        ?, 
        ?
      )", user 
    end
  end
end       

# Проверить "Есть ли такой person в базе"
def is_person_exist? db, name 
  # debug_pause ({'name' => name})                                          # -=DEBUG=- #
  db.execute("SELECT * FROM Persons WHERE name=?", [name]).length > 0 
end

# Сделаем первое слово ФАМИЛИЮ - большими буквами
def to_big_word fool_name_in
  words = fool_name_in.split(' ')
  words[0] = words[0].upcase
  fool_name_out = words.join(' ')
end

# Внести в базу user 
def seed_db_Persons db, persons 
  persons.each do |person|
    person[0] = to_big_word(person[0])
    if !is_person_exist? db, person[0]
      db.execute "INSERT INTO 
      Persons 
      (
        'name',
        'id_user',
        'b_date',
    	  'd_date',
    	  'photo_link',
    	  'discription'
      ) 
      VALUES (
        ?, 
        ?,
        ?, 
        ?, 
        ?, 
        ?
      )", person 
    end
  end
end 


