USE My_Music_DB
GO

CREATE TABLE Artists (
ArtistID INT PRIMARY KEY IDENTITY(1,1),
ArtistNickname NVARCHAR(20) NOT NULL,
MusicGroup BIT NOT NULL);

CREATE TABLE Groups (
GroupID INT PRIMARY KEY IDENTITY(1,1),
GroupName NVARCHAR(50) NOT NULL,
Country NVARCHAR(50) NOT NULL,
Followers INT NOT NULL);

CREATE TABLE Users (
UserID INT PRIMARY KEY IDENTITY(1,1),
UserName NVARCHAR(50) NOT NULL,
SubscriptionType NVARCHAR(20) NOT NULL);

CREATE TABLE Tracks (
TrackID INT IDENTITY(1,1) PRIMARY KEY,
Title NVARCHAR(150) NOT NULL,
Artist NVARCHAR(100) NOT NULL,
Genre NVARCHAR(50) NOT NULL,
DurationSeconds INT NOT NULL);

CREATE TABLE ListeningHistory (
HistoryID INT IDENTITY(1,1) PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
TrackID INT FOREIGN KEY REFERENCES Tracks(TrackID),
ListenDate DATETIME DEFAULT GETDATE());

INSERT INTO Artists (ArtistNickname, MusicGroup) VALUES
(N'Птушкін', 0),
(N'Настя Каменських', 1),
('Romeo', 0),
('Wellboy', 0),
(N'Льодяник-Лео', 1),
(N'Потап', 1),
(N'Квіточка-Оля', 1);

INSERT INTO Groups (GroupName, Country, Followers) VALUES
('Друзі', 'Україна', 25000),
('Время истекло', 'Україна', 841);

INSERT INTO Users (UserName, SubscriptionType) VALUES
('Марічка', 'Premium'),
('Leonardo', 'Premium'),
('Єва', 'Default'),
('Hoopaad', 'Default'),
('Назар', 'Premium'),
('Тетяна', 'Default'),
('Микола', 'Premium'),
('Євгенія', 'Premium'),
('Olexa', 'Default');

INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds) VALUES
(N'Дома', N'Wellboy', N'Pop', 178),
(N'Гуси', N'Wellboy', N'Pop', 185),
(N'Стиль', N'Wellboy', N'Pop', 192),
(N'Качка', N'Romeo', N'Alternative', 210),
(N'Липневий дощ', N'Romeo', N'Alternative', 245),
(N'Екскаватор', N'Птушкін', N'Techno', 320),
(N'Радіо Тревел', N'Птушкін', N'Techno', 295),
(N'Попурі', N'Настя Каменських', N'Pop', 202),
(N'Кришталь', N'Настя Каменських', N'Pop', 198),
(N'Я - Україна', N'Настя Каменських', N'Pop', 220),
(N'Волонтер', N'Потап', N'Hip-Hop', 165),
(N'Карантин', N'Потап', N'Hip-Hop', 180),
(N'Шоколадний вечір', N'Квіточка-Оля', N'Chanson', 215),
(N'Мамина черешня', N'Квіточка-Оля', N'Chanson', 260),
(N'Льодяниковий рай', N'Льодяник-Лео', N'Rock', 234);