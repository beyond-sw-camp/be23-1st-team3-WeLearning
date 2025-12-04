DELIMITER //
CREATE PROCEDURE 리뷰 쓰기(
    IN in_user_id BIGINT,
    IN in_cos_id BIGINT,
    IN in_rating BIGINT,
    IN in_comment
)
BEGIN
    -- BEGIN 밑에 DECLARE를 통해 변수 선언
    DECLARE _author_id BIGINT;
    DECLARE _post_id BIGINT;
    -- 아래 DECLARE는 변수선언과 상관없는 예외관련 특수문법
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    -- email로 회원 id 찾기
    SELECT id
    INTO _author_id
    FROM author
    WHERE email = in_email;

    -- post 테이블에 insert
    INSERT INTO post(title, contents) VALUES(in_title, in_contents); 

    -- post 테이블에 insert된 id값 구하기
    SELECT id
    INTO _post_id
    FROM post
    ORDER BY id desc
    LIMIT 1;

    -- author_post_list테이블에 insert하기(author_id, post_id필요)
    INSERT INTO author_post_list(author_id, post_id) VALUES(_author_id, _post_id);
    
    COMMIT;
END
// DELIMITER ;