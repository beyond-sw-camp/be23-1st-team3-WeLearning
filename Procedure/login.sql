DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login_user`(
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE v_user_id BIGINT;
    DECLARE v_name VARCHAR(255);
    DECLARE v_role ENUM('수강생','강사');
    SELECT
        id, name, role INTO v_user_id, v_name, v_role
    FROM
        user
    WHERE
        email = p_email
        AND password = p_password;
    IF v_user_id IS NOT NULL THEN
        SELECT 
            v_user_id AS user_id, 
            v_name AS user_name, 
            v_role AS user_role, 
            '로그인에 성공했습니다.' AS message,
            'SUCCESS' AS status;
    ELSE
        SELECT 
            NULL AS user_id, 
            NULL AS user_name, 
            NULL AS user_role, 
            '이메일 또는 비밀번호를 다시 확인해주세요.' AS message,
            'FAILURE' AS status;
    END IF;
END

//

DELIMITER ;