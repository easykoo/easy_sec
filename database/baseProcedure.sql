DROP PROCEDURE IF EXISTS generateCategoryId;
CREATE PROCEDURE generateCategoryId(in parentId varchar(20), out genId varchar(20))
BEGIN
declare tempId varchar (20);
if parentId is null or parentId = '' then
  select max(category_id) + 1 into tempId from category;
  set tempId = ifnull(tempId, '101');
else
  select cast(max(cast(category_id as unsigned)) + 1 as char(20)) into tempId from category where parent_category = parentId;
  if tempId is null then
    select concat(parentId, '001') into tempId;
  end if;
end if;
set genId = tempId;
END;