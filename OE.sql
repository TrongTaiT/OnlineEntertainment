USE master
GO
CREATE DATABASE [OnlineEntertainment]
GO
USE [OnlineEntertainment]
GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2/26/2022 11:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[favoriteID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[videoID] [int] NOT NULL,
	[likedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[favoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Share]    Script Date: 2/26/2022 11:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[shareID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[videoID] [int] NOT NULL,
	[emails] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/26/2022 11:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](36) NOT NULL,
	[email] [varchar](320) NOT NULL,
	[fullname] [nvarchar](70) NOT NULL,
	[admin] [bit] NOT NULL,
	[image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 2/26/2022 11:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[videoID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[poster] [nvarchar](max) NOT NULL,
	[views] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[releasedDate] [date] NOT NULL,
	[active] [bit] NOT NULL,
	[linkVideo] [char](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[videoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorite] ON 
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (1, 13, 1, CAST(N'2021-12-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (2, 1, 1, CAST(N'2022-02-16' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (3, 1, 5, CAST(N'2022-02-15' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (4, 16, 1, CAST(N'2021-12-22' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (5, 17, 1, CAST(N'2021-11-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (6, 16, 5, CAST(N'2021-10-16' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (7, 13, 5, CAST(N'2022-01-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (9, 17, 12, CAST(N'2021-12-23' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (10, 1, 12, CAST(N'2022-01-05' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (11, 1, 14, CAST(N'2022-02-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (12, 1, 20, CAST(N'2022-02-04' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (13, 13, 12, CAST(N'2021-10-10' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (14, 25, 1, CAST(N'2020-01-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (15, 25, 18, CAST(N'2021-09-04' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (16, 25, 9, CAST(N'2021-04-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (17, 25, 10, CAST(N'2021-03-01' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (18, 25, 19, CAST(N'2021-01-19' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (19, 1, 10, CAST(N'2022-01-17' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (20, 1, 18, CAST(N'2022-02-24' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (21, 1, 19, CAST(N'2022-02-24' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (22, 1, 13, CAST(N'2022-02-24' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (23, 1, 8, CAST(N'2022-02-24' AS Date))
GO
INSERT [dbo].[Favorite] ([favoriteID], [userID], [videoID], [likedDate]) VALUES (24, 1, 9, CAST(N'2022-02-24' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Favorite] OFF
GO
SET IDENTITY_INSERT [dbo].[Share] ON 
GO
INSERT [dbo].[Share] ([shareID], [userID], [videoID], [emails]) VALUES (1, 1, 12, N'nguyentrongtai.ait@gmail.com')
GO
INSERT [dbo].[Share] ([shareID], [userID], [videoID], [emails]) VALUES (2, 25, 11, N'nguyentrongtai.ait@gmail.com')
GO
INSERT [dbo].[Share] ([shareID], [userID], [videoID], [emails]) VALUES (3, 25, 11, N'nguyentrongtai.ait@gmail.com')
GO
INSERT [dbo].[Share] ([shareID], [userID], [videoID], [emails]) VALUES (4, 25, 11, N'nguyentrongtai.ait@gmail.com')
GO
INSERT [dbo].[Share] ([shareID], [userID], [videoID], [emails]) VALUES (5, 25, 11, N'nguyentrongtai.ait@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Share] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (1, N'b7003fc28c5502e516d5a1500e052280', N'nguyentrongtai.ait@gmail.com', N'Nguy???n Tr???ng T??i', 1, N'nguyentrongtai.ait.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (13, N'093d8e0b34eae9eb236e36f638529267', N'nguyentruongchinh@gmail.com', N'Nguy???n Tr?????ng Chinh', 0, N'nguyentruongchinh.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (15, N'f3bfeb96bf601903cdf91a92d5a9c4fe', N'tranhaitrieu@gmail.com', N'Tr???n H???i Tri???u', 0, N'tranhaitrieu.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (16, N'398b2f1ad0818ecc3c48d8e876f101f9', N'tranlehongphuc@gmail.com', N'Tr???n L?? H???ng Ph??c', 1, N'tranlehongphuc.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (17, N'b8b84a0a7ff76e57464a973a43a02dc3', N'thaihoahoangdieu@gmail.com', N'Th??i Hoa Ho??ng Di???u', 0, N'thaihoahoangdieu.png')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (25, N'0138bd2217b8f73e4904f0ea2899a7d4', N'nguyentruongnguyencat@gmail.com', N'Nguy???n Tr????ng Nguy??n C??t', 1, N'nguyentruongnguyencat.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (27, N'19ffa4027a3248345c66ceef41bda5ca', N'truongtoquynhmy@gmail.com', N'Tr????ng T??? Qu???nh My', 0, N'truongtoquynhmy.jpg')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (1, N'789 M?????i', N'789-M?????i.png', 5151, N'Chuy???n phim 798 M?????i k??? v??? T??m (Ki???u Minh Tu???n) v?? ng?????i anh h??? m?? l??a M?????i (Dustin Nguy???n). T??m l??n th??nh ph??? l???p nghi???p b???ng chi???c xe b??n b??nh ti??u, r???i ??em l??ng y??u n??? ca s?? ph??ng tr?? t??n B??ch (Nam Em). Song, c?? g??i c??n l???t v??o m???t xanh c???a tay tr??m R?? (Ho??ng S??n). T??n giang h??? m??u m???t d??? d??? ??ng Ch??n (Ti???u B???o Qu???c) ??? cha c???a B??ch ??? tham gia tr?? ????? ??en, r???i b???t ??ng ph???i g??n con g??i ????? tr??? m??n n??? kh??ng l???. C??ng l??c ????, M?????i b??n c??n nh?? d?????i qu?? ?????i l???y s??? ti???n l???n ????? c?? th??? l??n th??nh ph??? ch???a m???t. ????? c???u v??n m???i t??nh c???a m??nh, T??m b??n c??ng c?? b???n th??n t??n B???y (Thu Trang) b??y tr?? l???a ti???n ng?????i anh m??. T??? ????y, h??ng lo???t s??? ki???n ???d??? kh??c d??? c?????i??? c??? th??? x???y ra.', CAST(N'2016-01-01' AS Date), 1, N'2ctOSPUpdOU')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (5, N'B???n G??i T??i L?? S???p', N'B???n-G??i-T??i-L??-S???p.png', 1071, N'B???n G??i T??i L?? S???p l?? t??c ph???m m???i nh???t c???a ?????o di???n H??m Tr???n. Phim d??nh cho c??c c???p ????i th??ng 2 v???i s??? tham gia c???a d??n di???n vi??n "trai xinh g??i ?????p": Miu L??, ????? An, L?? Kh??nh, Ng???c Th???o, Huyme, Ph??? ?????c Bi???t... Phim ???????c Vi???t h??a t??? t??c ph???m ??n kh??ch ATM c???a Th??i Lan.', CAST(N'2017-02-03' AS Date), 1, N'N_wU29DMsQo')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (6, N'B???o m???u si??u qu???y', N'B???o-m???u-si??u-qu???y.png', 302, N'B???o M???u Si??u Qu???y (Hi???u Hi???n, ??inh Ng???c Di???p, D??ng Voi, Tr????ng Qu???nh Anh...) l?? m???t b??? phim h??i h?????c v???a ???????c ra m???t n??m 2015 c???a ?????o di???n L?? B???o Trung xoay quanh c??u chuy???n v??? nh???ng r???c r???i m?? m???t c?? b???o m???u tr??? ph???i ????i m???t khi g???p ph???i nh???ng ?????a tr??? tinh ngh???ch. Trong phim B???o M???u Si??u Qu???y v?? r???t y??u th??ch tr??? con n??n c?? quy???t t??m h???c l??m m???t b???o m???u gi???i nh??ng kh??ng ng??? b???n tr??? con kh??ng ch??? d??? th????ng m?? c??n r???t tinh ngh???ch v?? ????? tr?? qu???y ph?? g??y r???c r???i. Li???u c?? b???o m???u tr??? tu???i n??y s??? ????i m???t ra sau v???i nh???ng ?????a tr??? tinh ngh???ch ???y v?? c?? s??? ph???i c??n g???p ph???i nh???ng r???c r???i g?? n???a? ????? bi???t ???????c nh???ng ??i???u ???? m???i c??c b???n ????n xem phim B???o M???u Si??u Qu???y. Ch??c c??c b???n c?? ???????c nh???ng gi??y ph??t th?? gi???n tho??i m??i vui v???.', CAST(N'2017-05-09' AS Date), 1, N'mqWMPqVGahY')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (7, N'Ch??ng v??? c???a em', N'Ch??ng-v???-c???a-em.png', 480, N'Sau khi li??n t???c g???p ph???i r???c r???i v???i ng?????i gi??p vi???c, Mai ??? m???t c?? n??ng c??ng s??? b???n r???n -?? c???m th???y v?? c??ng may m???n khi t??m ???????c Ng???c ??? ng?????i h???a s??? ch??m s??c nh?? c???a v?? c??n c??ng c???a c?? m???t c??ch t???t nh???t. T??? ng??y c?? Ng???c, Mai lu??n c???m th???y h???nh ph??c v?? vui v??? khi tr??? v??? nh??. C?? t?????ng nh?? ???? t??m ???????c m???t ???ng?????i v?????? l?? t?????ng m?? m??nh ao ?????c b???y l??u.??
Th??? nh??ng, Mai kh??ng h??? bi???t r???ng ng?????i gi??p vi???c ho??n h???o m?? c?? lu??n tin t?????ng l???i ch??nh l?? H??ng ??? anh trai Ng???c ??? m???t ???g?? kh?? ??a??? m?? Mai th?????ng ch???m m???t ??? c??ng vi??n. Mai s??? l??m g?? khi ph??t hi???n ra b?? m???t n??y, v?? c?? s??? ?????i m???t v???i t??nh c???m c???a m??nh ra sao, khi b??n c???nh v???n c??n c?? M???nh ??? ng?????i ????n ??ng l???ch l??m, nhi???u tham v???ng v?? lu??n d??nh cho c?? s??? ch??m s??c ?????c bi???t?', CAST(N'2018-08-24' AS Date), 1, N'Or3SqGR_Qg4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (8, N'Ch??? M?????i Ba', N'Ch???-M?????i-Ba.png', 319, N'Phim Ch??? M?????i Ba: 3 Ng??y Sinh T??? ???????c ph??t tri???n t??? web drama Th???p Tam Mu???i ????nh ????m tr??n Youtube, Ch??? M?????i Ba tuy g??y ra kh??ng ??t tranh c??i v??? m???t n???i dung nh??ng v???n li??n t???c ?????t ???????c nh???ng th??nh t??ch ????ng n??? v??? m???t doanh thu. C??? th??? l?? sau 1 tu???n c??ng chi???u, b??? phim ???? thu v??? h??n 40 t??? ?????ng, m???t con s??? m?? kh??ng nhi???u b??? phim trong n??m nay ?????t ???????c. Ch??? M?????i Ba: 3 Ng??y Sinh T??? v???n khai th??c ????? t??i Giang H??? nh??ng s??? ch???a ?????ng n???i dung h???p v???n v?? ???gai g??c??? h??n ph???n 1 nh??? c???t truy???n ch???t ch??? nhi???u b???t ng??? v?? nh???ng pha r?????t ??u???i, ????nh ?????m ch??n th???t, ???????c ?????u t?? ho??nh tr??ng. Li???u Ch??? M?????i Ba s??? tr???i qua h??nh tr??nh kh?? kh??n v?? th??? th??ch n??o ????? v?????t qua 3 Ng??y Sinh T??? v?? b???o v??? nh???ng ng?????i anh em v??o s???ng ra ch???t v???i m??nh.', CAST(N'2020-12-23' AS Date), 0, N'Ncwkodt5dA4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (9, N'Cua l???i v??? b???u', N'Cua-l???i-v???-b???u.png', 1897, N'Cua l???i v??? b???u l?? m???t b??? phim t??nh c???m h??i h?????c Vi???t Nam do Nh???t Trung l??m ?????o di???n v?? vi???t k???ch b???n, ra m???t v??o ng??y 25/1/2019. Phim ?????t th??nh c??ng l???n v??? m???t doanh thu v?? nh???n ???????c nhi???u ????nh gi?? t??ch c???c t??? gi???i ph?? b??nh. Phim ???????c ph??t h??nh ?????c quy???n t???i ???ng d???ng Galaxy Play', CAST(N'2019-01-25' AS Date), 1, N'7V7SBjaQQ4g')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (10, N'Em ch??a 18', N'Em-ch??a-18.png', 11981, N'Em ch??a 18 l?? b??? phim ??i???n ???nh t??nh c???m h??i h?????c Vi???t Nam c???a ?????o di???n L?? Thanh S??n th???c hi???n, do Charlie Nguy???n v?? H??ng phim Ch??nh Ph????ng s???n xu???t n??m 2017. Phim c?? s??? g??p m???t c???a c??c di???n vi??n: Ki???u Minh Tu???n, Kaity Nguy???n, Will, Quang Minh, Huy Kh??nh.', CAST(N'2017-04-24' AS Date), 1, N'_affkHceSj4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (11, N'L???c Ph??t', N'L???c-Ph??t.png', 781, N'L???c Ph??t | Phim H??i H??nh ?????ng Vi???t Nam | VieON. Xem L???c Ph??t c???a Vi???t Nam c?? s??? tham gia c???a Hi???u Hi???n, B??nh Minh, Ki???u Minh Tu???n. Thu???c th??? lo???i: Phim l???. Ra m???t v??o d???p T???t Nguy??n ????n 2016, L???c Ph??t l?? c??u chuy???n v??? m???t cu???c r?????t ??u???i b???t ?????c d?? c???a anh ch??ng L???c v?? g?? giang h??? t??n C??t (B??nh Minh).', CAST(N'2016-02-05' AS Date), 1, N'pEgvzLUbuTU')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (12, N'Nam th???n xe ??m', N'Nam-th???n-xe-??m.png', 35154, N'Nam th???n xe ??m l?? m???t b??? phim h??i Th??i Lan n??m 2018 do Prueksa Amaruji ?????o di???n, v???i s??? tham gia c???a Pachara Chirathivat v?? Sananthachat Thanapatpisal. Ph???n phim ti???p n???i mang t??n ??m h??? y??u th???t v??o n??m 2019, ra r???p t???i Vi???t Nam ng??y 10/01/2020', CAST(N'2018-09-20' AS Date), 1, N'cJi4mTeL5B0')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (13, N'Ng?????i C???n Qu??n Ph???i Nh???', N'Ng?????i-C???n-Qu??n-Ph???i-Nh???.png', 0, N'Ng?????i C???n Qu??n Ph???i Nh??? k??? v??? c?? n??ng Loan (Ho??ng Y???n Chibi) ??ang ??i???u tra c??i ch???t c???a b??? m??nh. B??nh (Tr???n Ng???c V??ng) ???????c c??? ??i ?????e d???a??? c?? nh??ng r???i l???i b??? Loan cho???ng cho m???t c?? tr???i gi??ng ?????n m???c??? m???t tr?? nh???. Sau ????, Loan d???t B??nh v??? nh?? bao nu??i v???i hy v???ng s??? moi m??c ???????c th??ng tin v??? ??n t??? anh', CAST(N'2020-12-24' AS Date), 0, N'Q3f9eTTsEeg')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (14, N'Si??u Sao Si??u Ng???', N'Si??u-Sao-Si??u-Ng???.png', 1231, N'Si??u Sao Si??u Ng??? l?? b??? phim h??i ??? t??nh c???m c?? n???i dung xoay quanh nh??n v???t ch??nh l?? ng??i sao ??i???n ???nh Th??? S??n. M???c d?? s??? h???u s??? nghi???p th??nh c??ng h??ng ?????u v?? c?? cu???c s???ng sang ch???nh b???c nh???t khi???n v???n ng?????i m??, nh??ng Th??? S??n l???i ch???ng th??? t??? do y??u ??????ng hay l??m nh???ng g?? m?? m??nh y??u th??ch.', CAST(N'2018-02-16' AS Date), 1, N'DULpxY1Vspw')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (15, N'Th???n Ti??n C??ng N???i ??i??n', N'Th???n-Ti??n-C??ng-N???i-??i??n.png', 4561, N'L?? c??u chuy???n h??i h?????c th?? v??? xen l???n th???n tho???i, Th???n Ti??n C??ng N???i ??i??n k??? v??? c??u chuy???n khi th???n t??nh y??u ph????ng ????ng g???p ph???i... th???n t??nh y??u ph????ng T??y. B??? th?????ng ????? tr??ch ph???t v?? kh??ng ho??n th??nh c??ng vi???c, ??ng T?? b?? Nguy???t quy???t ?????nh xu???ng tr???n gian ????? t??m ki???m k???t qu??? c??c nh??n duy??n h??? ???? t??c th??nh. N??o ng???, v???a xu???ng tr???n th??? h??? ???? g???p ph???i v??? th???n Cupid ?????n t??? x??? kh??c. C??? ba h???p t??c v???i nhau, h??a th??n th??nh nh???ng ng?????i b??nh th?????ng ????? t??c h???p cho c??c c???p ????i.', CAST(N'2018-07-11' AS Date), 1, N'Of5I8PJh854')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (18, N'T??i l?? n??o c?? v??ng', N'T??i-l??-n??o-c??-v??ng.png', 0, N'T??i l?? n??o c?? v??ng l?? t??c ph???m chi???u r???p th??? t?? m?? di???n vi??n Kh??nh Hi???n g??p m???t. ???????c ?????o di???n Victor V?? ph??t hi???n v?? m???i tham gia d??? ??n T??i th???y hoa v??ng tr??n c??? xanh, c?? nhanh ch??ng kh???ng ?????nh th???c l???c, ghi ??i???m v???i kh??n gi??? ?????i ch??ng qua nh??n v???t ch??? Vinh.', CAST(N'2020-06-04' AS Date), 0, N'2AQJW9TFnww')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (19, N'T??i th???y l????ng v??? trong gi???c m??', N'T??i-th???y-l????ng-v???-trong-gi???c-m??.png', 321, N'C?? d??n m???ng ???? nhanh ch??ng ch??? ra nh???ng poster si??u h??i ??n theo b??? phim m???i ra m???t "T??i th???y hoa v??ng tr??n c??? xanh" c???a ?????o di???n Victor V??.', CAST(N'2018-07-11' AS Date), 0, N'wmjiCP6R-7I')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (20, N'?????c h???n m??a thu', N'?????c-h???n-m??a-thu.png', 3213, N'Chuy???n phim ?????c h???n m??a thu xoay quanh c???u h???c sinh trung h???c Duy (Qu???c Anh) b??? h??n m?? su???t 15 n??m tr???i sau m???t tai n???n giao th??ng. T???nh d???y ??? tu???i 32, m???i th??? xung quanh anh ?????u ???? thay ?????i m???t c??ch ch??ng m???t.

L??c n??y, Duy v???n nh??? ?????n c??u chuy???n t??nh c??n dang d??? n??m x??a v???i c?? b???n c??ng l???p Pha L?? (Ho??ng Oanh). Nh??? s??? gi??p ????? c???a anh b???n ch?? c???t B??nh (Ho??ng Phi) v?? c???u nh??c m???i quen t??n Long (Kay Tr???n), ch??ng trai quy???t t??m t??m l???i ng?????i c??.

????ng bu???n thay, Pha L?? l??c n??y chu???n b??? l??n xe hoa v???i M???nh (Nhan Ph??c Vinh).

T??? ????y, nhi???u s??? ki???n d??? kh??c d??? c?????i x???y ra khi Duy toan ??p d???ng nh???ng chi??u th???c c??a c???m ???t??n c??? giao duy??n??? nh???m gi??nh l???i tr??i tim ng?????i ?????p.', CAST(N'2019-05-10' AS Date), 1, N'SC1DAZ0vZVA')
GO
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
/****** Object:  Index [UN_Favorite]    Script Date: 2/26/2022 11:31:21 PM ******/
ALTER TABLE [dbo].[Favorite] ADD  CONSTRAINT [UN_Favorite] UNIQUE NONCLUSTERED 
(
	[userID] ASC,
	[videoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616411F914AB]    Script Date: 2/26/2022 11:31:21 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_Video]    Script Date: 2/26/2022 11:31:21 PM ******/
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [UN_Video] UNIQUE NONCLUSTERED 
(
	[title] ASC,
	[releasedDate] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Favorite] ADD  DEFAULT (getdate()) FOR [likedDate]
GO
ALTER TABLE [dbo].[Video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[Video] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[Video] ([videoID])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Share]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[Video] ([videoID])
GO
