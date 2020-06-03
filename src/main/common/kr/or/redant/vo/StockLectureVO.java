package kr.or.redant.vo;

import java.util.List;

//주식강좌
public class StockLectureVO {	
	private String sl_no;		//주식강좌 글번호
	private String sl_title;	//주식강좌 제목
	private String sl_content;	//자유게시판 내용
	private String sl_hit;		//조회수
	private String sl_reg_date;	//최초등록일
	private String sl_status;	//게시글 상태
	private String lecture_url;	//강좌 URL
	private String admin_id; 	//관리자 아이디
	private List<SLImageFileVO> sl_items;
	private String sl_rnum;
	private String sl_writer;
	
	public String getSl_no() {
		return sl_no;
	}
	public void setSl_no(String sl_no) {
		this.sl_no = sl_no;
	}
	public String getSl_title() {
		return sl_title;
	}
	public void setSl_title(String sl_title) {
		this.sl_title = sl_title;
	}
	public String getSl_content() {
		return sl_content;
	}
	public void setSl_content(String sl_content) {
		this.sl_content = sl_content;
	}
	public String getSl_hit() {
		return sl_hit;
	}
	public void setSl_hit(String sl_hit) {
		this.sl_hit = sl_hit;
	}
	public String getSl_reg_date() {
		return sl_reg_date;
	}
	public void setSl_reg_date(String sl_reg_date) {
		this.sl_reg_date = sl_reg_date;
	}
	public String getSl_status() {
		return sl_status;
	}
	public void setSl_status(String sl_status) {
		this.sl_status = sl_status;
	}
	public String getLecture_url() {
		return lecture_url;
	}
	public void setLecture_url(String lecture_url) {
		this.lecture_url = lecture_url;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public List<SLImageFileVO> getSl_items() {
		return sl_items;
	}
	public void setSl_items(List<SLImageFileVO> sl_items) {
		this.sl_items = sl_items;
	}
	public String getSl_rnum() {
		return sl_rnum;
	}
	public void setSl_rnum(String sl_rnum) {
		this.sl_rnum = sl_rnum;
	}
	public String getSl_writer() {
		return sl_writer;
	}
	public void setSl_writer(String sl_writer) {
		this.sl_writer = sl_writer;
	}
	
}
