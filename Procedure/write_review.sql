DELIMITER //
CREATE PROCEDURE 리뷰 쓰기(
    IN in_user_email VARCHAR(255),
    IN in_cos_title BIGINT,
    IN in_rating BIGINT,
    IN in_contents VARCHAR(255)
)
BEGIN
    DECLARE _user_id BIGINT;
    DECLARE _cos_id BIGINT;
    DECLARE _user_progress BIGINT;
    DECLARE _cos_id BIGINT;
    

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;

    -- 회원 id 가져오기
    SELECT id
    INTO _user_id
    FROM user
    WHERE in_user_email = email;

    -- 강의 id 가져오기
    SELECT id
    INTO _cos_id
    FROM course
    WHERE in_cos_title = title;

    -- 1) 회원이 해당 강의를 50% 이상 들었는지 조회

    SELECT cos_length
    FROM course
    WHERE id = in_cos_id;

    SELECT progress
    INTO _user_progress
    FROM cos_progress as cp
    WHERE _user_id = cp.user_id AND _cos_id = cp.cos_id;

    -- 참여자의 수를 조회
    IF _user_progress >= 50 THEN
        DELETE FROM post WHERE id = post_id_input;
        DELETE FROM author_post_list WHERE post_id = post_id_input AND author_id = auth_id_input;
    ELSE
        DELETE FROM author_post_list WHERE post_id = post_id_input AND author_id = auth_id_input;
    END IF;

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