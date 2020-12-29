/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.17-MariaDB : Database - textBoard
*********************************************************************
*/

/*!40101 SET NAMES utf8mb4 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `demoBoard`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demoBoard` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `demoBoard`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `title` CHAR(200) NOT NULL,
  `body` TEXT NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `boardId` INT(10) UNSIGNED NOT NULL,
  `view` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

INSERT  INTO `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`view`) VALUES 
(1,'2020-12-18 13:32:10','2020-12-18 13:32:10','����1??','����1',1,2,0),
(2,'2020-12-18 13:32:10','2020-12-18 13:32:10','����2','# �ڹٱ⺻����\r\n```java\r\nint a = 10;\r\nint b = 20;\r\nint c = a + b;\r\n```',1,2,0),
(3,'2020-12-18 13:32:10','2020-12-18 13:32:10','����3??','# ��������\r\n�ȳ��ϼ���.\r\n�� ����Ʈ�� ���� �� ���� �����Դϴ�.\r\n\r\n---\r\n\r\n# �� ����Ʈ�� Ư¡\r\n- A\r\n- B\r\n- C',1,1,0),
(4,'2020-12-18 13:32:10','2020-12-18 13:32:10','1��, Class','# Class\r\n- Ŭ������ ������ ����� ���� ��ü���� �Ӽ��� ������� ����ü\r\n- java ����\r\n\r\n# Main Ŭ���� ����\r\n```\r\n public class Main {\r\n   public static void main(Strings[] args) {\r\n      int i=1;\r\n      String str=\'string\';\r\n  }\r\n}\r\n```\r\n\r\n# Ŭ���� ���� ������\r\n```\r\n - public : public �� ���� ����, �޼ҵ�� � Ŭ���������� ������ �����մϴ�. \r\n - private : �ش� Ŭ������ ������ �����մϴ�. \r\n - protected : protected �� ���� ����, �޼ҵ�� ���� ��Ű������ Ŭ���� �Ǵ� �ش� Ŭ������ ��� �޴� �ܺ� ��Ű���� Ŭ�������� ������ �����մϴ�.\r\n```',1,3,0),
(5,'2020-12-18 13:32:10','2020-12-18 13:32:10','2��, Variable(1)','# Variable\r\n- ���� ����\r\n- ������ �̸��� ���� ���� ������ �� �ִ� �޸� ������ ����\r\n- ������ Ÿ�Կ� ���� ������ ũ�Ⱑ �޶�����.\r\n\r\n# ������ Ÿ��\r\n\r\n ## ������\r\n```\r\n1)������\r\n - byte\r\n - short\r\n - int\r\n - long\r\n 2)�Ǽ���\r\n - float\r\n - double\r\n```\r\n## ����\r\n```\r\n - boolean : true, false\r\n```\r\n## ������\r\n```\r\n - char : \'a\', \'b\' ... \r\n```\r\n## ���ڿ�\r\n```\r\n - String : \'abc\' ...\r\n```\r\n\r\n# ����\r\n# ',1,3,0),
(6,'2020-12-22 08:51:00','2020-12-22 08:51:00','3��, Variable(2)','# Variable\r\n- ���� ����\r\n- �������� ����\r\n\r\n# �迭�� ����\r\n\r\n ## Array\r\n```\r\n- ������ �����ϸ鼭 ũ�⸦ �������־�� �Ѵ�.\r\n- �ѹ� �迭�� �����ϸ� ũ�⸦ ������ �� ����.\r\n\r\nex)\r\n// ����\r\nint[] i = new int[10];\r\nString[] str = new String[10];\r\n// ����\r\nint[1];\r\nString[2];\r\n```\r\n## List\r\n```\r\n- ���� �����ϸ鼭 ũ�⸦ ���������� �ʾƵ� �ȴ�.\r\n- ���� ũ�Ⱑ ���ϴ� ��� ���\r\n\r\nex)\r\nimport java.util.ArrayList;\r\nArrayList<Integer> list = new ArrayList<Integer>();\r\n\r\n// �� �߰�\r\nlist.add(1);\r\nlist.add(2);\r\nlist.add(3); // list = {1,2,3}\r\n\r\n// �� ����\r\nlist.get(0); // 1\r\n\r\n// Listũ�⸦ ��ȯ\r\nlist.size(); // 3\r\n\r\n// ���� �ִ��� Ȯ��\r\nlist.contains(2); // true\r\n\r\n// �� ����\r\nlist.remove(0); // list = {2,3}\r\n```\r\n## Map\r\n```\r\n- (key, value)�� ���� �����Ѵ�.\r\n- index�� ���ѹ��� �ʰ� ���� ã�ų� ������ �� �ִ�.\r\n\r\nex)\r\nimport java.util.Map;\r\nimport java.util.HashMap;\r\nHashMap<dataType, dataType> map = new HashMap<dataType, dataType>();\r\n\r\n// �� ����\r\nmap.put(\"key\", \"value\"); // map = {\"key\" : \"value\"}\r\n\r\n// �� ����\r\nmap.get(\"key\"); // \"value\"\r\n\r\n// ���� Ȯ��\r\nmap.containsKey(\"key\"); // true\r\n\r\n// ���� ����\r\nmap.remove(\"key\");\r\n\r\n// ũ�� ��ȯ\r\nmap.size(); // 1\r\n```',1,3,0),
(7,'2020-12-22 08:51:00','2020-12-22 08:51:00','4��, ���','# ���\r\n- ���α׷��� �帧�� ������ �� �ְ� �����ش�.\r\n\r\n# ��� ����\r\n\r\n ## if\r\n```\r\n- ���ǹ��� true�� ��� if���� �����ϰ� false�� ��� �Ʒ��� �������鼭 ���ǿ� �´� if���� ã�´�.\r\n- ���ǹ��� �´� if���� ���� ��� else�� �����ϰų� if���� �����.\r\n- �񱳿����ڸ� ����Ͽ� �����Ǵ��� �� �� �ִ�.\r\n\r\nex)\r\nif(���ǹ�) {\r\n...\r\n} else if(���ǹ�) {\r\n...\r\n} else {\r\n...\r\n}\r\n\r\n```\r\n## switch/case\r\n```\r\n- if���� ��������� �� �� ����ȭ��\r\n- �Էº����� ��ġ�ϴ� �Է°��� ã�� �����Ѵ�.\r\n- ã�� ���� ���� ��� default�� ����\r\n\r\nex)\r\nswitch(�Էº���) {\r\n    case �Է°�1: ...\r\n        break;\r\n    case �Է°�2: ...\r\n        break;\r\n    default: ...\r\n        break;\r\n}\r\n```\r\n## while\r\n```\r\n- ���ǹ��� true�� ��� �ݺ� ����\r\n- while���� ���������� �ڵ尡 ���� ��� ���� ������ ������.\r\n- ���ѷ����� ���������� ���ؼ��� break; �� ����Ѵ�.\r\n- �˻� ���ǿ� ���� ���� ��� continue; �� ����ؼ� while���� ó������ ������ �� �ִ�.\r\n\r\nex)\r\nwhile(���ǹ�) {\r\n...\r\nbreak;\r\n}\r\n```\r\n\r\n## for\r\n```\r\n- �ʱ�ġ : ó�� ���� ��ġ\r\n- ����ġ : �ʱ�ġ���� �󸶸�ŭ ������ų���ΰ�\r\n- for�������� continue; �� ����� �� �ִ�.\r\n\r\nex)\r\nfor (�ʱ�ġ; ���ǹ�; ����ġ) {\r\n...\r\n}\r\n```\r\n\r\n## foreach\r\n```\r\n- �迭�ȿ� �ִ� ������ �Ѱ��� ���ʴ�� ������ �ݺ��Ѵ�.\r\n- �迭�� ũ�⸸ŭ �ݺ�\r\n\r\nex)\r\nint[] array = {1, 2, 3};\r\nfor(int i : array) {\r\nSystem.out.printf(i); // 1 2 3\r\n...\r\n}\r\n\r\nArrayList<String>() list = new ArrayList<String>();\r\nlist.add(\"a\");\r\nlist.add(\"b\");\r\nlist.add(\"c\");\r\nfor(String str : list) {\r\nSystem.out.printf(str); // a b c\r\n...\r\n}\r\n```',1,3,0),
(8,'2020-12-22 08:51:00','2020-12-22 08:51:00','5��, ��ü ���� ���α׷���','# ��ü���� ���α׷���\r\n\r\n```java\r\n - java : ��ü���� ���α׷��� ���\r\n```\r\n\r\n# ����\r\n\r\n## Ŭ����\r\n```\r\n - ��ü�� ����� ���\r\n - Ŭ���� ������ ������ ������ �� �ִ�. (=��ü ����)\r\n - �޼ҵ带 �̿��ؼ� Ŭ������ ������ ���� �Է��� �� �ִ�.\r\n - ��ü ������ �������� �ʴ´�.\r\n \r\n ex)\r\npublic class Animal {\r\n    String name;\r\n}\r\n\r\n// ����, ���� ����\r\nAnimal animal = new Animal();\r\nanimal.name;\r\n```\r\n\r\n## �޼ҵ�\r\n```\r\n - Ŭ���� ���� �Լ�\r\n - �Է°��� ���ϰ��� �ʿ信 ���� �ۼ��� �� �ִ�.\r\n - return; �� �ܵ����� ���� ��� �޼ҵ带 ��� ����������.\r\n \r\n ex)\r\npublic class Test {\r\n    // �޼ҵ� �ۼ�\r\n    public int sum(int a, int b) {\r\n        return a+b;\r\n    }\r\n}\r\n```\r\n\r\n## call by value\r\n```\r\n - �޼ҵ�� ��ü�� ������ ��� �޼ҵ忡�� ��ü�� ��ü���� ���� ������ �� �ִ�.\r\n```\r\n\r\n## ���\r\n```\r\n - �ڽ� Ŭ���� extends �θ� Ŭ���� { }\r\n - extends �� ����Ͽ� �θ� Ŭ������ ����� ��� ���� �� �ִ�.\r\n - IS-A ���� (���� ���� ������� or ��Ӱ���)\r\n - �ڽ� Ŭ������ �θ� Ŭ������ �޼ҵ带 �������̵�, �����ε��� �� �� �ִ�.\r\n - �ڹٴ� ���� ����� �������� �ʴ´�.\r\n \r\nex)\r\npublic class Dog extends Animal { }\r\n```\r\n\r\n## ������\r\n```\r\n - Ŭ���� ��ü�� ������ ��ü�� ���� ���� �� �ִ�.\r\n - �޼ҵ��� Ŭ�������� �����ؾ� �Ѵ�.\r\n - ����Ÿ���� �������� �ʴ´�.\r\n - ������ �����ε� ����.\r\n```\r\n\r\n## �������̽�\r\n```\r\n - ���� ������ ���� �������� ������ ��Ƴ��� ��\r\n```\r\n\r\n## �߻�Ŭ����\r\n```\r\n - ���� �ٸ� Ŭ���� ���� ����� �ʵ�� �޼��带 ���������� �����ؼ� ���� Ŭ����\r\n - �߻�Ŭ������ �޼���� ������ ��ü������ �ʱ� ������ ��ü�� ������ �� ����.\r\n - ���� Ŭ������ �߻�Ŭ������ ��ӹ޴´�.\r\n - abstract �� ���\r\n - �߻�Ŭ���� ������ �߻�Ŭ������ ��ӹ޾� ������ ����Ŭ���� �ν��Ͻ��� �����ϸ� �ش� �߻�Ŭ���� ������ �ڵ� Ÿ�Ժ�ȯ�� �߻����� ����Ŭ���� �ν��Ͻ�ó�� ����� �� �ִµ�, �̰��� Ÿ���� �������̶� �Ѵ�.\r\n \r\nex)\r\npublic abstract class Ŭ������ {\r\n  //�ʵ�\r\n  //������\r\n  //�޼���\r\n  //�߻�޼���\r\n}\r\n```',1,3,0);

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `name` CHAR(20) NOT NULL,
  `code` CHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

INSERT  INTO `board`(`id`,`regDate`,`updateDate`,`name`,`code`) VALUES 
(1,'2020-12-18 13:32:10','2020-12-18 13:32:10','��������','notice'),
(2,'2020-12-18 13:32:10','2020-12-18 13:32:10','����','free'),
(3,'2020-12-18 13:32:10','2020-12-18 13:32:10','JAVA','it');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `loginId` CHAR(30) NOT NULL,
  `loginPw` VARCHAR(50) NOT NULL,
  `name` CHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

INSERT  INTO `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`name`) VALUES 
(1,'2020-12-18 13:32:10','2020-12-18 13:32:10','admin','admin','������'),
(2,'2020-12-18 13:32:10','2020-12-18 13:32:10','test2','test2','�׽���2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

# �Խù� ���̺� ��õ��, ��ۼ� Į�� �߰�
ALTER TABLE article ADD COLUMN likesCount INT(10) UNSIGNED NOT NULL;
ALTER TABLE article ADD COLUMN commentsCount INT(10) UNSIGNED NOT NULL;