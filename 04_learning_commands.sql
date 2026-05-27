USE My_Music_DB;
GO

SELECT * FROM Artists;

SELECT ArtistNickname
FROM Artists
WHERE MusicGroup = 0;

SELECT * FROM Users;

SELECT UserID, UserName, SubscriptionType
FROM Users
WHERE SubscriptionType = 'Premium';

SELECT * FROM Users 
WHERE SubscriptionType = 'Premium';

SELECT * FROM Tracks;

SELECT Title, Genre
FROM Tracks
WHERE Genre = 'Pop';

SELECT * FROM Tracks
WHERE DurationSeconds > 200;

SELECT * FROM Groups;

SELECT GroupName 
FROM Groups
WHERE Followers > 10000 AND Country = 'Україна';

SELECT * FROM Tracks
WHERE Genre = 'Rock' OR Genre = 'Alternative';

SELECT * FROM Tracks
WHERE Genre IN ('Alternative', 'Rock');

SELECT * FROM Artists
WHERE ArtistNickname LIKE 'П%';

SELECT Title AS [SongName]
FROM Tracks;

SELECT COUNT(*) FROM Users;

SELECT MAX(DurationSeconds) AS [Maximum]
FROM Tracks;
SELECT MIN(DurationSeconds) AS [Minumum]
FROM Tracks;

SELECT MAX(DurationSeconds) AS [Maximum], MIN(DurationSeconds) AS [Minumum]
FROM Tracks;

SELECT AVG(DurationSeconds) AS [Avarage seconds]
FROM Tracks
WHERE Genre = 'Pop';

SELECT SUM(DurationSeconds) AS [Total Rock Time]
FROM Tracks
WHERE Genre = 'Rock' AND DurationSeconds > 180;

SELECT GroupName 
FROM Groups
WHERE Followers > 5000 AND Followers < 50000 AND Country <> 'Україна';

SELECT GroupName 
FROM Groups
WHERE Followers BETWEEN 5000 AND 50000
	AND Country <> 'Україна';

SELECT COUNT(*) AS [Special Users]
FROM Users
WHERE SubscriptionType = 'Premium' OR UserName NOT LIKE '%a%';

SELECT MAX(DurationSeconds) - MIN(DurationSeconds) AS [Pop Difference]
FROM Tracks
WHERE Genre = 'Pop';

SELECT ArtistNickname 
FROM Artists
WHERE ArtistNickname LIKE '%a' AND MusicGroup <> 0;

SELECT Genre, COUNT(*) AS [Total Tracks]
FROM Tracks
GROUP BY Genre;

SELECT Genre, AVG(DurationSeconds) AS [Average Duration]
FROM Tracks
WHERE DurationSeconds > 120
GROUP BY Genre;

SELECT Genre, MAX(DurationSeconds) AS [Max Duration]
FROM Tracks
WHERE Genre <> 'Rap'
GROUP BY Genre
ORDER BY [Max Duration] DESC;

SELECT SubscriptionType, COUNT(*) AS [Users Count]
FROM Users
WHERE UserName <> 'Марічка'
GROUP BY SubscriptionType
ORDER BY [Users Count] ASC;

SELECT SubscriptionType, COUNT(*) AS [Users Count]
FROM Users
GROUP BY SubscriptionType
ORDER BY [Users Count] ASC;

SELECT Genre, COUNT(*) AS [Total Tracks]
FROM Tracks
GROUP BY Genre
HAVING COUNT(*) > 2;

SELECT Genre, AVG(DurationSeconds) AS [Avg Duration]
FROM Tracks
WHERE Title NOT LIKE 'S%'
GROUP BY Genre
HAVING AVG(DurationSeconds) > 150
ORDER BY [Avg Duration] DESC;

SELECT t.Title, a.MusicGroup
FROM Tracks t
INNER JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE MusicGroup = 1;

SELECT t.Title, a.ArtistNickname
FROM Tracks t
INNER JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE a.ArtistNickname LIKE 'П%';

SELECT a.ArtistNickname, a.MusicGroup, COUNT(*) AS [Tracks Count]
FROM Artists a 
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
GROUP BY a.ArtistNickname, a.MusicGroup
ORDER BY [Tracks Count] DESC;

SELECT a.ArtistNickname, AVG(DurationSeconds) AS [Avg Duration]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE MusicGroup = 0
GROUP BY a.ArtistNickname
ORDER BY [Avg Duration] ASC;

SELECT a.ArtistNickname, MAX(t.DurationSeconds) AS [Max Duration]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE t.Genre <> 'Pop'
GROUP BY a.ArtistNickname
HAVING MAX(t.DurationSeconds) > 180
ORDER BY a.ArtistNickname ASC;

SELECT a.ArtistNickname, COUNT(*) AS [Tracks Count]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE MusicGroup = 1
GROUP BY a.ArtistNickname
HAVING COUNT(*) > 2
ORDER BY [Tracks Count] DESC;

SELECT a.ArtistNickname, SUM(t.DurationSeconds) AS [Total Time]
FROM Artists a
INNER JOIN Tracks t ON a.Artistnickname = t.Artist
WHERE a.MusicGroup = 0 AND t.Genre <> 'Alternative'
GROUP BY a.ArtistNickname
HAVING SUM(t.DurationSeconds) > 350
ORDER BY [Total Time] DESC;

SELECT a.ArtistNickname, COUNT(DISTINCT t.Genre) AS [Unique Genres]
FROM Artists a
INNER JOIN Tracks t ON a.Artistnickname = t.Artist
GROUP BY a.ArtistNickname
HAVING COUNT(DISTINCT t.Genre) >= 2
ORDER BY a.ArtistNickname ASC;

SELECT DISTINCT Genre
FROM Tracks
ORDER BY Genre ASC;

SELECT Genre 
FROM Tracks
ORDER BY Genre ASC;

SELECT Artist
FROM Tracks;

SELECT COUNT(DISTINCT Artist) AS [Total Active Artists]
FROM Tracks;

SELECT a.ArtistNickname, COUNT(DISTINCT t.Genre) AS [Genres Count]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE a.MusicGroup = 1
GROUP BY a.ArtistNickname;

SELECT t.Genre, AVG(t.DurationSeconds) AS [Average Duration]
FROM Tracks t
INNER JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE a.MusicGroup = 0
GROUP BY t.Genre
HAVING AVG(t.DurationSeconds) > 200
ORDER BY t.Genre ASC;

SELECT a.ArtistNickname, COUNT(DISTINCT t.Title) AS [Unique Tracks Count]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
GROUP BY a.ArtistNickname
HAVING COUNT(DISTINCT t.Title) >= 3;

SELECT a.ArtistNickname, COUNT(DISTINCT t.Title) AS [Tracks Count], SUM(t.DurationSeconds) AS [Total Duration]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE a.ArtistNickname LIKE '%a%' AND t.DurationSeconds > 120
GROUP BY a.ArtistNickname
HAVING SUM(t.DurationSeconds) > 500
ORDER BY COUNT(DISTINCT t.Title) DESC;

SELECT a.ArtistNickname, COUNT(DISTINCT t.Title) AS [Tracks Count], SUM(t.DurationSeconds) AS [Total Duration]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE t.DurationSeconds > 120
GROUP BY a.ArtistNickname
HAVING SUM(t.DurationSeconds) > 360
ORDER BY COUNT(DISTINCT t.Title) DESC;

SELECT a.ArtistNickname, t.Title
FROM Artists a
LEFT JOIN Tracks t ON a.ArtistNickname = t.Artist;


SELECT a.ArtistNickname, t.Title
FROM Tracks t
LEFT JOIN Artists a ON a.ArtistNickname = t.Artist;

SELECT a.ArtistNickname
FROM Artists a
LEFT JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE t.Title IS NULL;

SELECT a.ArtistNickname
FROM Tracks t
RIGHT JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE t.Title IS NULL;

SELECT a.ArtistNickname, t.Title
FROM Artists a
FULL OUTER JOIN Tracks t ON a.ArtistNickname = t.Artist;

SELECT ArtistNickname
FROM Artists
UNION ALL
SELECT Title
FROM Tracks;

SELECT ArtistNickname
FROM Artists
UNION 
SELECT Title
FROM Tracks;

SELECT UPPER(Title) AS [LOUD TITLE], LOWER(Artist) AS [quiet artist]
FROM Tracks;

SELECT LEN(Title) AS [TitleLength]
FROM Tracks
ORDER BY [TitleLength] DESC;

SELECT SUBSTRING(Title,1,4) AS [ShortTitle]
FROM Tracks;

SELECT ArtistNickname, TRIM(ArtistNickname) AS [CleanNickname]
FROM Artists;

SELECT CONCAT(Title,' від автора ', Artist) AS [Track Card]
FROM Tracks;

SELECT GETDATE() AS [Current Server Time];

SELECT YEAR(GETDATE()) AS [CURRENT YEAR],MONTH(GETDATE()) AS [CURRENT MONTH],DAY(GETDATE()) AS [CURRENT DAY];

SELECT DATEDIFF(YEAR,'2019-04-12',GETDATE()) AS [YearsPasse], DATEADD(MONTH,6,GETDATE()) AS [FutureDate];

SELECT ROUND(3.67, 1) AS [ClassicRound], CEILING(3.67) AS [CeilRound], FLOOR(3.67) AS [FloorRound];

ALTER TABLE Tracks ADD Price DECIMAL(5,2);
ALTER TABLE Tracks ADD ReleaseDate DATE;

UPDATE Tracks SET Price = 15.50, ReleaseDate = '2022-03-15' WHERE TrackID = 1;
UPDATE Tracks SET Price = 24.99, ReleaseDate = '2021-06-20' WHERE TrackID = 2;
UPDATE Tracks SET Price = 19.00, ReleaseDate = '2023-01-10' WHERE TrackID = 3;

SELECT * FROM Tracks;

SELECT Title, DurationSeconds
FROM Tracks
WHERE DurationSeconds > (SELECT AVG(DurationSeconds) FROM Tracks);

SELECT Title, DurationSeconds
FROM Tracks
WHERE DurationSeconds = (SELECT MAX(DurationSeconds) FROM Tracks);

SELECT Title, DurationSeconds,
CASE
	WHEN DurationSeconds <= 190 THEN 'Short track'
	WHEN DurationSeconds > 190 OR DurationSeconds <= 230 THEN 'Medium track'
	ELSE 'Long track'
END AS [TrackCategory]
FROM Tracks;

SELECT Title, DurationSeconds,
CASE
	WHEN DurationSeconds <= 190 THEN 'Short track'
	WHEN DurationSeconds <= 230 THEN 'Medium track'
	ELSE 'Long track'
END AS [TrackCategory]
FROM Tracks;

SELECT Title, DurationSeconds, AVG(DurationSeconds) OVER() AS [AverageDuration]
FROM Tracks;

SELECT Genre, AVG(DurationSeconds) AS [AvgTime]
FROM Tracks
GROUP BY Genre;

SELECT Title, DurationSeconds, AVG(DurationSeconds) OVER(PARTITION BY Genre) AS [GenreAverage]
FROM Tracks;

SELECT Title, Genre, DurationSeconds, AVG(DurationSeconds) OVER(PARTITION BY Genre) AS [GenreAvgDuration]
FROM Tracks;

SELECT a.ArtistNickname, t.Title
FROM Artists a
LEFT JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE t.Price IS NOT NULL
ORDER BY a.ArtistNickname ASC;

SELECT a.ArtistNickname, t.Title
FROM Tracks t
RIGHT JOIN Artists a ON a.ArtistNickname = t.Artist
WHERE t.Price IS NOT NULL
ORDER BY a.ArtistNickname ASC;

SELECT * FROM Users;
SELECT SubscriptionType, COUNT(UserID) AS [TotalUsers]
FROM Users
GROUP BY SubscriptionType
HAVING COUNT(UserID) > 4;

SELECT UPPER(Title) AS [CapsTitle], Genre, DurationSeconds, MAX(DurationSeconds) OVER(PARTITION BY Genre) AS [MaxGenreDuration]
FROM Tracks;

SELECT a.ArtistNickname, t.Title, YEAR(t.ReleaseDate) AS [ReleaseYear]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist
WHERE YEAR(t.ReleaseDate) > 2021;

SELECT a.ArtistNickname, t.Title, YEAR(t.ReleaseDate) AS [ReleaseYear]
FROM Tracks t
RIGHT JOIN Artists a ON a.ArtistNickname = t.Artist
WHERE YEAR(t.ReleaseDate) > 2021;

SELECT a.ArtistNickname, t.Title, YEAR(t.ReleaseDate) AS [ReleaseYear]
FROM Artists a
INNER JOIN Tracks t ON a.ArtistNickname = t.Artist;

SELECT Title, Price, 
CASE
	WHEN Price > (SELECT AVG(Price) FROM Tracks) THEN 'Дорожче середнього'
	WHEN Price <= (SELECT AVG(Price) FROM Tracks) THEN 'Бюджетний варіант'
	ELSE 'Безкоштовно/Пром'
END AS [PriceCategory]
FROM Tracks;

SELECT Title, Genre, DurationSeconds, (MAX(DurationSeconds) OVER(PARTITION BY Genre)) - DurationSeconds AS [SecondsToLeader]
FROM Tracks;

SELECT t.Genre, SUM(t.Price) AS [TotalGenrePrice]
FROM Tracks t
INNER JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE a.ArtistNickname IS NOT NULL
GROUP BY Genre
HAVING SUM(t.Price) > 20;

SELECT t.Genre, SUM(t.Price) AS [TotalGenrePrice]
FROM Tracks t
INNER JOIN Artists a ON t.Artist = a.ArtistNickname
WHERE a.ArtistNickname IS NOT NULL
GROUP BY Genre;

SELECT Title, Price, MIN(Price) OVER() AS [GlobalMinPrice]
FROM Tracks;

SELECT Title, DurationSeconds, 
CASE
	WHEN DurationSeconds < 180 THEN 'Short track'
	WHEN DurationSeconds >= 180 AND DurationSeconds <= 240 THEN 'Normal track'
	ELSE 'Long track'
END
FROM Tracks;

INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds, Price, ReleaseDate) 
VALUES ('Ляляля тополя', 'Wellboy','Pop',165,12,'2021-06-24');


SELECT * FROM Tracks;

UPDATE Tracks 
SET Price = 19
WHERE Genre  = 'Pop';

DELETE 
FROM Tracks
WHERE DurationSeconds < 60;

SELECT Title, Price
FROM Tracks
WHERE Price > (SELECT AVG(Price) FROM Tracks);

WITH AveragePriceTable AS (
	SELECT AVG(Price) AS [GlobalAvg]
	FROM Tracks
)

SELECT t.Title, t.Price, a.GlobalAvg
FROM Tracks t
CROSS JOIN AveragePriceTable a
WHERE t.Price > a.GlobalAvg;

WITH MaxPriceCTE AS (
	SELECT MAX(Price) AS [MaxGlobalPrice]
	FROM Tracks
)

SELECT t.Title, t.Price, m.MaxGlobalPrice
FROM Tracks t
CROSS JOIN MaxPriceCTE m;

WITH GenreAvgCTE AS (
	SELECT Genre, AVG(Price) AS [AvgGenrePrice]
	FROM Tracks
	GROUP BY Genre
)

SELECT t.Title, t.Genre, t.Price, g.AvgGenrePrice
FROM Tracks t
INNER JOIN GenreAvgCTE g ON t.Genre = g.Genre;
