---
-- Example Schema
--

DROP ALL OBJECTS;

CREATE SEQUENCE hibernate_sequence START WITH 1000;


CREATE TABLE USER (
    id                       int not null IDENTITY,
    login                    varchar(100) not null,
    password                 varchar(100) not null,
    email                    varchar(100),
    is_enabled               bool not null default true,
    civility                 char(2) default 'MR',
    first_name               varchar(100),
    last_name                varchar(100),
    version                  int default 0,

    constraint user_unique_1 unique (login),
    primary key (id)
);

COMMENT ON TABLE USER IS 'The User is a human that can connect to this web application';
COMMENT ON COLUMN USER.LOGIN IS 'The login used to login';

CREATE TABLE ROLE (
    id              int not null IDENTITY,
    role_name       varchar(100) not null,
    constraint role_unique_1 unique (role_name),
    primary key (id)
);

CREATE TABLE USER_ROLE (
    user_id     int not null,
    role_id     int not null,

    constraint user_role_fk_1 foreign key (user_id) references USER,
    constraint user_role_fk_2 foreign key (role_id) references ROLE,
    primary key (user_id, role_id)
);

CREATE TABLE EVENTTYPE (
	id bigint(20) NOT NULL IDENTITY,
	name varchar(63) NOT NULL,
	agenda_start varchar(63) NOT NULL,
	agenda_stop varchar(63) NOT NULL,
	mail_start varchar(63) NOT NULL,
	mail_stop varchar(63) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE VAR_EVENT (
	id bigint(20) NOT NULL IDENTITY,
	abbreviation varchar(15) NOT NULL,
	startday datetime DEFAULT NULL,
	endday datetime DEFAULT NULL,
	current_state int(11) DEFAULT NULL,
	agenda_start datetime DEFAULT NULL,
	agenda_stop datetime DEFAULT NULL,
	mail_send datetime DEFAULT NULL,
	mail_start datetime DEFAULT NULL,
	mail_stop datetime DEFAULT NULL,
	manager varchar(255) DEFAULT NULL,
	workshop_nr int(11) NOT NULL,
	eventtype_id bigint(20) DEFAULT NULL,
	PRIMARY KEY (id),
	CONSTRAINT var_event_fk_1 FOREIGN KEY (eventtype_id) REFERENCES EVENTTYPE (id)
); 



INSERT INTO USER (id, login, password, email, is_enabled, version) VALUES (-1, 'admin', 'admin', 'admin@example.com', true, 1);

INSERT INTO ROLE (id, role_name) VALUES (-1, 'ROLE_ADMIN');
INSERT INTO ROLE (id, role_name) VALUES (-2, 'ROLE_USER');
INSERT INTO ROLE (id, role_name) VALUES (-3, 'ROLE_MONITORING');

INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -1);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -2);
INSERT INTO USER_ROLE (user_id, role_id) VALUES (-1, -3);


INSERT INTO EVENTTYPE VALUES (1,'UG','-15w','-10w','-10w','-8w');
INSERT INTO EVENTTYPE VALUES (2,'K','-15w','-10w','-10w','-8w');

INSERT INTO VAR_EVENT VALUES (1,'AMS',0,NULL,NULL,'2017-04-24 00:00:00',NULL,NULL,NULL,'MBA','2017-04-23 00:00:00',1,1);
