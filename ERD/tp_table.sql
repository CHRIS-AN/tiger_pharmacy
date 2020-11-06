
/* Drop Tables */

DROP TABLE tp_comments CASCADE CONSTRAINTS;
DROP TABLE tp_board CASCADE CONSTRAINTS;
DROP TABLE tp_user CASCADE CONSTRAINTS;


UPDATE tp_comments SET reply = 'dsvdsv' where c_uid = 36; 

/* Create Tables */

CREATE TABLE tp_board
(
	-- 게시판 고유번호입니다.
	b_uid number NOT NULL,
	-- 게시판 비회원 닉네임입니다.
	b_nickname varchar2(10 char),
	-- 게시판 비회원 비밀번호입니다.
	b_pw varchar2(30),
	u_uid number,
	-- 회원 uid 
	-- <진료톡>
	-- jin_jung
	-- jin_bi
	-- <자유톡>
	-- free
	-- 
	catagory varchar2(10 char) NOT NULL,
	-- 게시판 내에 해당 글 제목을 의미합니다.
	title varchar2(100 char),
	-- 게시판 내에 글 내용
	content clob NOT NULL,
	-- 게시글 조회수 입니다.
	viewcnt number DEFAULT 0 NOT NULL,
	-- 게시글 리스트에 보이는 작성일입니다.
	b_regdate date DEFAULT SYSDATE,
	
	-- 증빙서류 파일첨부입니다.
	file1 varchar2(200 char),
	-- 증빙서류가 아닌,
	-- 
	-- 그냥 파일 첨부입니다.
	file2 varchar2(200 char),
	PRIMARY KEY (b_uid)
);


CREATE TABLE tp_comments
(
	-- 댓글 고유번호 입니다.
	c_uid number NOT NULL,
	-- 게시판 고유번호입니다.
	b_uid number NOT NULL,
	-- 회원 uid 
	u_uid number NOT NULL,
	-- 댓글 비회원 작성자 명
	c_nickname varchar2(10 char),
	-- 댓글 비회원 비밀번호 
	c_pw varchar2(20 char),
	-- 게시글 댓글 입니다.
	reply varchar2(500 char),
	-- 댓글 게시 날짜입니다.
	c_regdate date DEFAULT SYSDATE,
	PRIMARY KEY (c_uid)
);


CREATE TABLE tp_user
(
	-- 회원 uid 
	u_uid number NOT NULL,
	-- 회원의 닉네임 입니다.
	u_nickname varchar2(10 char) NOT NULL UNIQUE,
	-- 회원테이블 비밀번호 입니다.
	u_pw varchar2(100 char) NOT NULL,
	-- 회원 id랑 email
	email varchar2(50 char) NOT NULL UNIQUE,
	-- 회원 이름 입니다.
	name varchar2(20 char) NOT NULL,
	-- 회원 성별 입니다.
	gender varchar2(10 char) NOT NULL,
	-- 회원 생년월일 합니다 !!!!
	-- 숫자는 더해져 연산이되서 무조건 바차!
	birth varchar2(40 char) NOT NULL,
	PRIMARY KEY (u_uid)
);

-- u_uid u_nickname u_pw email name gender birth

/* Create Foreign Keys */

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
ALTER TABLE TP_COMMENTS MODIFY U_uid NULL;
ALTER TABLE TP_user MODIFY U_pw NULL;

SELECT * FROM TP_BOARD;
SELECT * FROM TP_USER;
SELECT * FROM TP_comments;

DELETE FROM TP_COMMENTS;


--- 데이터 삽입


SELECT * FROM TP_BOARD;

INSERT INTO TP_BOARD (b_uid, b_nickname, b_pw, U_UID ,CATAGORY ,title, content, B_REGDATE)
VALUES
(tp_board_seq.nextval, ?, ?, tp_board_seq.nextval, 'free', ?, ?, sysdate);
-- default 값은 into 값이랑 values값을 생략을한다.
-- file1, file2, viewcnt 생략. value값으로 항상 free는 삽입을 해주어야한다.
-- file1, file2는 originalFileName을 파라미터값으로 넣어서 넣다 뺐다해야한다.

INSERT INTO TP_BOARD (b_uid, b_nickname, b_pw, CATAGORY ,title, content,VIEWCNT, b_regdate,FILE1,FILE2)
VALUES
(tp_board_seq.NEXTVAL, '정민', 'DDD', '자유' , '안녕?', '나나', 0 ,SYSDATE,'','');

INSERT INTO TP_BOARD (b_uid, b_nickname, CATAGORY ,title, content, b_regdate)
VALUES
(tp_board_seq.NEXTVAL, '연섭','자유', '안녕?', '나나',SYSDATE);

INSERT INTO TP_USER values(tp_user_seq.nextval,'연섭','1234','dustjq1005@naver.com','김연섭','남','1994-07-06');

----------------------------------------

INSERT INTO TP_BOARD (B_UID, u_uid, CATAGORY ,title, content, VIEWCNT, b_regdate, FILE1,FILE2)
VALUES
(tp_board_seq.NEXTVAL, 1, 'jin_jung', '정신과 게시글 제목', '정신과 게시글 첨부파일 테스트', 0, SYSDATE, 'photo-19.jpg', '');

SELECT * FROM TP_USER;

SELECT * FROM TP_BOARD WHERE CATAGORY = 'jin_jung';

SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = 'jin_jung'
and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC;

INSERT INTO TP_COMMENTS (c_uid,	b_uid, u_uid, reply, c_regdate) VALUES
(tp_comments_seq, 1, 2, 찐찐찐, SYSDATE);

SELECT TP_COMMENTS.*, tp_user.u_nickname FROM TP_COMMENTS, TP_USER where b_uid = 1
 and TP_COMMENTS.u_uid = tp_user.u_uid ORDER BY c_uid DESC;

SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where b_uid = 4 and tp_board.u_uid = tp_user.u_uid

SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where (TITLE LIKE '%병원%' OR CONTENT LIKE '%병원%')
AND catagory = 'jin_jung' and tp_board.u_uid = tp_user.u_uid ORDER BY b_uid DESC;


--test


SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER  ORDER BY b_uid DESC;

SELECT B_UID, B_NICKNAME, TITLE, CONTENT, B_REGDATE 
FROM TP_BOARD ;
SELECT * FROM tp_board ORDER BY b_uid DESC;

SELECT 
FROM TP_BOARD
WHERE 

UPDATE TP_BOARD SET viewcnt = viewcnt + 1 WHERE b_uid = 22;
SELECT * FROM TP_BOARD WHERE b_uid = 23;

SELECT * FROM TP_BOARD WHERE b_uid = 10;

INSERT INTO TP_USER values(tp_user_seq.nextval,'하이루','1234','dustjq1004@naver.com','안정민','남','1994-07-06');

SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where TP_BOARD.b_uid = ? ORDER BY b_uid DESC;



SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = '자유' AND TP_BOARD.U_UID = tp_user.U_UID (+) ORDER BY b_uid DESC;
SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER where catagory = '자유' AND (TP_BOARD.U_UID IS NULL) ORDER BY b_uid DESC



SELECT * FROM TP_BOARD;

SELECT COUNT(*) AS total FROM TP_BOARD;
UPDATE TP_BOARD SET TITLE = 'ㅇㅇ', CONTENT = 'ㅇㅇ', FILE2_SOURCE, FILE2 = ? WHERE B_UID = 93"
