delete from sec_role;
delete from sec_department;
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(1,'Admin','SYSTEM',now(),'SYSTEM',now());
insert into sec_role (role_id, description, create_user, create_date, update_user, update_date)values(2,'Employee','SYSTEM',now(),'SYSTEM',now());
insert into sec_role(role_id, description, create_user, create_date, update_user, update_date) values(3,'User','SYSTEM',now(),'SYSTEM',now());
insert into sec_department (department_id, description, create_user, create_date, update_user, update_date)values(1,'Default','SYSTEM',now(),'SYSTEM',now());

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

insert into sec_function ( function_id, description, uri, module_id)values (30,'View profile','/profile/profile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (31,'View preferences','/profile/preferences.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (32,'Change password','/profile/password.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (33,'Change profile','/profile/changeProfile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (34,'Change email','/profile/changeEmail.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (35,'Change preferences','/profile/changePreferences.do',3);

insert into sec_function ( function_id, description, uri, module_id)values (40,'View accounts','/account/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (41,'Get all account by ajax','/account/ajax/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (42,'Delete account by ajax','/account/ajax/deleteAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (43,'Ban account by ajax','/account/ajax/banAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (44,'Unban account by ajax','/account/ajax/unbanAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (45,'Update account by ajax','/account/ajax/updateAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (46,'Make account admin by ajax','/account/ajax/makeAdmin.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (47,'Make account admin by ajax','/account/ajax/hire.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (48,'Make account admin by ajax','/account/ajax/fire.do',4);

insert into sec_function ( function_id, description, uri, module_id)values (50,'View feedback','/feedback/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (51,'Get top 5 feedback by ajax','/feedback/ajax/getTop5Feedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (52,'Read feedback by ajax','/feedback/ajax/readFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (53,'Get feedback count by ajax','/feedback/ajax/getFeedbackCount.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (54,'Get all feedback by ajax','/feedback/ajax/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (55,'Delete feedback by ajax','/feedback/ajax/deleteFeedback.do',5);

insert into sec_function ( function_id, description, uri, module_id)values (60,'View notices','/notice/allNotice.do',6);
insert into sec_function ( function_id, description, uri, module_id)values (61,'Publish notice','/notice/publishNotice.do',6);

insert into sec_function ( function_id, description, uri, module_id)values (70,'View products','/product/allProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (71,'View categories','/product/allCategory.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (72,'Publish product','/product/publishProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (73,'View products','/product/ajax/allProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (74,'Delete product','/product/ajax/deleteProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (75,'Delete products','/product/ajax/deleteProducts.do',7);

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

