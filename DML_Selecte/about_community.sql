-------- 글 목록 전체 조회 -------
SELECT id, title AS '제목' , post_type AS '글 구분', create_time AS '작성일' , views AS '조회수' , solved AS '현재상태'
FROM post ORDER BY create_time DESC;
--------------------------------

----- 특정 게시글 상세 조회 -------
SELECT p.*, u.name AS 작성자, u.role AS 구분
FROM post p 
INNER JOIN user u ON p.user_id = u.id 
WHERE p.id = [게시글_ID];
--------------------------------

------- 댓글 조회 ----------------
SELECT cmt.contents, u.name AS commenter_name, u.role AS 구분
FROM comment cmt 
INNER JOIN user u ON cmt.user_id = u.id 
WHERE cmt.post_id = [게시글_ID] 
ORDER BY cmt.create_time ASC;
---------------------------------
