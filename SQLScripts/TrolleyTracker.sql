USE [TrolleyTracker]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[LongName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteSchedule]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[StartTime] [date] NOT NULL,
	[EndTime] [date] NOT NULL,
 CONSTRAINT [PK_RouteSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RouteStops]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteStops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[StopID] [int] NOT NULL,
	[StopSequence] [int] NOT NULL,
 CONSTRAINT [PK_RouteStops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shapes]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shapes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteID] [int] NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
	[Sequence] [int] NOT NULL,
	[DistanceTraveled] [float] NOT NULL,
 CONSTRAINT [PK_Shapes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stops]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Lat] [float] NOT NULL,
	[Lon] [float] NOT NULL,
 CONSTRAINT [PK_Stops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trolley]    Script Date: 7/21/2015 5:23:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trolley](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrolleyName] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[CurrentLat] [float] NULL,
	[CurrentLon] [float] NULL,
 CONSTRAINT [PK_Trolley] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description]) VALUES (1, N'Weekday', N'Main Street short', N'Main Street: no Heritage Green')
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description]) VALUES (2, N'Weekend', N'Main Street, Including Heritage Green', N'Main Street, Including Heritage Green')
INSERT [dbo].[Routes] ([ID], [ShortName], [LongName], [Description]) VALUES (3, N'Friday Lunch', N'Friday Lunch Route', N'From University Ridge / County Square to N Main St')
SET IDENTITY_INSERT [dbo].[Routes] OFF
SET IDENTITY_INSERT [dbo].[RouteStops] ON 

INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (114, 2, 45, 0)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (115, 2, 44, 1)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (116, 2, 43, 2)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (117, 2, 42, 3)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (118, 2, 41, 4)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (119, 2, 40, 5)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (120, 2, 46, 6)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (121, 2, 31, 7)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (122, 2, 32, 8)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (123, 2, 33, 9)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (124, 2, 34, 10)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (125, 2, 35, 11)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (126, 2, 36, 12)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (127, 2, 37, 13)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (128, 2, 38, 14)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (129, 2, 30, 15)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (130, 2, 29, 16)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (131, 2, 28, 17)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (132, 2, 27, 18)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (133, 2, 26, 19)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (134, 2, 25, 20)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (135, 2, 24, 21)
INSERT [dbo].[RouteStops] ([ID], [RouteID], [StopID], [StopSequence]) VALUES (136, 2, 39, 22)
SET IDENTITY_INSERT [dbo].[RouteStops] OFF
SET IDENTITY_INSERT [dbo].[Shapes] ON 

INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20531, 2, 34.862797, -82.393742, 0, 0)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20532, 2, 34.862831, -82.394011, 1, 24.86024217395715)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20533, 2, 34.863003, -82.395912, 2, 199.55017423784761)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20534, 2, 34.854524, -82.398794, 3, 1179.4524335872345)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20535, 2, 34.8544459, -82.3988433, 4, 1189.2435655099866)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20536, 2, 34.85431, -82.398929, 5, 1206.2777704862122)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20537, 2, 34.854085, -82.399121, 6, 1236.8551862634861)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20538, 2, 34.853918, -82.399292, 7, 1261.1373431243023)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20539, 2, 34.853758, -82.399467, 8, 1285.0704756428654)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20540, 2, 34.853545, -82.399636, 9, 1313.3644785819852)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20541, 2, 34.853366, -82.399751, 10, 1335.8903445154131)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20542, 2, 34.853233, -82.399817, 11, 1351.8765593391831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20543, 2, 34.8530065, -82.3999427, 12, 1379.5821282722457)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20544, 2, 34.8530065, -82.3999427, 13, 1379.5821282722457)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20545, 2, 34.8524811, -82.4001426, 14, 1440.8538309620581)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20546, 2, 34.8523843, -82.4001846, 15, 1452.2920412885576)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20547, 2, 34.8522884, -82.4002263, 16, 1463.6271239572461)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20548, 2, 34.852075, -82.400319, 17, 1488.8470220875463)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20549, 2, 34.851909, -82.400392, 18, 1508.4923796666251)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20550, 2, 34.851288, -82.400668, 19, 1582.076200163405)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20551, 2, 34.851288, -82.400668, 20, 1582.076200163405)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20552, 2, 34.850751, -82.400911, 21, 1645.8434597527694)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20553, 2, 34.850689, -82.400957, 22, 1653.924233225541)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20554, 2, 34.850614, -82.401037, 23, 1665.0201131409772)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20555, 2, 34.850388, -82.401314, 24, 1700.703146467881)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20556, 2, 34.8503625, -82.401348, 25, 1704.91081825229)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20557, 2, 34.850271, -82.40147, 26, 1720.0089801989504)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20558, 2, 34.850271, -82.40147, 27, 1720.0089801989504)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20559, 2, 34.850204, -82.401557, 28, 1730.9081447374185)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20560, 2, 34.850063, -82.40167, 29, 1749.6946778007875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20561, 2, 34.849735, -82.401839, 30, 1789.3374012951379)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20562, 2, 34.849281, -82.402059, 31, 1843.7261244395359)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20563, 2, 34.8492262, -82.4020904, 32, 1850.4680528443105)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20564, 2, 34.848977, -82.402233, 33, 1881.1154010906425)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20565, 2, 34.8489294, -82.4022956, 34, 1888.9111314898269)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20566, 2, 34.8488918, -82.402345, 35, 1895.0653973173826)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20567, 2, 34.848621, -82.402701, 36, 1939.4102314259014)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20568, 2, 34.848518, -82.402843, 37, 1956.7234649694142)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20569, 2, 34.848518, -82.402843, 38, 1956.7234649694142)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20570, 2, 34.848372, -82.403049, 39, 1981.5895200252357)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20571, 2, 34.8482573, -82.4032, 40, 2000.38638783965)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20572, 2, 34.8482573, -82.4032, 41, 2000.38638783965)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20573, 2, 34.848224, -82.4032486, 42, 2006.1691060158876)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20574, 2, 34.8481977, -82.403277, 43, 2010.0808508980913)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20575, 2, 34.8481435, -82.4033269, 44, 2017.6424852871025)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20576, 2, 34.848032, -82.403413, 45, 2032.3370996797687)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20577, 2, 34.847512, -82.403757, 46, 2098.2040264761167)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20578, 2, 34.847171, -82.403983, 47, 2141.4156781282431)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20579, 2, 34.8467981, -82.4042084, 48, 2187.7535110240683)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20580, 2, 34.846764, -82.404229, 49, 2191.9889988923114)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20581, 2, 34.846642, -82.40429, 50, 2206.6685451933054)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20582, 2, 34.84653, -82.404319, 51, 2219.4147565189542)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20583, 2, 34.84653, -82.404319, 52, 2219.4147565189542)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20584, 2, 34.846353, -82.404338, 53, 2239.1943763116919)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20585, 2, 34.8462646, -82.404344, 54, 2249.050334129809)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20586, 2, 34.845478, -82.404397, 55, 2336.7480524534844)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20587, 2, 34.845478, -82.404397, 56, 2336.7480524534844)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20588, 2, 34.8453134, -82.4043812, 57, 2355.1277351139574)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20589, 2, 34.844992, -82.404324, 58, 2391.285543844419)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20590, 2, 34.844619, -82.4042173, 59, 2433.9366809780786)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20591, 2, 34.84459, -82.404209, 60, 2437.253619821287)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20592, 2, 34.844521, -82.404215, 61, 2444.9537506879406)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20593, 2, 34.844521, -82.404215, 62, 2444.9537506879406)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20594, 2, 34.8444546, -82.4044559, 63, 2468.1707663858606)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20595, 2, 34.8443977, -82.4046626, 64, 2488.0887323432808)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20596, 2, 34.844208, -82.405351, 65, 2554.4320024456429)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20597, 2, 34.844101, -82.405717, 66, 2589.9282335865214)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20598, 2, 34.843789, -82.406823, 67, 2696.7761067288225)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20599, 2, 34.843569, -82.407608, 68, 2772.5609363366425)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20600, 2, 34.843083, -82.409344, 69, 2940.1384180976875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20601, 2, 34.843083, -82.409344, 70, 2940.1384180976875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20602, 2, 34.842924, -82.40927, 71, 2959.0853406351671)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20603, 2, 34.842254, -82.409006, 72, 3037.4724957659196)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20604, 2, 34.842127, -82.40896, 73, 3052.221411558638)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20605, 2, 34.842127, -82.40896, 74, 3052.221411558638)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20606, 2, 34.841329, -82.408641, 75, 3145.7132379077657)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20607, 2, 34.854524, -82.398794, 76, 4868.1567425965895)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20608, 2, 34.854908, -82.3986318, 77, 4913.3985492748)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20609, 2, 34.854924, -82.398625, 78, 4915.2850715214936)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20610, 2, 34.8549426, -82.3986187, 79, 4917.4314134428614)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20611, 2, 34.855416, -82.398457, 80, 4972.1610281406811)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20612, 2, 34.85569, -82.398354, 81, 5004.0808654739376)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20613, 2, 34.856403, -82.398103, 82, 5086.6970183255962)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20614, 2, 34.857666, -82.397668, 83, 5232.8007788621244)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20615, 2, 34.858066, -82.397535, 84, 5278.9561824815664)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20616, 2, 34.858579, -82.397365, 85, 5338.1367441561488)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20617, 2, 34.858579, -82.397365, 86, 5338.1367441561488)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20618, 2, 34.858706, -82.397352, 87, 5352.3237551405718)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20619, 2, 34.859272, -82.39718, 88, 5417.2599276230912)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20620, 2, 34.85939, -82.397134, 89, 5431.0514455605335)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20621, 2, 34.860346, -82.39669, 90, 5544.9388687070186)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20622, 2, 34.860794, -82.396485, 91, 5598.2095046948371)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20623, 2, 34.86159, -82.39611, 92, 5693.2098654300162)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20624, 2, 34.861714, -82.396078, 93, 5707.3196250547853)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20625, 2, 34.863003, -82.395912, 94, 5851.6092662317305)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20626, 2, 34.858579, -82.397365, 95, 6361.6569153295113)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20627, 2, 34.85889, -82.398836, 96, 6500.4133156814414)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20628, 2, 34.859101, -82.399857, 97, 6596.588295068841)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20629, 2, 34.859135, -82.400019, 98, 6611.8619295590133)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20630, 2, 34.859212, -82.400388, 99, 6646.6406691362854)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20631, 2, 34.859238, -82.40054, 100, 6660.82322250106)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20632, 2, 34.859227, -82.400612, 101, 6667.5133693315893)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20633, 2, 34.854524, -82.398794, 102, 7216.7565184743926)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20634, 2, 34.854691, -82.399241, 103, 7261.6224037589327)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20635, 2, 34.8547474, -82.3993579, 104, 7274.0099402319993)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20636, 2, 34.854937, -82.399751, 105, 7315.6627898903916)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20637, 2, 34.855144, -82.400285, 106, 7369.6118647255362)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20638, 2, 34.855144, -82.400285, 107, 7369.6118647255362)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20639, 2, 34.8552402, -82.400528, 108, 7394.2578990040729)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20640, 2, 34.855273, -82.400611, 109, 7402.6732425728915)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20641, 2, 34.8553339, -82.4007799, 110, 7419.5253837500095)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20642, 2, 34.8557019, -82.4018412, 111, 7524.7730654405095)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20643, 2, 34.855869, -82.402288, 112, 7569.6263657508252)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20644, 2, 34.855892, -82.402429, 113, 7582.7586275753529)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20645, 2, 34.855892, -82.402429, 114, 7582.7586275753529)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20646, 2, 34.855944, -82.402531, 115, 7593.7275996910666)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20647, 2, 34.856094, -82.402714, 116, 7617.3553358143317)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20648, 2, 34.856207, -82.402834, 117, 7634.04048665598)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20649, 2, 34.856364, -82.402984, 118, 7656.2485220738163)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20650, 2, 34.8570057, -82.4035126, 119, 7742.4709670406019)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20651, 2, 34.8570057, -82.4035126, 120, 7742.4709670406019)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20652, 2, 34.8571078, -82.4034597, 121, 7754.8212586623758)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20653, 2, 34.8572782, -82.4033306, 122, 7777.1572520981954)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20654, 2, 34.8573096, -82.4033068, 123, 7781.2726748676578)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20655, 2, 34.8574737, -82.40316, 124, 7803.9336740205108)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20656, 2, 34.8576162, -82.4029653, 125, 7827.765442584152)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20657, 2, 34.857724, -82.402761, 126, 7849.9529280951392)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20658, 2, 34.857892, -82.40247, 127, 7882.4541043281615)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20659, 2, 34.858079, -82.402181, 128, 7916.0730531342351)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20660, 2, 34.859161, -82.40073, 129, 8095.1675771913824)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20661, 2, 34.859227, -82.400612, 130, 8108.2121907048349)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20662, 2, 34.850744, -82.39896, 131, 9064.5171333827438)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20663, 2, 34.849972, -82.399321, 132, 9156.5662526923588)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20664, 2, 34.8496944, -82.3994465, 133, 9189.5267898685015)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20665, 2, 34.849618, -82.399481, 134, 9198.5961707904753)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20666, 2, 34.8493323, -82.3996114, 135, 9232.5580930503875)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20667, 2, 34.849184, -82.399679, 136, 9250.1841497775458)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20668, 2, 34.8488203, -82.3998508, 137, 9293.6066253024928)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20669, 2, 34.848695, -82.39991, 138, 9308.5665503016153)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20670, 2, 34.8484822, -82.4000144, 139, 9334.1032266693255)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20671, 2, 34.8483379, -82.4000782, 140, 9351.1914346686863)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20672, 2, 34.847587, -82.40041, 141, 9440.1075285993065)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20673, 2, 34.8471513, -82.4006111, 142, 9491.9723063088841)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20674, 2, 34.846493, -82.400915, 143, 9570.3369874793043)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20675, 2, 34.846392, -82.400971, 144, 9582.6894730833228)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20676, 2, 34.8461845, -82.4011174, 145, 9609.3809431440332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20677, 2, 34.8461845, -82.4011174, 146, 9609.3809431440332)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20678, 2, 34.845958, -82.401324, 147, 9640.8768806262815)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20679, 2, 34.845895, -82.401377, 148, 9649.3988867986682)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20680, 2, 34.845834, -82.40143, 149, 9657.7387549095311)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20681, 2, 34.8455653, -82.4016592, 150, 9694.2513151426028)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20682, 2, 34.8455653, -82.4016592, 151, 9694.2513151426028)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20683, 2, 34.845494, -82.40172, 152, 9703.93903549356)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20684, 2, 34.845153, -82.402009, 153, 9750.1783209474415)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20685, 2, 34.844934, -82.402251, 154, 9783.089354519072)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20686, 2, 34.844857, -82.40235, 155, 9795.5510467528311)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20687, 2, 34.844755, -82.40253, 156, 9815.5351148406735)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20688, 2, 34.8447269, -82.402607, 157, 9823.234072532814)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20689, 2, 34.844709, -82.402656, 158, 9828.1340186958278)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20690, 2, 34.844664, -82.402825, 159, 9844.3663924774319)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20691, 2, 34.844631, -82.403026, 160, 9863.09369150589)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20692, 2, 34.8445617, -82.4037552, 161, 9930.1588714784484)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20693, 2, 34.844521, -82.404215, 162, 9972.4099751393)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20694, 2, 34.844521, -82.404215, 163, 9972.4099751393)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20695, 2, 34.844473, -82.404229, 164, 9977.90433426736)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20696, 2, 34.844406, -82.404275, 165, 9986.4649412298859)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20697, 2, 34.8442101, -82.4044852, 166, 10015.522818156411)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20698, 2, 34.84409, -82.404614, 167, 10033.333424601471)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20699, 2, 34.843726, -82.404983, 168, 10086.04417757121)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20700, 2, 34.843453, -82.405245, 169, 10124.729268353618)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20701, 2, 34.843372, -82.405325, 170, 10136.336414398076)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20702, 2, 34.843052, -82.405586, 171, 10179.203028835982)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20703, 2, 34.842452, -82.406046, 172, 10258.1167657009)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20704, 2, 34.842057, -82.406315, 173, 10308.490078360133)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20705, 2, 34.841948, -82.40636, 174, 10321.301321798355)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20706, 2, 34.841826, -82.406394, 175, 10335.232620554205)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20707, 2, 34.850744, -82.39896, 176, 11538.064197126829)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20708, 2, 34.851558, -82.398591, 177, 11634.745209792905)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20709, 2, 34.852485, -82.398164, 178, 11745.064744570285)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20710, 2, 34.8538632, -82.3975444, 179, 11908.593065946918)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20711, 2, 34.853991, -82.397487, 180, 11923.755704323343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20712, 2, 34.853991, -82.397487, 181, 11923.755704323343)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20713, 2, 34.854075, -82.397469, 182, 11933.250357179843)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20714, 2, 34.854146, -82.397464, 183, 11941.167386690831)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20715, 2, 34.854588, -82.397282, 184, 11993.103522014226)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20716, 2, 34.854858, -82.397156, 185, 12025.288268160475)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20717, 2, 34.8549254, -82.3971253, 186, 12033.298308945081)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20718, 2, 34.855293, -82.396958, 187, 12076.980040292141)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20719, 2, 34.8570122, -82.3962211, 188, 12279.85351418746)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20720, 2, 34.85715, -82.396162, 189, 12296.115909852584)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20721, 2, 34.85715, -82.396162, 190, 12296.115909852584)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20722, 2, 34.8572429, -82.3961232, 191, 12307.047761820841)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20723, 2, 34.857724, -82.395922, 192, 12363.669358972675)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20724, 2, 34.8581421, -82.3957472, 193, 12412.874856190458)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20725, 2, 34.858231, -82.39571, 194, 12423.33807072279)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20726, 2, 34.858231, -82.39571, 195, 12423.33807072279)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20727, 2, 34.858315, -82.3956742, 196, 12433.244763280003)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20728, 2, 34.859888, -82.395005, 197, 12618.713165664703)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20729, 2, 34.8604683, -82.394752, 198, 12687.321102046224)
GO
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20730, 2, 34.861544, -82.394283, 199, 12814.499784900674)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20731, 2, 34.861544, -82.394283, 200, 12814.499784900674)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20732, 2, 34.862797, -82.393742, 201, 12962.477721964984)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20733, 2, 34.841329, -82.408641, 202, 15712.685759013537)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20734, 2, 34.841604, -82.407404, 203, 15829.775566336153)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20735, 2, 34.841667, -82.407063, 204, 15861.70997419068)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20736, 2, 34.841699, -82.406861, 205, 15880.506121160346)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20737, 2, 34.841723, -82.40671, 206, 15894.558467083323)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20738, 2, 34.841779, -82.406504, 207, 15914.385068870337)
INSERT [dbo].[Shapes] ([ID], [RouteID], [Lat], [Lon], [Sequence], [DistanceTraveled]) VALUES (20739, 2, 34.841826, -82.406394, 208, 15925.715369139824)
SET IDENTITY_INSERT [dbo].[Shapes] OFF
SET IDENTITY_INSERT [dbo].[Stops] ON 

INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (24, N'N Main @ Bohemian Cafe', N'N Main @ Bohemian Cafe', 34.8619016, -82.3942142)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (25, N'N Main @ Thomas McAfee', N'N Main @ Thomas McAfee', 34.8602415, -82.3950161)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (26, N'619 N Main', N'619 N Main', 34.8595832, -82.3952439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (27, N'Towers East Apts', N'Towers East Apts', 34.8558375, -82.3968439)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (28, N'N Main @ NOMA Square', N'N Main @ NOMA Square', 34.8531554, -82.3979107)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (29, N'N Main @ Mast General Store', N'N Main @ Mast General Store', 34.8520171, -82.3984516)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (30, N'N Main @ Certus Bank', N'N Main @ Certus Bank', 34.8512226, -82.3988049)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (31, N'S Main @ Wells Fargo Plaza', N'S Main @ Wells Fargo Plaza', 34.8503157, -82.3992308)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (32, N'S Main @ Poinsett Plaza', N'S Main @ Poinsett Plaza', 34.8491211, -82.3997923)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (33, N'S Main @ City Hall', N'S Main @ City Hall', 34.8482581, -82.4002633)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (34, N'S Main @ Village Green', N'S Main @ Village Green', 34.8477894, -82.4003879)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (35, N'S Main @ Peace Center', N'S Main @ Peace Center', 34.8466131, -82.400934)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (36, N'S Main @ Falls Park', N'S Main @ Falls Park', 34.8453763, -82.4019207)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (37, N'S Main @ Pomegranate', N'S Main @ Pomegranate', 34.8447334, -82.402793)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (38, N'S Main @ Rick Erwin', N'S Main @ Rick Erwin', 34.844639, -82.4036105)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (39, N'Fluor Field', N'Fluor Field', 34.8416466, -82.407466)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (40, N'Greenville Drive Ticket Office', N'Greenville Drive Ticket Office', 34.8428768, -82.4092208)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (41, N'S Main @ Compadres', N'S Main @ Compadres', 34.8433129, -82.4082198)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (42, N'S Main @ American Grocery', N'S Main @ American Grocery', 34.8442468, -82.4050237)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (43, N'River St @ West Court St', N'River St @ West Court St', 34.8493456, -82.4019878)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (44, N'S Richardson St @ Transit Center', N'S Richardson St @ Transit Center', 34.850448, -82.4010785)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (45, N'Richardson St @ W North St', N'Richardson St @ W North St', 34.8528676, -82.3998933)
INSERT [dbo].[Stops] ([ID], [Name], [Description], [Lat], [Lon]) VALUES (46, N'Heritage Green', N'Heritage Green', 34.8554933, -82.4010898)
SET IDENTITY_INSERT [dbo].[Stops] OFF
SET IDENTITY_INSERT [dbo].[Trolley] ON 

INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (1, N'Trolley', 1, NULL, NULL)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (2, N'Trolley', 2, NULL, NULL)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (3, N'Trolley', 999, NULL, NULL)
INSERT [dbo].[Trolley] ([ID], [TrolleyName], [Number], [CurrentLat], [CurrentLon]) VALUES (4, N'Trolley', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Trolley] OFF
ALTER TABLE [dbo].[RouteSchedule]  WITH CHECK ADD  CONSTRAINT [FK_RouteSchedule_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteSchedule] CHECK CONSTRAINT [FK_RouteSchedule_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Routes]
GO
ALTER TABLE [dbo].[RouteStops]  WITH CHECK ADD  CONSTRAINT [FK_RouteStops_Stops] FOREIGN KEY([StopID])
REFERENCES [dbo].[Stops] ([ID])
GO
ALTER TABLE [dbo].[RouteStops] CHECK CONSTRAINT [FK_RouteStops_Stops]
GO
ALTER TABLE [dbo].[Shapes]  WITH CHECK ADD  CONSTRAINT [FK_Shapes_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Shapes] CHECK CONSTRAINT [FK_Shapes_Routes]
GO
