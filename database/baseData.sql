delete from sec_role;
delete from sec_department;
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(1,'Admin','SYSTEM',now(),'SYSTEM',now());
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(2,'Employee','SYSTEM',now(),'SYSTEM',now());
insert into sec_role(role_id, description, create_user, create_date, update_user, update_date) values(3,'User','SYSTEM',now(),'SYSTEM',now());
insert into sec_department (department_id, description, create_user, create_date, update_user, update_date)values(1,'Default','SYSTEM',now(),'SYSTEM',now());

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

delete from sec_module;
delete from sec_function;
delete from sec_privilege;
insert into sec_module(module_id, description) values (1,'Admin');
insert into sec_module(module_id, description) values (2,'Settings');
insert into sec_module(module_id, description) values (3,'Profile');
insert into sec_module(module_id, description) values (4,'Account');
insert into sec_module(module_id, description) values (5,'Feedback');
insert into sec_module(module_id, description) values (6,'Notice');
insert into sec_module(module_id, description) values (7,'Product');

insert into sec_function ( function_id, description, uri, module_id)values (10,'View dashboard','/admin/dashboard.do',1);

insert into sec_function ( function_id, description, uri, module_id)values (20,'View setting','/admin/settings.do',2);

insert into sec_function ( function_id, description, uri, module_id)values (30,'View profile','/admin/profile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (31,'View preferences','/admin/preferences.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (32,'View change password','/admin/password.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (33,'Change profile','/account/changeProfile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (34,'Change email','/account/changeEmail.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (35,'Change preferences','/account/changePreferences.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (36,'Change password','/account/changePassword.do',3);

insert into sec_function ( function_id, description, uri, module_id)values (40,'View accounts','/admin/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (41,'Get all account by ajax','/ajax/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (42,'Delete account by ajax','/ajax/deleteAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (43,'Ban account by ajax','/ajax/banAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (44,'Unban account by ajax','/ajax/unbanAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (45,'Update account by ajax','/ajax/updateAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (46,'Make account admin by ajax','/ajax/makeAdmin.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (47,'Make account admin by ajax','/ajax/hire.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (48,'Make account admin by ajax','/ajax/fire.do',4);

insert into sec_function ( function_id, description, uri, module_id)values (50,'View feedback','/admin/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (51,'Get top 5 feedback by ajax','/ajax/getTop5Feedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (52,'Read feedback by ajax','/ajax/readFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (53,'Get feedback count by ajax','/ajax/getFeedbackCount.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (54,'Get all feedback by ajax','/ajax/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (55,'Delete feedback by ajax','/ajax/deleteFeedback.do',5);

insert into sec_function ( function_id, description, uri, module_id)values (60,'View notices','/admin/allNotice.do',6);
insert into sec_function ( function_id, description, uri, module_id)values (61,'Publish notice','/notice/publishNotice.do',6);

insert into sec_function ( function_id, description, uri, module_id)values (70,'View products','/admin/allProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (71,'View categories','/admin/allCategory.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (72,'Publish product','/product/publishProduct.do',7);

insert into sec_privilege ( external_id, type,role_id,department_id) values (1,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (2,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (3,2,3,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (4,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (4,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (5,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (5,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (6,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (6,2,2,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (7,2,1,1);
insert into sec_privilege ( external_id, type,role_id,department_id) values (7,2,2,1);

