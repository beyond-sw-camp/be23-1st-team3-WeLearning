---- 공고 목록 전체 조회 -------
------- 대략적인 내용만 조회 ---
SELECT id, name, area, target FROM job;
------------------------------

------- 공고 상세 조회 --------
SELECT * FROM job WHERE id = [공고_ID];
-----------------------------

------ 각 조건별로 공고 검색 ---
SELECT * FROM job WHERE name = [회사명];
SELECT * FROM job WHERE target = [모집대상];
SELECT * FROM job WHERE requirements = [자격요건];
SELECT * FROM job WHERE area = [지역명];
-- 두개이상의 조건을 걸어서 검색 가능
SELECT * FROM job WHERE target = [회사명] and area = [지역명];
 ------------------------------


 ----- 강의 별 공고 검색 -----
 SELECT
    ct.title AS 강의_카테고리,
    j.name AS 채용_공고명,
    j.area AS 근무_지역,
    j.target AS 대상,
    j.requirements AS 요구사항
FROM
    cos_tag ct 
INNER JOIN
    job_cos jc ON ct.cos_id = jc.cos_id 
INNER JOIN
    job j ON jc.job_id = j.id
ORDER BY
    ct.title, j.name;
-----------------------------
