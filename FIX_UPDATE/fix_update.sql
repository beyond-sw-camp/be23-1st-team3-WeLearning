-- 1. 주문 및 장바구니 총 금액 업데이트
UPDATE orders o
JOIN (
    SELECT od.ord_id, SUM(c.price) AS calculated_total
    FROM order_detail od
    JOIN course c ON od.cos_id = c.id
    GROUP BY od.ord_id
) actual ON o.id = actual.ord_id
SET o.total = actual.calculated_total;

UPDATE cart ca
JOIN (
    SELECT cart_id, SUM(price) AS calculated_total
    FROM cart_detail
    GROUP BY cart_id
) actual ON ca.id = actual.cart_id
SET ca.total_price = actual.calculated_total;

-- 2. 강의 진도 업데이트
UPDATE cos_progress cp
JOIN (
    SELECT vt.user_id, cv.cos_id, SUM(vt.view_length) AS calculated_viewtime
    FROM view_time vt
    JOIN cos_video cv ON vt.vid_id = cv.id
    GROUP BY vt.user_id, cv.cos_id
) actual ON cp.user_id = actual.user_id AND cp.cos_id = actual.cos_id
JOIN course c ON cp.cos_id = c.id
SET 
    cp.viewtime = actual.calculated_viewtime,
    cp.progress = ROUND((actual.calculated_viewtime / c.cos_length) * 100);

-- 3. 강의 및 강사 집계 필드 업데이트
UPDATE course c
SET
    c.rating = (SELECT AVG(rating) FROM review WHERE cos_id = c.id),
    c.students = (SELECT COUNT(DISTINCT user_id) FROM cos_progress WHERE cos_id = c.id)
WHERE c.id IN (SELECT DISTINCT cos_id FROM review UNION SELECT DISTINCT cos_id FROM cos_progress);

UPDATE instructors i
SET
    i.rating = (SELECT AVG(c.rating) FROM course c WHERE c.ins_id = i.id),
    i.students = (SELECT SUM(c.students) FROM course c WHERE c.ins_id = i.id);