package kr.or.redant.vo;
//자주하는 질문
public class FAQboardVO {
	private String faq_no;			//자주하는 질문 번호
	private String faq_title;		//자주하는 질문 제목
	private String faq_content;		//자주하는 질문 내용
	private String faq_hit;			//조회수
	private String faq_reg_date;	//최초등록일
	private String faq_status;		//게시글 상태
	private String admin_id;		//관리자 아이디
	private String faq_writer;
	private String faq_rnum;
	
	public String getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_hit() {
		return faq_hit;
	}
	public void setFaq_hit(String faq_hit) {
		this.faq_hit = faq_hit;
	}
	public String getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(String faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public String getFaq_status() {
		return faq_status;
	}
	public void setFaq_status(String faq_status) {
		this.faq_status = faq_status;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public String getFaq_rnum() {
		return faq_rnum;
	}
	public void setFaq_rnum(String faq_rnum) {
		this.faq_rnum = faq_rnum;
	}
	
	
}
