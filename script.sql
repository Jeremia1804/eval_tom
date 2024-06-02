create database eval;
\c eval

create table equipe(
    idequipe serial primary key,
    nom varchar(50),
    pwd varchar(50)
);

create table categorie(
    idcategorie serial primary key,
    nom varchar(30)
);

create table coureur(
    idcoureur serial primary key,
    nom varchar(50),
    numero int,
    genre varchar(10),
    dtn date,
    idequipe int,
    foreign key (idequipe) references equipe(idequipe)
);

create table categorie_coureur(
    idcategorie_coureur serial primary key,
    idcategorie int,
    idcoureur int,
    foreign key (idcategorie) references categorie(idcategorie),
    foreign key (idcoureur) references coureur(idcoureur)
);

create table etape(
    idetape serial primary key,
    nom varchar(50),
    rang int,
    nombre_coureur int,
    longueur double precision,
    debut timestamp
);

create table point(
    idpoint serial primary key,
    classement int,
    valeur double precision,
    idetape int,
    foreign key (idetape) references etape(idetape)
);

create table participation(
    idparticipation serial primary key,
    idcoureur int,
    idetape int,
    arrive timestamp,
    chrono double precision,
    foreign key (idetape) references etape(idetape),
    foreign key (idcoureur) references coureur(idcoureur)
);

create table penalite(
    idpenalite serial primary key,
    idcoureur int,
    idetape int,
    penalite double precision,
    foreign key (idetape) references etape(idetape),
    foreign key (idcoureur) references coureur(idcoureur)
);