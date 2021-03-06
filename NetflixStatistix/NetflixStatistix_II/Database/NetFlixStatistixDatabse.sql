USE [master]
GO
DROP DATABASE IF EXISTS NetflixStatistix;
GO
CREATE DATABASE NetflixStatistix;
GO
USE NetflixStatistix;
GO
/**Alle tabels**/
CREATE TABLE Abbonement(
	[AbbonementId] [int] NOT NULL,
	[MaxActiveScreens] [int] NOT NULL,
 CONSTRAINT [PK_Abbonement] PRIMARY KEY CLUSTERED 
(
	[AbbonementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Account(
	[Email] [nvarchar](50) NOT NULL,
	[AbbonementId] [int] NOT NULL,
	[Wachtwoord] [nvarchar](50) NOT NULL,
	[Voornaam] [nvarchar](50) NOT NULL,
	[Achternaam] [nvarchar](50) NOT NULL,
	[Straat] [nvarchar](50) NOT NULL,
	[Huisnummer] [nvarchar](5) NOT NULL,
	[Postcode] [nvarchar](7) NOT NULL,
	[Woonplaats] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Aflevering(
	[Titel] [nvarchar](50) NOT NULL,
	[SerieNaam] [nvarchar](50) NOT NULL,
	[ContentId] [int] NOT NULL,
	[Tijdsduur] [nchar](10) NOT NULL,
	[SeizoenId] [int],
	[AfleveringId] [int] NOT NULL,
	[VolgNummer] [int],
 CONSTRAINT [PK_Aflevering_1] PRIMARY KEY CLUSTERED 
(
	[AfleveringId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE BekekenContent(
	[ProfielNaam] [nvarchar](50) NOT NULL,
	[ContentId] [int] NOT NULL,
	[PercentageBekeken] [int] NOT NULL,
	[LaatstBekeken] [datetime] NOT NULL
) ON [PRIMARY]
GO


CREATE TABLE Content(
	[ContentId] [int] NOT NULL,
	[Titel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Film(
	[ContentId] [int] NOT NULL,
	[Titel] [nvarchar](50) NOT NULL,
	[Tijdsduur] [nvarchar](50) NOT NULL,
	[LeeftijdsIndicatie] [nvarchar](50) NULL,
	[Taal] [nvarchar](50) NULL,
	[Genre] [nvarchar](50) NULL,
	[FilmId] [int] NOT NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Profiel(
	[ProfielNaam] [nvarchar](50) NOT NULL,
	[Leeftijd] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Profiel] PRIMARY KEY CLUSTERED 
(
	[ProfielNaam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Seizoen(
	[SerieNaam] [nvarchar](50) NOT NULL,
	[SeizoenNummer] [int] NOT NULL,
	[SeizoenId] [int] NOT NULL,
 CONSTRAINT [PK_Seizoen] PRIMARY KEY CLUSTERED 
(
	[SeizoenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Serie(
	[SerieNaam] [nvarchar](50) NOT NULL,
	[Seizoenen] [int] NOT NULL,
	[LeeftijdsIndicatie] [nvarchar](50) NOT NULL,
	[Taal] [nvarchar](50) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
	[LijktOp] [nvarchar](50) NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[SerieNaam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/**Gegevens**/
INSERT [dbo].[Abbonement] ([AbbonementId], [MaxActiveScreens]) VALUES (1, 3)
INSERT [dbo].[Abbonement] ([AbbonementId], [MaxActiveScreens]) VALUES (2, 3)
INSERT [dbo].[Account] ([Email], [AbbonementId], [Wachtwoord], [Voornaam], [Achternaam], [Straat], [Huisnummer], [Postcode], [Woonplaats]) VALUES (N'droover@avans.nl', 1, N'JavaSql', N'Dries', N'de Roover', N'Hogeschoollaan', N'1', N'4501AE', N'Breda')
INSERT [dbo].[Account] ([Email], [AbbonementId], [Wachtwoord], [Voornaam], [Achternaam], [Straat], [Huisnummer], [Postcode], [Woonplaats]) VALUES (N'wesley@avans.nl', 2, N'SqlJava', N'Wesley', N'de Jonge', N'Lovensdijkstraat', N'61', N'4501AB', N'Breda')
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'A Study in Pink', N'Sherlock', 1001, N'01:28     ', 1, 1, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Blind Banker', N'Sherlock', 1002, N'01:28     ', 1, 2, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Great Game', N'Sherlock', 1003, N'01:28:00  ', 1, 3, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'A Scandal in Belgravia', N'Sherlock', 1004, N'01:28:00  ', 2, 4, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Hounds of Baskerville', N'Sherlock', 1005, N'01:28:00  ', 2, 5, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Reichenbach Fall', N'Sherlock', 1006, N'01:28:00  ', 2, 6, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Empty Hearse', N'Sherlock', 1007, N'01:28:00  ', 3, 7, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Sign of Three', N'Sherlock', 1008, N'01:28:00  ', 3, 8, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'His Last Vow', N'Sherlock', 1009, N'01:28:00  ', 1, 9, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Pilot', N'Breaking Bad', 2000, N'00:58:00  ', 1, 10, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Cat''s in the Bag...', N'Breaking Bad', 2001, N'00:48:00  ', 1, 11, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'...And the Bag''s in the River', N'Breaking Bad', 2002, N'00:48:00  ', 1, 12, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Cancer Man', N'Breaking Bad', 2003, N'00:48:00  ', 1, 13, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Gray Matter', N'Breaking Bad', 2004, N'00:48:00  ', 1, 14, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Crazy Handful of Nothin''', N'Breaking Bad', 2005, N'00:48:00  ', 1, 15, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'A No-Rough-Stuff-Type Deal', N'Breaking Bad', 2006, N'00:48:00  ', 1, 16, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Seven Thirty-Seven', N'Breaking Bad', 2007, N'00:48:00  ', 2, 17, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Grilled', N'Breaking Bad', 2008, N'00:48:00  ', 2, 18, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Bit by a Dead Bee', N'Breaking Bad', 2009, N'00:48:00  ', 2, 19, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Down', N'Breaking Bad', 2010, N'00:48:00  ', 2, 20, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Breakage', N'Breaking Bad', 2011, N'00:48:00  ', 2, 21, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Peekaboo', N'Breaking Bad', 2012, N'00:48:00  ', 2, 22, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Negro Y Azul', N'Breaking Bad', 2013, N'00:48:00  ', 2, 23, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Better Call Saul', N'Breaking Bad', 2014, N'00:48:00  ', 2, 24, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'4 Days Out', N'Breaking Bad', 2015, N'00:48:00  ', 2, 25, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Over', N'Breaking Bad', 2016, N'00:48:00  ', 2, 26, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Mandala', N'Breaking Bad', 2017, N'00:48:00  ', 2, 27, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Crocodile''s Dilemma', N'Fargo', 3001, N'01:08:00  ', 1, 30, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Rooster Prince', N'Fargo', 3002, N'01:08:00  ', 1, 31, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'A Muddy Road', N'Fargo', 3003, N'01:08:00  ', 1, 32, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Eating the Blame', N'Fargo', 3004, N'01:08:00  ', 1, 33, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Six Ungraspables', N'Fargo', 3005, N'01:08:00  ', 1, 34, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Buridan''s Ass', N'Fargo', 3006, N'01:08:00  ', 1, 35, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Who Shaves the Barber?', N'Fargo', 3007, N'01:08:00  ', 1, 36, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Heap', N'Fargo', 3008, N'01:08:00  ', 1, 39, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'A Fox, a Rabbit, and a Cabbage', N'Fargo', 3009, N'01:08:00  ', 3, 40, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Morton''s Fork', N'Fargo', 3010, N'01:08:00  ', 1, 41, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Waiting for Dutch', N'Fargo', 3101, N'01:08:00  ', 2, 42, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Before the Law', N'Fargo', 3102, N'01:08:00  ', 2, 43, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Myth of Sisyphus', N'Fargo', 3103, N'01:08:00  ', 2, 44, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Gift of the Magi', N'Fargo', 3104, N'01:08:00  ', 2, 45, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Fear and Trembling', N'Fargo', 3105, N'01:08:00  ', 2, 46, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Rhinoceros', N'Fargo', 3106, N'01:08:00  ', 2, 47, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Did you do this? No, you did it!', N'Fargo', 3107, N'01:08:00  ', 2, 48, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Loplop', N'Fargo', 3108, N'01:08:00  ', 2, 50, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'The Castle', N'Fargo', 3109, N'01:08:00  ', 2, 51, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Palindrome', N'Fargo', 3110, N'01:08:00  ', 2, 52, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'ABQ', N'Breaking Bad', 2019, N'00:48:00  ', 2, 80, NULL)
INSERT [dbo].[Aflevering] ([Titel], [SerieNaam], [ContentId], [Tijdsduur], [SeizoenId], [AfleveringId], [VolgNummer]) VALUES (N'Phoenix', N'Breaking Bad', 2018, N'00:48:00  ', 2, 542, NULL)
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1000, N'-')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1001, N'A Study in Pink')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1002, N'The Blind Banker')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1003, N'The Great Game')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1004, N'A Scandal in Belgravia')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1005, N'The Hounds of Baskerville')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1006, N'The Reichenbach Fall')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1007, N'The Empty Hearse')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1008, N'The Sign of Three')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1009, N'His Last Vow')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (1010, N'The Abominable Bride')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2000, N'Pilot')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2001, N'Cat''s in the Bag...')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2002, N'...And the Bag''s in the River')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2003, N'Cancer Man')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2004, N'Gray Matter')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2005, N'Crazy Handful of Nothin''')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2006, N'A No-Rough-Stuff-Type Deal')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2007, N'Seven Thirty-Seven')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2008, N'Grilled')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2009, N'Bit by a Dead Bee')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2010, N'Down')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2011, N'Breakage')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2012, N'Peekaboo')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2013, N'Negro Y Azul')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2014, N'Better Call Saul')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2015, N'4 Days Out')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2016, N'Over')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2017, N'Mandala')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2018, N'Phoenix')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (2019, N'ABQ')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3001, N'The Crocodile''s Dilemma')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3002, N'The Rooster Prince')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3003, N'A Muddy Road')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3004, N'Eating the Blame')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3005, N'The Six Ungraspables')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3006, N'Buridan''s Ass')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3007, N'Who Shaves the Barber?')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3008, N'The Heap')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3009, N'A Fox, a Rabbit, and a Cabbage')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3010, N'Morton''s Fork')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3101, N'Waiting for Dutch')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3102, N'Before the Law')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3103, N'The Myth of Sisyphus')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3104, N'The Gift of the Magi')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3105, N'Fear and Trembling')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3106, N'Rhinoceros')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3107, N'Did you do this? No, you did it!')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3108, N'Loplop')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3109, N'The Castle')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (3110, N'Palindrome')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8000, N'Avengers')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8001, N'Life of Brian')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8002, N'Pulp Fiction')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8004, N'Pruimebloesem')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8008, N'Reservoir Dogs')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8010, N'The Good, the Bad and the Ugly')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8011, N'Andy Warhols Dracula')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8012, N'Ober')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8014, N'Der Untergang')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8016, N'De helaasheid der dingen')
INSERT [dbo].[Content] ([ContentId], [Titel]) VALUES (8017, N'A Clockwork Orange')
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8017, N'A Clockwork Orange', N'02:16:00', N'16 jaar en ouder', N'Engels', N'Sci-Fi', 2654)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8011, N'Andy Warhols Dracula', N'01:41:00', N'16 jaar en ouder', N'Engels-Amerikaans', N'Humor', 2786)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8002, N'Pulp Fiction', N'02:34:00', N'16 jaar en ouder', N'Engels-Amerikaans', N'Misdaad', 11758)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8000, N'Avengers', N'02:40:00', N'12 jaar en ouder', N'Engels', N'Actie', 22145)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8012, N'Ober', N'01:37:00', N'6 jaar en ouder', N'Nederlands', N'Humor', 22548)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (1010, N'The Abominable Bride', N'01:29:00', N'12 jaar en ouder', N'Engels', N'Detective', 33258)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8016, N'De helaasheid der dingen', N'01:48:00', N'12 jaar en ouder', N'Vlaams', N'Humor', 49685)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8014, N'Der Untergang', N'02:58:00', N'16 jaar en ouder', N'Duits', N'Oorlog', 54796)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8008, N'Reservoir Dogs', N'01:39:00', N'16 jaar en ouder', N'Engels-Amerikaans', N'Misdaad', 55425)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8010, N'The Good, the Bad and the Ugly', N'02:41:00', N'12 jaar en ouder', N'Engels-Amerikaans', N'Western', 88745)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8001, N'The Life of Brian', N'01:34:00', N'12 jaar en ouder', N'Engels', N'Humor', 95234)
INSERT [dbo].[Film] ([ContentId], [Titel], [Tijdsduur], [LeeftijdsIndicatie], [Taal], [Genre], [FilmId]) VALUES (8004, N'Pruimebloesem', N'01:20:00', N'18 jaar en ouder', N'Nederlands', N'Erotiek', 99874)
INSERT [dbo].[Profiel] ([ProfielNaam], [Leeftijd], [Email]) VALUES (N'Dries', 18, N'droover@avans.nl')
INSERT [dbo].[Profiel] ([ProfielNaam], [Leeftijd], [Email]) VALUES (N'Henk', 15, N'droover@avans.nl')
INSERT [dbo].[Profiel] ([ProfielNaam], [Leeftijd], [Email]) VALUES (N'Henk2', 16, N'droover@avans.nl')
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Sherlock', 1, 1)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Sherlock', 2, 2)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Sherlock', 3, 3)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Fargo', 1, 4)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Fargo', 2, 5)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Breaking Bad', 1, 6)
INSERT [dbo].[Seizoen] ([SerieNaam], [SeizoenNummer], [SeizoenId]) VALUES (N'Breaking Bad', 2, 7)
INSERT [dbo].[Serie] ([SerieNaam], [Seizoenen], [LeeftijdsIndicatie], [Taal], [Genre], [LijktOp]) VALUES (N'Breaking Bad', 2, N'16 jaar en ouder', N'Engels', N'Spanning', N'Fargo')
INSERT [dbo].[Serie] ([SerieNaam], [Seizoenen], [LeeftijdsIndicatie], [Taal], [Genre], [LijktOp]) VALUES (N'Fargo', 2, N'16 jaar en ouder', N'Engels', N'Spanning', N'Breaking Bad')
INSERT [dbo].[Serie] ([SerieNaam], [Seizoenen], [LeeftijdsIndicatie], [Taal], [Genre], [LijktOp]) VALUES (N'Sherlock', 3, N'12 jaar en ouder', N'Engels', N'Detective', N'-')
GO

/**Relaties**/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Abbonement] FOREIGN KEY([AbbonementId])
REFERENCES [dbo].[Abbonement] ([AbbonementId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Abbonement]
GO
ALTER TABLE [dbo].[Aflevering]  WITH CHECK ADD  CONSTRAINT [FK_Aflevering_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([ContentId])
GO
ALTER TABLE [dbo].[Aflevering] CHECK CONSTRAINT [FK_Aflevering_Content]
GO
ALTER TABLE [dbo].[Aflevering]  WITH CHECK ADD  CONSTRAINT [FK_Aflevering_Serie] FOREIGN KEY([SerieNaam])
REFERENCES [dbo].[Serie] ([SerieNaam])
GO
ALTER TABLE [dbo].[Aflevering] CHECK CONSTRAINT [FK_Aflevering_Serie]
GO
ALTER TABLE [dbo].[BekekenContent]  WITH CHECK ADD  CONSTRAINT [FK_BekekenContent_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([ContentId])
GO
ALTER TABLE [dbo].[BekekenContent] CHECK CONSTRAINT [FK_BekekenContent_Content]
GO
ALTER TABLE [dbo].[BekekenContent]  WITH CHECK ADD  CONSTRAINT [FK_BekekenContent_Profiel] FOREIGN KEY([ProfielNaam])
REFERENCES [dbo].[Profiel] ([ProfielNaam])
GO
ALTER TABLE [dbo].[BekekenContent] CHECK CONSTRAINT [FK_BekekenContent_Profiel]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Content] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Content] ([ContentId])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Content]
GO
ALTER TABLE [dbo].[Profiel]  WITH CHECK ADD  CONSTRAINT [FK_Profiel_Account] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Profiel] CHECK CONSTRAINT [FK_Profiel_Account]
GO
ALTER TABLE [dbo].[Seizoen]  WITH CHECK ADD  CONSTRAINT [FK_Seizoen_Serie] FOREIGN KEY([SerieNaam])
REFERENCES [dbo].[Serie] ([SerieNaam])
GO
ALTER TABLE [dbo].[Seizoen] CHECK CONSTRAINT [FK_Seizoen_Serie]
GO


USE [master]
GO
ALTER DATABASE [NetflixStatistix] SET  READ_WRITE 
GO
