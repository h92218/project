/* MEMBER TABLE */
create table member(
	mem_num number not null primary key,
	mem_id varchar2(20) unique,
	mem_auth number(10) not null
);
create sequence member_seq;

/* MEMBER_DETAIL TABLE */
create table member_detail(
	detail_num number not null primary key,
	mem_num not null,
	detail_nick varchar2(20),
	detail_name varchar2(20) not null,
	detail_passwd varchar2(20) not null,
	detail_cell number(20) not null,
	detail_mail varchar2(50) not null,
	detail_date DATE not null,
	detail_point number,
	detail_img varchar2(500),
	image blob,
	constraint detail_fk foreign key (mem_num) references member(mem_num)
);

create sequence member_detail_seq;



/* QA_BOARD TABLE */
create table qa_board(
	qa_num number not null primary key,
	qa_title varchar2(150) not null,
	qa_content clob not null,
	qa_secret_key number(4),
	qa_datetime DATE not null,
	qa_hit number not null,
	qa_filename varchar2(100),
	qa_uploadfile blob,
	mem_num number not null,
	mem_id varchar2(20),
	constraint qa_fk3 foreign key (mem_id) references member(mem_id),
	constraint qa_fk foreign key (mem_num) references member(mem_num)
);
create sequence qa_board_seq;

/* QA_REPLY TABLE */
create table qa_reply (
	qa_reply_num number not null primary key,
	mem_num number not null,
	mem_id varchar2(20) not null,
	qa_num number not null,
	qa_reply_content clob not null,
	qa_reply_datetime DATE not null,
	constraint qa_fk1 foreign key(mem_num) references member(mem_num),
	constraint qa_fk4 foreign key(mem_id) references member(mem_id),
	constraint qa_fk2 foreign key(qa_num) references qa_board(qa_num)
);

/* 자주하는 질문 테이블 */
create table qa_aqtable (
     aq_num number not null primary key,
     aq_title varchar(150) not null,
     aq_content clob not null
     );
     
     create sequence qa_aqtable_seq;
/* 자주하는 질문 테이블 */

/* QA1_1Board */
create table qa1_1board(
	qa1_1num number not null primary key,
	qa1_1title varchar2(150) not null,
	qa1_1content clob not null,
	qa1_1secret_key number(4),
	qa1_1datetime DATE not null,
	qa1_1hit number not null,
	qa_filename varchar2(100),
	qa_uploadfile blob,
	mem_id varchar2(20) not null,
	mem_num number not null,
	constraint qa_fk foreign key (mem_num) references member(mem_num),
	constraint qa_fk5 foreign key (mem_id) references member(mem_id)
);

create sequence qa_board_seq;
/* QA1_1Board */
create sequence qa_reply_seq;

/* CLUB TABLE */
create table club(
   club_num number not null primary key,
   mem_num number not null,
   club_title varchar2(60) not null,
   club_loc varchar2(60) not null,
   club_name varchar2(60) not null,
   club_start date not null,
   club_time varchar2(20) not null,
   club_interval varchar2(40) not null,
   club_end date not null,
   club_detail clob not null,
   club_img blob,
   club_state number not null,
   return_message varchar2(2000),
   club_date date default sysdate not null,
   constraint club_fk foreign key (mem_num) references member (mem_num)
);

create sequence club_seq;

/* JOINCLUB TABLE */
create table joinclub(
	join_num number not null primary key,
	club_num number not null,
	mem_num number not null,
	join_date varchar2(1000),
	constraint club_joinclub_fk foreign key (club_num) references club(club_num),
	constraint member_joinclub_fk foreign key (mem_num) references member(mem_num)	
);
create sequence joinclub_seq;

/* POST TABLE */
create table post (
	post_num number not null primary key,
	mem_num number not null,
	club_num number not null,
	post_title varchar2(30) not null,
	post_board varchar2(2000) not null,
	post_img blob,
	post_imgname varchar2(200),
	post_date date not null,
	post_modify date not null,
	post_category varchar2(50) not null,
	post_hit number(20) not null,
	constraint post_fk1 foreign key(mem_num) references member(mem_num),
	constraint post_fk2 foreign key(club_num) references club(club_num) 
);

create sequence post_seq;

/* NOTICE TABLE */
create table notice(
	nt_num number not null primary key,
	mem_num number not null,
	nt_title varchar2(80) not null,
	nt_category varchar2(15) not null,
	nt_content clob not null,
	nt_img blob,
	nt_file clob,
	nt_datetime date not null,
	nt_hit number not null,
	constraint notice_fk foreign key(mem_num) references member(mem_num)
);

create sequence notice_seq;