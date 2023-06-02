create table author{
    id int primary key generated always as identity,
    first_name varchar(100),
    last_name varchar(100)
}

create table game{
    id int primary key generated always as identity,
    multiplayer boolean,
    last_played_at date
}