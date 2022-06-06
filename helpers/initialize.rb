#
configure do
  db = get_db
  
  db.execute "CREATE TABLE IF NOT EXISTS 
  `Users` 
  (
    `id`      INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`       TEXT,
    `login`		 TEXT,
    `pass_main`  TEXT,
    `pass_guest` TEXT
  ) "

  db.execute "CREATE TABLE IF NOT EXISTS 
  `Persons` 
  (
    `id`       INTEGER PRIMARY KEY AUTOINCREMENT,
    `id_user`	  TEXT,
    `name`        TEXT,
    `b_date`	  TEXT,
    `d_date`      TEXT,
    `photo_link`  TEXT,
    `discription` TEXT
  ) "

  db.execute "CREATE TABLE IF NOT EXISTS 
  `Photos` 
  (
    `id`        INTEGER PRIMARY KEY AUTOINCREMENT,
    `id_person`	   TEXT,
    `photo_link`   TEXT,
    `photo_date`   TEXT,
    `location`	   TEXT,	
    `person_age`   TEXT,
    `discription`  TEXT
  ) "
  
end