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