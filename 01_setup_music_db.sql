-- 1. СТВОРЕННЯ ТАБЛИЦІ КОРИСТУВАЧІВ
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    SubscriptionType NVARCHAR(20) NOT NULL -- 'Free' або 'Premium'
);

-- 2. СТВОРЕННЯ ТАБЛИЦІ ТРЕКІВ
CREATE TABLE Tracks (
    TrackID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    Artist NVARCHAR(100) NOT NULL,
    Genre NVARCHAR(50) NOT NULL,
    DurationSeconds INT NOT NULL
);

-- 3. СТВОРЕННЯ ТАБЛИЦІ ІСТОРІЇ ПРОСЛУХОВУВАНЬ
CREATE TABLE ListeningHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    TrackID INT FOREIGN KEY REFERENCES Tracks(TrackID),
    ListenDate DATETIME DEFAULT GETDATE()
);

-- Наповнюємо користувачами
INSERT INTO Users (UserName, Country, SubscriptionType) VALUES 
(N'Анна', N'Ukraine', 'Premium'),
(N'Максим', N'Ukraine', 'Free'),
(N'John', N'USA', 'Premium'),
(N'Emma', N'UK', 'Free'),
(N'Дмитро', N'Ukraine', 'Premium');

-- Наповнюємо треками
INSERT INTO Tracks (Title, Artist, Genre, DurationSeconds) VALUES 
('Blinding Lights', 'The Weeknd', 'Pop', 200),
('Levitating', 'Dua Lipa', 'Pop', 203),
('Bad Guy', 'Billie Eilish', 'Alternative', 194),
('Shape of You', 'Ed Sheeran', 'Pop', 233),
('Numb', 'Linkin Park', 'Rock', 187);

-- Наповнюємо історією (хто що послухав)
INSERT INTO ListeningHistory (UserID, TrackID, ListenDate) VALUES 
(1, 1, '2026-05-15 14:20:00'), -- Анна послухала The Weeknd
(1, 2, '2026-05-15 14:23:00'), -- Анна послухала Dua Lipa
(2, 5, '2026-05-16 09:15:00'), -- Максим послухав Linkin Park
(3, 1, '2026-05-16 18:00:00'), -- John послухав The Weeknd
(4, 3, '2026-05-17 21:40:00'), -- Emma послухала Billie Eilish
(5, 1, '2026-05-18 11:10:00'), -- Дмитро послухав The Weeknd
(2, 1, '2026-05-18 12:00:00'), -- Максим послухав The Weeknd
(5, 5, '2026-05-19 19:30:00'); -- Дмитро послухав Linkin Park