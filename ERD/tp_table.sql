CREATE USER chris_k IDENTIFIED BY lion_b;

GRANT CONNECT, DBA, resource TO chris_k;

/* Drop Tables */

DROP TABLE tp_comments CASCADE CONSTRAINTS;
DROP TABLE tp_board CASCADE CONSTRAINTS;
DROP TABLE tp_user CASCADE CONSTRAINTS;

drop sequence tp_user_seq;
drop sequence tp_board_seq;
drop sequence tp_comments_seq;

/* Create Tables */

CREATE TABLE tp_board
(
	b_uid number NOT NULL,
	b_nickname varchar2(10 char),
	b_pw varchar2(30),
	u_uid number,
	catagory varchar2(10 char) NOT NULL,
	title varchar2(100 char),
	content clob NOT NULL,
	viewcnt number DEFAULT 0 NOT NULL,
	b_regdate date DEFAULT SYSDATE,
	file1 varchar2(200 char),
	file2 varchar2(200 char),
	PRIMARY KEY (b_uid)

);


CREATE TABLE tp_comments
(
	c_uid number NOT NULL,
	b_uid number NOT NULL,
	u_uid number,
	c_nickname varchar2(10 char),
	c_pw varchar2(20 char),
	reply clob,
	c_regdate date DEFAULT SYSDATE,
	PRIMARY KEY (c_uid)
);


CREATE TABLE tp_user
(
	u_uid number NOT NULL,
	u_nickname varchar2(20 char) NOT NULL UNIQUE,
	u_pw varchar2(100 char) NULL,
	email varchar2(50 char) NOT NULL UNIQUE,
	name varchar2(20 char) NOT NULL,
	gender varchar2(10 char) NOT NULL,
	birth varchar2(40 char) NOT NULL,
	PRIMARY KEY (u_uid)
);


ALTER TABLE tp_comments
	ADD FOREIGN KEY (b_uid)
	REFERENCES tp_board (b_uid)
   ON DELETE CASCADE
;


ALTER TABLE tp_board
	ADD FOREIGN KEY (u_uid)
	REFERENCES tp_user (u_uid)
   ON DELETE CASCADE
;


ALTER TABLE tp_comments
	add FOREIGN KEY (u_uid)
	REFERENCES tp_user (u_uid)
   ON DELETE CASCADE
;

/* 시퀀스 */
CREATE SEQUENCE tp_user_seq;
CREATE SEQUENCE tp_board_seq;
CREATE SEQUENCE tp_comments_seq;

-- not null 삭제
SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE TP_COMMENTS ADD (BUFF_REPLY CLOB);
UPDATE TP_COMMENTS SET BUFF_REPLY = REPLY;
UPDATE TP_COMMENTS SET REPLY = NULL;
COMMIT;
ALTER TABLE TP_COMMENTS DROP COLUMN REPLY;
ALTER TABLE TP_COMMENTS RENAME COLUMN BUFF_REPLY TO REPLY;

SELECT * FROM TP_COMMENTS;





ALTER TABLE TP_BOARD MODIFY U_UID NULL; -- 되어있던데?
ALTER TABLE TP_COMMENTS MODIFY U_uid NULL; -- 댓글 내에서 비회원은 u_uid값이 null이여야 하기 때문에, 허용.
ALTER TABLE TP_user MODIFY U_pw NULL;   -- 구글 email 로그인을 위한 null허용.

SELECT * FROM TP_BOARD;
SELECT * FROM TP_USER;
SELECT * FROM TP_comments;

DELETE FROM TP_COMMENTS;
DELETE FROM TP_USER;

SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = ? and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC;
SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = 'free' and tp_board.u_uid = tp_user.u_uid (+) ORDER BY b_uid DESC;

--- 데이터 삽입

SELECT TP_BOARD.*, tp_user.u_nickname 
FROM tp_board, TP_USER 
where (TITLE LIKE '%병원%' OR CONTENT LIKE '%병원%')
AND catagory = 'jin_jung' and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC;




												-- 시현 테스트 데이터 준비.
												-- 실행 할때마다, 게시판 글 x2
												
-- u_uid u_nickname u_pw email name gender birth   [7개]
-- b_uid b_nickname b_pw u_uid cataogory title content viewcnt b_regdate file1 file2   [10개]
-- c_uid b_uid u_uid c_nickname c_pw reply c_regdate   [7개]
--<진료톡> jin_jung, jin_bi 
--<자유톡> free


-- 회원가입 데이터 집어넣기.
INSERT INTO TP_USER (U_UID, U_NICKNAME, U_PW, EMAIL, NAME, GENDER, BIRTH)
SELECT (tp_user_seq.nextval,'예솔군','lovw77288!@123','dfadfs1@naver.com','김예솔','여','1992-11-01')
UNION ALL
SELECT (tp_user_seq.nextval,'연지군','lovw8821','dfadfs2@naver.com','김연지','여','1996-10-02')
UNION ALL

(tp_user_seq.nextval,'연섭양','qe11231','dfadfs4@naver.com','김연섭','남','1988-08-04'),
(tp_user_seq.nextval,'연철양','qe12123','dfadfs5@naver.com','성연철','남','1911-07-05'),
(tp_user_seq.nextval,'연종양','qe12123','dfadfs6@naver.com','김연종','남','1922-04-06'),
(tp_user_seq.nextval,'연상양','qe121231','dfadfs7@naver.com','김연상','남','1933-03-07'),
(tp_user_seq.nextval,'윤셥양','qe12121','dfadfs8@naver.com','김윤섭','남','1944-02-08'),
(tp_user_seq.nextval,'연우양','qe11221','dfadfs9@naver.com','지연우','남','1955-01-09'),
(tp_user_seq.nextval,'현우양','qe112213','dfadfs0@naver.com','차현우','남','1966-05-11'),
(tp_user_seq.nextval,'가즈아','qe112213','dfadfs11@naver.com','조승우','남','1977-04-22'),
(tp_user_seq.nextval,'승우형','qe1123213','dfadfs22@naver.com','이승우','남','1988-03-30'),
(tp_user_seq.nextval,'승현양','qe121231','dfadfs33@naver.com','이승현','남','1967-02-11'),
(tp_user_seq.nextval,'효리군','qe112321','dfadfs44@naver.com','이효리','여','1989-01-08'),
(tp_user_seq.nextval,'미오군','qe112321','dfadfs45@naver.com','로미오','여','1989-01-08'),
(tp_user_seq.nextval,'젤리나군','qe1113321','dfadfs47@naver.com','안젤리나','여','2014-01-08')
(tp_user_seq.nextval,'젤리나군','qe1113321','dfadfs47@naver.com','안젤리나','여','2014-01-08')
;

DROP TABLE TP_USER CASCADE CONSTRAINTS;



CREATE TABLE TP_USER as
SELECT 
LEVEL AS U_UID, 
		'adf'|| ROUND(DBMS_RANDOM.VALUE(1,1000),0) || 'ad@!fa' AS U_PW,
		'호랭이찡'|| ROUND(DBMS_RANDOM.VALUE(1,1000),0) || '번째닉넴' AS U_NICKNAME ,
		DBMS_RANDOM.STRING('a',9) || '@naver.com' AS EMAIL,
	 	DBMS_RANDOM.STRING('b',6) AS NAME,
		'남' AS GENDER,
		TO_DATE('19920101','YYYYMM	DD') + (ROWNUM -1) AS birth
FROM DUAL 
		CONNECT BY LEVEL <= 1000;
	
	
	
SELECT * FROM TP_USER;

ALTER TABLE TP_user MODIFY U_pw NOT NULL;   



CREATE TABLE tp_board
(
	b_uid number NOT NULL,
	b_nickname varchar2(10 char),
);


-- 진료톡 내에서 정신과 데이터 집어넣기.
INSERT INTO TP_BOARD (B_UID, u_uid, CATAGORY ,title, content, VIEWCNT, b_regdate, FILE1, FILE2)
VALUES
(tp_board_seq.NEXTVAL, 1, 'jin_jung', '정신과 게시글 제목', '정신과 게시글 첨부파일 테스트', 0, SYSDATE, 'photo-19.jpg', '');

-- 진료톡 내에 비뇨기과 데이터 집어넣기.
INSERT INTO TP_BOARD (B_UID, u_uid, CATAGORY ,title, content, VIEWCNT, b_regdate, FILE1, FILE2)
VALUES
(tp_board_seq.NEXTVAL, 1, 'jin_jung', '정신과 게시글 제목', '정신과 게시글 첨부파일 테스트', 0, SYSDATE, 'photo-19.jpg', '');


-- 댓글 데이터 집어넣기
INSERT INTO TP_COMMENTS 
(C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) 
VALUES 
tp_comments_seq.nextval, ?, '', ?, ?, ?, SYSDATE);

-- 게시글 테이블 데이터 집어 넣기 (비회원)
INSERT INTO TP_BOARD (b_uid, b_nickname, b_pw, U_UID, CATAGORY ,title, content,VIEWCNT, b_regdate, FILE1, FILE2)
VALUES
(tp_board_seq.NEXTVAL, '정민', 'DDD', '', '자유' , '안녕?', '나나', 0 ,SYSDATE,'','');



