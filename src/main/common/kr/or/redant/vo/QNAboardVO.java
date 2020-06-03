package kr.or.redant.vo;

import java.util.List;

//QNA게시판
public class QNAboardVO {
	private String qna_no;			//QNA 번호
	private String qna_title;		//QNA 제목
	private String qna_pass;		//QNA 비밀번호
	private String qna_content;		//QNA 내용
	private String qna_hit;			//조회수
	private String qna_reg_date;	//최초등록일
	private String qna_status;		//게시글상태
	private String qna_group;		//그룹번호
	private String qna_g_seq;			//그룹 내 순번
	private String qna_depth;		//글의 깊이
	private String mem_id;			//회원 아이디
	private String admin_id;		//관리자 아이디
	private List<QNAFileItemVO> qna_items;
	private String qna_rnum;
	private String qna_writer;
	
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_no() {
		return qna_no;
	}
	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(String qna_hit) {
		this.qna_hit = qna_hit;
	}
	public String getQna_reg_date() {
		return qna_reg_date;
	}
	public void setQna_reg_date(String qna_reg_date) {
		this.qna_reg_date = qna_reg_date;
	}
	public String getQna_status() {
		return qna_status;
	}
	public void setQna_status(String qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_group() {
		return qna_group;
	}
	public void setQna_group(String qna_group) {
		this.qna_group = qna_group;
	}
	public String getQna_g_seq() {
		return qna_g_seq;
	}
	public void setQna_g_seq(String qna_g_seq) {
		this.qna_g_seq = qna_g_seq;
	}
	public String getQna_depth() {
		return qna_depth;
	}
	public void setQna_depth(String qna_depth) {
		this.qna_depth = qna_depth;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public List<QNAFileItemVO> getQna_items() {
		return qna_items;
	}
	public void setQna_items(List<QNAFileItemVO> qna_items) {
		this.qna_items = qna_items;
	}
	public String getQna_rnum() {
		return qna_rnum;
	}
	public void setQna_rnum(String qna_rnum) {
		this.qna_rnum = qna_rnum;
	}
	
	
	
}
