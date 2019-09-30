--select * from tabs;

create table Member(
    Member_id varchar2(30) PRIMARY key, --�ɹ����̵�
    Member_password number,--�ɹ����
    Member_name varchar2(10),--�ɹ��̸�
    Member_email varchar2(30),--�ɹ��̸���
    phone varchar2(11),--�ɹ�����ȣ
    address varchar2(30),--�ɹ��ּ�
    kh_cNo number ,--khȸ����ȣ
    join_date Date DEFAULT SYSDATE,--������
    attendance_count number,--�⼮��
    grade number default 1, --��� 
    point number default 0 --����Ʈ(����)
);

insert into member values('jy9503',1234,'������','avenir30@naver.com',01059237319,'����� ����',0000,default,1,default,default);
insert into member values('sein0728',1234,'�ڼ���','tpdls@naver.com',01084850487,'����� ���Ǳ�',1111,default,1,default,default);
insert into member values('pureum01',1234,'��Ǫ��','vnfma@naver.com',01024801286,'����� ��������',2222,default,1,default,default);
insert into member values('sung222',1234,'������','tjddbs@naver.com',01011112222,'����� ������',3333,default,1,default,default);
insert into member values('minsu1234',1234,'�ֹμ�','alstn@naver.com',01022223333,'��⵵',4444,default,1,default,default);

--select * from Member; 

create table Notice_board(
    Notice_no number PRIMARY key,--���� �Խñ� ��ȣ
    Notice_writer varchar2(50) not null, --�����Խñ� �ۼ���
    Notice_title varchar2(50) not null, --�����Խñ� ����
    Notice_contents varchar2(2000) not null,--�����Խñ۳���
    Original_filename varchar2(100), --���� ÷������ 
    renamed_filename varchar2(100), --���� ������� ÷������
    Notice_date DATE default sysdate,--���� �Խñ� �ۼ���
    Notice_count number default 0, --�����Խñ� ��ȸ��
    writing_status varchar2(1) default 'Y', --�ۻ���('Y'�� ���� 'N' ����)
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
   
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'sein0728','�� �����߾��','�ȳ��ϼ���.�ڼ����Դϴ������K',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'jy9503','���� �����Դϴ�.','�ȳ��ϼ���.������������������',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'pureum01','���� �츶�� ����..','�ȳ��ϼ���.��Ǫ���Դϴ�',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'sung222','�ȳ��Ͻʴϱ�','�ȳ��ϼ���.���������׿�',null,null,default,default,default);
insert into Notice_board values(SEQ_notice_BOARD_NO.nextval,'minsu1234','�μ��μ��μ�','�ȳ��ϼ���!!',null,null,default,default,default);
 
--SELECT * FROM Notice_board;



create table Notice_Comment(
   comment_no number primary key,--��۹�ȣ
   comment_writer varchar2(30),--����ۼ���
   comment_contents varchar2(2000),--��۳��� 
   comment_date DATE DEFAULT SYSDATE,--����ۼ���
   board_no_Ref number,--�����Խñ� ������ȣ
   comment_level number default 1,--��۷���
   comment_Refno number,--���������ȣ
   CONSTRAINT FK_notice_board_no_Ref FOREIGN KEY(board_no_Ref) 
   REFERENCES Notice_board(Notice_no) ON DELETE SET NULL, -- �ܷ�Ű
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
    board_no number PRIMARY key, -- food�Խñ۹�ȣ
    board_writer varchar2(30), --�Խñ� �ۼ���
    board_title varchar2(30), --�Խñ� ����(���� ��ȣ��)
    board_contents varchar2(2000), --�Խñ� ����
    board_map varchar2(1000), --�Խñ� �������� url
    board_thumbnail varchar2(100), --�����(�̹��� �ּ�)
    original_filename varchar2(1000),--���� ÷�������̸�
    renamed_filename varchar2(1000),--���θ��� ÷�������̸�
    board_date DATE DEFAULT SYSDATE, --�Խñ� �ۼ���
    board_count number default 0, --�Խñ� ��ȸ��
    writing_status varchar2(1) default 'Y', -- �Խñ� ����
    board_grade number default 0, --�Խñ� ����
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
   
insert into Food_board values(SEQ_food_board_NO.nextval,'sein0728','�ٽ�����','¯��(JMT)',null,'BathBurger.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','��ȭ��������','��������� ������Į���� ��ʼ�.���Ե�',null,'ihwasuyuggaejang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'pureum01','���¸��δ��','����� ���� ���ε� �絵 �����Դϴ�.�����е�',null,'itaelibudaejjigae.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','����«��','���� «�Ͱ� ���캺���� ���� �ְ�',null,'jijonjjamppong.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','��������','��ȸ������ϸ� �ٷ� ����',null,'mabuyugjeon.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','���̽�����','������ ������ �׸�ŭ ����Ƽ �ձ�',null,'naiseusyawo.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'sein0728','ǳ����','��....����..��¥ ���Դϴ�.',null,'pung-gugmyeon.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'pureum01','����','���� �ϸ� ��������.�׸��� �ߺ������� �ְ�',null,'sandeul-ae.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','����24���ᳪ������','������ ����� ����� �Դ°��Դϴ�.',null,'jeonju24sikongnamulgugbab.jpg',null,null,default,default,default,default);

insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','�����쵿','������ ����� ����� �Դ°��Դϴ�.',null,'yeogjeon_udong.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','������','����� �������Դϴ�.',null,'eoyugjang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','������[emoi]','��Ʈ�������� ����� ����~.',null,'emoi.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','�뵶��','��ġ��� ���Ѹ��� ����Ķ���!!!',null,'daedogjang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','��ȴ߰���','�߰���� ġ���� ���� ���� ��.',null,'jang-andalg-galbi.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','���׵��[Egg DROP]','�νζ�� ���׵���� �Բ�.',null,'EggDrop.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','�����ѹ�����','�������� �ʿ��ϴٸ� �����.',null,'bongahanbangsamgyetang.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','�ӿ���������Į����','���� ����..�׸��� �ʹ� ���־��.',null,'im-yeong-og bajilag kalgugsu.jpg',null,null,default,default,default,default);
insert into Food_board values(SEQ_food_board_NO.nextval,'jy9503','����̺ξ�','�Ʊ��ڱ��� ���׸���� ������ �͵� �ְ� ���� ��¦���� �� ������',null,'goyang-ibueok.jpg',null,null,default,default,default,default);

--delete food_board;
--drop table food_board;
--
--select * from Food_board;
--select * from  (select rownum as rnum, a.* from (select * from food_board order by board_date desc)a ) where rnum between 0 and 8;
--select * from  (select rownum as rnum, a.* from (select * from food_board order by board_date desc)a ) where rnum between 9 and 16;

commit;
   
create table Food_Comment(
   comment_no number primary key, -- �����Խñ� ��۹�ȣ
   comment_writer varchar2(30),-- ����ۼ���
   comment_contents varchar2(2000),--��۳���
   comment_date DATE DEFAULT SYSDATE,--��� �ۼ���
   board_no_Ref number,--�����Խñ� ������ȣ
   comment_level number default 1,--��۷���
   comment_Refno number,--���������ȣ
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
    board_no number PRIMARY key,--�͸�Խ��� �Խñ� ��ȣ
    board_writer varchar2(50), --�Խñ� �ۼ���
    board_title varchar2(30),--�Խñ� ����
    board_contents varchar2(2000),--�Խñ� ����
    Original_filename varchar2(100), --���� ÷������ 
    renamed_filename varchar2(100), --���� ������� ÷������
    board_date  DATE DEFAULT SYSDATE ,--�Խñ� �ۼ���
    board_count number default 0,--�Խñ� ��ȸ��
    writing_status varchar2(1) default 'Y'
);

 CREATE SEQUENCE SEQ_anonymous_board_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;

insert into anonymous_board values(SEQ_anonymous_board_NO.nextval,null,'�� �����߾��','�ȳ��ϼ���.�͸��Դϴ�ȩ',null,null,default,default,default);

--select * from anonymous_board;



create table anonymous_comment(
   comment_no number PRIMARY key, --��۹�ȣ
   comment_contents varchar2(2000), --��۳���
   comment_date DATE DEFAULT SYSDATE, --����ۼ���
   board_no_Ref number,--�Խñ�������ȣ
   comment_level number default 1,--��۷���
   comment_Refno number,--���������ȣ
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
    board_no number PRIMARY key,--���� �Խñ� ��ȣ
    board_writer varchar2(50) not null, --���ǰԽñ� �ۼ���
    board_title varchar2(50) not null, --���ǰԽñ� ����
    board_contents varchar2(2000) not null,--���ǰԽñ۳���
    inputCode varchar2(1000),--�Էµ��ڵ������̸�
    outputCode varchar2(1000),--��µ��ڵ������̸�
    Code_type varchar2(20),--�ڵ������̸�
    Original_filename varchar2(100), --���� ÷������ 
    renamed_filename varchar2(100), --���� ������� ÷������
    board_date DATE default sysdate,--���� �Խñ� �ۼ���
    board_count number default 0, --���ǰԽñ� ��ȸ��
    writing_status varchar2(1) default 'Y', --�ۻ���('Y'�� ���� 'N' ����)
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

insert into Inquery_board values(SEQ_Inquery_board_NO.nextval,'sein0728','�����̿�','�� �ڵ��� ���ּ���',null,null,'Java',null,null,default,default,default);

--select * from Inquery_board;

create table Inquery_Comment(
    comment_no number primary key, -- ��� ��ȣ
    comment_writer varchar2(30), --��� �ۼ���
    comment_contents varchar2(2000), --��� ����
    updateCode varchar2(1000),--������ �ڵ� �����̸�
    comment_date DATE DEFAULT SYSDATE, --��� �ۼ���
    board_no_Ref number, --�Խñ� ������ȣ
    comment_level number default 1, --��۷���
    comment_Refno number, --��� ������ȣ
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

--������ ����
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