// ---- ARTISTS ----

//Artists have name, year they were born, year they died (if not alive), nationality, and if they have specialization (painting, sculpting etc.)

//Remember to delete database

MATCH (n) DELETE n;

//These artists are made up
CREATE 
  (:Artist {name: "Mirja Kaunonen", bornYear: 1991, nationality:"Finnish", specialization: "Sculpting"}),
  (:Artist {name: "Lilja Heinonen", bornYear: 1973, nationality:"Finnish", specialization: "Oilpainting"}),
  (:Artist {name: "Martti Savo", bornYear: 1899, deathYear: 1987, nationality:"Finnish"}),
  (:Artist {name: "Arthur Cooper"}, bornYear: 1985, nationality:"American", specialization: "Painting");

// ---- MUSEUMS ----

//Museums have name and if there is entry fee. The entry fee is integer (7 = 7€)

//Museums are kind of made up but some might be real :D 
CREATE
  (:Museum {name: "Helsingin kaupunkimuseo", entryFee:7}),
  (:Museum {name: "Jyväskylän taidemuseo", entryFee: 3}),
  (:Museum {name: "Oulun museo"}); //this means tge entry is free

// ---- ARTS ----

//Arts have name and what kind of art (painting, sculpt etc.)

//These are also made up
CREATE 
  (:Artwork {name: "Kaupungin yö", type: "painting"}),
  (:Artwork {name: "Flower beyond Mountain", type: "painting"}),
  (:Artwork {name: "Alone", type: "Sculpt"}),
  (:Artwork {name: "Viljapelto", type: "painting"}),
  (:Artwork {name: "Emännät ja Isännät", type: "painting"}),
  (:Artwork {name: "Sairaus, Kauneus ja Kuolema", type: "painting"}),
  (:Artwork {name: "Piilossa", type: "Sculpt"}),
  (:Artwork {name: "Look up, down and there", type: "Sculpt"});

// ---- RELATIONSHIPS ----

//There is two relationships, MADE between Artist and Art: (Artist)-[:MADE {date:}]->(Art)
//As u can see, the MADE relationship has date that shows when the Artist made the art
//And ON_DISPLAY between Art and Museums: (Art)-[:ON_DISPLAY]->(Museum)

//Match artists, museums and artwork. This is simply so that the create querys have ; at the end. I made it this way so it actually creates everything before we start mathcing for the relationships to work

MATCH 
  //Artists
  (mirja:Artist {name:"Mirja Kaunonen"}),
  (lilja:Artist {name: "Lilja Heinonen"}),
  (martti:Artist {name: "Martti Savo"}),
  (arthur:Artist {name: "Arthur Cooper"}),

  //Museums
  (helsinki:Museum {name: "Helsingin kauounkimuseo"}),
  (jkl:Museum {name: "Jyväskylän taidemuseo"}),
  (oulu:Museum {name: "Oulun museo"}),

  //Artwork
  (a1:Artwork {name: "Kaupungin yö"}),
  (a2:Artwork {name: "Flower beyond Mountain"}),
  (a3:Artwork {name: "Alone"}),
  (a4:Artwork {name: "Viljapelto"}),
  (a5:Artwork {name: "Emännät ja Isännät"}),
  (a6:Artwork {name: "Sairaus, Kauneus ja Kuolema"}),
  (a7:Artwork {name: "Piilossa"}),
  (a8:Artwork {name: "Look up, down and there"})


//Which artist made which art 
//HUOM! date( "YYYY-MM-DD" )
CREATE
  (a1)<-[:MADE {date: date("2016-07-06")}]-(lilja),
  (a2)<-[:MADE {date: date("1999-04-03")}]-(arthur),
  (a3)<-[:MADE {date: date("2018-06-13")}]-(mirja),
  (a4)<-[:MADE {date: date("1961-07-01")}]-(martti),
  (a5)<-[:MADE {date: date("1940-05-10")}]-(martti),
  (a6)<-[:MADE {date: date("1955-01-21")}]-(martti),
  (a7)<-[:MADE {date: date("2021-06-08")}]-(mirja),
  (a8)<-[:MADE {date: date("2001-08-05")}]-(arthur),

  //Which artwork is at which museum
  (a1)-[:ON_DISPLAY]->(jkl),
  (a2)-[:ON_DISPLAY]->(helsinki),
  (a3)-[:ON_DISPLAY]->(oulu),
  (a4)-[:ON_DISPLAY]->(jkl),
  (a5)-[:ON_DISPLAY]->(jkl),
  (a6)-[:ON_DISPLAY]->(jkl),
  (a7)-[:ON_DISPLAY]->(oulu),
  (a8)-[:ON_DISPLAY]->(helsinki),
