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