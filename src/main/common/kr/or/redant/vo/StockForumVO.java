package kr.or.redant.vo;

import java.util.List;

//주식토론방
public class StockForumVO {
	private String sf_no;		//주식토론방 글번호
	private String sf_title;	//주식토론방 제목
	private String sf_content;	//주식토론방 내용
	private String sf_hit;		//조회수
	private String sf_reg_date;	//최초등록일
	private String sf_status;	//게시글상태
	private String sf_group;	//그룹번호
	private String sf_seq;		//그룹 내 순번
	private String sf_depth;	//글의 깊이
	private String mem_id;		//회원아이디
	private List<SFFileItemVO> sf_items;
	private String sf_rnum;
	private String sf_writer;
	
	public String getSf_writer() {
		return sf_writer;
	}
	public void setSf_writer(String sf_writer) {
		this.sf_writer = sf_writer;
	}
	public String getSf_no() {
		return sf_no;
	}
	public void setSf_no(String sf_no) {
		this.sf_no = sf_no;
	}
	public String getSf_title() {
		return sf_title;
	}
	public void setSf_title(String sf_title) {
		this.sf_title = sf_title;
	}
	public String getSf_content() {
		return sf_content;
	}
	public void setSf_content(String sf_content) {
		this.sf_content = sf_content;
	}
	public String getSf_hit() {
		return sf_hit;
	}
	public void setSf_hit(String sf_hit) {
		this.sf_hit = sf_hit;
	}
	public String getSf_reg_date() {
		return sf_reg_date;
	}
	public void setSf_reg_date(String sf_reg_date) {
		this.sf_reg_date = sf_reg_date;
	}
	public String getSf_status() {
		return sf_status;
	}
	public void setSf_status(String sf_status) {
		this.sf_status = sf_status;
	}
	public String getSf_group() {
		return sf_group;
	}
	public void setSf_group(String sf_group) {
		this.sf_group = sf_group;
	}
	public String getSf_seq() {
		return sf_seq;
	}
	public void setSf_seq(String sf_seq) {
		this.sf_seq = sf_seq;
	}
	public String getSf_depth() {
		return sf_depth;
	}
	public void setSf_depth(String sf_depth) {
		this.sf_depth = sf_depth;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public List<SFFileItemVO> getSf_items() {
		return sf_items;
	}
	public void setSf_items(List<SFFileItemVO> sf_items) {
		this.sf_items = sf_items;
	}
	public String getSf_rnum() {
		return sf_rnum;
	}
	public void setSf_rnum(String sf_rnum) {
		this.sf_rnum = sf_rnum;
	}
	
	
}
