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