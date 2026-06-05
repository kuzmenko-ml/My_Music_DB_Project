USE My_Music_DB;
GO

CREATE PROCEDURE GetTracksByGenre
	@GenreName NVARCHAR(50)
AS
BEGIN
SELECT * FROM Tracks WHERE Genre = @GenreName;
END;

CREATE PROCEDURE TrackWithCheckingDS
	@Title NVARCHAR(150),
	@Artist NVARCHAR(100),
	@Genre NVARCHAR(50),
	@DurationSeconds INT
AS
BEGIN
	IF (@DurationSeconds > 0)
		BEGIN
			INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds) VALUES
			(@Title, @Artist, @Genre, @DurationSeconds);
		END
	ELSE 
		BEGIN
			PRINT 'Помилка: тривалість має бути більшою за 0'
		END
END;

CREATE PROCEDURE SP_ListeningHistoryAddNew
	@UserID INT,
	@TrackID INT
AS
BEGIN
	INSERT INTO ListeningHistory (UserID,TrackID) VALUES (@UserID,@TrackID )
END;

CREATE PROCEDURE SP_GetTracksByGenre
	@TargetGenre NVARCHAR(50)
AS
BEGIN
	SELECT * FROM Tracks
	WHERE Genre = @TargetGenre;
END;

CREATE PROCEDURE SP_AddFollowersToGroup
	@GroupName NVARCHAR(50),
	@NewFollowers INT
AS
BEGIN
	UPDATE Groups
	SET Followers = Followers + @NewFollowers
	WHERE GroupName = @GroupName;
END;

CREATE PROCEDURE SP_AddTrackWithArtistCheck
	@Title NVARCHAR(150),
	@Artist NVARCHAR(100),
	@Genre NVARCHAR(50),
	@DurationSeconds INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Artists WHERE ArtistNickname = @Artist)
	BEGIN
		INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds) 
		VALUES (@Title,@Artist, @Genre, @DurationSeconds)
	END
	ELSE
		BEGIN
			PRINT 'Помилка: такого артиста немає в базі даних!';
		END
END;

CREATE PROCEDURE SP_AddTrackWithArtistAndDSCheck
	@Title NVARCHAR(150),
	@Artist NVARCHAR(100),
	@Genre NVARCHAR(50),
	@DurationSeconds INT
AS
BEGIN
	IF (@DurationSeconds > 0) AND EXISTS (SELECT 1 FROM Artists WHERE ArtistNickname = @Artist)
	BEGIN
		INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds) 
		VALUES (@Title,@Artist, @Genre, @DurationSeconds)
	END
	ELSE
	BEGIN
		PRINT 'Помилка!';
	END
END;

CREATE PROCEDURE SP_GetPremiumUsers 
AS
BEGIN
	SELECT * FROM Users WHERE SubscriptionType = 'Premium';
END;

CREATE PROCEDURE SP_GetUsersBySubType
	@SubType NVARCHAR(50)
AS
BEGIN
	SELECT * FROM Users WHERE SubscriptionType = @SubType;
END;

CREATE PROCEDURE SP_SafeRecordListen
	@UserID INT,
	@TrackID INT
AS
BEGIN 
	IF EXISTS (SELECT 1 FROM ListeningHistory WHERE UserID = @UserID 
	AND TrackID = @TrackID 
	AND CAST(ListenDate AS DATE) = CAST(GETDATE() AS DATE))
		BEGIN 
			PRINT 'Цей трек користувач вже слухав сьогодні!'
		END;
	ELSE
		BEGIN
			INSERT INTO ListeningHistory (UserID, TrackID, ListenDate) VALUES (@UserID, @TrackID,GETDATE())
			PRINT 'Успішно додано!';
		END;
END;

EXEC SP_GetUsersBySubType @SubType = 'Premium';
EXEC SP_SafeRecordListen @UserID = 5, @TrackID = 10;