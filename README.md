# 프로젝트 소개
**프로젝트명:** 개미의집<br>
**설명:** 일반인들을 위한 주식 정보 프로그램으로 인공지능을 활용한 주식전략 웹 애플리케이션<br>
**역할:** UA, AA | 인원 5명<br>
**기간:** 4월 18일 ~ 6월 8일<br>
**느낀점:** 부트스트랩을 쓰지않고 Html과 CSS, Javascript로 페이지를 제작하여 빠른시간안에 팀원들에게 전달하려하니<br>
부담감이 상당하였으나 그만큼 얻는것도 많을 것이라는 긍정적인 마음으로 만들었습니다.<br>
역할상 프론트단에 치중하느라 백엔드에 시간을 많이 투자하지못한점이 아쉬웠지만 각자 분업하여 빠르게 실무느낌으로 <br>
진행할수있었습니다. 기본골격인 레이아웃을 잘잡아야 수정하기도 쉽고 반응형하기도 좋다는 사실을 실감하게되었습니다.<br>
결과를 보니 뿌듯하였고 앞으로 많은 프로젝트를 통해 실력을 더 키우고 싶습니다.<br>

# 백앤드
게시판을 담당하여 기본적인 CRUD외 validation, 검색, pagenation 기능을 구현하였습니다. 스프링 MVC패턴의 xml, dao, service, controller, view순으로 코드를 준비하였습니다.
1. xml 
![final-project-capture](https://user-images.githubusercontent.com/59987309/83714677-67688700-a666-11ea-982f-19a7573f03ee.jpg)

2. DAO : xml의 데이터의 접근과 갱신을 담당
![2 dao](https://user-images.githubusercontent.com/59987309/83743546-d3161880-a695-11ea-92e5-b89036ba1295.jpg)

3.Service : DAO를 호출해 여러번의 데이터 접근과 갱신 담당
![3 service](https://user-images.githubusercontent.com/59987309/83743548-d4474580-a695-11ea-9a92-9149d49d23eb.jpg)

4.Controller : 사용자 요청을 처리해 View단에 모델객체를 넘겨주는 역할
![4 controller](https://user-images.githubusercontent.com/59987309/83743550-d4dfdc00-a695-11ea-914d-52ec20e7523b.jpg)

5. View : 유저에게 노출되는 화면
![5 view](https://user-images.githubusercontent.com/59987309/83723408-9f2cfa00-a679-11ea-80bf-37317d5dde46.jpg)

# 프론트앤드
57개의 UI 페이지를 담당하여 HTML,CSS,자바스크립트로 화면을 제작하였습니다. 
그외 chart.js 차트와 daum 우편번호 API를 적용하였습니다.
![6 frontend](https://user-images.githubusercontent.com/59987309/83781797-f5c22480-a6c9-11ea-9110-29d48670538f.jpg)

# 시연
* 프로젝트시연 : 1.212.157.149:8090/redant/main.do
* 이메일: <happyHackingEugene@gmail.com>
