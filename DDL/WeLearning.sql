CREATE DATABASE SCHEMA welearning;
--1
CREATE TABLE user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    age BIGINT NOT NULL,
    role EMUM('수강생','강사') NOT NULL DEFAULT '수강생'
    phone VARCHAR(255) NOT NULL
);
--2
CREATE TABLE instructors (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    profile VARCHAR(255) NOT NULL,
    career VARCHAR(3000),
    rating DECIMAL NOT NULL,
    students BIGINT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
--3
CREATE TABLE course (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ins_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    detail VARCHAR(255) NOT NULL,
    price VARCHAR(3000) NOT NULL,
    create_time DATETIME DEFAULT CUREENT_TIMESTAMP(),
    photo VARCHAR(255),
    cos_length BIGINT NOT NULL
    rating DECIMAL NOT NULL,
    students BIGINT DEFAULT 0
);
--4
CREATE TABLE cos_tag (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cos_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (cos_id) REFERENCES course(id),
);
--5
CREATE TABLE cos_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    viewtime BIGINT NOT NULL,
    progress BIGINT NOT NULL
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (cos_id) REFERENCES course(id),
);
--6
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    status ENUM('결제완료','환불') DEFAULT '결제완료',
    total BIGINT NOT NULL,
    method ENUM('카드','계좌이체') NOT NULL,
    pay_info BIGINT NOT NULL,
    payer_name VARCHAR(255) NOT NULL,
    comp VARCHAR(255) NOT NULL
    FOREIGN KEY (user_id) REFERENCES user(id)
);
--7
CREATE TABLE order_detail ( 
    ord_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    PRIMARY(ord_id,cos_id),
    FOREIGN(ord_id) REFERENCES order(id),
    FOREIGN(cos_id) REFERENCES course(id)
);
--8
CREATE TABLE cart (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    total_price BIGINT NOT NULL
    FOREIGN KEY (user_id) REFERENCES user_id
);
--9
CREATE TABLE cart_detail (
    cart_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    price BIGINT NOT NULL,
    PRIMARY KEY (cart_id,cos_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (cos_id) REFERENCES course(id)
);
--10
CREATE TABLE cos_video (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cos_id BIGINT NOT NULL
    title VARCHAR(255) NOT NULL,
    vid_lenth BIGINT NOT NULL,
    views BIGINT DEFAULT 0,
    link VARCHAR(3000) NOT NULL,
    FOREIGN (cos_id) REFERENCES course(id),
);
--11
CREATE TABLE view_time (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    vid_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    view_length BIGINT DEFAULT 0,
    FOREIGN KEY (vid_id) REFERENCES cos_video(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);
--12
CREATE TABLE job (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    target VARCHAR(255) NOT NULL,
    requirements VARCHAR(255) NOT NULL,
    area VARCHAR NOT NULL,
);
--13
CREATE TABLE job_cos (
    job_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    PRIMARY KEY (job_id,cos_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (cos_id) REFERENCES course(id)
);
--14
CREATE TABLE review (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    cos_id BIGINT NOT NULL,
    create_time DATETIME DEFAULT CUREENT_TIMESTAMP(),
    rating BIGINT NOT NULL, 
    comment VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (cos_id) REFERENCES course(id)
);
    









