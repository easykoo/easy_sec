
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
insert into category (category_id,  description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('101', 'Bamboo Crafts', '竹工艺品', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('102', 'Christmas Tree', '圣诞树', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('103', 'Crystal Crafts', '水晶工艺品', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('104', 'Glass Crafts', '玻璃工艺品', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('105', 'Porcelain Crafts', '陶瓷工艺品', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('106', 'Power Bank Gifts', '移动电源', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('107', 'Promotional Porcelain', '促销瓷器', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('108', 'Resin Crafts', '树脂工艺品', null, 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('102001', 'Fiber optic Christmas tree', '光纤圣诞树', '102', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('102002', 'Ordinary Christmas tree', '普通圣诞树', '102', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('104001', 'Blown Glass Ornaments', '吹制玻璃饰品', '104', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('104002', 'Glass Candle Holder', '玻璃罐', '104', 'SYSTEM', now(), 'SYSTEM', now());
insert into category (category_id, description, cn_description, parent_category, create_user, create_date, update_user, update_date)
values ('104003', 'Glass Crafts', '玻璃工艺品', '104', 'SYSTEM', now(), 'SYSTEM', now());