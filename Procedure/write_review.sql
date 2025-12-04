DELIMITER //
CREATE PROCEDURE 리뷰 쓰기(
    IN in_user_id BIGINT,
    IN in_cos_id BIGINT,
    IN in_rating BIGINT,
    IN in_contents VARCHAR(255)
)
BEGIN
    
    DECLARE _ BIGINT;
    DECLARE _post_id BIGINT;
    

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    -- 회원이 해당 강의를 들었는지 조회
    
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