SELECT ID
FROM ECOLI_DATA
WHERE PARENT_ID IN (SELECT ID
                    FROM ECOLI_DATA
                    WHERE PARENT_ID IN (SELECT ID
                                        FROM ECOLI_DATA
                                        WHERE PARENT_ID IS NULL)
                   )
ORDER BY ID

/*
ID PI IN(ID PI IN (ID WHERE PI = NULL))
*/
