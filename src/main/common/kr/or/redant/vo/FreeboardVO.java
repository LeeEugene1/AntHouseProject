package kr.or.redant.vo;

import java.util.List;

//자유게시판 
public class FreeboardVO {
	private String fr_bo_no;		//자유게시판 글 번호
	private String fr_bo_title;		//자유게시판 제목
	private String fr_bo_content;	//자유게시판 내용
	private String fr_bo_hit;		//조회수
	private String fr_bo_reg_date;	//최초등록일
	private String fr_bo_status;	//게시글 상태
	private String fr_bo_group;		//그룹번호
	private String fr_bo_seq;		//그룹내 순번
	private String fr_bo_depth;		//글의 깊이
	private String mem_id;			//회원아이디
	private List<FreeFileItemVO> fr_bo_items;
	private String fr_bo_rnum;
	private String fr_bo_writer;
	
	public String getFr_bo_writer() {
		return fr_bo_writer;
	}
	public void setFr_bo_writer(String fr_bo_writer) {
		this.fr_bo_writer = fr_bo_writer;
	}
	public String getFr_bo_no() {
		return fr_bo_no;
	}
	public void setFr_bo_no(String fr_bo_no) {
		this.fr_bo_no = fr_bo_no;
	}
	public String getFr_bo_title() {
		return fr_bo_title;
	}
	public void setFr_bo_title(String fr_bo_title) {
		this.fr_bo_title = fr_bo_title;
	}
	public String getFr_bo_content() {
		return fr_bo_content;
	}
	public void setFr_bo_content(String fr_bo_content) {
		this.fr_bo_content = fr_bo_content;
	}
	public String getFr_bo_hit() {
		return fr_bo_hit;
	}
	public void setFr_bo_hit(String fr_bo_hit) {
		this.fr_bo_hit = fr_bo_hit;
	}
	public String getFr_bo_reg_date() {
		return fr_bo_reg_date;
	}
	public void setFr_bo_reg_date(String fr_bo_reg_date) {
		this.fr_bo_reg_date = fr_bo_reg_date;
	}
	public String getFr_bo_status() {
		return fr_bo_status;
	}
	public void setFr_bo_status(String fr_bo_status) {
		this.fr_bo_status = fr_bo_status;
	}
	public String getFr_bo_group() {
		return fr_bo_group;
	}
	public void setFr_bo_group(String fr_bo_group) {
		this.fr_bo_group = fr_bo_group;
	}
	public String getFr_bo_seq() {
		return fr_bo_seq;
	}
	public void setFr_bo_seq(String fr_bo_seq) {
		this.fr_bo_seq = fr_bo_seq;
	}
	public String getFr_bo_depth() {
		return fr_bo_depth;
	}
	public void setFr_bo_depth(String fr_bo_depth) {
		this.fr_bo_depth = fr_bo_depth;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public List<FreeFileItemVO> getFr_bo_items() {
		return fr_bo_items;
	}
	public void setFr_bo_items(List<FreeFileItemVO> fr_bo_items) {
		this.fr_bo_items = fr_bo_items;
	}
	public String getFr_bo_rnum() {
		return fr_bo_rnum;
	}
	public void setFr_bo_rnum(String fr_bo_rnum) {
		this.fr_bo_rnum = fr_bo_rnum;
	}
}