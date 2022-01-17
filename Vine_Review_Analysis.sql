-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

--DELIVERABLE 2

-- Initial Count = 1'785,997
SELECT COUNT(*)
FROM vine_table;

-- Step 1. Filter total_votes >= 20
CREATE TABLE vine_step1 AS
SELECT * FROM vine_table
WHERE total_votes >= 20;
--SELECT COUNT(*) FROM vine_step1 = 65,379

--Step 2. Filter helpful_votes / total_votes > .5
CREATE TABLE vine_step2 AS
SELECT * FROM vine_step1 
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
--SELECT COUNT(*) FROM vine_step2 = 40,565

--Step 3. Filter Vine program (paid)
CREATE TABLE y_vine_step3 AS
SELECT * FROM vine_step2 
WHERE vine = 'Y';

--Step 4. Filter Vine program (unpaid)
CREATE TABLE n_vine_step4 AS
SELECT * FROM vine_step2 
WHERE vine = 'N';

--Step 5.total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews.
SELECT 'Paid' AS vine,*,(five_star_revs/total_reviews::FLOAT)*100 AS five_stars_percentage
FROM
	(
	SELECT COUNT(review_id) AS total_reviews,
		SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END) AS five_star_revs
	FROM y_vine_step3
	)a
UNION ALL	

--Step 6.total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews.
SELECT 'Unpaid' AS vine,*,(five_star_revs/total_reviews::FLOAT)*100 AS five_stars_percentage
FROM
	(
	SELECT COUNT(review_id) AS total_reviews,
		SUM(CASE WHEN star_rating = 5 THEN 1 ELSE 0 END) AS five_star_revs
	FROM n_vine_step4
	)a
