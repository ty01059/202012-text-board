# 구글 애널리틱스 4 페이지 경로별 통계 정보
CREATE TABLE ga4DataPagePath (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    pagePath CHAR(100) NOT NULL UNIQUE,
    hit INT(10) UNSIGNED NOT NULL
);

# 1단계, 다 불러오기
SELECT pagePath
FROM ga4DataPagePath AS GA4_PP
WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'

# 2단계, pagePath 정제
SELECT 
IF(
    INSTR(GA4_PP.pagePath, '?') = 0,
    GA4_PP.pagePath,
    SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
) AS pagePathWoQueryStr
FROM ga4DataPagePath AS GA4_PP
WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'

# 3단계, pagePathWoQueryStr(정제된 pagePth)기준으로 sum
SELECT 
IF(
    INSTR(GA4_PP.pagePath, '?') = 0,
    GA4_PP.pagePath,
    SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
) AS pagePathWoQueryStr,
SUM(GA4_PP.hit) AS hit
FROM ga4DataPagePath AS GA4_PP
WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'
GROUP BY pagePathWoQueryStr

# 4단계, subQuery를 이용
SELECT *
FROM (
    SELECT 
    IF(
        INSTR(GA4_PP.pagePath, '?') = 0,
        GA4_PP.pagePath,
        SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
    ) AS pagePathWoQueryStr,
    SUM(GA4_PP.hit) AS hit
    FROM ga4DataPagePath AS GA4_PP
    WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'
    GROUP BY pagePathWoQueryStr
) AS GA4_PP;

# 5단계, subQuery를 이용해서 나온결과를 다시 재편집
SELECT CAST(REPLACE(REPLACE(GA4_PP.pagePathWoQueryStr, "/article_detail_", ""), ".html", "") AS UNSIGNED) AS articleId,
hit
FROM (
    SELECT 
    IF(
        INSTR(GA4_PP.pagePath, '?') = 0,
        GA4_PP.pagePath,
        SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
    ) AS pagePathWoQueryStr,
    SUM(GA4_PP.hit) AS hit
    FROM ga4DataPagePath AS GA4_PP
    WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'
    GROUP BY pagePathWoQueryStr
) AS GA4_PP;

# 게시물 테이블에 조회수 칼럼 추가
ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL;

# 구글 애널리틱스에서 가져온 데이터를 기반으로 모든 게시물의 hit 정보를 갱신

# 1단계, 조인
SELECT AR.id, AR.hitCount, GA4_PP.hit
FROM article AS AR
INNER JOIN (
    SELECT CAST(REPLACE(REPLACE(GA4_PP.pagePathWoQueryStr, '/article_detail_', ''), '.html', '') AS UNSIGNED) AS articleId,
    hit
    FROM (
        SELECT 
        IF(
            INSTR(GA4_PP.pagePath, '?') = 0,
            GA4_PP.pagePath,
            SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
        ) AS pagePathWoQueryStr,
        SUM(GA4_PP.hit) AS hit
        FROM ga4DataPagePath AS GA4_PP
        WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'
        GROUP BY pagePathWoQueryStr
    ) AS GA4_PP
) AS GA4_PP
ON AR.id = GA4_PP.articleId;

# 2단계, 실제 쿼리
UPDATE article AS AR
INNER JOIN (
    SELECT CAST(REPLACE(REPLACE(GA4_PP.pagePathWoQueryStr, '/article_detail_', ''), '.html', '') AS UNSIGNED) AS articleId,
    hit
    FROM (
        SELECT 
        IF(
            INSTR(GA4_PP.pagePath, '?') = 0,
            GA4_PP.pagePath,
            SUBSTR(GA4_PP.pagePath, 1, INSTR(GA4_PP.pagePath, '?') - 1)
        ) AS pagePathWoQueryStr,
        SUM(GA4_PP.hit) AS hit
        FROM ga4DataPagePath AS GA4_PP
        WHERE GA4_PP.pagePath LIKE '/article_detail_%.html%'
        GROUP BY pagePathWoQueryStr
    ) AS GA4_PP
) AS GA4_PP
ON AR.id = GA4_PP.articleId
SET AR.hitCount = GA4_PP.hit;