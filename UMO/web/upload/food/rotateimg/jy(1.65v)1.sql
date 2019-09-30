--select * from tabs;

create table Member(
    Member_id varchar2(30) PRIMARY key, --맴버아이디
    Member_password number,--맴버비번
    Member_name varchar2(10),--맴버이름
    Member_email varchar2(30),--맴버이메일
    phone varchar2(11),--맴버폰번호
    address varchar2(30),--맴버주소
    kh_cNo number ,--kh회원번호
    join_date Date DEFAULT SYSDATE,--가입일
    attendance_count number,--출석수
    grade number default 1, --등급 
    point number default 0 --포인트(점수)
);

insert into member values('jy9503',1234,'이지연','avenir30@naver.com',01059237319,'서울시 은평구',0000,default,1,default,default);
insert into member values('sein0728',1234,'박세인','tpdls@naver.com',01084850487,'서울시 관악구',1111,default,1,default,default);
insert into member values('pureum01',1234,'국푸름','vnfma@naver.com',01024801286,'서울시 영등포구',2222,default,1,default,default);
insert into member values('sung222',1234,'문성윤','tjddbs@naver.com',01011112222,'서울시 강남구',3333,default,1,default,default);
insert into member values('minsu1234',1234,'최민수','alstn@naver.com',01022223333,'경기도',4444,default,1,default,default);

--select * from Member; 

create table Notice_board(
    Notice_no number PRIMARY key,--공지 게시글 번호
    Notice_writer varchar2(50) not null, --공지게시글 작성자
    Notice_title varchar2(50) not null, --공지게시글 제목
    Notice_contents varchar2(2000) not null,--공지게시글내용
    Original_filename varchar2(100), --원본 첨부파일 
    renamed_filename varchar2(100), --새로 만들어진 첨부파일
    Notice_date DATE default sysdate,--공지 게시글 작성일
    Notice_count number default 0, --공지게시글 조회수
    writing_status varchar2(1) default 'Y', --글상태('Y'는 존재 'N' 삭제)
    CONSTRAINT FK_notice_board_writer_Ref FOREIGN KEY(notice_writer)
    REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);

  CREATE SEQUENCE SEQ_notice_BOARD_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;
   
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'sein0728','저 가입했어요','안녕하세요.박세인입니다하하핳',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'jy9503','저는 지연입니다.','안녕하세요.ㅋㅋㅋㅋㅋㅋㅋㅋㅋ',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'pureum01','저는 우마오 조장..','안녕하세요.국푸름입니다',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'sung222','안녕하십니까','안녕하세요.날씨가좋네요',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'minsu1234','민수민수민수','안녕하세요!!',null,null,default,default,default);
 
--SELECT * FROM Notice_board;



create table Notice_Comment(
   comment_no number primary key,--댓글번호
   comment_writer varchar2(30),--댓글작성자
   comment_contents varchar2(2000),--댓글내용 
   comment_date DATE DEFAULT SYSDATE,--댓글작성일
   board_no_Ref number,--공지게시글 참조번호
   comment_level number default 1,--댓글레벨
   comment_Refno number,--댓글참조번호
   CONSTRAINT FK_notice_board_no_Ref FOREIGN KEY(board_no_Ref) 
   REFERENCES Notice_board(Notice_no) ON DELETE SET NULL, -- 외래키
   CONSTRAINT FK_notice_comment_writer_Ref FOREIGN KEY(comment_writer)
   REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);
  CREATE SEQUENCE SEQ_notice_comment_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;

--SELECT * FROM Notice_Comment;

create table Food_board(
    board_no number PRIMARY key, -- food게시글번호
    board_writer varchar2(30), --게시글 작성자
    board_title varchar2(30), --게시글 제목(맛집 상호명)
    board_contents varchar2(2000), --게시글 내용
    board_map varchar2(1000), --게시글 맛집지도 url
    board_thumbnail varchar2(100), --썸네일(이미지 주소)
    original_filename varchar2(1000),--원본 첨부파일이름
    renamed_filename varchar2(1000),--새로만든 첨부파일이름
    board_date DATE DEFAULT SYSDATE, --게시글 작성일
    board_count number default 0, --게시글 조회수
    writing_status varchar2(1) default 'Y', -- 게시글 상태
    board_grade number default 0, --게시글 평점
    CONSTRAINT FK_food_board_writer_Ref FOREIGN KEY(board_writer)
    REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);

  CREATE SEQUENCE SEQ_food_board_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;
   
insert into Food_board values(SEQ_food_board_NO.nextval,'sein0728','바스버거','짱맛(JMT)',null,'BathBurger.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','이화수육개장','비오느날엔 육개장칼국수 드십쇼.형님들',null,'ihwasuyuggaejang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'pureum01','이태리부대찌개','여기는 맛도 맛인데 양도 혜자입니다.여러분들',null,'itaelibudaejjigae.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','지존짬뽕','여긴 짬뽕과 새우볶음밥 조합 최고',null,'jijonjjamppong.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','마부육전','육회비빕밥하면 바로 여기',null,'mabuyugjeon.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','나이스샤워','가격은 쎄지만 그만큼 퀄리티 왕굿',null,'naiseusyawo.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'sein0728','풍국면','와....여긴..진짜 죽입니다.',null,'pung-gugmyeon.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'pureum01','산들애','산들애 하면 제육볶음.그리고 닭볶음탕은 최고',null,'sandeul-ae.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','전주24시콩나물국밥','여러분 여기는 돈까스만 먹는곳입니다.',null,'jeonju24sikongnamulgugbab.jpg',null,null,default,default,default,default);

insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','역전우동','여러분 여기는 돈까스만 먹는곳입니다.',null,'yeogjeon_udong.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','어육장','여기는 어육장입니다.',null,'eoyugjang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','에머이[emoi]','베트남음식이 땡기는 날엔~.',null,'emoi.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','대독장','김치찌개와 무한리필 계란후라이!!!',null,'daedogjang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','장안닭갈비','닭갈비와 치즈의 조합 아주 굿.',null,'jang-andalg-galbi.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','에그드랍[Egg DROP]','인싸라면 에그드랍과 함께.',null,'EggDrop.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','본초한방삼계탕','몸보신이 필요하다면 여기로.',null,'bongahanbangsamgyetang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','임영옥바지락칼국수','양이 혜자..그리고 너무 맛있어요.',null,'im-yeong-og bajilag kalgugsu.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','고양이부엌','아기자기한 인테리어로 볼만한 것도 있고 맛도 달짝매콤 꼭 가세요',null,'goyang-ibueok.jpg',null,null,default,default,default,default);

--delete food_board;
--drop table food_board;
--
--select * from Food_board;
--select * from  (select rownum as rnum, a.* from (select * from food_board order by board_date desc)a ) where rnum between 0 and 8;
--select * from  (select rownum as rnum, a.* from (select * from food_board order by board_date desc)a ) where rnum between 9 and 16;

commit;
   
create table Food_Comment(
   comment_no number primary key, -- 맛집게시글 댓글번호
   comment_writer varchar2(30),-- 댓글작성자
   comment_contents varchar2(2000),--댓글내용
   comment_date DATE DEFAULT SYSDATE,--댓글 작성일
   board_no_Ref number,--맛집게시글 참조번호
   comment_level number default 1,--댓글레벨
   comment_Refno number,--댓글참조번호
   CONSTRAINT FK_food_board_no_Ref FOREIGN KEY(board_no_Ref) 
   REFERENCES Food_board(board_no) ON DELETE SET NULL,
   CONSTRAINT FK_food_comment_writer_Ref FOREIGN KEY(comment_writer)
   REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);
  CREATE SEQUENCE SEQ_food_comment_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;
   
--select * from Food_Comment;


create table anonymous_board(
    board_no number PRIMARY key,--익명게시판 게시글 번호
    board_writer varchar2(50), --게시글 작성자
    board_title varchar2(30),--게시글 제목
    board_contents varchar2(2000),--게시글 내용
    Original_filename varchar2(100), --원본 첨부파일 
    renamed_filename varchar2(100), --새로 만들어진 첨부파일
    board_date  DATE DEFAULT SYSDATE ,--게시글 작성일
    board_count number default 0,--게시글 조회수
    writing_status varchar2(1) default 'Y'
);

 CREATE SEQUENCE SEQ_anonymous_board_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;

insert into anonymous_board values(SEQ_anonymous_board_NO.nextval,null,'저 가입했어요','안녕하세요.익명입니다홉',null,null,default,default,default);

--select * from anonymous_board;



create table anonymous_comment(
   comment_no number PRIMARY key, --댓글번호
   comment_contents varchar2(2000), --댓글내용
   comment_date DATE DEFAULT SYSDATE, --댓글작성일
   board_no_Ref number,--게시글참조번호
   comment_level number default 1,--댓글레벨
   comment_Refno number,--댓글참조번호
   CONSTRAINT FK_anonymous_board_no_Ref FOREIGN KEY(board_no_Ref) 
   REFERENCES anonymous_board(board_no) ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_anonymous_comment_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;
   
--select * from anonymous_comment;

create table Inquery_board(
    board_no number PRIMARY key,--질의 게시글 번호
    board_writer varchar2(50) not null, --질의게시글 작성자
    board_title varchar2(50) not null, --질의게시글 제목
    board_contents varchar2(2000) not null,--질의게시글내용
    inputCode varchar2(1000),--입력된코드파일이름
    outputCode varchar2(1000),--출력된코드파일이름
    Code_type varchar2(20),--코드종류이름
    Original_filename varchar2(100), --원본 첨부파일 
    renamed_filename varchar2(100), --새로 만들어진 첨부파일
    board_date DATE default sysdate,--질의 게시글 작성일
    board_count number default 0, --질의게시글 조회수
    writing_status varchar2(1) default 'Y', --글상태('Y'는 존재 'N' 삭제)
    CONSTRAINT FK_Inquery_board_writer_Ref FOREIGN KEY(board_writer)
    REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_Inquery_board_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;

insert into Inquery_board values(SEQ_Inquery_board_NO.nextval,'sein0728','질문이요','이 코드좀 봐주세요',null,null,'Java',null,null,default,default,default);

--select * from Inquery_board;

create table Inquery_Comment(
    comment_no number primary key, -- 댓글 번호
    comment_writer varchar2(30), --댓글 작성자
    comment_contents varchar2(2000), --댓글 내용
    updateCode varchar2(1000),--수정된 코드 파일이름
    comment_date DATE DEFAULT SYSDATE, --댓글 작성일
    board_no_Ref number, --게시글 참조번호
    comment_level number default 1, --댓글레벨
    comment_Refno number, --댓글 참조번호
    CONSTRAINT FK_Inquery_board_no_Ref FOREIGN KEY(board_no_Ref) 
    REFERENCES Inquery_board(board_no) ON DELETE SET NULL,
    CONSTRAINT FK_Inquery_comment_writer_Ref FOREIGN KEY(comment_writer)
    REFERENCES MEMBER(Member_id)ON DELETE SET NULL
);

CREATE SEQUENCE SEQ_Inquery_comment_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;

--select * from Inquery_Comment;

--select * from tabs;

--삭제용 구문
--drop table food_comment;
--drop table food_board;
--drop table Notice_comment;
--drop table Notice_board;
--drop table anonymous_comment;
--drop table anonymous_board;
--drop table Inquery_Comment;
--drop table Inquery_board;
--drop table member;
--drop SEQUENCE SEQ_notice_BOARD_NO;
--drop SEQUENCE SEQ_notice_comment_NO;
--drop SEQUENCE SEQ_food_BOARD_NO;
--drop SEQUENCE SEQ_food_comment_NO;
--drop SEQUENCE SEQ_Inquery_BOARD_NO;
--drop SEQUENCE SEQ_Inquery_comment_NO;
--drop SEQUENCE SEQ_anonymous_BOARD_NO;
--drop SEQUENCE SEQ_anonymous_comment_NO;
--select * from tab;


commit;