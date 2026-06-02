USE My_Music_DB;
GO

CREATE PROCEDURE GetTracksByGenre
	@GenreName NVARCHAR(50)
AS
BEGIN
SELECT * FROM Tracks WHERE Genre = @GenreName;
END;