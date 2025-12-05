# 🚀 WeLearning

<p align="center">
  <img src="Images/브랜드 이미지.png" alt="[로고]" width="400"/>
</p>

  <h1 align="center">어디서든, 누구나, 더 똑똑하게</h1>	

   <p align="center">당신의 성장을 이어주는 WeLearning	
   지금 바로 새로운 배움을 시작해보세요!		</p>	

## 👤 팀원

<div align="center">
<table border="0" style="border: none; width: 80%;">
    <tr>
      <td align="center">
        <img src="./Images/이다은.png" style="width: 190px; height: 150px; object-fit: cover; border-radius: 50%;" />
        <br />
        <b>이다은</b>
        <br />
        <a href="https://github.com/">@leeda973</a>
      </td>
      <td align="center">
        <img src="./Images/박세민.png" style="width: 170px; height: 150px; object-fit: cover; border-radius: 50%;" />
        <br />
        <b>박세민</b>
        <br />
        <a href="https://github.com/">@semin980520</a>
      </td>
      <td align="center">
        <img src="./Images/이병찬.png" style="width: 170px; height: 150px; object-fit: cover; border-radius: 50%;" />
        <br />
        <b>이병찬</b>
        <br />
        <a href="https://github.com/2001056">@2001056</a>
      </td>
      <td align="center">
        <img src="./Images/조현준.png" style="width: 190px; height: 150px; object-fit: cover; border-radius: 50%;" />
        <br />
        <b>조현준</b>
        <br />
        <a href="https://github.com/chohj2614">@chohj2614</a>
      </td>
    </tr>
  </table>


</div>

# 목차

1. [프로젝트 개요](#1-프로젝트-개요)  
   
2. [주요 기능](#2-주요-기능)
3. [기술스택](#3-기술스택) 

4. [WBS](#4-wbs)  

5. [UML](#5-uml)  

6. [요구사항 명세서](#6-요구사항-명세서)  

7. [DB 모델링](#7-db모델링)
   
8. [DB 설계](#8-db-설계)

9. [테스트 케이스](#9-테스트-케이스)   
   

<br/>

# 1. 프로젝트 개요

## 1-1. 📘프로젝트 소개

 본 프로젝트는 온라인 강의 제공자와 학습자를 연결하는 교육 콘텐츠 플랫폼을 설계하기 위한 데이터베이스 구축 프로젝트이다.
프로그램·디자인·비즈니스 등 다양한 분야의 강의가 업로드되고, 사용자가 자유롭게 수강·평가·소통할 수 있는 구조를 지원하는 것이 목표이다.
플랫폼의 핵심 기능인 강의 관리, 사용자 관리, 학습 진행 기록, 결제·정산, 커뮤니티 기능 등을 체계적으로 구현할 수 있도록 ERD를 포함한 전체 DB 구조를 설계한다.
이를 통해 온라인 교육 플랫폼 운영에 필요한 기반 시스템의 구조적 이해를 높이고, 실제 서비스 개발로 이어질 수 있는 확장성과 안정성을 갖춘 DB 모델을 완성한다.


## 1-2. 📗 프로젝트 기획 배경
온라인 교육 시장은 지속적으로 성장하고 있으며, 누구나 제작한 강의를 공유할 수 있는 콘텐츠 중심 플랫폼 모델의 수요 또한 증가하고 있다.
기존 플랫폼들은 다양한 기능—강의 판매, 리뷰, Q&A, 강사 수익 정산 등—을 포함하고 있어 복잡도와 유연성을 동시에 요구하는 DB 구조가 필요하다.


## 1-3. 📘 기존 플랫폼과의 차별점

본 프로젝트가 지향하는 교육 플랫폼은 단순히 온라인 강의를 제공하는 데서 머무르지 않고, 학습자의 커리어 개발까지 연결되는 통합형 서비스를 목표로 한다. 기존의 온라인 교육 플랫폼들은 강의 추천, 수강 관리, 리뷰 제공 등 학습 과정 중심의 기능에 집중하는 반면, 본 프로젝트는 교육과 채용을 직접적으로 연결하는 구조를 통해 플랫폼의 활용 범위를 확장한다.

가장 큰 차별 요소는 강의 콘텐츠와 채용공고 정보를 연동하여 학습자의 취업 가능성을 높이는 기능이다. 사용자는 강의 수강 중에도 해당 강의와 관련된 직무나 스킬을 요구하는 최신 채용공고를 확인할 수 있으며, 이를 기반으로 목표 직무에 맞춘 강의 선택, 학습 로드맵 구성, 취업 전략 수립이 가능하다. 이처럼 학습 데이터와 채용 데이터를 결합함으로써, “무엇을 배울지”에서 “왜 배우는지”까지 명확하게 제시하는 실질적 커리어 지원 플랫폼으로 차별화된다.

또한 강의–기술 태그–직무–채용 정보 간의 관계를 체계적으로 구축해 학습자의 관심 분야에 대한 맞춤 채용 추천이 가능하며, 수강 기록을 기반으로 한 직무 매칭, 스킬 기반 채용 필터링 등 기존 플랫폼에서는 제공하지 않는 커리어 지향적 추천 시스템을 구현할 수 있다. 이를 통해 학습자는 단순한 지식 습득을 넘어 실제 취업 기회로 이어지는 경험을 제공받으며, 플랫폼은 교육과 경력을 자연스럽게 연결하는 새로운 가치를 창출한다.


# 2. 주요 기능

본 프로젝트에서 설계하는 교육 플랫폼의 데이터베이스는 강의 제공, 학습 관리, 커뮤니티 소통, 결제 시스템, 그리고 채용 정보 연동까지 포함한 전반적인 서비스 운영을 지원한다. 이를 위해 다음과 같은 핵심 기능들을 중심으로 구조를 설계한다.
### 2-1. 🛠️ 강의 관리 시스템
 강의 업로드, 카테고리 분류, 기술 태그 설정, 강사 정보 관리 등 강의 콘텐츠 운영 전반을 지원한다. 강의별 커리큘럼, 강의 영상, 자료 업로드 등의 요소가 체계적으로 관리될 수 있도록 구성한다.


### 2-2. 🛠️ 사용자 관리 및 학습자 정보 구조
 학습자·강사 등 사용자 유형별 권한 관리, 프로필 정보, 학습 기록, 관심 강의, 구매 내역 등을 관리한다. 수강 진행도, 수료 여부 등 학습 이력을 기반으로 서비스 운영에 필요한 사용자 데이터를 제공할 수 있도록 한다.


### 2-3. 💡 수강·학습 진행 관리 기능
 사용자가 실제로 어떤 강의를 언제 수강했고 어느 단계까지 학습했는지 기록한다. 이를 통해 학습률 분석, 수료 여부 표시, 강의 콘텐츠 개선 등 서비스 운영 측면의 다양한 활용이 가능하다.


### 2-4. 💰 결제 및 정산 기능
 강의 구매, 결제 이력 관리, 환불 처리 등을 포함하며, 강사에게 지급되는 수익 정산 구조까지 고려한다. 강의 가격 정책, 할인, 쿠폰 등도 DB 기반으로 관리될 수 있도록 설계한다.


### 2-5. 💬 커뮤니티 및 상호작용 기능
 Q&A, 리뷰, 댓글, 평점 등 사용자 간 상호작용을 지원한다. 학습자가 강사 또는 다른 학습자와 소통하며 학습 경험을 확장할 수 있도록 게시물, 반응, 신고 기능 등이 데이터 단위로 구성된다.


### 2-6. 🌟 채용공고 연동 기능 (차별점 핵심)
 강의와 기술 태그를 기반으로 관련 직무·기업 채용공고를 함께 제공하는 기능이다. 사용자는 수강 중인 강의와 연결된 취업 기회를 즉시 확인할 수 있으며, 스킬 기반 채용 필터링, 직무–기술 매칭 등 기존 교육 플랫폼에서 제공되지 않는 기능을 구현할 수 있다.

<br>

# 3. 기술스택


📌 개발 환경
---

🔧
 DBMS
<p>
  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" />

</p>

---

📌
 협업 및 관리 도구
🤝
 협업 도구
<p>
  <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white"/>
  <img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white"/>
</p>

🗂
 버전 및 이슈 관리
<p>
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
</p>

📊
 데이터 관리
<p>
  <img src="https://img.shields.io/badge/Google%20Sheets-34A853?style=for-the-badge&logo=googlesheets&logoColor=white"/>
</p>

---

📌
 ERD 및 다이어그램 도구
<p>
  <img src="https://img.shields.io/badge/ERDCloud-1F4E79?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Draw.io-F08705?style=for-the-badge&logo=diagramsdotnet&logoColor=white"/>
</p>


<br>

<br>

# 4. WBS

<details>
<summary>📜WBS</summary>
<div markdown="1">

<img width="1000" height="845" alt="image" src="Images/dbWBS.png" />

</div>
</details>

<br>

# 5. UML

<details>
<summary>🎨UseCase Diagram</summary>
<div markdown="1">

<img width="718" height="1100" alt="image (1)" src="Images/uml.png.png" />

</div>
</details>

<br>

# 6. 요구사항 명세서

<details>
<summary>👥회원</summary>
<div markdown="1">
  
<img width="1648" height="590" alt="image" src="./Images/요구사항_명세서_회원.jpg" />

</div>
</details>

<details>
<summary>🎓강의</summary>
<div markdown="1">
  
<img width="1689" height="508" alt="image" src="./Images/요구사항_명세서_강의.jpg" />


</div>
</details>

<details>
<summary>📢채용공고</summary>
<div markdown="1">
  
<img width="1685" height="542" alt="image" src="./Images/요구사항_명세서_채용공고.jpg" />

</div>
</details>

<details>
<summary>💬커뮤니티</summary>
<div markdown="1">
  
<img width="1657" height="447" alt="image" src="./Images/요구사항_명세서_커뮤니티.jpg" />

</div>
</details>

<br>

# 7. DB모델링
<details>
<summary>🧱ERD</summary>
<div markdown="1">

<img width="1543" height="1094" alt="image (3)" src="Images/DBERDWeLearning.png" />

</div>
</details>

<br>

# 8. DB 설계

<details>
  <summary>🧩 테이블 구조</summary>
  <div markdown="1">
    <img alt="image" src="Images/프로젝트 구조.png" />
  </div>
</details>

<details>
<summary>📐 DB 설계</summary>
<div markdown="1">

<img width="250" height="845" alt="image" src="Images/db설계.png" />
</div>
</details>
<details>
<summary>🗒️ 테이블 정의서</summary>
<div markdown="1">
  <img alt="image" src="Images/DB 프로젝트 db nice - 테이블 정의서_page-0001.jpg " />
  <img alt="image" src="Images/DB 프로젝트 db nice - 테이블 정의서_page-0002.jpg " />
  <img alt="image" src="Images/DB 프로젝트 db nice - 테이블 정의서_page-0003.jpg " />
</div>
</details>

<br>

# 9. 테스트 케이스

<details>
    <summary>🔑 공통 기능 및 인증</summary>
  <ul>    
      <li><details>
                <summary>로그인 성공/실패</summary>
                <div markdown="1">
                    <img width="450" alt="image" src="Images/로그인확인code.png" />
                    <br>
                    <img width="450" alt="image" src="Images/로그인성공이미지.png" />
                    <img width="450" alt="image" src="Images/로그인실패이미지.png" />
                </div>
        </details></li>
    </ul>    
    <ul>
        <li><details>
            <summary>중복 이메일 가입 실패</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/중복 이메일 가입 실패.png" />
            </div>
        </details></li>
    </ul>
    <ul>
        <li><details>
            <summary>장바구니 목록 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/장바구니 목록조회.png" />
            </div>
        </details></li>
    </ul>
    
</details>

<details>
    <summary>📚 강의 및 수강생 관리 기능</summary>
    <ul>
        <li><details>
            <summary>특정 강의 검색</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/특정강의 검색.png" />
            </div>
        </details></li>        
        <li><details>
            <summary>특정 강의 상세 검색</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/특정강의 상세검색.png" />
            </div>
        </details></li>
    </ul>    
    <ul>
        <li><details>
            <summary>특정 강의 평점 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/특정강의 평점조회.png" />
            </div>
        </details></li>        
        <li><details>
            <summary>특정 강의 리뷰 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/특정강의 리뷰조회.png" />
            </div>
        </details></li>
    </ul>
    <ul>
        <li><details>
            <summary>수강 신청한 목록 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/수강신청한 목록 조회.png" />
            </div>
        </details></li>        
        <li><details>
            <summary>수강생별 진도 확인</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/수강생 진도율 확인 코드.png" />
                <br>
                <img width="450" alt="image" src="Images/수강생 별 진도 확인.png" />
            </div>
        </details></li>   
        <li><details>
            <summary>수강 취소 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/수강취소 조회.png" />
            </div>
        </details></li>
    </ul>
</details>

<details>
    <summary>💬 커뮤니티 및 Q&A 기능</summary>
    <ul>
        <li><details>
            <summary>글 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/글조회.png" />
            </div>
        </details></li> 
        <li><details>
            <summary>게시글 내 댓글 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/게시글 내 댓글 조회.png" />
            </div>
        </details></li>
    </ul>
</details>
<details>
    <summary>🏢 채용 공고 및 연관 검색 기능</summary>
    <ul>
        <li><details>
            <summary>채용 공고 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/공고조회.png" />
            </div>
        </details></li>  
        <li><details>
            <summary>채용 공고 상세 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/공고상세조회.png" />
            </div>
        </details></li>      
        <li><details>
            <summary>조건별 공고 검색 기능</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/조건별로 공고 검색가능.png" />
            </div>
        </details></li>      
        <li><details>
            <summary>공고별 연관 카테고리 조회</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images/공고 별 연관 카테고리조회.png" />
              </div>
        </details></li>
    </ul>
        </details>
      <details>
    <summary>📝 리뷰 기능</summary>
    <ul>
        <li><details>
            <summary>리뷰쓰기 전 테이블</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_유저.png" />
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_전_강사.png" />
                <img width="550" alt="image" src="Images2/리뷰쓰기/리뷰_전_강의.png" />
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_전_리뷰.png" />
                <p>50%이상 강의 수강자임을 확인</p> <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_진도율.png" />
            </div>
        </details></li>
        <li><details>
            <summary>리뷰쓰기</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_입력문_성공.png" />
            </div>
        </details></li>
        <li><details>
            <summary>리뷰 완료 후 테이블 확인</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_후_리뷰.png" />
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_후_강사.png" />
                <img width="450" alt="image" src="Images2/리뷰쓰기/리뷰_후_강의.png" />
            </div>
        </details></li>
      <li><details>
            <summary>강사가 리뷰를 쓰는 경우</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/수강생아님_입력.png" />
                <br>
                <img alt="image" src="Images2/리뷰쓰기/수강생아님_결과.png" />
            </div>
        </details></li>
        <li><details>
            <summary>없는 강의에 대한 리뷰 입력</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/없는강의_입력.png" />
              <br>
                <img alt="image" src="Images2/리뷰쓰기/없는강의_결과.png" />
            </div>
        </details></li>
        <li><details>
            <summary>잘못된 이메일 입력 후 리뷰작성</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/잘못된_이메일_입력.png" />
              <br>
                <img alt="image" src="Images2/리뷰쓰기/잘못된_이메일_입력_에러코드.png" />
            </div>
        </details></li>
      <li><details>
            <summary>평점 범위 초과 후 입력</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/잘못된_평점_입력.png" />
              <br>
                <img alt="image" src="Images2/리뷰쓰기/잘못된_평점_결과.png" />
            </div>
        </details></li>
      <li><details>
            <summary>진도율 50% 미만자가 리뷰 쓴 경우</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/진도율_미달_셋업.png" />
              <img width="450" alt="image" src="Images2/리뷰쓰기/진도율_미달_입력.png" />
              <br>
                <img alt="image" src="Images2/리뷰쓰기/진도율_미달_결과.png" />
            </div>
        </details></li>
    </ul>
</details>
       
<details>
    <summary>💬 댓글 기능</summary>
    <ul>
        <li><details>
            <summary>원댓글 입력/결과</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/대댓글달기/원댓글_입력.png" />
                <img alt="image" src="Images2/대댓글달기/원댓글_결과.png" />
            </div>
        </details></li>  
        <li><details>
            <summary>대댓글 쓰기</summary>
            <div markdown="1">
            <p>대댓글 쓰기 전</p>
                <img width="450" alt="image" src="Images2/대댓글달기/대댓글_전.png" />
            <p>대댓글 쓰기 전</p>
                <img width="450" alt="image" src="Images2/대댓글달기/대댓글_입력.png" />
                <img alt="image" src="Images2/대댓글달기/대댓글_결과.png" />
            </div>
        </details></li> 
      <li><details>
            <summary>없는 글에 댓글 다는 경우</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/대댓글달기/없는글_댓글.png" />
                <img width="450" alt="image" src="Images2/대댓글달기/없는글_댓글_입력.png" />
                <img alt="image" src="Images2/대댓글달기/없는글_댓글_결과.png" />
            </div>
        </details></li>      
        <li><details>
            <summary>없는 댓글id에 대댓글 다는 경우</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/대댓글달기/없는_댓글id.png" />
                <img width="450" alt="image" src="Images2/대댓글달기/없는_댓글id_입력.png" />
                <img alt="image" src="Images2/대댓글달기/없는_댓글id_결과.png" />
            </div>
        </details></li>  
        <li><details>
            <summary>잘못된 이메일로 댓글 다는 경우</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/리뷰쓰기/없는강의_입력.png" />
              <br>
                <img alt="image" src="Images2/리뷰쓰기/없는강의_결과.png" />
            </div>
        </details></li>      
        <li><details>
            <summary>잘못된 이메일 입력 후 리뷰작성</summary>
            <div markdown="1">
                <img width="450" alt="image" src="Images2/대댓글달기/잘못된_이메일_입력.png" />
              <br>
                <img alt="image" src="Images2/대댓글달기/잘못된_이메일_결과.png" />
            </div>
        </details></li>
    </ul>
</details>

<br>
<br>
