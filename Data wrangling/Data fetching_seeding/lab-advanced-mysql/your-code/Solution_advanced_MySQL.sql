#Challenge 1

#Step 1
SELECT au_id AS author_id, au_lname AS first_name, au_fname AS last_name, royaltyper, advance, title, price, royalty, qty, qty*price*(royalty/100)*(royaltyper/100) AS sales_royalty
FROM authors AS a
JOIN titleauthor AS ta
USING(au_id)

JOIN titles AS t
USING(title_id)

JOIN sales AS s
USING(title_id)
ORDER BY sales_royalty DESC;

#Step 2
SELECT au_id AS author_id, au_fname, au_lname, title_id, SUM(qty*price*(royalty/100)*(royaltyper/100)) AS sales_royalty
FROM authors AS a
JOIN titleauthor AS ta
USING(au_id)

JOIN titles AS t
USING(title_id)

JOIN sales AS s
USING(title_id)
GROUP BY author_id, title_id
ORDER BY sales_royalty DESC;


# Step 3

SELECT au_id AS author_id, au_fname AS first_name, au_lname AS last_name, sum(total_profit) AS author_total_profit
FROM(
	SELECT au_id, au_fname, au_lname, title_id,(sales_royalty + proportional_advance) AS total_profit
	FROM(
		SELECT au_id, au_fname, au_lname, title_id, sum(qty*price*(royalty/100)*(royaltyper/100)) AS sales_royalty, advance*(royaltyper/100) AS proportional_advance
		FROM authors AS a
		JOIN titleauthor AS ta
		USING(au_id)

		JOIN titles AS t
		USING(title_id)

		JOIN sales AS s
		USING(title_id)
		GROUP BY title_id, au_id) nest1
)nest2
GROUP BY author_id
ORDER BY author_total_profit DESC;

# Challenge 2

-- a. Creating the temporary table
CREATE TEMPORARY TABLE unit_revenues_summary
SELECT au_id, au_fname, au_lname, title_id, sum(qty*price*(royalty/100)*(royaltyper/100)) AS sales_royalty, advance*(royaltyper/100) AS proportional_advance
FROM authors AS a
JOIN titleauthor AS ta
USING(au_id)

JOIN titles AS t
USING(title_id)

JOIN sales AS s
USING(title_id)
GROUP BY title_id, au_id;

-- b. Using the temporary table instead of a subquery of "second order"
SELECT au_id AS author_id, au_lname AS last_name, au_fname AS first_name, SUM(total_profit) as author_total_profit
FROM(
	SELECT au_id, au_fname, au_lname, title_id,(sales_royalty + proportional_advance) AS total_profit
	FROM unit_revenues_summary
)final
GROUP BY author_id, last_name, first_name
ORDER BY author_total_profit DESC
LIMIT 3;

# Challenge 3

-- a. Creating the permanent table
CREATE TABLE most_profiting_authors(au_id VARCHAR(11), author_total_profit INT(11),
PRIMARY KEY(au_id)
);

-- b. Creating the temporary table from the query of challenge 2
CREATE TEMPORARY TABLE most_profiting_authors_temporary
SELECT au_id AS author_id, SUM(total_profit) as author_total_profit
FROM(
	SELECT au_id, au_fname, au_lname, title_id,(sales_royalty + proportional_advance) AS total_profit
	FROM unit_revenues_summary
)final
GROUP BY author_id
ORDER BY author_total_profit DESC
LIMIT 3;

-- c. Pouring the content of the temporary table into the permanent one.
INSERT INTO most_profiting_authors(au_id, author_total_profit)
SELECT author_id, author_total_profit
FROM most_profiting_authors_temporary;
