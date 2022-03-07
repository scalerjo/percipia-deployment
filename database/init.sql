create table todo (
    id SERIAL PRIMARY KEY NOT NULL,
    text VARCHAR(200),
    time BIGINT
);


CREATE ROLE todo_readwrite LOGIN PASSWORD 'password123';
GRANT ALL PRIVILEGES ON todo TO todo_readwrite;
GRANT ALL PRIVILEGES ON todo_id_seq TO todo_readwrite;