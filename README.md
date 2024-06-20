# JSP CRUD 게시판 


## 🖥️ 프로젝트 소개
JSP Model1 기반 게시판입니다 

## 🕰️ 개발 기간
* 24.04.26일 - 22.05.24일


### ⚙️ 개발 환경
- `Java 8`
- `JDK 1.8.0`
- **IDE** : Eclipse 
- **Database** : MySQL
- **ORM** : Mybatis
- **Server** : tomcat

## 프로젝트 구조 
![image](https://github.com/sk5614/jsp_board1/assets/169679888/75fa422b-8c84-49ce-9177-00f848b3efc4)
![image](https://github.com/sk5614/jsp_board1/assets/169679888/50453faf-8544-4afc-b6be-86c8c19a50f7){: width="50" height="50"}
<img src="https://github.com/sk5614/jsp_board1/assets/169679888/50453faf-8544-4afc-b6be-86c8c19a50f7" width="200" height="200"/>


## DB 구조 
![image](https://github.com/sk5614/jsp_board1/assets/169679888/0bd53f5f-dc1c-4be4-9e8a-f26cd6f053f6)

#### 작성
<details>
	<summary>SQL 쿼리문 </summary>
    
        INSERT INTO board (b_title, b_content, b_date)
        VALUES (#{bTitle}, #{bContent}, NOW() );
   
</details>

- 
#### 삭제 - 
<details>
	<summary>SQL 쿼리문 </summary>
    	DELETE 
    	FROM board
    	WHERE b_id=#{bId}
   
</details>

- 
#### 수정 - 
-<details>
	<summary>SQL 쿼리문 </summary>
    
    	UPDATE board
    	SET b_title=#{bTitle},
    		b_content=#{bContent}
    	WHERE b_id=#{bId}	
</details>


#### 답글 - 

<details>
	<summary>SQL 쿼리문 </summary>
        INSERT INTO board (b_title, b_content, b_date, b_group, b_order, b_depth)
    	VALUES (#{bTitle},#{bContent}, NOW(), #{bGroup}, #{bOrder}+1, #{bDepth}+1)
     		UPDATE board 
	
        SET b_order=b_order+1 
		WHERE b_group=#{bGroup} and b_order>#{bOrder} and b_id!=LAST_INSERT_ID() 
   
   
</details>
