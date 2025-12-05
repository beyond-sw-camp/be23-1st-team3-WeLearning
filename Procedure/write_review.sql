DELIMITER //
CREATE PROCEDURE `리뷰쓰기`(
    IN in_user_email VARCHAR(255),
    IN in_cos_title VARCHAR(255),
    IN in_rating BIGINT,
    IN in_contents VARCHAR(255)
)
BEGIN
    DECLARE _user_id BIGINT;
    DECLARE _user_role ENUM('수강생','강사');
    DECLARE _cos_id BIGINT;
    DECLARE _user_progress BIGINT;
    DECLARE _cos_length BIGINT;
    DECLARE _review_count BIGINT;
    DECLARE _ins_id BIGINT;
    
    START TRANSACTION;
	IF in_rating > 5 OR in_rating < 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '별점은 0에서 5까지 가능합니다.';
	END IF;
    
    -- 회원 id 가져오기
    SELECT id
    INTO _user_id
    FROM user
    WHERE in_user_email = email;
    
    IF _user_id IS NULL THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '회원을 찾지 못했습니다.';
	END IF;
    
    -- 회원 role 가져오기
    SELECT role
    INTO _user_role
    FROM user
    WHERE id = _user_id;

    IF _user_role != '수강생' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '수강생이 아닙니다.';
	END IF;

    -- 강의 id 가져오기
    SELECT id, ins_id
    INTO _cos_id, _ins_id
    FROM course
    WHERE title = in_cos_title;
    
    IF _cos_id IS NULL THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '강의를 찾지 못했습니다.';
	END IF;
    
    -- 1) 회원이 해당 강의를 50% 이상 들었는지 조회
    -- 1.1 강의 전체 길이 조회
    SELECT cos_length
    INTO _cos_length
    FROM course
    WHERE id = _cos_id;

    -- 1.2 회원 진행도 조회
    SELECT progress
    INTO _user_progress
    FROM cos_progress
    WHERE _user_id = user_id AND _cos_id = cos_id;

    -- 50% 진행도 조회
    IF _user_progress < 50 THEN
       SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '강의를 50% 이상 듣지 않았습니다.';
    END IF;

    -- 2) 리뷰 Insert
    INSERT INTO review(
        user_id, cos_id, rating, contents
    ) VALUES(
        _user_id, _cos_id, in_rating, in_contents
    ); 

    -- 3) 강의 rating 업데이트
    UPDATE course
    SET rating = (
        SELECT AVG(rating)
        FROM review
        WHERE cos_id = _cos_id
    )
    WHERE id = _cos_id;

    -- 4) 강사 rating 업데이트 (강사가 가진 모든 강의 rating 평균)
    UPDATE instructors
    SET rating = (
        SELECT AVG(c.rating)
        FROM course AS c
        WHERE c.ins_id = _ins_id
    )
    WHERE id = _ins_id;
    
    COMMIT;
END
// DELIMITER ;