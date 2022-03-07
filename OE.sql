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
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (1, N'b7003fc28c5502e516d5a1500e052280', N'nguyentrongtai.ait@gmail.com', N'Nguyễn Trọng Tài', 1, N'nguyentrongtai.ait.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (13, N'093d8e0b34eae9eb236e36f638529267', N'nguyentruongchinh@gmail.com', N'Nguyễn Trường Chinh', 0, N'nguyentruongchinh.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (15, N'f3bfeb96bf601903cdf91a92d5a9c4fe', N'tranhaitrieu@gmail.com', N'Trần Hải Triều', 0, N'tranhaitrieu.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (16, N'398b2f1ad0818ecc3c48d8e876f101f9', N'tranlehongphuc@gmail.com', N'Trần Lê Hồng Phúc', 1, N'tranlehongphuc.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (17, N'b8b84a0a7ff76e57464a973a43a02dc3', N'thaihoahoangdieu@gmail.com', N'Thái Hoa Hoàng Diệu', 0, N'thaihoahoangdieu.png')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (25, N'0138bd2217b8f73e4904f0ea2899a7d4', N'nguyentruongnguyencat@gmail.com', N'Nguyễn Trương Nguyên Cát', 1, N'nguyentruongnguyencat.jpg')
GO
INSERT [dbo].[Users] ([userID], [password], [email], [fullname], [admin], [image]) VALUES (27, N'19ffa4027a3248345c66ceef41bda5ca', N'truongtoquynhmy@gmail.com', N'Trương Tố Quỳnh My', 0, N'truongtoquynhmy.jpg')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Video] ON 
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (1, N'789 Mười', N'789-Mười.png', 5151, N'Chuyện phim 798 Mười kể về Tám (Kiều Minh Tuấn) và người anh họ mù lòa Mười (Dustin Nguyễn). Tám lên thành phố lập nghiệp bằng chiếc xe bán bánh tiêu, rồi đem lòng yêu nữ ca sĩ phòng trà tên Bích (Nam Em). Song, cô gái còn lọt vào mắt xanh của tay trùm Rô (Hoàng Sơn). Tên giang hồ máu mặt dụ dỗ ông Chín (Tiểu Bảo Quốc) – cha của Bích – tham gia trò đỏ đen, rồi bắt ông phải gán con gái để trả món nợ không lồ. Cùng lúc đó, Mười bán căn nhà dưới quê đổi lấy số tiền lớn để có thể lên thành phố chữa mắt. Để cứu vãn mối tình của mình, Tám bèn cùng cô bạn thân tên Bảy (Thu Trang) bày trò lừa tiền người anh mù. Từ đây, hàng loạt sự kiện “dở khóc dở cười” cứ thế xảy ra.', CAST(N'2016-01-01' AS Date), 1, N'2ctOSPUpdOU')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (5, N'Bạn Gái Tôi Là Sếp', N'Bạn-Gái-Tôi-Là-Sếp.png', 1071, N'Bạn Gái Tôi Là Sếp là tác phẩm mới nhất của đạo diễn Hàm Trần. Phim dành cho các cặp đôi tháng 2 với sự tham gia của dàn diễn viên "trai xinh gái đẹp": Miu Lê, Đỗ An, Lê Khánh, Ngọc Thảo, Huyme, Phở Đặc Biệt... Phim được Việt hóa từ tác phẩm ăn khách ATM của Thái Lan.', CAST(N'2017-02-03' AS Date), 1, N'N_wU29DMsQo')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (6, N'Bảo mẫu siêu quậy', N'Bảo-mẫu-siêu-quậy.png', 302, N'Bảo Mẫu Siêu Quậy (Hiếu Hiền, Đinh Ngọc Diệp, Dũng Voi, Trương Quỳnh Anh...) là một bộ phim hài hước vừa được ra mắt năm 2015 của đạo diễn Lê Bảo Trung xoay quanh câu chuyện về những rắc rối mà một cô bảo mẫu trẻ phải đói mặt khi gặp phải những đứa trẻ tinh nghịch. Trong phim Bảo Mẫu Siêu Quậy vì rất yêu thích trẻ con nên cô quyết tâm học làm một bảo mẫu giỏi nhưng không ngờ bọn trẻ con không chỉ dễ thương mà cón rất tinh nghịch và đủ trò quậy phá gây rắc rối. Liệu cô bảo mẫu trẻ tuổi này sẻ đói mặt ra sau với những đứa trẻ tinh nghịch ấy và cô sẻ phải còn gặp phải những rắc rối gì nữa? để biết được những điều đó mời các bạn đón xem phim Bảo Mẫu Siêu Quậy. Chúc các bạn có được những giây phút thư giản thoái mái vui vẻ.', CAST(N'2017-05-09' AS Date), 1, N'mqWMPqVGahY')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (7, N'Chàng vợ của em', N'Chàng-vợ-của-em.png', 480, N'Sau khi liên tục gặp phải rắc rối với người giúp việc, Mai – một cô nàng công sở bận rộn -  cảm thấy vô cùng may mắn khi tìm được Ngọc – người hứa sẽ chăm sóc nhà cửa và cún cưng của cô một cách tốt nhất. Từ ngày có Ngọc, Mai luôn cảm thấy hạnh phúc và vui vẻ khi trở về nhà. Cô tưởng như đã tìm được một “người vợ” lý tưởng mà mình ao ước bấy lâu. 
Thế nhưng, Mai không hề biết rằng người giúp việc hoàn hảo mà cô luôn tin tưởng lại chính là Hùng – anh trai Ngọc – một “gã khó ưa” mà Mai thường chạm mặt ở công viên. Mai sẽ làm gì khi phát hiện ra bí mật này, và cô sẽ đối mặt với tình cảm của mình ra sao, khi bên cạnh vẫn còn có Mạnh – người đàn ông lịch lãm, nhiều tham vọng và luôn dành cho cô sự chăm sóc đặc biệt?', CAST(N'2018-08-24' AS Date), 1, N'Or3SqGR_Qg4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (8, N'Chị Mười Ba', N'Chị-Mười-Ba.png', 319, N'Phim Chị Mười Ba: 3 Ngày Sinh Tử được phát triển từ web drama Thập Tam Muội đình đám trên Youtube, Chị Mười Ba tuy gây ra không ít tranh cãi về mặt nội dung nhưng vẫn liên tục đạt được những thành tích đáng nể về mặt doanh thu. Cụ thể là sau 1 tuần công chiếu, bộ phim đã thu về hơn 40 tỷ đồng, một con số mà không nhiều bộ phim trong năm nay đạt được. Chị Mười Ba: 3 Ngày Sinh Tử vẫn khai thác đề tài Giang Hồ nhưng sẽ chứa đựng nội dung hấp vẫn và “gai góc” hơn phần 1 nhờ cốt truyện chặt chẽ nhiều bất ngờ và những pha rượt đuổi, đánh đấm chân thật, được đầu tư hoành tráng. Liệu Chị Mười Ba sẽ trải qua hành trình khó khăn và thử thách nào để vượt qua 3 Ngày Sinh Tử và bảo vệ những người anh em vào sống ra chết với mình.', CAST(N'2020-12-23' AS Date), 0, N'Ncwkodt5dA4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (9, N'Cua lại vợ bầu', N'Cua-lại-vợ-bầu.png', 1897, N'Cua lại vợ bầu là một bộ phim tình cảm hài hước Việt Nam do Nhất Trung làm đạo diễn và viết kịch bản, ra mắt vào ngày 25/1/2019. Phim đạt thành công lớn về mặt doanh thu và nhận được nhiều đánh giá tích cực từ giới phê bình. Phim được phát hành độc quyền tại ứng dụng Galaxy Play', CAST(N'2019-01-25' AS Date), 1, N'7V7SBjaQQ4g')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (10, N'Em chưa 18', N'Em-chưa-18.png', 11981, N'Em chưa 18 là bộ phim điện ảnh tình cảm hài hước Việt Nam của đạo diễn Lê Thanh Sơn thực hiện, do Charlie Nguyễn và Hãng phim Chánh Phương sản xuất năm 2017. Phim có sự góp mặt của các diễn viên: Kiều Minh Tuấn, Kaity Nguyễn, Will, Quang Minh, Huy Khánh.', CAST(N'2017-04-24' AS Date), 1, N'_affkHceSj4')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (11, N'Lộc Phát', N'Lộc-Phát.png', 781, N'Lộc Phát | Phim Hài Hành động Việt Nam | VieON. Xem Lộc Phát của Việt Nam có sự tham gia của Hiếu Hiền, Bình Minh, Kiều Minh Tuấn. Thuộc thể loại: Phim lẻ. Ra mắt vào dịp Tết Nguyên đán 2016, Lộc Phát là câu chuyện về một cuộc rượt đuổi bất đắc dĩ của anh chàng Lộc và gã giang hồ tên Cát (Bình Minh).', CAST(N'2016-02-05' AS Date), 1, N'pEgvzLUbuTU')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (12, N'Nam thần xe ôm', N'Nam-thần-xe-ôm.png', 35154, N'Nam thần xe ôm là một bộ phim hài Thái Lan năm 2018 do Prueksa Amaruji đạo diễn, với sự tham gia của Pachara Chirathivat và Sananthachat Thanapatpisal. Phần phim tiếp nối mang tên Ôm hờ yêu thật vào năm 2019, ra rạp tại Việt Nam ngày 10/01/2020', CAST(N'2018-09-20' AS Date), 1, N'cJi4mTeL5B0')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (13, N'Người Cần Quên Phải Nhớ', N'Người-Cần-Quên-Phải-Nhớ.png', 0, N'Người Cần Quên Phải Nhớ kể về cô nàng Loan (Hoàng Yến Chibi) đang điều tra cái chết của bố mình. Bình (Trần Ngọc Vàng) được cử đi “đe dọa” cô nhưng rồi lại bị Loan choảng cho một cú trời giáng đến mức… mất trí nhớ. Sau đó, Loan dắt Bình về nhà bao nuôi với hy vọng sẽ moi móc được thông tin vụ án từ anh', CAST(N'2020-12-24' AS Date), 0, N'Q3f9eTTsEeg')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (14, N'Siêu Sao Siêu Ngố', N'Siêu-Sao-Siêu-Ngố.png', 1231, N'Siêu Sao Siêu Ngố là bộ phim hài – tình cảm có nội dung xoay quanh nhân vật chính là ngôi sao điện ảnh Thế Sơn. Mặc dù sở hữu sự nghiệp thành công hàng đầu và có cuộc sống sang chảnh bậc nhất khiến vạn người mê, nhưng Thế Sơn lại chẳng thể tự do yêu đương hay làm những gì mà mình yêu thích.', CAST(N'2018-02-16' AS Date), 1, N'DULpxY1Vspw')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (15, N'Thần Tiên Cũng Nổi Điên', N'Thần-Tiên-Cũng-Nổi-Điên.png', 4561, N'Là câu chuyện hài hước thú vị xen lẫn thần thoại, Thần Tiên Cũng Nổi Điên kể về câu chuyện khi thần tình yêu phương Đông gặp phải... thần tình yêu phương Tây. Bị thượng đế trách phạt vì không hoàn thành công việc, ông Tơ bà Nguyệt quyết định xuống trần gian để tìm kiếm kết quả các nhân duyên họ đã tác thành. Nào ngờ, vừa xuống trần thế họ đã gặp phải vị thần Cupid đến từ xứ khác. Cả ba hợp tác với nhau, hóa thân thành những người bình thường để tác hợp cho các cặp đôi.', CAST(N'2018-07-11' AS Date), 1, N'Of5I8PJh854')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (18, N'Tôi là não cá vàng', N'Tôi-là-não-cá-vàng.png', 0, N'Tôi là não cá vàng là tác phẩm chiếu rạp thứ tư mà diễn viên Khánh Hiền góp mặt. Được đạo diễn Victor Vũ phát hiện và mời tham gia dự án Tôi thấy hoa vàng trên cỏ xanh, cô nhanh chóng khẳng định thực lực, ghi điểm với khán giả đại chúng qua nhân vật chị Vinh.', CAST(N'2020-06-04' AS Date), 0, N'2AQJW9TFnww')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (19, N'Tôi thấy lương về trong giấc mơ', N'Tôi-thấy-lương-về-trong-giấc-mơ.png', 321, N'Cư dân mạng đã nhanh chóng chế ra những poster siêu hài ăn theo bộ phim mới ra mắt "Tôi thấy hoa vàng trên cỏ xanh" của đạo diễn Victor Vũ.', CAST(N'2018-07-11' AS Date), 0, N'wmjiCP6R-7I')
GO
INSERT [dbo].[Video] ([videoID], [title], [poster], [views], [description], [releasedDate], [active], [linkVideo]) VALUES (20, N'Ước hẹn mùa thu', N'Ước-hẹn-mùa-thu.png', 3213, N'Chuyện phim Ước hẹn mùa thu xoay quanh cậu học sinh trung học Duy (Quốc Anh) bị hôn mê suốt 15 năm trời sau một tai nạn giao thông. Tỉnh dậy ở tuổi 32, mọi thứ xung quanh anh đều đã thay đổi một cách chóng mặt.

Lúc này, Duy vẫn nhớ đến câu chuyện tình còn dang dở năm xưa với cô bạn cùng lớp Pha Lê (Hoàng Oanh). Nhờ sự giúp đỡ của anh bạn chí cốt Bình (Hoàng Phi) và cậu nhóc mới quen tên Long (Kay Trần), chàng trai quyết tâm tìm lại người cũ.

Đáng buồn thay, Pha Lê lúc này chuẩn bị lên xe hoa với Mạnh (Nhan Phúc Vinh).

Từ đây, nhiều sự kiện dở khóc dở cười xảy ra khi Duy toan áp dụng những chiêu thức cưa cẩm “tân cổ giao duyên” nhằm giành lại trái tim người đẹp.', CAST(N'2019-05-10' AS Date), 1, N'SC1DAZ0vZVA')
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
