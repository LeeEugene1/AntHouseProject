package kr.or.redant.vo;
//회원
public class MemberVO {
	private String mem_id;			//회원 아이디
	private String mem_name;		//회원 이름
	private String mem_pass;		//회원 비밀번호
	private String mem_nickname;	//회원 닉네임	
	private String mem_mail;		//회원 메일
	private String mem_bir;			//회원 생년월일
	private String mem_hp;			//회원 핸드폰번호
	private String mem_zip;			//회원 우편번호
	private String mem_add1;		//회원 주소
	private String mem_add2;		//회원 상세주소
	private String mem_delete;		//회원 활성화 여부
	private String mem_rnum;		//회원 번호
	private String mem_deletecheck;		//회원 활성화 여부체크
	
	public String getMem_deletecheck() {
		return mem_deletecheck;
	}
	public void setMem_deletecheck(String mem_deletecheck) {
		this.mem_deletecheck = mem_deletecheck;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_bir() {
		return mem_bir;
	}
	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public String getMem_zip() {
		return mem_zip;
	}
	public void setMem_zip(String mem_zip) {
		this.mem_zip = mem_zip;
	}
	public String getMem_add1() {
		return mem_add1;
	}
	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}
	public String getMem_add2() {
		return mem_add2;
	}
	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}
	public String getMem_delete() {
		return mem_delete;
	}
	public void setMem_delete(String mem_delete) {
		this.mem_delete = mem_delete;
	}
	public String getMem_rnum() {
		return mem_rnum;
	}
	public void setMem_rnum(String mem_rnum) {
		this.mem_rnum = mem_rnum;
	}
	
}
