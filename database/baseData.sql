
delete from sec_role;
delete from sec_department;
insert into sec_role values(1,'Admin',1,now(),1,now());
insert into sec_role values(2,'Employee',1,now(),1,now());
insert into sec_department values(1,'人事部',1,now(),1,now());
insert into sec_department values(2,'销售部',1,now(),1,now());

delete from sec_account;
delete from sec_acc_security;
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(1,'steven','呈','汪','Steven',1,3316148,'15370057062','215021','方洲路495号','easykooc@gmail.com',1,1,null,1,0,1,now(),1,now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(2,'lily','丽','刘','Lily',1,157401581,'15370059603','215021','方洲路495号','lily@gmail.com',2,1,null,1,0,1,now(),1,now());
INSERT INTO sec_acc_security (account_id,username,password,temp_flag,fail_time,effective_date,create_user,create_date,update_user,update_date)
VALUES (1,'steven','1',0,0,NULL,1,now(),1,now());
INSERT INTO sec_acc_security (account_id,username,password,temp_flag,fail_time,effective_date,create_user,create_date,update_user,update_date)
VALUES (2,'lily','1',0,0,NULL,1,now(),1,now());

delete from sec_module;
delete from sec_function;
delete from sec_privilege;
insert into sec_module(module_id, description) values (1,'Account');
insert into sec_module(module_id, description) values (2,'Admin');
insert into sec_function ( function_id, description, uri, module_id)values (1,'View dashboard','/admin/dashboard.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (2,'View all account','/admin/allAccountView.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (3,'Get all account by ajax','/ajax/allAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (4,'Delete account by ajax','/ajax/deleteAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (5,'Ban account by ajax','/ajax/banAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (6,'Unban account by ajax','/ajax/unbanAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (7,'Update account','/account/updateAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (8,'Update account by ajax','/ajax/updateAccount.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (9,'Update account by ajax','/ajax/adminAccount.do',1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (1,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (4,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (5,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (6,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (7,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (8,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (9,1,1,1);
