# DB ����
DROP DATABASE IF EXISTS textBoard;
CREATE DATABASE textBoard;
USE textBoard;

# �Խù� ���̺� ����
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL
);

# �Խù� ������ 3�� ����
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '����1',
`body` = '����1',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '����2',
`body` = '����2',
memberId = 1,
boardId = 1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '����3',
`body` = '����3',
memberId = 1,
boardId = 1;

# ȸ�� ���̺� ����
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(30) NOT NULL,
    loginPw VARCHAR(50) NOT NULL,
    `name` CHAR(30) NOT NULL
);

# ȸ�� ������ ����
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '������';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '�׽���2';

# �Խ��� ���̺� ����
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(20) NOT NULL,
    `code` CHAR(20) NOT NULL
);

# �������� �Խ��� �߰�
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '��������',
`code` = 'notice';

# ���� �Խ��� �߰�
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = '����',
`code` = 'free';

UPDATE article
SET boardId = 2
LIMIT 2;

# ���� �Լ�
/*
SELECT DATE(NOW());
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT SUBSTR("�ȳ��ϼ���.", 1, 2);
SELECT SUBSTR("�ȳ��ϼ���.", 2, 2);
SELECT CONCAT("�ȳ�", "�ϼ���.");
SELECT RAND() * 100;
*/

# �Խù� ���� ����
/*
insert into article
set regDate = NOW(),
updateDate = NOW(),
title = concat("����_", rand()),
`body` = CONCAT("����_", RAND()),
memberId = FLOOR(RAND() * 2) + 1,
boardId = FLOOR(RAND() * 2) + 1;
*/

# 3���� ������ ��ũ�ٿ� �������� ����
UPDATE article SET `body` = '# ��������\r\n�ȳ��ϼ���.\r\n�� ����Ʈ�� ���� �� ���� �����Դϴ�.\r\n\r\n---\r\n\r\n# �� ����Ʈ�� Ư¡\r\n- A\r\n- B\r\n- C'
WHERE id = '3';

SELECT * FROM article;

# 2���� ���뿡 �ڹټҽ��ڵ� �ֱ�
UPDATE article SET `body` = '# �ڹٱ⺻����\r\n```java\r\nint a = 10;\r\nint b = 20;\r\nint c = a + b;\r\n```'
WHERE id = '2'; 

# IT �Խ��� �߰�
INSERT INTO board 
SET regDate = NOW(),
updateDate = NOW(),
`name` = 'JAVA',
`code` = 'it';

ALTER TABLE article ADD COLUMN `view` INT UNSIGNED NOT NULL;

# IT �Խ��ǿ� �� 5�� �ۼ�
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = "1��, Class",
`body` = "# Class\r\n- Ŭ������ ������ ����� ���� ��ü���� �Ӽ��� ������� ����ü\r\n- java ����\r\n\r\n# Main Ŭ���� ����\r\n```\r\n public class Main {\r\n   public static void main(Strings[] args) {\r\n      int i=1;\r\n      String str='string';\r\n  }\r\n}\r\n```\r\n\r\n# Ŭ���� ���� ������\r\n```\r\n - public : public �� ���� ����, �޼ҵ�� � Ŭ���������� ������ �����մϴ�. \r\n - private : �ش� Ŭ������ ������ �����մϴ�. \r\n - protected : protected �� ���� ����, �޼ҵ�� ���� ��Ű������ Ŭ���� �Ǵ� �ش� Ŭ������ ��� �޴� �ܺ� ��Ű���� Ŭ�������� ������ �����մϴ�.\r\n```",
memberId = 1,
boardId = 3,
`view`=1;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = "2��, Variable(1)",
`body` = "# Variable\r\n- ���� ����\r\n- ������ �̸��� ���� ���� ������ �� �ִ� �޸� ������ ����\r\n- ������ Ÿ�Կ� ���� ������ ũ�Ⱑ �޶�����.\r\n\r\n# ������ Ÿ��\r\n\r\n ## ������\r\n```\r\n1)������\r\n - byte\r\n - short\r\n - int\r\n - long\r\n 2)�Ǽ���\r\n - float\r\n - double\r\n```\r\n## ����\r\n```\r\n - boolean : true, false\r\n```\r\n## ������\r\n```\r\n - char : 'a', 'b' ... \r\n```\r\n## ���ڿ�\r\n```\r\n - String : 'abc' ...\r\n```\r\n\r\n# ����\r\n# ",
memberId = 1,
boardId = 3,
`view`=2;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = "3��, Variable(2)",
`body` = "",
memberId = 1,
boardId = 3,
`view`=3;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = "4��, ���",
`body` = "",
memberId = 1,
boardId = 3,
`view`=4;

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = "5��, ��ü ���� ���α׷���",
`body` = "",
memberId = 1,
boardId = 3,
`view`=5;