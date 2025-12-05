----- 장바구니에 담긴 강의 조회 -----
SELECT
    c.title AS 강의_제목,
    c.price AS 원가,
    cd.price AS 장바구니에_담긴_가격
FROM
    cart_detail cd
INNER JOIN
    course c ON cd.cos_id = c.id
INNER JOIN
    cart ca ON cd.cart_id = ca.id
WHERE
    ca.user_id = [확인할_사용자_ID];
---------------------------------