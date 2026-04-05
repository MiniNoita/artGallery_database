# ArtGallery database
This is a school prpject for NoSQL databases. This database is ment for Neo4j and the main idea is to show artists, their art (what type of art etc.) and what museum has which art.

## How to get this database running
You will need to download [Docker Desktop](https://www.docker.com/products/docker-desktop/)

After you have downloaded it, do in command line and find this repository docker folder. It has yml file that connects to the neo4j.

Start docker with command `docker compose up -d`. Also remember to put it down after you are done with `docker compose down`. If you succeeded, open browser and fo to `http://localhost:7474/browser/` and sign in. You should be able to sign in with username: `neo4j` and password: `password`.

## How to create the database

Go to the file named "createDatabase.cypher". First copy the lines 7-39 and paste to the Neo4j. It's important to first run `MATCH (n) DETACH DELETE n;` to clear the database (code line 7). Other lines create all nodes. After that copy lines 50-88 and paste to the Neo4j. You can see the whole database with command `MATCH (n) RETURN n;`.

## Use Cases and editing existing data

Now this next part, go to the file names "query.cypher". There you can find some use cases I thought for this database and couple of editing query's. Just copy them one by one and paste into the Neo4j.
