# Online-Oral-Care-Project
> 공간 제약 없는 구강건강관리 실현을 목적으로 제작한 웹사이트입니다.<br>
제가 전공했던 분야라 자신 있는 주제였고, 병원에서 근무할 때 생각했던 부분을 현실화했습니다.

- 목차 만들기 (링크 걸어주면 된다)

  ## 1. 프로젝트 개요
  ### 1-1. 구현 기능
  
  ### 1-2. 개발 환경
  
  ## 2. 서비스 기획 및 설계
  ### 2-1. 기획 &nasp;&nasp;🔥[기획서 자세히 보기](https://ovenapp.io/view/C5tMuonvWKnKpdp0yzAvxwPhAgKRu2RZ/xivXo "기획서 링크")
![기획1](https://github.com/EunSunJJ/online-oral-care/assets/126765411/a4a74aa4-5e3f-4544-8b8a-8c2f5175f929 "기획-질문 게시판")
![기획2](https://github.com/EunSunJJ/online-oral-care/assets/126765411/599c8794-003a-43c5-95e3-e622b278c0fe "기획-설문 결과지")

  ### 2-2. 설계
  - DB 설계 &nasp;&nasp;🔥[ERD 자세히 보기](https://www.erdcloud.com/d/4XDGqN95CusyakDuM "DB 설계 ERD 링크")
    ![ERD 설계](https://github.com/EunSunJJ/online-oral-care/assets/126765411/7d8bc8f7-5d13-407e-9cf4-3381f8f0756c "ERD설계 이미지")

  - URL 설계 &nasp;&nasp;🔥[URL 설계 자세히 보기](https://docs.google.com/spreadsheets/d/1oH9uhe67nG7w688nEha89jCRufneH8w7TDERo9vvqXw/edit?usp=sharing "URL 설계 링크")
    ![View URL설계](https://github.com/EunSunJJ/online-oral-care/assets/126765411/fe9fd13c-7590-4430-bc14-a2ab513d26f8 "URL설계 - View")

    ![API URL 설계1](https://github.com/EunSunJJ/online-oral-care/assets/126765411/ec28ed9a-6587-4c8d-a143-e4a464318e1e "URL설계 - 회원가입 API")
    ![API URL설계2](https://github.com/EunSunJJ/online-oral-care/assets/126765411/f1c9ff54-e9fc-47ca-a3e8-2daf3c728a7a "URL설계 - 질문게시판 API")
    ![API URL 설계 3](https://github.com/EunSunJJ/online-oral-care/assets/126765411/6980eeb6-86d1-4e1a-8ba4-8385a5b0a3d5 "URL설계 - 설문지 API")

    
    
  ## 3. 기능 명세 + 트러블 슈팅
  ### 3-1. 서비스 홈 
  ### 3-2. 회원가입 & 로그인,로그아
  ### 3-3. 본인인증 이메일 발송
  ### 3-4. 사용자 정보 수정하기 & 비밀번호 재설정 하기
  ### 3-5. 온라인 문진표 & 문진표만 프린트 하기
  ### 3-6. Open API를 통해 경기도 내 치과의원 정보 보여주기
  ### 3-7. 질문게시판 기본 기능 - CRUD기반 글 작성,수정,삭제,답변달
  ### 3-8. 질문게시판 심화 기능 - Rest기반 페이징 처리, 제목 또는 작성자 검색기능
  ### 3-9. 구강관리점수 측정 설문
 
  ## 4. 느낀점
  
  ## 5. 앞으로 업데이트 될 부분
  ### 5-1. Version2
  - Open API보충할 부분
- [ ]  추가 조건들 걸어주기
- [ ]  폐업 중인 병원들 제외시기기
- [ ]  병원 리스트에 페이징 기능 넣기
- [ ]  병원 리스트에 검색 기능 넣기
- [ ]  권한 부여하기

  - 부족해서 추가할 부분
- [ ]  꿀팁 모음집 화면
- [ ]  댓글달기 기능
- [ ]  좋아요 기능
- [ ]  사용자들이 누르는 좋아요 개수에 따라 게시물 크기 반영
- [ ]  질문게시판 수정기능에서 이미지 수정기능 구현

  ### 5-2. Version3
- [ ] Oauth2.0 소셜 로그인 기능 구현
- [ ] 암호화 방법 변경 : md5 → SHA256 방법 + salt로 변경하기
- [ ] JWT를 사용하여 로그인 상태 유지하기
- [ ] 치과 병원급 Open API도 파싱해서 사용하기
- [ ] 치과 위치를 지도위에 나타내기
- [ ] 나이별로 설문지 내용을 다르게 구성하기
