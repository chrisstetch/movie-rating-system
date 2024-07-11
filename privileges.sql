/*
Grants all privileges on the users table to admins
*/
GRANT ALL PRIVILEGES ON movies.users TO chris, harithik, sarp
    WITH GRANT OPTION;
FLUSH PRIVILEGES;

/*
Grants SELECT privilege on the anonymous ratings view to a regular user
*/
GRANT SELECT ON movies.ratings_anonymous TO schester;
FLUSH PRIVILEGES;

A