DELIMITER //
CREATE PROCEDURE `대댓글달기`(
    IN in_user_email VARCHAR(255),
    IN in_post_id BIGINT,
    IN in_contents VARCHAR(255),
    IN in_refer_to BIGINT
)
BEGIN
    DECLARE _user_id BIGINT;
    DECLARE _parent BIGINT;

    START TRANSACTION;
    
    -- 회원 id 가져오기
    SELECT id
    INTO _user_id
    FROM user
    WHERE in_user_email = email;
    
    IF _user_id IS NULL THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '회원을 찾지 못했습니다.';
	END IF;

    IF in_post_id NOT IN (SELECT id FROM post) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = '글을 찾지 못했습니다.';
	END IF;


    -- 2) 원댓글인지( = in_refer_to IS NULL )
    IF in_refer_to IS NULL THEN
        -- 원 댓글 → refer_to = NULL 로 Insert
        INSERT INTO comment(
            user_id, post_id, contents
        ) VALUES (
            _user_id, in_post_id, in_contents
        );

    ELSE
        IF in_refer_to NOT IN(SELECT id FROM comment) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = '원댓글을 찾지 못했습니다.';
        END IF;

        -- 3) 대댓글 → 부모 댓글이 실제 존재하는지 확인
        SELECT 
            CASE 
                WHEN refer_to IS NULL THEN id   -- 원댓글
                ELSE refer_to                  -- 원댓글 유지
            END
        INTO _parent
        FROM comment
        WHERE id = in_refer_to;

        IF _parent IS NULL THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = '부모 댓글을 찾지 못했습니다.';
        END IF;

        -- 4) 대댓글 Insert (refer_to = 최상위 부모 id)
        INSERT INTO comment(
            user_id, post_id, contents, refer_to
        ) VALUES (
            _user_id, in_post_id, in_contents, _parent
        );
    END IF;

    COMMIT;
END
// DELIMITER ;