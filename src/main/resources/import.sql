insert into category (title) values ('Admin');
insert into category (title) values ('Projekt');
insert into category (title) values ('IT-Support');
insert into role (rolename) values ('Admin');
insert into user (username, password, role_id) VALUES ('nosmanaj', '1234', 1);
insert into entry (checkin, checkout, category_id, user_id) values ('2021-09-30T15:42:39.877496900', '2021-09-30T15:42:39.877496900', 2, 1);
