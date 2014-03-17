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

insert into sec_function ( function_id, description, uri, module_id)values (101,'View dashboard','/admin/dashboard.do',1);

insert into sec_function ( function_id, description, uri, module_id)values (201,'View setting','/admin/settings.do',2);

insert into sec_function ( function_id, description, uri, module_id)values (301,'View profile','/profile/profile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (302,'View preferences','/profile/preferences.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (303,'Change password','/profile/password.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (304,'Change profile','/profile/changeProfile.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (305,'Change email','/profile/changeEmail.do',3);
insert into sec_function ( function_id, description, uri, module_id)values (306,'Change preferences','/profile/changePreferences.do',3);

insert into sec_function ( function_id, description, uri, module_id)values (401,'View accounts','/account/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (402,'Get all account by ajax','/account/ajax/allAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (403,'Delete account by ajax','/account/ajax/deleteAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (404,'Ban account by ajax','/account/ajax/banAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (405,'Unban account by ajax','/account/ajax/unbanAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (406,'Update account by ajax','/account/ajax/updateAccount.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (407,'Make account admin by ajax','/account/ajax/makeAdmin.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (408,'Make account admin by ajax','/account/ajax/hire.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (409,'Make account admin by ajax','/account/ajax/fire.do',4);
insert into sec_function ( function_id, description, uri, module_id)values (410,'Delete accounts','/account/ajax/deleteAccounts.do',4);

insert into sec_function ( function_id, description, uri, module_id)values (501,'View feedback','/feedback/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (502,'Get top 5 feedback by ajax','/feedback/ajax/getTop5Feedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (503,'Read feedback by ajax','/feedback/ajax/readFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (504,'Get feedback count by ajax','/feedback/ajax/getFeedbackCount.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (505,'Get all feedback by ajax','/feedback/ajax/allFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (506,'Delete feedback by ajax','/feedback/ajax/deleteFeedback.do',5);
insert into sec_function ( function_id, description, uri, module_id)values (507,'Delete feedback array','/feedback/ajax/deleteFeedbackArray.do',5);

insert into sec_function ( function_id, description, uri, module_id)values (601,'View notices','/notice/allNotice.do',6);
insert into sec_function ( function_id, description, uri, module_id)values (602,'Publish notice','/notice/publishNotice.do',6);

insert into sec_function ( function_id, description, uri, module_id)values (701,'View products','/product/allProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (702,'View categories','/product/allCategory.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (703,'Publish product','/product/publishProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (704,'View products','/product/ajax/allProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (705,'Delete product','/product/ajax/deleteProduct.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (706,'Delete products','/product/ajax/deleteProducts.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (707,'Create category','/product/createCategory.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (708,'Edit category','/product/editCategory.do',7);
insert into sec_function ( function_id, description, uri, module_id)values (709,'Delete category','/product/ajax/deleteCategory.do',7);

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

