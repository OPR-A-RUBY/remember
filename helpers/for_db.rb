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