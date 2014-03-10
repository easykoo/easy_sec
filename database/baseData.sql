delete from sec_role;
delete from sec_department;
insert into sec_role values(0,'User','SYSTEM',now(),'SYSTEM',now());
insert into sec_role values(1,'Admin','SYSTEM',now(),'SYSTEM',now());
insert into sec_role values(2,'Employee','SYSTEM',now(),'SYSTEM',now());
insert into sec_department values(1,'人事部','SYSTEM',now(),'SYSTEM',now());

delete from sec_account;
delete from sec_acc_security;
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(1,'steven','呈','汪','Steven',1,3316148,'15370057062','215021','方洲路495号','easykooc@gmail.com',1,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(2,'lily','丽','刘','Lily',0,157401581,'15370059603','215021','方洲路495号','lily@gmail.com',2,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(3,'user','user','汪','User',1,3316148,'15370057062','215021','test','user@gmail.com',0,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,temp_flag,fail_time,effective_date,create_user,create_date,update_user,update_date)
VALUES (1,'steven','1',0,0,NULL,'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,temp_flag,fail_time,effective_date,create_user,create_date,update_user,update_date)
VALUES (2,'lily','1',0,0,NULL,'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,temp_flag,fail_time,effective_date,create_user,create_date,update_user,update_date)
VALUES (3,'user','1',0,0,NULL,'SYSTEM',now(),'SYSTEM',now());

delete from sec_module;
delete from sec_function;
delete from sec_privilege;
insert into sec_module(module_id, description) values (1,'Admin');
insert into sec_module(module_id, description) values (2,'Account');
insert into sec_module(module_id, description) values (3,'Feedback');
insert into sec_function ( function_id, description, uri, module_id)values (1,'View dashboard','/admin/dashboard.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (2,'View setting','/admin/settings.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (3,'View profile','/admin/profile.do',1);
insert into sec_function ( function_id, description, uri, module_id)values (6,'View all account','/admin/allAccountView.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (7,'Get all account by ajax','/ajax/allAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (8,'Delete account by ajax','/ajax/deleteAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (9,'Ban account by ajax','/ajax/banAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (10,'Unban account by ajax','/ajax/unbanAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (11,'Change profile','/account/changeProfile.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (12,'Update account by ajax','/ajax/updateAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (13,'Make account admin by ajax','/ajax/adminAccount.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (14,'Get top 5 feedback by ajax','/ajax/getTop5Feedback.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (15,'Read feedback by ajax','/ajax/readFeedback.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (16,'Get feedback count by ajax','/ajax/getFeedbackCount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (17,'View all feedback','/admin/allFeedbackView.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (18,'Get all feedback by ajax','/ajax/allFeedback.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (19,'Delete feedback by ajax','/ajax/deleteFeedback.do',3);
insert into sec_privilege ( external_id, type,role_id,department_id) values (1,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (1,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,1,0,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,1,0,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (6,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (6,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (7,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (7,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (8,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (8,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (9,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (9,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (10,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (10,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (11,1,0,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (11,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (11,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (12,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (12,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (13,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (13,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (14,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (14,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (15,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (15,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (16,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (16,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (17,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (17,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (18,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (18,1,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (19,1,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (19,1,2,1);

