// this file has some basic query for typical usage like finding data based on a question and how to edit existing data

// --------- USE CASES -----------

//1. What art pieces are shown in museum "Jyväskylän taidemuseo"?

MATCH (aw:Artwork)-[:ON_DISPLAY]->(m:Museum)
WHERE m.name = "Jyväskylän taidemuseo"
RETURN aw, m;

//2. How many art pieces have each artist made?

MATCH (artist:Artist)-[:MADE]->(aw:Artwork)
RETURN artist.name, count(DISTINCT aw);

//3. Which museum has artist "Lilja Heinonen" art pieces?

 MATCH (lilja:Artist {name: "Lilja Heinonen"})-[:MADE]->(aw:Artwork)-[:ON_DISPLAY]->(m:Museum)
 RETURN m.name;

//4. How much does it cost to go "Helsingin kaupunkimuseo"?

MATCH (m:Museum {name: "Helsingin kaupunkimuseo"})
RETURN m.entryFee;

//5. How many art pieces are in each museum?

MATCH (aw:Artwork)-[:ON_DISPLAY]->(m:Museum)
RETURN m.name AS Museum, count(DISTINCT aw) AS artPieces;

//6. Which art pieces are paintings (aka type = "painting")

MATCH (aw:Artwork)
WHERE aw.type = "painting"
RETURN aw.name AS Name, aw.type AS type;

//7. What art pieces have been made before year 2000?

MATCH (aw:Artwork)<-[made:MADE]-(a:Artist)
WHERE made.date.year < 2000
RETURN aw.name AS artName, made.date AS date;

//8. What is oldest art piece in database? Who made it?

MATCH (aw: Artwork)<-[made:MADE]-(a:Artist)
RETURN aw.name AS artwork_name, made.date AS made_by, a.name AS artist
ORDER BY made_by ASC
LIMIT 1;

//9. What artwork are in each museum and whose artwork is it?

MATCH (a:Artist)-[:MADE]->(aw:Artwork)-[:ON_DISPLAY]->(m:Museum)
WITH m , a, collect(aw.name) AS artworks
RETURN m.name AS museum, {artist_name: a.name, art: artworks} AS artist_and_artworks;

// --------- EDITING EXISTING DATA -------------

//1. "Helsingin kaupunkimuseo" entry fee goes up 2€

//2. "Jyväskylä taidemuseo" entry fee goes down 1€