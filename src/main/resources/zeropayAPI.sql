# zeropayAPI DB 생성
create database if not exists zeropayAPI default charset utf8;

# zeropayAPI DB 사용
use zeropayAPI;

# 업권 대분류
create table if not exists category1(
	ca1_id int primary key,
    ca1_name varchar(50) not null default 'none'
);

# 업권 소분류
# on update cascade : 업권 대분류가 변경되면 업권 소분류에도 영향이 가진다.
# on delete restrict : 업권 소분류의 데이터가 하나라도 남아있다면 참조하고 있는 업권 대분류 데이터는 삭제할 수 없다.
create table if not exists category2(
	ca2_id int primary key,
    ca1_id int not null,
    ca2_name varchar(50) not null default 'none',
    foreign key(ca1_id) references category1(ca1_id) on update cascade on delete restrict
);

# 회원
create table if not exists member(
	mem_id varchar(255) primary key,
    mem_pw varchar(255) not null,
    mem_name varchar(255) not null
);

# 자산 
create table if not exists asset(
	as_id int primary key auto_increment,
    mem_id varchar(255) not null,
    ca1_id int not null,
    ca2_id int not null,
    as_name varchar(255) not null,
    foreign key(mem_id) references member(mem_id) on update cascade on delete restrict,
    foreign key(ca1_id) references category1(ca1_id) on update cascade on delete restrict,
    foreign key(ca2_id) references category2(ca2_id) on update cascade on delete restrict
);

# 업권 대분류 샘플 데이터
insert into category1 values(100, '은행');
insert into category1 values(200, '카드');
insert into category1 values(300, '증권');
insert into category1 values(400, '캐피탈');
insert into category1 values(500, '보험');
insert into category1 values(600, '전자금융');
insert into category1 values(700, '통신');

# 업권 소분류 샘플 데이터
insert into category2 values(100001, 100, '신한은행');
insert into category2 values(100002, 100, '국민은행');
insert into category2 values(100003, 100, '하나은행');
insert into category2 values(100004, 100, '농협');
insert into category2 values(100005, 100, '부산은행');
insert into category2 values(200001, 200, '신한카드');
insert into category2 values(200002, 200, '국민카드');
insert into category2 values(200003, 200, '부산카드');
insert into category2 values(300001, 300, '삼성증권');
insert into category2 values(300002, 300, '카카오증권');
insert into category2 values(300003, 300, '토스증권');
insert into category2 values(400001, 400, '신한캐피탈');
insert into category2 values(400002, 400, '롯데캐피탈');
insert into category2 values(400003, 400, '삼성캐피탈');
insert into category2 values(500001, 500, '삼성보험');
insert into category2 values(500002, 500, '하나생명');
insert into category2 values(500003, 500, '다이렉트 보험');
insert into category2 values(600001, 600, '카카오페이');
insert into category2 values(600002, 600, '네이버페이');
insert into category2 values(600003, 600, '쿠팡페이');
insert into category2 values(700001, 700, 'SKT');
insert into category2 values(700002, 700, 'LG');
insert into category2 values(700003, 700, 'KT');

# 회원 샘플 데이터
insert into member values('user1', '1234qwer', '차차차');
insert into member values('user2', '1234qwer', '오오오');
insert into member values('user3', '1234qwer', '김김김');

# 자산 샘플 데이터
insert into asset values(0,'user1',100,100005,'BNK모바일 입출금 통장');
insert into asset values(0,'user1',100,100001,'신한cash통장');
insert into asset values(0,'user1',100,100003,'오늘도하나씩적금');
insert into asset values(0,'user1',100,100005,'BNK더조은정기예적금');
insert into asset values(0,'user1',200,200003,'BNK 탑모아 신용카드');
insert into asset values(0,'user1',200,200003,'프렌즈 선물 카드');
insert into asset values(0,'user1',300,300001,'쿠콘');
insert into asset values(0,'user1',300,300001,'일임형ISA');
insert into asset values(0,'user1',400,400002,'롯데캐피탈 직장인신용대출');
insert into asset values(0,'user1',400,400001,'신한캐피탈 신용대출');
insert into asset values(0,'user1',500,500001,'꿈나무재태크보험');
insert into asset values(0,'user1',500,500003,'다이렉트 자동차보험');
insert into asset values(0,'user1',600,600001,'페이 포인트');
insert into asset values(0,'user1',600,600001,'카카오 페이머니');
insert into asset values(0,'user1',600,600002,'네이버페이 포인트1');
insert into asset values(0,'user1',700,700001,'SKT');
insert into asset values(0,'user1',700,700002,'LG');

