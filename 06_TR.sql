USE My_Music_DB;
GO

CREATE TRIGGER TR_Tracks_AfterInsert
ON Tracks
AFTER INSERT
AS
BEGIN
	PRINT 'Новий трек успішно додано в систему!';
END;

CREATE TRIGGER TR_Users_AfterDelete
ON Users
AFTER DELETE
AS
BEGIN
	DELETE FROM ListeningHistory
	WHERE UserID IN (SELECT UserID FROM deleted);
END;


CREATE TRIGGER TR_Groups_CheckName
ON Groups
AFTER INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted WHERE GroupName = '')
	BEGIN
		PRINT 'Помилка: Назва групи не може бути порожньою!'
		ROLLBACK TRANSACTION;
	END
END;
