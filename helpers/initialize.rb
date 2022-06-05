#
configure do
  db = get_db
  
  db.execute "CREATE TABLE IF NOT EXISTS 
  `Persons` 
  (
    `id`        INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`      TEXT
  ) "
end