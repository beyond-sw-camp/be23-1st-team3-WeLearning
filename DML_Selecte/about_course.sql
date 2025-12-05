
-- 강의 목록 검색------------
SELECT id, title, rating, price FROM course 
WHERE title LIKE '%[강좌명]%' 
OR detail LIKE '%[카테고리]%' 
OR ins_id = (SELECT id FROM instructors 
WHERE user_id = (SELECT id FROM user WHERE name = '[강사명]'));
---------------------------


-- 강의 상세 조회 -----------
SELECT c.*, u.name AS instructor_name FROM course c 
INNER JOIN instructors i ON c.ins_id = i.id 
INNER JOIN user u ON i.user_id = u.id WHERE c.id = [강의_ID];
---------------------------

-- 수강 취소 조회 -----------
-- order 테이블에 status가 환불 수강생이 있어야 조회 가능
SELECT * FROM orders WHERE user_id = [사용자_ID] AND ord_status = '환불';
---------------------------

-- 장바구니에 담긴 강의 조회 --
SELECT c.title, c.price, cd.price AS discounted_price 
FROM cart_detail cd 
INNER JOIN course c ON cd.cos_id = c.id 
WHERE cd.cart_id = (SELECT id FROM cart WHERE user_id = [사용자_ID]);
----------------------------

--- 수강 신청 한 강의 히스토리 조회 ----
SELECT od.cos_id, c.title, o.total 
FROM order_detail od 
INNER JOIN orders o ON od.ord_id = o.id 
INNER JOIN course c ON od.cos_id = c.id 
WHERE o.id = [주문_ID];
-----------------------------


------ 강의 평점 조회 ------
SELECT id, title, rating FROM course WHERE name LIKE %[강의이름]%;
-----------------------------


----- 강의 리뷰 조회 ----------
SELECT u.name AS reviewer, r.rating, r.contents, r.create_time 
FROM review r 
INNER JOIN user u ON r.user_id = u.id 
WHERE r.cos_name LIKE %[강의이름]% 
ORDER BY r.create_time DESC;
------------------------------

------ 특정 사용자가(내가) 쓴 리뷰 조회 --------
SELECT c.title, r.rating, r.contents, r.create_time 
FROM review r 
INNER JOIN course c ON r.cos_id = c.id 
WHERE r.user_email LIKE %[사용자_email]& 
ORDER BY r.create_time DESC;
---------------------------------------------

----- 특정 수강생 진도율 확인 -------------
SELECT
    u.name AS 이름,
    c.title AS 강의명,
    cp.progress AS 진도
FROM
    cos_progress cp
INNER JOIN
    user u ON cp.user_id = u.id
INNER JOIN
    course c ON cp.cos_id = c.id
ORDER BY
    u.name, c.title;
----------------------------------------

--- 강의별 자신의 진도율 확인 ------------
SELECT
    c.title AS 강의_제목,
    cp.progress AS 진도율_퍼센트
FROM
    cos_progress cp
INNER JOIN
    course c ON cp.cos_id = c.id
WHERE
    cp.user_id = [수강생의_고유_USER_ID]
ORDER BY
    cp.progress DESC;
---------------------------------------