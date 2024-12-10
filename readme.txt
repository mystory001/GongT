[ 프로젝트 1 ]
- 프로젝트명 : 공티(프리랜서-기업 SI 매칭)
- 작업기간 : 2024.01.18 ~ 2024.02.29
- 인력 구성 : 5명
- 주요 업무 : 회원가입, 로그인, 아이디 및 비밀번호 찾기, 마이페이지
- 느낀점 : 
1) 팀원 간 코드 작성 방법의 차이가 존재하여 작성된 코드가 일정하지 않음. 프로그램 시작 전에 코드 작성 규칙을 만드는 것이 가시성이나 추후 유지보수에 유리할 것으로 보임
2) 코드 작성 방법이 달라 코드를 확인할 때 어려움을 겪음. 주석을 작성하여 누가 작성하였으며, 왜 그렇게 했는지에 대한 짧은 생각을 작성해두면 학습하는데 도움이 될 것으로 보임
- 팀 프로젝트 깃 : https://github.com/MaomiMaru/GonT0223/tree/master/GongT1
- 요구사항 명세서 : https://drive.google.com/file/d/119EkHxu9zSSLpOdcVmJvkMM1zfnXAkww/view?pli=1
- 중요기능 세부 요구사항 명세서 : https://docs.google.com/spreadsheets/d/1RHEeaeb-gIkdA_vm7m96bHaaWu8eBLAs/edit?pli=1&gid=1463476677#gid=1463476677
- 테이블 정의서 : https://docs.google.com/spreadsheets/d/19fxURHPvwkVdk63c8LweQPBBngY53Ui8/edit?gid=1086071801#gid=1086071801
- ERD : https://drive.google.com/file/d/1RdICU9xdX0o7PFISii9RqLX77ZSDLmUB/view
=======================================================================================================
241210
1. 웹 소켓을 이용한 채팅 구현 => 실패 => 코드 재수정(완료) - pom.xml, web.xml, views-inc-chatting, spring - root-context, spring - appServlet - servlet-context.xml 등
2. ajax와 js를 이용한 채팅 구현
3. 채팅, 쪽지 등의 용어 혼용 => 채팅으로 통일

241209
1. 쪽지함 => 채팅 목록 수정(보낸사람과 받은사람이 같을 경우 목록에 하나만 나타나며, 최종적으로 받은내용만)
2. 첨부파일 위치 변경(/usr/local/tomcat/webapps/GongT1/resources/upload => C:\\Users\\ITWILL\\git\\GonT\\GongT1\\src\\main\\webapp\\resources\\upload)
3. 웹 소켓을 이용한 채팅 => 실패... ajax를 이용해서 구현

241208
일부 코드 수정

241207
AdminController 수정 완료 views - admin, adminPage 수정완료

241206
AdminController 어노테이션 및 메소드 수정