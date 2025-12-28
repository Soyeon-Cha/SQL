-- 리뷰를 가장 많이 작성한 회원의 리뷰들
SELECT M.MEMBER_NAME, R.REVIEW_TEXT,
    DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW R
    JOIN MEMBER_PROFILE M
        ON R.MEMBER_ID = M.MEMBER_ID
WHERE R.MEMBER_ID IN (SELECT MEMBER_ID
                    FROM REST_REVIEW
                    GROUP BY MEMBER_ID
                    HAVING COUNT(*) = (SELECT MAX(CNT)
                                      FROM (SELECT COUNT(*) AS CNT
                                           FROM REST_REVIEW
                                           GROUP BY MEMBER_ID) A
                                      ))
ORDER BY R.REVIEW_DATE, R.REVIEW_TEXT
