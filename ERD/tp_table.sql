
/* Drop Tables */

DROP TABLE tp_comments CASCADE CONSTRAINTS;
DROP TABLE tp_board CASCADE CONSTRAINTS;
DROP TABLE tp_user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE tp_board (
	b_uid number NOT NULL,
	b_nickname varchar2(10 char),
	b_pw varchar2(30),
	u_uid number NOT NULL,
	catagory varchar2(10 char) NOT NULL,
	title varchar2(100 char),
	content clob NOT NULL,
	viewcnt number DEFAULT 0 NOT NULL,
	b_regdate date DEFAULT SYSDATE,
	file1 varchar2(200 char),
	file2 varchar2(200 char),
	PRIMARY KEY (b_uid));
-- 첨부파일 원본파일,물리적파일를 같이  추가할려고 칼럼 하나 더 추가.
ALTER  TABLE TP_BOARD 
ADD file2_source varchar2(200 char);



CREATE TABLE tp_comments
(
	c_uid number NOT NULL,
	b_uid number NOT NULL,
	u_uid number NULL,
	c_nickname varchar2(10 char),
	c_pw varchar2(20 char),
	reply varchar2(500 char),
	c_regdate date DEFAULT SYSDATE,
	PRIMARY KEY (c_uid)
);


CREATE TABLE tp_user
( 
	u_uid number NOT NULL,
	u_nickname varchar2(10 char) NOT NULL UNIQUE,
	u_pw varchar2(100 char) NOT NULL,
	email varchar2(50 char) NOT NULL UNIQUE,
	name varchar2(20 char) NOT NULL,
	gender varchar2(10 char) NOT NULL,
	birth varchar2(40 char) NOT NULL,
	PRIMARY KEY (u_uid)
);
SELECT * FROM tp_user;
SELECT 
FROM tp_user
WHERE U_UID = ? AND U_NICKNAME;
SELECT tp_user.*
FROM TP_USER
WHERE U_NICKNAME IS NULL;


SELECT tp_user.*
FROM TP_USER;
INSERT INTO TP_USER 
VALUES (63, '이것은닉네임5', 'lovw77881', 'anjungmin97@naver.com', '안민','남','1993-09-31');
SELECT *
FROM TP_USER;
/* Create Foreign Keys */

ALTER TABLE tp_comments
	ADD FOREIGN KEY (b_uid)
	REFERENCES tp_board (b_uid)
;


ALTER TABLE tp_board
	ADD FOREIGN KEY (u_uid)
	REFERENCES tp_user (u_uid)
;


ALTER TABLE tp_comments
	ADD FOREIGN KEY (u_uid)
	REFERENCES tp_user (u_uid)
;


/* 시퀀스 */
CREATE SEQUENCE tp_user_seq;
CREATE SEQUENCE tp_board_seq;
CREATE SEQUENCE tp_comments_seq;

/* Comments */

COMMENT ON COLUMN tp_board.b_uid IS '寃뚯떆�뙋 怨좎쑀踰덊샇�엯�땲�떎.';
COMMENT ON COLUMN tp_board.b_nickname IS '寃뚯떆�뙋 鍮꾪쉶�썝 �땳�꽕�엫�엯�땲�떎.';
COMMENT ON COLUMN tp_board.b_pw IS '寃뚯떆�뙋 鍮꾪쉶�썝 鍮꾨�踰덊샇�엯�땲�떎.';
COMMENT ON COLUMN tp_board.u_uid IS '�쉶�썝 uid ';
COMMENT ON COLUMN tp_board.catagory IS '<吏꾨즺�넚>
jin_jung
jin_bi
<�옄�쑀�넚>
free
';
COMMENT ON COLUMN tp_board.title IS '寃뚯떆�뙋 �궡�뿉 �빐�떦 湲� �젣紐⑹쓣 �쓽誘명빀�땲�떎.';
COMMENT ON COLUMN tp_board.content IS '寃뚯떆�뙋 �궡�뿉 湲� �궡�슜';
COMMENT ON COLUMN tp_board.viewcnt IS '寃뚯떆湲� 議고쉶�닔 �엯�땲�떎.';
COMMENT ON COLUMN tp_board.b_regdate IS '寃뚯떆湲� 由ъ뒪�듃�뿉 蹂댁씠�뒗 �옉�꽦�씪�엯�땲�떎.';
COMMENT ON COLUMN tp_board.file1 IS '利앸튃�꽌瑜� �뙆�씪泥⑤��엯�땲�떎.';
COMMENT ON COLUMN tp_board.file2 IS '利앸튃�꽌瑜섍� �븘�땶,

洹몃깷 �뙆�씪 泥⑤��엯�땲�떎.';
COMMENT ON COLUMN tp_comments.b_uid IS '寃뚯떆�뙋 怨좎쑀踰덊샇�엯�땲�떎.';
COMMENT ON COLUMN tp_comments.u_uid IS '�쉶�썝 uid ';
COMMENT ON COLUMN tp_comments.c_nickname IS '�뙎湲� 鍮꾪쉶�썝 �옉�꽦�옄 紐�';
COMMENT ON COLUMN tp_comments.c_pw IS '�뙎湲� 鍮꾪쉶�썝 鍮꾨�踰덊샇 ';
COMMENT ON COLUMN tp_comments.reply IS '寃뚯떆湲� �뙎湲� �엯�땲�떎.';
COMMENT ON COLUMN tp_comments.c_regdate IS '�뙎湲� 寃뚯떆 �궇吏쒖엯�땲�떎.';
COMMENT ON COLUMN tp_user.u_uid IS '�쉶�썝 uid ';
COMMENT ON COLUMN tp_user.u_nickname IS '�쉶�썝�쓽 �땳�꽕�엫 �엯�땲�떎.';
COMMENT ON COLUMN tp_user.u_pw IS '�쉶�썝�뀒�씠釉� 鍮꾨�踰덊샇 �엯�땲�떎.';
COMMENT ON COLUMN tp_user.email IS '�쉶�썝 id�옉 email';
COMMENT ON COLUMN tp_user.name IS '�쉶�썝 �씠由� �엯�땲�떎.';
COMMENT ON COLUMN tp_user.gender IS '�쉶�썝 �꽦蹂� �엯�땲�떎.';
COMMENT ON COLUMN tp_user.birth IS '�쉶�썝 �깮�뀈�썡�씪 �빀�땲�떎 !!!!
�닽�옄�뒗 �뜑�빐�졇 �뿰�궛�씠�릺�꽌 臾댁“嫄� 諛붿감!';

-- not null 삭제
SELECT * FROM USER_CONSTRAINTS;
ALTER TABLE TP_BOARD MODIFY U_uid NULL;
ALTER TABLE TP_COMMENTS MODIFY b_uid NULL;
ALTER TABLE TP_COMMENTS 
<<<<<<< HEAD

SELECT * FROM TP_BOARD;
SELECT * FROM TP_USER;


--- 데이터 삽입


SELECT * FROM TP_BOARD;

>>>>>>> branch 'master' of https://github.com/CHRIS-AN/tiger_pharmacy.git
INSERT INTO TP_BOARD (b_uid, b_nickname, b_pw, U_UID ,CATAGORY ,title, content, B_REGDATE)
VALUES
(tp_board_seq.nextval, ?, ?, tp_board_seq.nextval, 'free', ?, ?, sysdate);
-- default 값은 into 값이랑 values값을 생략을한다.
-- file1, file2, viewcnt 생략. value값으로 항상 free는 삽입을 해주어야한다.
-- file1, file2는 originalFileName을 파라미터값으로 넣어서 넣다 뺐다해야한다.

INSERT INTO TP_BOARD (b_uid, b_nickname, b_pw, CATAGORY ,title, content,VIEWCNT, b_regdate,FILE1,FILE2)
VALUES
(10, '정민', 'DDD', '안녕?', '나나', '','',SYSDATE,'','');

INSERT INTO TP_BOARD (b_uid, b_nickname, CATAGORY ,title, content, b_regdate)
VALUES
(tp_board_seq.NEXTVAL, '연섭','자유', '안녕?', '나나',SYSDATE);

INSERT INTO TP_USER values(tp_user_seq.nextval,'연섭','1234','dustjq1005@naver.com','김연섭','남','1994-07-06');

--test


SELECT TP_BOARD.*, tp_user.u_nickname FROM tp_board, TP_USER  ORDER BY b_uid DESC;

SELECT B_UID, B_NICKNAME, TITLE, CONTENT, B_REGDATE 
FROM TP_BOARD ;
SELECT * FROM tp_board ORDER BY b_uid DESC;

SELECT 
FROM TP_BOARD
WHERE 

UPDATE TP_BOARD SET viewcnt = viewcnt + 1 WHERE b_uid = 22;
UPDATE TP_USER  SET c_viewcnt = C_VIEWCNT +1 WHERE c_uid = ?;
SELECT * FROM TP_BOARD WHERE b_uid = 23;

SELECT * FROM TP_BOARD;

INSERT INTO TP_BOARD (B_UID, FILE2_SOURCE, FILE2, U_UID)
VALUES
(TP_BOARD_SEQ.NEXTVAL, dd.png, dd.png, TP_BOARD_SEQ.NEXTVAL);

SELECT b_uid, file2_source, file2 FROM TP_BOARD WHERE b_uid = 10  ORDER BY b_uid DESC
SELECT b_uid, file2_source, file2 FROM TP_BOARD WHERE b_uid = 22;
SELECT B_PW,B_UID FROM TP_BOARD WHERE B_UID = 52;


ALTER TABLE test_file
	ADD FOREIGN KEY (b_uid)
	REFERENCES test_write (wr_uid)
	ON DELETE CASCADE  -- 참조하는 부모가 삭제되면 같이 삭제됨.
;-- 딱히 할 필요가 없는 거 같다.!!

UPDATE TP_BOARD SET TITLE = 'ㅇㅇ', CONTENT = 'ㅇㅇ', FILE2_SOURCE, FILE2 = ? WHERE B_UID = 93"


SELECT (C_NICKNAME, C_PW, C_REGDATE, C_UID, U_UID) 
FROM TP_COMMENTS 
WHERE TP_BOARD.B_UID = 22; 

INSERT INTO TP_COMMENTS (C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) 
VALUES (4, '22' , '', 'dd', 'dd', 'dd', SYSDATE);
SELECT TP_COMMENTS FROM ORDER BY C_UID DESCMENTS;

SELECT TP_COMMENTS (C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE)
FROM TP_COMMENTS
WHERE TP_COMMENTS.B_UID = TP_BOARD.B_UID;




SELECT * FROM TP_COMMENTS;


SELECT tp_comments.*, tp_user.u_nickName 
FROM tp_comments, tp_user 
where b_uid = 103
AND tp_comments.u_uid = tp_user.u_uid (+) order by c_uid DESC;

SELECT tp_comments.*
FROM TP_COMMENTS, TP_USER

ALTER TABLE TP_COMMENTS ADD C_VIEWCNT NUMBER DEFAULT 0;
-- 회원이 댓글을 남겼을 때, 회원uid, 회원 nickname, 댓글, 작성날

INSERT INTO 
TP_COMMENTS 
(C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) 
VALUES 
(tp_comments_seq.nextval, '103', '123', ';DD', 'D', 'D', SYSDATE);


INSERT INTO 
TP_COMMENTS 
(C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) 
VALUES 
(tp_comments_seq.nextval, ?, '', ?, ?, ?, SYSDATE);

INSERT INTO 
TP_COMMENTS 
(C_UID, B_UID, U_UID, C_NICKNAME, C_PW, REPLY, C_REGDATE) 
VALUES 
(tp_comments_seq.nextval, 103, 23, '', '', '회원이당', SYSDATE);

SELECT *
FROM TP_COMMENTS;

INSERT INTO
TP_USER
(U_UID, U_NICKNAME, U_PW, EMAIL, NAME, GENDER, BIRTH)
VALUES
(77, '정민닉네임', '123123', 'anjungmin92@naver.com','앉어민', '남자', '1992-09-11');
SELECT * FROM TP_USER;


SELECT tp_comments.*, tp_user.u_nickName 
FROM tp_comments, tp_user where b_uid = 103 
AND tp_comments.u_uid = tp_user.u_uid (+) order by c_uid DESC;

DELETE 
FROM TP_COMMENTS
WHERE c_uid = 329 AND C_UID IN 
(SELECT C_UID
FROM TP_COMMENTS
WHERE b_uid in
(SELECT B_UID 
FROM TP_BOARD
WHERE B_UID = 124));



SELECT REPLY
FROM TP_COMMENTS
WHERE C_UID = 439;

-------
UPDATE TP_COMMENTS
SET REPLY = '메롱이다 자자 !?'
WHERE c_uid = 206;
AND c_uid in
(SELECT c_uid
FROM TP_COMMENTS
WHERE B_UID IN
(SELECT b_uid 
FROM TP_BOARD 
WHERE b_uid = 103));
---------

UPDATE  tp_comments
SET REPLY = '왜그럴까??'
WHERE c_uid = 439 AND C_UID IN 
(SELECT C_UID
FROM tp_comments
WHERE b_uid in
(SELECT b_uid 
FROM tp_board
WHERE b_uid = 124));

---------------------------

UPDATE  tp_comments
SET REPLY = ?
WHERE c_uid = ? AND C_UID IN 
(SELECT C_UID
FROM tp_comments
WHERE b_uid in
(SELECT b_uid 
FROM tp_board
WHERE b_uid = ?));

SELECT tp_board.*
FROM TP_BOARD;
