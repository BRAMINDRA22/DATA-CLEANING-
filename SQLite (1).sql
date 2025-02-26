SELECT * 
FROM layoff ; /*  MENAMPILKAN SEMUA DATA   */



  SELECT *,
 ROW_NUMBER() OVER (PARTITION BY C1,C2,C3,C4,C5,C6,C7,C8,C9) AS row_num 
 from layoff; /* Fungsi raw num yaitu untuk menganalisis data duplicate dengan menambahkan nila 1 atau >1 pada kolom */

with duplicate_cte as ( /* Untuk menampilkan data mana saja yang ada duplicate menggunak row num */
  SELECT *,
 ROW_NUMBER() OVER (PARTITION BY C1,C2,C3,C4,C5,C6,C7,C8,C9) AS row_num 
 from layoff
  )
  SELECT *
  FROM duplicate_cte 
  where row_num > 1;  
  
  
  SELECT * FROM layoff
WHERE (c1,c3, c4, c5, c6, c7, c8, c9 ) IN (
    SELECT c1, c3, c4, c5, c6, c7, c8, c9 FROM layoff /* untuk menampilkan duplicate lebih spesifik dan berururtan mengunakan order by */
    GROUP BY c1, c3, c4, c5, c6, c7, c8, c9
    HAVING COUNT(*) > 1
) ORDER BY C1, C2, C3, C4; 
  
  DELETE FROM layoff
WHERE rowid NOT IN (
    SELECT MIN(rowid)  /* menghapus data duplicate */
    FROM layoff
    GROUP BY c1, c2, c3, c4, c5, c6, c7, c8, c9
);


SELECT * FROM layoff /* mendeteksi nilai null*/
WHERE c4 IS NULL
   OR c5 IS NULL
   or c9 is null;

DELETE FROM layoff /* meremove nilai null */
WHERE c4 IS NULL
   OR c5 IS NULL
   or c9 is null; 
   
SELECT * FROM layoff;

