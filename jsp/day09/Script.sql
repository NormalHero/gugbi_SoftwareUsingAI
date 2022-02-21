create database board;
use board;

create table tbl_member(
   memberNumber int unsigned auto_increment primary key,
   memberId varchar(2000),
   memberPw varchar(2000),
   memberName varchar(2000),
   memberAge tinyint unsigned,
   memberGender varchar(10),
   memberEmail varchar(2000),
   memberZipcode varchar(100),
   memberAddress varchar(2000),
   memberAddressDetail varchar(2000)
);

select * from tbl_member;