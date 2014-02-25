drop table  if exists feedback;
CREATE  TABLE feedback (
  feedback_id INT(11) NOT NULL AUTO_INCREMENT,
  email VARCHAR(45) NOT NULL ,
  name VARCHAR(20) NOT NULL ,
  content VARCHAR(200) NOT NULL ,
  viewed tinyint(1) DEFAULT '0',
  create_date DATETIME NULL ,
  PRIMARY KEY (feedback_id) );

drop table  if exists subscribe;
CREATE  TABLE subscribe (
  email VARCHAR(45) NOT NULL ,
  name VARCHAR(20) NULL ,
  create_date DATETIME NULL ,
  PRIMARY KEY (email) );
