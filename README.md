# character-rest-api
CSC 340 Assignment 3 - Character REST API

 Character REST API

 Description

This project is a CRUD API developed for CSC 340 Assignment 3. It manages anime characters and allows users to create, retrieve, update, delete, search, and filter characters.

The application uses Java 25, Spring Boot, Spring Data JPA, and PostgreSQL. The database is hosted on Neon, and the application is containerized with Docker and is deployed on Render.

Character Entity

The `TvCharacter` entity contains the following attributes:

 Attribute      Type             Rules 

 `characterId`  Long     Unique primary key; auto-generated 
 `name`          String  Required; cannot be null or blank 
 `description`  String  Required; cannot be null or blank 
 `universe`     String  Character's fictional universe 
 `species`      String  Character's species 

 Endpoints

Base path is `/api/characters`

 Method,  Path,  Description,  Success Status 

 GET  `/api/characters`  Retrieve all characters  200 OK 

 GET  `/api/characters/{id}`  Retrieve a character by ID  200 OK

 POST  `/api/characters`  Create a new character  201 Created 

 PUT  `/api/characters/{id}`  Update an existing character  200 OK 

 DELETE  `/api/characters/{id}`  Delete a character by ID  204 No Content 

 GET  `/api/characters?universe=Marvel`  Filter characters by universe  200 OK 

 GET  `/api/characters?name=abc`  Search names using a partial
 case-insensitive match  200 OK 

Example POST

Create a character using `POST /api/characters`.

```json
{
  "name": "Naruto Uzumaki",
  "description": "A ninja who dreams of becoming Hokage.",
  "universe": "Naruto",
  "species": "Human"
}
```

The API generates the character ID automatically.

Example PUT

Update a character using `PUT /api/characters/1`.

```json
{
  "name": "Naruto Uzumaki",
  "description": "A ninja who becomes the Seventh Hokage.",
  "universe": "Naruto",
  "species": "Human"
}
```

The ID in the URL will identifies the character to update.

Error handling

`404 Not Found`: Returned when a requested character ID does not exist.
`400 Bad Request`: Returned when a POST or PUT request has a missing or blank name or description.

Architecture

The application uses four layers:

**Entity:** Defines the character attributes and validation rules.
**Repository:** Handles database operations using Spring Data JPA.
**Service:** Contains application logic and coordinates database operations.
**Controller:** Handles HTTP requests and returns responses.

The Controller communicates with the Service, and the Service communicates with the Repository.


Database

The application uses PostgreSQL hosted on Neon, configured through the `SPRING_DATASOURCE_URL` environment variable.

Database passwords and connection strings are not stored in this repository.


Deployment

Deployed API URL: `https://character-rest-api-u5cy.onrender.com/api/characters`


The application is deployed on Render using Docker.


Technologeis used

Java 25
Spring Boot
Spring Data JPA
Spring Web
Jakarta Bean Validation
PostgreSQL
Neon
Docker
Render
Maven

Course

CSC 340 — Assignment 3: Character REST API
