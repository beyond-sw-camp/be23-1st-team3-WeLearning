INSERT INTO cart (user_id, total_price) VALUES (7, 0);
INSERT INTO cart_detail (cart_id, cos_id, price) VALUES (LAST_INSERT_ID(), 3, 79000), (LAST_INSERT_ID(), 6, 119000);

INSERT INTO cart (user_id, total_price) VALUES (8, 0);
INSERT INTO cart_detail (cart_id, cos_id, price) VALUES (LAST_INSERT_ID(), 1, 129000);