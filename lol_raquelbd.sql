drop database if exists lol_raquelbd;
create database lol_raquelbd;
use lol_raquelbd;
create table hechizos(
Id_hechizos int not null auto_increment,
Nombre varchar(50) not null,
Enfriamiento varchar(10) not null,
Tipo varchar(20) not null,
primary key(Id_hechizos)
);
create table campeones(
Id_campeones int not null auto_increment,
Nombre varchar(50) not null,
Dificultad varchar(20) not null,
Informacion varchar(300) not null,
Rol varchar(30) not null,
Id_hechizos int not null,
Id_aspectos int not null,
primary key(Id_campeones)
);
create table habilidades(
Id_habilidades int not null auto_increment,
Nombre varchar(50) not null,
Uso varchar(10) not null,
Descripcion varchar(200) not null,
Id_campeones int not null,
primary key(Id_habilidades)
);
create table aspectos(
Id_aspectos int not null auto_increment,
Nombre varchar(50) not null,
Tipo varchar(20) not null,
Tematica varchar(50) not null,
primary key(Id_aspectos)
);
create table jugadores(
Id_jugadores int not null auto_increment,
Nombre varchar(50) not null,
Alias varchar(50) not null,
Apellido varchar(100) not null,
Edad varchar(2) not null,
primary key(Id_jugadores)
);
create table juegan(
Id_campeones int not null,
Id_jugadores int not null,
primary key(Id_campeones,Id_jugadores)
);
create table equipos(
Id_equipos int not null auto_increment,
Nombre varchar(50) not null,
Pais varchar(50) not null,
Num_jugador varchar(5) not null,
primary key(Id_equipos)
);
create table tienen_jugadores_equipos(
Id_jugadores int not null,
Id_equipos int not null,
primary key(Id_jugadores,Id_equipos)
);
create table patrocinadores(
Id_patrocinadores int not null auto_increment,
Nombre varchar(50) not null,
Ubicacion varchar(60) not null,
Valor varchar(10) not null,
primary key(Id_patrocinadores)
);
create table tienen_equipos_patrocinadores(
Id_equipos int not null,
Id_patrocinadores int not null,
primary key(Id_equipos,Id_patrocinadores)
);
create table torneos(
Id_torneos int not null auto_increment,
Nombre varchar(50) not null,
Pais varchar(60) not null,
Fecha varchar(20) not null,
primary key(Id_torneos)
);
create table participan(
Id_equipos int not null,
Id_torneos int not null,
primary key(Id_equipos,Id_torneos)
);
alter table campeones
add constraint fk_hechizos foreign key(Id_hechizos) references hechizos(Id_hechizos),
add constraint fk_aspectos foreign key(Id_aspectos) references aspectos(Id_aspectos);
alter table habilidades
add constraint fk_campeones1 foreign key(Id_campeones) references campeones(Id_campeones);
alter table juegan
add constraint fk_campeones2 foreign key(Id_campeones) references campeones(Id_campeones),
add constraint fk_jugadores1 foreign key(Id_jugadores) references jugadores(Id_jugadores);
alter table tienen_jugadores_equipos
add constraint fk_jugadores2 foreign key(Id_jugadores) references jugadores(Id_jugadores),
add constraint fk_equipos1 foreign key(Id_equipos) references equipos(Id_equipos);
alter table tienen_equipos_patrocinadores
add constraint fk_equipos2 foreign key(Id_equipos) references equipos(Id_equipos),
add constraint fk_patrocinadores foreign key(Id_patrocinadores) references patrocinadores(Id_patrocinadores);
alter table participan
add constraint fk_equipos3 foreign key(Id_equipos) references equipos(Id_equipos),
add constraint fk_torneos foreign key(Id_torneos) references torneos(Id_torneos);
#Datos aspectos
INSERT INTO aspectos VALUES ('1', 'Vaquera', 'Chroma', 'Recreativa');
INSERT INTO aspectos VALUES ('2', 'Dios de la guerra', 'Legado', 'Prestigio');
INSERT INTO aspectos VALUES ('3', 'Espartano', 'Chroma', 'Prestigio');
INSERT INTO aspectos VALUES ('4', 'Diosa', 'Legado', 'Recreativa');
#Datos hechizos
INSERT INTO hechizos VALUES ('1', 'Fantasma', '180', 'Ofensivo');
INSERT INTO hechizos VALUES ('2', 'Curación', '240', 'Defensivo');
INSERT INTO hechizos VALUES ('3', 'Barrera', '180', 'Defensivo');
INSERT INTO hechizos VALUES ('4', 'Destello', '300', 'Utilidad');
#Datos campeones
INSERT INTO campeones VALUES ('1', 'Miss Fortune', 'Baja', 'De niña, presenció cómo Gangplank, el rey de los piratas, asesinaba a su familia, una situación de la que se vengó salvajemente años después al hacer saltar por los aires su buque insignia con él a bordo. Todo aquel que la subestime se enfrentará a un oponente seductor e impredecible', 'Tirador', '1', '1');
INSERT INTO campeones VALUES ('2', 'Mordekaiser', 'Moderada', 'Mordekaiser es un sanguinario señor de la guerra proveniente de tiempos olvidados al que los siglos han visto nacer en tres ocasiones y morir en otras dos. Utiliza sus poderes necrománticos para atar almas perdidas a una vida eterna a su servicio.', 'Luchador', '2', '2');
INSERT INTO campeones VALUES ('3', 'Pantheon', 'Moderada', 'Tiempo atrás, Atreus había albergado al Aspecto de la Guerra en su interior contra su voluntad, pero sobrevivió al golpe que acabó con el poder divino y arrancó estrellas del firmamento.', 'Luchador', '3', '3');
INSERT INTO campeones VALUES ('4', 'sona', 'Moderada', 'Sona es la artista más virtuosa de Demacia con el etwahl de cuerda y solo se comunica a través de sus elegantes acordes y vibrantes melodías', 'Apoyo', '4', '4');
#Datos equipos
INSERT INTO equipos VALUES ('1', 'G2', 'España', '5');
INSERT INTO equipos VALUES ('2', 'Koi', 'España', '5');
INSERT INTO equipos VALUES ('3', 'Navi', 'Ruso', '5');
INSERT INTO equipos VALUES ('4', 'Spirit', 'Aleman', '5');
#Datos habilidades
INSERT INTO habilidades VALUES ('1', 'Alarde', 'W', 'Si no la atacan, Miss Fortune recibe velocidad de movimiento de forma pasiva.', '1');
INSERT INTO habilidades VALUES ('2', 'Abrazo de la muerte', 'E', 'Mordekaiser atrae a todos los enemigos de una zona.', '2');
INSERT INTO habilidades VALUES ('3', 'Gran descarga estelar', 'R', 'Pantheon se prepara para saltar por los aires y aterriza en una ubicación objetivo como un cometa.', '3');
INSERT INTO habilidades VALUES ('4', 'Himno del valor', 'Q', 'Sona toca el Himno del valor, que lanza rayos sónicos que infligen daño mágico a dos enemigos cercanos.', '4');
#Datos jugadores
INSERT INTO jugadores VALUES ('1', 'Paco', 'Destroy', 'Ramirez Martel', '20');
INSERT INTO jugadores VALUES ('2', 'Mikel', 'BestMi', 'Abad Reus', '22');
INSERT INTO jugadores VALUES ('3', 'Frank', 'Franki', 'Suares Sanz', '18');
INSERT INTO jugadores VALUES ('4', 'Ralf', 'Alpha', 'Orente Chill', '20');
#Datos juegan
INSERT INTO juegan VALUES ('1', '1');
INSERT INTO juegan VALUES ('2', '2');
INSERT INTO juegan VALUES ('3', '3');
INSERT INTO juegan VALUES ('4', '4');
#Datos torneos
INSERT INTO torneos VALUES ('1', 'Esl', 'España', '20/06/2023');
INSERT INTO torneos VALUES ('2', 'FusionCup', 'Francia', '10/05/2023');
INSERT INTO torneos VALUES ('3', 'Cologne', 'Alemania', '25/07/2023');
INSERT INTO torneos VALUES ('4', 'Master', 'España', '15/04/2023');
#Datos participan
INSERT INTO participan VALUES ('1', '1');
INSERT INTO participan VALUES ('2', '2');
INSERT INTO participan VALUES ('3', '3');
INSERT INTO participan VALUES ('4', '4');
#Datos patrocinadores
INSERT INTO patrocinadores VALUES ('1', 'Asus', 'Holanda', '50.000€');
INSERT INTO patrocinadores VALUES ('2', 'Vodafone', 'España', '60.000€');
INSERT INTO patrocinadores VALUES ('3', 'Movistar', 'España', '60.000€');
INSERT INTO patrocinadores VALUES ('4', 'Grefusa', 'Francia', '45.000€');
#Datos tienen_equipos_patrocinadores
INSERT INTO tienen_equipos_patrocinadores VALUES ('1', '1');
INSERT INTO tienen_equipos_patrocinadores VALUES ('2', '2');
INSERT INTO tienen_equipos_patrocinadores VALUES ('3', '3');
INSERT INTO tienen_equipos_patrocinadores VALUES ('4', '4');
#Datos tienen_jugadores_equipos
INSERT INTO tienen_jugadores_equipos VALUES ('1', '1');
INSERT INTO tienen_jugadores_equipos VALUES ('2', '2');
INSERT INTO tienen_jugadores_equipos VALUES ('3', '3');
INSERT INTO tienen_jugadores_equipos VALUES ('4', '4');
