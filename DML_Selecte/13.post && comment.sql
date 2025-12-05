INSERT INTO post (user_id, title, contents, solved, post_type, views) VALUES 
(1, 'React Hook 질문드립니다.', 'useState를 사용할 때 발생하는 무한 루프 오류가 궁금합니다.', '진행중', '질문', 15),
(5, '머신러닝 스터디 모집합니다.', 'Kaggle 데이터셋 기반으로 매주 모델 구현 스터디를 함께 하실 분을 찾습니다.', '진행중', '스터디', 50),
(7, 'AWS VPC 설계 질문', 'VPC 서브넷 구성을 어떻게 해야 가장 효율적일까요?', '완료', '질문', 10);

INSERT INTO comment (user_id, post_id, contents, refer_to) VALUES 
(4, 1, 'Hook은 의존성 배열을 확인해야 합니다. 코드를 보여주세요.', NULL),
(1, 1, '아, 의존성 배열에 변수를 넣으니 해결됐습니다. 감사합니다.', 1),
(11, 2, '저 스터디 참여하고 싶습니다! 메일 보낼게요.', NULL);