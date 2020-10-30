
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


CREATE TABLE tp_comments
(
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



/* Comments */

COMMENT ON COLUMN tp_board.b_uid IS '게시판 고유번호입니다.';
COMMENT ON COLUMN tp_board.b_nickname IS '게시판 비회원 닉네임입니다.';
COMMENT ON COLUMN tp_board.b_pw IS '게시판 비회원 비밀번호입니다.';
COMMENT ON COLUMN tp_board.u_uid IS '회원 uid ';
COMMENT ON COLUMN tp_board.catagory IS '<진료톡>
jin_jung
jin_bi
<자유톡>
free
';
COMMENT ON COLUMN tp_board.title IS '게시판 내에 해당 글 제목을 의미합니다.';
COMMENT ON COLUMN tp_board.content IS '게시판 내에 글 내용';
COMMENT ON COLUMN tp_board.viewcnt IS '게시글 조회수 입니다.';
COMMENT ON COLUMN tp_board.b_regdate IS '게시글 리스트에 보이는 작성일입니다.';
COMMENT ON COLUMN tp_board.file1 IS '증빙서류 파일첨부입니다.';
COMMENT ON COLUMN tp_board.file2 IS '증빙서류가 아닌,

그냥 파일 첨부입니다.';
COMMENT ON COLUMN tp_comments.b_uid IS '게시판 고유번호입니다.';
COMMENT ON COLUMN tp_comments.u_uid IS '회원 uid ';
COMMENT ON COLUMN tp_comments.c_nickname IS '댓글 비회원 작성자 명';
COMMENT ON COLUMN tp_comments.c_pw IS '댓글 비회원 비밀번호 ';
COMMENT ON COLUMN tp_comments.reply IS '게시글 댓글 입니다.';
COMMENT ON COLUMN tp_comments.c_regdate IS '댓글 게시 날짜입니다.';
COMMENT ON COLUMN tp_user.u_uid IS '회원 uid ';
COMMENT ON COLUMN tp_user.u_nickname IS '회원의 닉네임 입니다.';
COMMENT ON COLUMN tp_user.u_pw IS '회원테이블 비밀번호 입니다.';
COMMENT ON COLUMN tp_user.email IS '회원 id랑 email';
COMMENT ON COLUMN tp_user.name IS '회원 이름 입니다.';
COMMENT ON COLUMN tp_user.gender IS '회원 성별 입니다.';
COMMENT ON COLUMN tp_user.birth IS '회원 생년월일 합니다 !!!!
숫자는 더해져 연산이되서 무조건 바차!';


CREATE SEQUENCE _seq;
