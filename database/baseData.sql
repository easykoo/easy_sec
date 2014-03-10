delete from sec_role;
delete from sec_department;
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(1,'Admin','SYSTEM',now(),'SYSTEM',now());
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(2,'Employee','SYSTEM',now(),'SYSTEM',now());
insert into sec_role(role_id, description, create_user, create_date, update_user, update_date) values(3,'User','SYSTEM',now(),'SYSTEM',now());
insert into sec_department (department_id, description, create_user, create_date, update_user, update_date)values(1,'人事部','SYSTEM',now(),'SYSTEM',now());

delete from sec_account;
delete from sec_acc_security;
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(1,'steven','呈','汪','Steven',1,3316148,'15370057062','215021','方洲路495号','easykooc@gmail.com',1,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(2,'lily','丽','刘','Lily',0,157401581,'15370059603','215021','方洲路495号','lily@gmail.com',2,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
insert into sec_account (account_id, username, first_name, last_name, nick_name, gender, qq, telephone, postcode,address, email, role_id, department_id, permission, active, locked, create_user,create_date, update_user, update_date)
values(3,'user','user','汪','User',1,3316148,'15370057062','215021','test','user@gmail.com',3,1,null,1,0,'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (1,'steven','1',now(),'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (2,'lily','1',now(),'SYSTEM',now(),'SYSTEM',now());
INSERT INTO sec_acc_security (account_id,username,password,effective_date,create_user,create_date,update_user,update_date)
VALUES (3,'user','1',now(),'SYSTEM',now(),'SYSTEM',now());

delete from sec_module;
delete from sec_function;
delete from sec_privilege;
insert into sec_module(module_id, description) values (1,'Admin');
insert into sec_module(module_id, description) values (2,'Profile');
insert into sec_module(module_id, description) values (3,'Account');
insert into sec_module(module_id, description) values (4,'Feedback');
insert into sec_module(module_id, description) values (5,'Products');

insert into sec_function ( function_id, description, uri, module_id)values (1,'View dashboard','/admin/dashboard.do',1);

insert into sec_function ( function_id, description, uri, module_id)values (21,'View setting','/admin/settings.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (22,'View profile','/admin/profile.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (23,'Change profile','/account/changeProfile.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (24,'View change email','/admin/changeEmailView.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (25,'Change email','/account/changeEmail.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (26,'View change password','/admin/password.do',2);
insert into sec_function ( function_id, description, uri, module_id)values (27,'Change password','/account/changePassword.do',2);

insert into sec_function ( function_id, description, uri, module_id)values (30,'View accounts','/admin/allAccountView.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (31,'Get all account by ajax','/ajax/allAccount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (32,'Delete account by ajax','/ajax/deleteAccount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (33,'Ban account by ajax','/ajax/banAccount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (34,'Unban account by ajax','/ajax/unbanAccount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (35,'Update account by ajax','/ajax/updateAccount.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (36,'Make account admin by ajax','/ajax/makeAdmin.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (37,'Make account admin by ajax','/ajax/hire.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (38,'Make account admin by ajax','/ajax/fire.do',3);

insert into sec_function ( function_id, description, uri, module_id)values (40,'View feedback','/admin/allFeedbackView.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (41,'Get top 5 feedback by ajax','/ajax/getTop5Feedback.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (42,'Read feedback by ajax','/ajax/readFeedback.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (43,'Get feedback count by ajax','/ajax/getFeedbackCount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (44,'Get all feedback by ajax','/ajax/allFeedback.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (45,'Delete feedback by ajax','/ajax/deleteFeedback.do',4);

insert into sec_function ( function_id, description, uri, module_id)values (50,'View products','/admin/allProductView.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (51,'View create products','/admin/createProductView.do',5);

insert into sec_privilege ( external_id, type,role_id,department_id) values (1,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,2,3,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (4,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (4,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (5,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (5,2,2,1);

