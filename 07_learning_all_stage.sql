SELECT * FROM dbo.Artists;
SELECT * FROM dbo.Groups;
SELECT * FROM dbo.ListeningHistory;
SELECT * FROM dbo.Tracks;
SELECT * FROM dbo.Users;

INSERT INTO ListeningHistory (UserID, TrackID, ListenDate) VALUES
(1, 7, GETDATE()),
(2, 11, GETDATE()),
(4, 3, GETDATE()),
(9, 7, GETDATE()),
(3, 15, GETDATE()),
(5, 6, GETDATE()),
(8, 1, GETDATE());

SELECT t.TrackID, t.Title, COUNT(HistoryID) AS [TotalListenings]
FROM Tracks t
INNER JOIN ListeningHistory l ON t.TrackID = l.TrackID
GROUP BY t.TrackID, t.Title
ORDER BY [TotalListenings] DESC;

SELECT u.UserName, u.SubscriptionType, t.Title, t.ReleaseDate,
	CASE 
		WHEN Price >= 19 THEN 'Expensive'
		ELSE 'Cheap'
	END AS [PriceCategory] 
FROM Users u
INNER JOIN ListeningHistory l ON u.UserID = l.UserID
INNER JOIN Tracks t ON l.TrackID = t.TrackID
WHERE u.SubscriptionType = 'Premium' AND YEAR(t.ReleaseDate) < 2023;

SELECT Title, Artist, DurationSeconds
FROM Tracks
WHERE DurationSeconds > (SELECT AVG(DurationSeconds) FROM Tracks);

SELECT 'ARTIST: ' + UPPER(ArtistNickname) + ' (Group: ' + CAST(MusicGroup AS VARCHAR) + ')' AS [INFORMATION] FROM Artists;

SELECT Genre, Title, ROW_NUMBER() OVER(PARTITION BY Genre ORDER BY Title) FROM Tracks;

SELECT UserID, TrackID, ListenDate
FROM ListeningHistory
WHERE UserID % 2 = 0
	AND CAST(ListenDate AS DATE) = CAST(GETDATE() AS DATE);

SELECT u.UserName,t.Title, l.ListenDate, ROW_NUMBER() OVER(PARTITION BY u.UserID ORDER BY l.ListenDate ASC)
FROM Users u
INNER JOIN ListeningHistory l ON u.UserID = l.UserID
INNER JOIN Tracks t ON t.TrackID = l.TrackID
WHERE CAST(ListenDate AS DATE) = CAST(GETDATE() AS DATE);