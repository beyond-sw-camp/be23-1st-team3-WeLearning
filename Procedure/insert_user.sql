DELIMITER //

CREATE PROCEDURE sp_register_user (
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_name VARCHAR(255),
    IN p_age BIGINT,
    IN p_role ENUM('수강생','강사'),
    IN p_phone VARCHAR(255),
    IN p_profile VARCHAR(255),
    IN p_career VARCHAR(3000)
)
BEGIN
    DECLARE v_count INT;
    DECLARE v_user_id BIGINT;
    SELECT COUNT(id) INTO v_count
    FROM user
    WHERE email = p_email;
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '이미 가입된 이메일 입니다';
    ELSE
        INSERT INTO user (
            email, password, name, age, role, phone
        ) VALUES (
            p_email, p_password, p_name, p_age, p_role, p_phone
        );
        SET v_user_id = LAST_INSERT_ID();
        IF p_role = '강사' THEN
            INSERT INTO instructors (
                user_id, profile, career, rating, students
            ) VALUES (
                v_user_id, p_profile, p_career, 0.00, 0
            );
        END IF;
        
        SELECT '회원가입이 성공적으로 완료되었습니다.' AS message;
        
    END IF;
END //

DELIMITER ;