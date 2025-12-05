INSERT INTO orders (user_id, ord_status, total, method, pay_info, payer_name, comp)
VALUES (1, '결제완료', 0, '카드', 1000000000, '강유찬', 'KB카드');
INSERT INTO order_detail (ord_id, cos_id) VALUES (LAST_INSERT_ID(), 1), (LAST_INSERT_ID(), 5); 

INSERT INTO orders (user_id, ord_status, total, method, pay_info, payer_name, comp)
VALUES (2, '결제완료', 0, '계좌이체', 2000000000, '정예준', '우리은행');
INSERT INTO order_detail (ord_id, cos_id) VALUES (LAST_INSERT_ID(), 3), (LAST_INSERT_ID(), 6); 

INSERT INTO orders (user_id, ord_status, total, method, pay_info, payer_name, comp)
VALUES (3, '결제완료', 0, '카드', 3000000000, '권준우', '신한카드');
INSERT INTO order_detail (ord_id, cos_id) VALUES (LAST_INSERT_ID(), 7); 

INSERT INTO orders (user_id, ord_status, total, method, pay_info, payer_name, comp)
VALUES (5, '결제완료', 0, '카드', 4000000000, '강유찬2', '현대카드');
INSERT INTO order_detail (ord_id, cos_id) VALUES (LAST_INSERT_ID(), 2), (LAST_INSERT_ID(), 4), (LAST_INSERT_ID(), 8);
