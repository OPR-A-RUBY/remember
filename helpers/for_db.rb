# Получить базу данных
def get_db 
  db = SQLite3::Database.new 'remebe_db.sqlite3'
  db.results_as_hash = true
  return db
end