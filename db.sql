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
`body` = "# Class\r\n- 클래스란 유사한 기능을 가진 객체들의 속성을 묶어놓은 집합체\r\n- java 기초\r\n\r\n# Main 클래스 예시\r\n```\r\n public class Main {\r\n   public static void main(Strings[] args) {\r\n      int i=1;\r\n      String str='string';\r\n  }\r\n}\r\n```\r\n\r\n# 클래스 접근 제어자\r\n```\r\n - public : public 가 붙은 변수, 메소드는 어떤 클래스에서라도 접근이 가능합니다. \r\n - private : 해당 클래스만 접근이 가능합니다. \r\n - protected : protected 가 붙은 변수, 메소드는 동일 패키지내의 클래스 또는 해당 클래스를 상속 받는 외부 패키지의 클래스에서 접근이 가능합니다.\r\n```",
memberId = 1,
boardId = 3;

# Class
- 클래스란 유사한 기능을 가진 객체들의 속성을 묶어놓은 집합체
- java 기초

# Main 클래스 예시
```
 public class Main {
   public static void main(Strings[] args) {
      int i=1;
      String str='string';
  }
}
```

# 클래스 접근 제어자
```
 - public : public 가 붙은 변수, 메소드는 어떤 클래스에서라도 접근이 가능합니다. 
 - private : 해당 클래스만 접근이 가능합니다. 
 - protected : protected 가 붙은 변수, 메소드는 동일 패키지내의 클래스 또는 해당 클래스를 상속 받는 외부 패키지의 클래스에서 접근이 가능합니다.
```

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "2강, Variable(1)",
`body` = "# Variable\r\n- 변수 선언\r\n- 변수에 이름을 정해 값을 저장할 수 있는 메모리 공간을 생성\r\n- 데이터 타입에 따라서 변수의 크기가 달라진다.\r\n\r\n# 변수의 타입\r\n\r\n ## 숫자형\r\n```\r\n1)정수형\r\n - byte\r\n - short\r\n - int\r\n - long\r\n 2)실수형\r\n - float\r\n - double\r\n```\r\n## 논리형\r\n```\r\n - boolean : true, false\r\n```\r\n## 문자형\r\n```\r\n - char : 'a', 'b' ... \r\n```\r\n## 문자열\r\n```\r\n - String : 'abc' ...\r\n```\r\n\r\n# 예시\r\n# ",
memberId = 1,
boardId = 3;

# Variable
- 변수 선언
- 변수에 이름을 정해 값을 저장할 수 있는 메모리 공간을 생성
- 데이터 타입에 따라서 변수의 크기가 달라진다.

# 변수의 타입

 ## 숫자형
```
1)정수형
 - byte
 - short
 - int
 - long
 2)실수형
 - float
 - double
```
## 논리형
```
 - boolean : true, false
```
## 문자형
```
 - char : 'a', 'b' ... 
```
## 문자열
```
 - String : 'abc' ...
```

# 예시
# 

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "3강, Variable(2)",
`body` = "",
memberId = 1,
boardId = 3;

# Variable
- 변수 선언
- 변수들의 집합

# 배열의 종류

 ## Array
```
- 변수를 선언하면서 크기를 지정해주어야 한다.
- 한번 배열을 선언하면 크기를 변경할 수 없다.

ex)
// 선언
int[] i = new int[10];
String[] str = new String[10];
// 추출
int[1];
String[2];
```
## List
```
- 변수 선언하면서 크기를 지정해주지 않아도 된다.
- 값의 크기가 변하는 경우 사용

ex)
import java.util.ArrayList;
ArrayList<Integer> list = new ArrayList<Integer>();

// 값 추가
list.add(1);
list.add(2);
list.add(3); // list = {1,2,3}

// 값 추출
list.get(0); // 1

// List크기를 반환
list.size(); // 3

// 값이 있는지 확인
list.contains(2); // true

// 값 제거
list.remove(0); // list = {2,3}
```
## Map
```
- (key, value)로 값을 저장한다.
- index에 제한받지 않고 값을 찾거나 저장할 수 있다.

ex)
import java.util.Map;
import java.util.HashMap;
HashMap<dataType, dataType> map = new HashMap<dataType, dataType>();

// 값 저장
map.put("key", "value"); // map = {"key" : "value"}

// 값 추출
map.get("key"); // "value"

// 값을 확인
map.containsKey("key"); // true

// 값을 제거
map.remove("key");

// 크기 반환
map.size(); // 1
```

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "4강, 제어문",
`body` = "",
memberId = 1,
boardId = 3;

# 제어문
- 프로그램의 흐름을 변경할 수 있게 도와준다.

# 제어문 종류

 ## if
```
- 조건문이 true일 경우 if문을 실행하고 false일 경우 아래로 내려가면서 조건에 맞는 if문을 찾는다.
- 조건문에 맞는 if문이 없을 경우 else를 실행하거나 if문을 벗어난다.
- 비교연산자를 사용하여 조건판단을 할 수 있다.

ex)
if(조건문) {
...
} else if(조건문) {
...
} else {
...
}

```
## switch/case
```
- if문과 비슷하지만 좀 더 정형화됨
- 입력변수에 일치하는 입력값을 찾아 실행한다.
- 찾는 값이 없을 경우 default를 실행

ex)
switch(입력변수) {
    case 입력값1: ...
        break;
    case 입력값2: ...
        break;
    default: ...
        break;
}
```
## while
```
- 조건문이 true일 경우 반복 실행
- while문을 빠져나가는 코드가 없을 경우 무한 루프에 빠진다.
- 무한루프를 빠져나가기 위해서는 break; 를 사용한다.
- 검색 조건에 맞지 않을 경우 continue; 를 사용해서 while문을 처음부터 실행할 수 있다.

ex)
while(조건문) {
...
break;
}
```

## for
```
- 초기치 : 처음 시작 위치
- 증가치 : 초기치에서 얼마만큼 증가시킬것인가
- for문에서도 continue; 를 사용할 수 있다.

ex)
for (초기치; 조건문; 증가치) {
...
}
```

## foreach
```
- 배열안에 있는 값들을 한개씩 차례대로 꺼내서 반복한다.
- 배열의 크기만큼 반복

ex)
int[] array = {1, 2, 3};
for(int i : array) {
System.out.printf(i); // 1 2 3
...
}

ArrayList<String>() list = new ArrayList<String>();
list.add("a");
list.add("b");
list.add("c");
for(String str : list) {
System.out.printf(str); // a b c
...
}
```

insert into article
set regDate = NOW(),
updateDate = NOW(),
title = "5강, 객체 지향 프로그래밍",
`body` = "",
memberId = 1,
boardId = 3;

# 객체지향 프로그래밍

```java
 - java : 객체지향 프로그래밍 언어
```

# 개념

## 클래스
```
 - 객체를 만드는 기능
 - 클래스 내에서 변수를 선언할 수 있다. (=객체 변수)
 - 메소드를 이용해서 클래스의 변수에 값을 입력할 수 있다.
 - 객체 변수는 공유되지 않는다.
 
 ex)
public class Animal {
    String name;
}

// 선언, 접근 가능
Animal animal = new Animal();
animal.name;
```

## 메소드
```
 - 클래스 내의 함수
 - 입력값과 리턴값을 필요에 따라서 작성할 수 있다.
 - return; 만 단독으로 쓰일 경우 메소드를 즉시 빠져나간다.
 
 ex)
public class Test {
    // 메소드 작성
    public int sum(int a, int b) {
        return a+b;
    }
}
```

## call by value
```
 - 메소드로 객체를 전달할 경우 메소드에서 객체의 객체변수 값을 변경할 수 있다.
```

## 상속
```
 - 자식 클래스 extends 부모 클래스 { }
 - extends 를 사용하여 부모 클래스의 기능을 상속 받을 수 있다.
 - IS-A 관계 (상위 하위 개념관계 or 상속관계)
 - 자식 클래스는 부모 클래스의 메소드를 오버라이딩, 오버로딩을 할 수 있다.
 - 자바는 다중 상속을 지원하지 않는다.
 
ex)
public class Dog extends Animal { }
```

## 생성자
```
 - 클래스 객체를 생성시 객체에 값을 넣을 수 있다.
 - 메소드명과 클래스명이 동일해야 한다.
 - 리턴타입을 정의하지 않는다.
 - 생성자 오버로딩 가능.
```

## 인터페이스
```
 - 상위 개념이 같은 종류들의 구조를 모아놓은 것
```

## 추상클래스
```
 - 서로 다른 클래스 간에 비슷한 필드와 메서드를 공통적으로 추출해서 만든 클래스
 - 추상클래스는 메서드와 내용이 구체적이지 않기 때문에 객체를 생성할 수 없다.
 - 실제 클래스는 추상클래스를 상속받는다.
 - abstract 를 사용
 - 추상클래스 변수에 추상클래스를 상속받아 구현한 실제클래스 인스턴스를 주입하면 해당 추상클래스 변수는 자동 타입변환을 발생시켜 실제클래스 인스턴스처럼 사용할 수 있는데, 이것을 타입의 다형성이라 한다.
 
ex)
public abstract class 클래스명 {
  //필드
  //생성자
  //메서드
  //추상메서드
}
```