package kr.or.redant.utiles;

import javax.servlet.http.HttpServletRequest;

// 페이지네이션 UI 작성
public class RolePagingUtile {
	private int currentPage;		// 현재 페이지 번호
	private int totalCount;  		// 전체 게시글 수
	private int blockCount = 10;    // 페이지별 출력 게시글 수
	private int totalPage;          // 전체 페이지 수
	private int blockPage = 5;      // 페이지별 출력 페이지네이션 넘버 수
	private int startPage;          // 페이지별 출력 페이지네이션 넘버 시작 페이지 번호
	private int endPage;            // 페이지별 출력 페이지네이션 넘버 끝 페이지 번호
	private int startCount;         // 페이지별 출력게시글 시작번호(rnum)
	private int endCount;           // 페이지별 출력게시글 끝번호(rnum)
	private String search_keyword;           // 페이지별 출력게시글 끝번호(rnum)
	private String search_keycode;           // 페이지별 출력게시글 끝번호(rnum)
	private StringBuffer pagingHtmls;
	private HttpServletRequest request;
	
	
	public RolePagingUtile(HttpServletRequest request, int totalCount, int currentPage) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		pagingHtmls = new StringBuffer();
		
		makePagination();
	}
	
	public RolePagingUtile(HttpServletRequest request, int totalCount, int currentPage, String search_keycode,String search_keyword) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		this.search_keyword = search_keyword;
		this.search_keycode = search_keycode;
		pagingHtmls = new StringBuffer();
		
		makePagination();
	}
	
	public RolePagingUtile(HttpServletRequest request, int totalCount, int currentPage, String search_keyword) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		this.search_keyword = search_keyword;
		pagingHtmls = new StringBuffer();
		
		makePagination();
	}


	private void makePagination() {
		// 전체 게시글 수(검색 O/X)
		this.totalPage = (int)Math.ceil(this.totalCount / (double)this.blockCount);
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		// 현재페이지(currentPage)에 출력될 게시글의 시작번호, 끝번호
		this.startCount = this.totalCount - (this.currentPage -1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		if(this.endCount < 0){
			this.endCount = 1;
		}
		
		// 페이지별 출력 페이지네이션 넘버의 시작, 끝 페이지 번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage ) + 1;
		this.endPage = this.startPage + this.blockPage -1;
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
		
		this.pagingHtmls.append("<div class='page_navi'>");
		
		String requestURI = this.request.getRequestURI();
		
		// 이전
		if(this.search_keycode != null){
			if((this.currentPage -1 ) == 0){
				this.pagingHtmls.append("<a href='#' class='prev'><span></span></a><span>");
			}else{
				this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage -1 ) + "&search_keyword="+search_keyword + "&search_keycode="+search_keycode+"'><span>이전</span></a><span>");
			}
		}else{
			if((this.currentPage - 1 ) == 0){
				this.pagingHtmls.append("<a href='#' class='prev'><span></span></a><span>");
			}else{
				this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + (this.currentPage -1 ) + "&search_keyword="+search_keyword + "&search_keycode="+search_keycode+"'><span>이전</span></a><span>");
			}
		}
		
		// |1|2|3|4|5|다음
		for(int i=this.startPage; i<=this.endPage; i++){
			if(this.search_keycode != null){
				if(this.currentPage == i){
					this.pagingHtmls.append("<a href='#'><b>" + i + "</b></a>");
				}else{
					this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + i + "&search_keyword="+search_keyword+"&search_keycode="+search_keycode+"'>" + i + "</a>");
				}
			}else{
				if(this.currentPage == i){
					this.pagingHtmls.append("<a href='#'><b>" + i + "</b></a>");
				}else{
					this.pagingHtmls.append("<a href='" + requestURI + "?currentPage=" + i + "&search_keyword="+search_keyword + "'>" + i + "</a>");
				}
			}
		}
		
		// 다음
		if(this.search_keycode != null){
			if((this.currentPage) == this.totalPage){
				this.pagingHtmls.append("</span><a href='#' class='next'><span></span></a></div>");
			}else{
				this.pagingHtmls.append("</span><a href='" + requestURI + "?currentPage=" + (this.currentPage +1 ) + "&search_keyword="+search_keyword + "&search_keycode="+search_keycode+"'><span>다음</span></a></div>");
			}
		}else{
			if((this.currentPage) == this.totalPage){
				this.pagingHtmls.append("</span><a href='#' class='next'><span></span></a></div>");
			}else{
				this.pagingHtmls.append("</span><a href='" + requestURI + "?currentPage=" + (this.currentPage +1 ) + "&search_keyword="+search_keyword + "&search_keycode="+search_keycode+"'><span>다음</span></a></div>");
			}
		}
		
		
	}


	public int getStartCount() {
		return startCount;
	}


	public int getEndCount() {
		return endCount;
	}


	public String getPagingHtmls() {
		return pagingHtmls.toString();
	}
	
	
	
	
	
	
	
}






















