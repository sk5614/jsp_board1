# JSP CRUD 게시판 


## 🖥️ 프로젝트 소개
JSP Model1 게시판입니다 

## 🕰️ 개발 기간
* 24.06.15일 - 22.06.20일


### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **IDE** : Eclipse 
- **Database** : MySQL
- **ORM** : Mybatis
- **Server** : tomcat

## 프로젝트 구조 
![image](https://github.com/sk5614/jsp_board1/assets/169679888/75fa422b-8c84-49ce-9177-00f848b3efc4)
<img src="https://github.com/sk5614/jsp_board1/assets/169679888/50453faf-8544-4afc-b6be-86c8c19a50f7" width="400" height="400"/>


## DB 구조 
![image](https://github.com/sk5614/jsp_board1/assets/169679888/0bd53f5f-dc1c-4be4-9e8a-f26cd6f053f6)

## 기능 
<details> 
	<summary>펼치기 </summary>

#### 작성
![write](https://github.com/sk5614/jsp_board1/assets/169679888/6b2b9af0-adec-47e7-9343-aff097ed0b79)
<details>
	<summary>SQL 쿼리문 </summary>
    
        INSERT INTO board (b_title, b_content, b_date)
        VALUES (#{bTitle}, #{bContent}, NOW() );
   
</details>

- 
#### 삭제 - 
![delete](https://github.com/sk5614/jsp_board1/assets/169679888/e47684b7-79ff-45ec-a227-8be32f7c6b1a)
<details>
	<summary>SQL 쿼리문 </summary>
    	DELETE 
    	FROM board
    	WHERE b_id=#{bId}
   
</details>

- 
#### 수정 - 
![edit](https://github.com/sk5614/jsp_board1/assets/169679888/51c6af24-7a0d-4b22-bb7f-0a8eb5bb9635)
-<details>
	<summary>SQL 쿼리문 </summary>
    
    	UPDATE board
    	SET b_title=#{bTitle},
    		b_content=#{bContent}
    	WHERE b_id=#{bId}	
</details>


#### 답글 - 
![reply](https://github.com/sk5614/jsp_board1/assets/169679888/9ab6de7b-1021-4412-a03f-39cbcd63aa5d)

<details>
	<summary>SQL 쿼리문 </summary>
        INSERT INTO board (b_title, b_content, b_date, b_group, b_order, b_depth)
    	VALUES (#{bTitle},#{bContent}, NOW(), #{bGroup}, #{bOrder}+1, #{bDepth}+1)
     		UPDATE board 
	
        SET b_order=b_order+1 
		WHERE b_group=#{bGroup} and b_order>#{bOrder} and b_id!=LAST_INSERT_ID() 
   
   
</details>

</details>


#### 개선점 


1. 유저 로그인 기능을 추가하지 못해서 아쉬웠습니다. 상단에 현재로그인중인 유저아이디를 띄우는 기능이 필요해보입니다
2. 글쓴이정보와 게시물 정보를 조인해서 보여주는 기능도 필요해보입니다.
3. bootstrap 이용해서 view 를 못꾸민점이 아쉽습니다. 당장 사용 가능할 만큼 꾸밀필요가 있어보입니다
4. 직접 배포하지 못한게 아쉽습니다.
5. 직접 파일받아서 라이브러리에 넣어서하는거보다 다음 프로젝트한다면 maven이나 gradle 을 이용하는게 좋아보입니다.
6.  예외 처리 추가해야할곳이 많아보입니다 alert 로 경고문 띄우는거도 필요해보입니다 .
7.  답글 기능을 구현하는곳에서 생긴 버그를 아직 해결하지 못했습니다. 
8.  자료가 적어서 offset limit 방식으로 페이징처리를 했는데 다른방법으로도 해볼필요가 있어보입니다 
