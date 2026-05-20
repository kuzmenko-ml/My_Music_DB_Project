USE My_Music_DB;
GO

SELECT UserName, Country
FROM Users;

SELECT UserName, Country
FROM Users
WHERE Country = 'Ukraine';

SELECT Title, Artist
FROM Tracks

SELECT Title, Artist, Genre
FROM Tracks
WHERE Genre = 'Pop' AND DurationSeconds > 200;

SELECT TOP 3 Title, Artist, DurationSeconds
FROM Tracks
ORDER BY DurationSeconds DESC;

SELECT Title, Artist, DurationSeconds
FROM Tracks
ORDER BY DurationSeconds DESC;

SELECT TOP 3 Title, Artist, DurationSeconds
FROM Tracks
ORDER BY DurationSeconds;

SELECT Title, Artist, DurationSeconds
FROM Tracks
ORDER BY DurationSeconds;

SELECT Title AS [Назва пісенька], Artist AS [Співачок]
FROM Tracks;

SELECT Title AS [Назва пісенька], Artist AS [Співачок], Genre AS [Жанрр-ррр-р]
FROM Tracks;

SELECT Title AS [Назва пісенька], Artist AS [Співачок], Genre AS [Жанрр-ррр-р]
FROM Tracks
WHERE Genre = 'Pop';

SELECT Title, Genre
FROM Tracks 
WHERE Genre = 'Pop' OR Genre = 'Rock';

SELECT Title, Genre
FROM Tracks 
WHERE Genre IN ('Pop','Rock');

SELECT Title, Genre, DurationSeconds
FROM Tracks 
WHERE Genre = 'Alternative' OR DurationSeconds > 200;

SELECT Title, Genre, DurationSeconds
FROM Tracks 
WHERE Genre = 'Alternative' OR DurationSeconds >= 200;

SELECT Title, Artist
FROM Tracks
WHERE Title LIKE 'Bad%';

SELECT Title, Artist
FROM Tracks
WHERE Title LIKE '%of%';

SELECT Username, Country 
FROM Users
WHERE Username LIKE '%1';

SELECT DISTINCT Genre
FROM Tracks;

SELECT Title, Artist
FROM Tracks
WHERE DurationSeconds IS NULL;

SELECT Title, Artist, DurationSeconds,
	CASE
		WHEN DurationSeconds > 220 THEN 'Довгий трек'
		ELSE 'Короткий трек'
	END AS [Тип треку]
FROM Tracks;

SELECT UserName AS [Ім'я], Country AS [Батьківщина],
	CASE
		WHEN Country = 'Ukraine' THEN 'Живчік'
		ELSE '-'
	END AS [Статус]
FROM Users;

SELECT COUNT(*) AS [Скільки всього]
FROM Users;

SELECT MAX(DurationSeconds) AS [Найдовший трек (сек)], 
       MIN(DurationSeconds) AS [Найкоротший трек (сек)]
FROM Tracks;

SELECT SUM(DurationSeconds) AS [Загальний час (сек)], 
       AVG(DurationSeconds) AS [Середній час треку (сек)]
FROM Tracks;

SELECT Genre, COUNT(*) AS [Кількість пісень]
FROM Tracks
GROUP BY Genre;

SELECT Genre, COUNT(*) AS [Кількість пісень]
FROM Tracks
GROUP BY Genre
HAVING COUNT(*) > 1;