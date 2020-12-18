# DB 생성
DROP DATABASE IF EXISTS textBoard;
CREATE DATABASE textBoard;
USE textBoard;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL
);

# 게시물 데이터 3개 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3',
memberId = 1,
boardId = 1;

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(30) NOT NULL,
    loginPw VARCHAR(50) NOT NULL,
    `name` CHAR(30) NOT NULL
);

# 회원 데이터 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '관리자';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '테스터2';

# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(20) NOT NULL,
    `code` CHAR(20) NOT NULL
);

# 공지사항 게시판 추가
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '공지사항',
`code` = 'notice';

# 자유 게시판 추가
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '자유',
`code` = 'free';

UPDATE article
SET boardId = 2
LIMIT 2;

# 각종 함수
/*
SELECT DATE(NOW());
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT SUBSTR("안녕하세요.", 1, 2);
SELECT SUBSTR("안녕하세요.", 2, 2);
SELECT CONCAT("안녕", "하세요.");
SELECT RAND() * 100;
*/

# 게시물 랜덤 생성
/*
insert into article
set regDate = NOW(),
updateDate = NOW(),
title = concat("제목_", rand()),
`body` = CONCAT("내용_", RAND()),
memberId = FLOOR(RAND() * 2) + 1,
boardId = FLOOR(RAND() * 2) + 1;
*/

# 3번글 내용을 마크다운 문법으로 수정
UPDATE article SET `body` = '# 공지사항\r\n안녕하세요.\r\n이 사이트는 저의 글 연재 공간입니다.\r\n\r\n---\r\n\r\n# 이 사이트의 특징\r\n- A\r\n- B\r\n- C'
WHERE id = '3';

SELECT * FROM article;

# 2번글 내용에 자바소스코드 넣기
UPDATE article SET `body` = '# 자바기본문법\r\n```java\r\nint a = 10;\r\nint b = 20;\r\nint c = a + b;\r\n```'
WHERE id = '2'; 

# IT 게시판 추가
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'JAVA',
`code` = 'it';

# IT 게시판에 글 5개 작성
insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "1강, Class",
`body` = "# Class\r\n- java 기초\r\n\r\n# Main 클래스 예시\r\n```\r\n public class Main {\r\n   public static void main(Strings[] args) {\r\n      int i=1;\r\n      String str='string';\r\n  }\r\n}\r\n```\r\n\r\n# 클래스 접근 제어자\r\n```\r\n - public : public 가 붙은 변수, 메소드는 어떤 클래스에서라도 접근이 가능합니다. \r\n - private : 해당 클래스만 접근이 가능합니다. \r\n - protected : protected 가 붙은 변수, 메소드는 동일 패키지내의 클래스 또는 해당 클래스를 상속 받는 외부 패키지의 클래스에서 접근이 가능합니다.\r\n```",
memberId = 1,
boardId = 3;

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "2강, Variable",
`body` = "# Variable\r\n- 변수\r\n\r\n# 변수의 타입\r\n\r\n ## 숫자형\r\n```\r\n1)정수형\r\n - byte\r\n - short\r\n - int\r\n - long\r\n 2)실수형\r\n - float\r\n - double\r\n```\r\n## 논리형\r\n```\r\n - boolean \r\n```\r\n## 문자형\r\n```\r\n - char \r\n```\r\n## 문자열\r\n```\r\n - String\r\n```\r\n",
memberId = 1,
boardId = 3;

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "3강",
`body` = "",
memberId = 1,
boardId = 3;

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "4강",
`body` = "",
memberId = 1,
boardId = 3;

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "5강",
`body` = "",
memberId = 1,
boardId = 3;