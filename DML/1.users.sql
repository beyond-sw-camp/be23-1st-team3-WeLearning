CREATE TABLE user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    age BIGINT NOT NULL,
    role EMUM('수강생','강사') NOT NULL DEFAULT '수강생'
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE instructors (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    profile VARCHAR(255) NOT NULL,
    career VARCHAR(3000),
    rating DECIMAL NOT NULL,
    students BIGINT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE cos_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    viewtime BIGINT NOT NULL,
    progress BIGINT NOT NULL
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (cos_id) REFERENCES course(id),
);