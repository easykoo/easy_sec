
delete from sec_account;
delete from sec_acc_security;
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(1,'steven','呈','汪','Steven',1,3316148,'15370057062','215021','方洲路495号','easykooc@gmail.com',1,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(2,'lily','丽','刘','Lily',0,157401581,'15370059603','215021','方洲路495号','lily@gmail.com',2,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(3,'user','user','汪','User',1,3316148,'15370057062','215021','test','user@gmail.com',3,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (1,'steven','C4CA4238A0B923820DCC509A6F75849B',now(),'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (2,'lily','C4CA4238A0B923820DCC509A6F75849B',now(),'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (3,'user','C4CA4238A0B923820DCC509A6F75849B',now(),'SYSTEM',now(),'SYSTEM',now());

delete from category;
insert into category (category_id,  description, parent_category, create_user, create_date, update_user, update_date)
values ('101', '101', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, parent_category, create_user, create_date, update_user, update_date)
values ('102', '102', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, parent_category, create_user, create_date, update_user, update_date)
values ('101001', '101001', '101', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, parent_category, create_user, create_date, update_user, update_date)
values ('101002', '101002', '101', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, parent_category, create_user, create_date, update_user, update_date)
values ('101001001', '101001001', '101001', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, parent_category, create_user, create_date, update_user, update_date)
values ('101002001', '101002001', '101002', 'SYSTEM', now(), 'SYSTEM', now());