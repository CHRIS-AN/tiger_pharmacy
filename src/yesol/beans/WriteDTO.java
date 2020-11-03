package yesol.beans;

public class WriteDTO {
	private int b_uid; // 게시판번호
	private int u_uid; // 회원번호
	private String category;
	private String title; // 게시판제목
	private String content; // 게시글 내용
	private int viewcnt; // 조회수
	private String b_regdate; // 게시글 등록일
	private String file1;
	private String file2;
	private boolean isImage;
	
	private String u_nickname; // 회원테이블에서 조인하는 sql문 만들기
	
	
	// 웹개발시...
	// 가급적, 다음 3가지는 이름을 일치 시켜주는게 좋습니다.
	// DB필드명 = 클래스 필드명 = form의 b_nickname명
	
	// 기본생성자
	public WriteDTO() {
		super();
		System.out.println("WriteDTO() 객체 생성");
	}

	// 매개변수를 받는 생성자
	public WriteDTO(int b_uid, int u_uid, String category, String title, String content, int viewcnt, String file1,
			String file2, String u_nickname) {
		super();
		this.b_uid = b_uid;
		this.u_uid = u_uid;
		this.category = category;
		this.title = title;
		this.content = content;
		this.viewcnt = viewcnt;
		this.file1 = file1;
		this.file2 = file2;
		this.u_nickname = u_nickname;
	}

	
	public int getB_uid() {
		return b_uid;
	}

	public void setB_uid(int b_uid) {
		this.b_uid = b_uid;
	}

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public boolean isImage() {
		return isImage;
	}

	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}

	public String getU_nickname() {
		return u_nickname;
	}

	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
}