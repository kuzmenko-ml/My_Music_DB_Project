USE My_Music_DB;
GO

CREATE TRIGGER TR_Tracks_AfterInsert
ON Tracks
AFTER INSERT
AS
BEGIN
	PRINT 'Новий трек успішно додано в систему!';
END;