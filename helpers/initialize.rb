#
configure do
  db = get_db
  # _____________________________________________________ Users ____________________________
  db.execute "CREATE TABLE IF NOT EXISTS 
  `Users` 
  (
    `id`      INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`       TEXT,
    `login`		 TEXT,
    `pass_main`  TEXT,
    `pass_guest` TEXT
  ) "
  seed_db_Users db, [
  	['Aleksandr', 'Opr', 'pass+','pass'], 
  	['Ekaterina', 'Kate', '0636', '']
  ]

  # _____________________________________________________ Person ___________________________
  db.execute "CREATE TABLE IF NOT EXISTS 
  `Persons` 
  (
    `id`       INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`        TEXT,
    `id_user`	  TEXT,
    `b_date`	  TEXT,
    `d_date`      TEXT,
    `photo_link`  TEXT,
    `discription` TEXT
  ) "
  seed_db_Persons db, [
  	['НИКИПЕЛОВА Галина Николаевна',      '1', '02.09.1939', '11.12.2021', '', 'Моя тётя, сестра моей мамы'], 
  	['БАРАБАНЩИКОВ Александр Викторович', '1', 'нет данных', '__.06.20__', '', 'Мы вместе работали в БЭС. Мой учитель']
  ]


  # _____________________________________________________ Photos ___________________________
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