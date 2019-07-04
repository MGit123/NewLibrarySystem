/*
 Navicat Premium Data Transfer

 Source Server         : cdb-4nwq78pt.gz.tencentcdb.com_10050
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-4nwq78pt.gz.tencentcdb.com:10050
 Source Schema         : bookManage

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 03/07/2019 14:25:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for SystemInfo
-- ----------------------------
DROP TABLE IF EXISTS `SystemInfo`;
CREATE TABLE `SystemInfo`  (
  `infoNum` int(11) NOT NULL AUTO_INCREMENT,
  `infoName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiveID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `releaseDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`infoNum`) USING BTREE,
  INDEX `SystemInfo_ibfk_1`(`sendID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SystemInfo
-- ----------------------------
INSERT INTO `SystemInfo` VALUES (1, '欢迎邮件', '1', '1173556', '欢迎您，尊敬的李红用户!', '2019-07-02');
INSERT INTO `SystemInfo` VALUES (2, '通知', '1173559', '1', '这只是一个测试!', '2019-07-02');
INSERT INTO `SystemInfo` VALUES (3, '欢迎邮件', '1', '1173975', '欢迎您，尊敬的erg用户!', '2019-07-02');
INSERT INTO `SystemInfo` VALUES (4, '欢迎邮件', '1', '', '欢迎您，尊敬的用户!', '2019-07-02');
INSERT INTO `SystemInfo` VALUES (5, '欢迎邮件', '1', '123', '欢迎您，尊敬的123用户!', '2019-07-03');
INSERT INTO `SystemInfo` VALUES (6, 'lkrgn', '1173559', '1', 'Hello!蔡ergmokm', '2019-07-03');
INSERT INTO `SystemInfo` VALUES (7, '欢迎邮件', '1', '2135', '欢迎您，尊敬的124用户!', '2019-07-03');

-- ----------------------------
-- Table structure for adminInfo
-- ----------------------------
DROP TABLE IF EXISTS `adminInfo`;
CREATE TABLE `adminInfo`  (
  `userID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrowed` int(5) NULL DEFAULT 0,
  `allowLend` int(5) NULL DEFAULT 40,
  `ownMoney` float(5, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminInfo
-- ----------------------------
INSERT INTO `adminInfo` VALUES ('1173559', '蔡成功', '123456', '男', NULL, '35436467@qq.com', '管理员', 0, 40, 0);
INSERT INTO `adminInfo` VALUES ('1173721', '刘鑫', '123456', '男', NULL, '23655732@163.com', '管理员', 0, 40, 0);

-- ----------------------------
-- Table structure for bookIDInfo
-- ----------------------------
DROP TABLE IF EXISTS `bookIDInfo`;
CREATE TABLE `bookIDInfo`  (
  `bookID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookNum` int(11) NULL DEFAULT NULL,
  `bookName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookID`) USING BTREE,
  INDEX `bookID`(`bookID`) USING BTREE,
  INDEX `bookIDInfo_ibfk_1`(`bookNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookIDInfo
-- ----------------------------
INSERT INTO `bookIDInfo` VALUES ('A11', 1, 'C', '谭浩强', '0');
INSERT INTO `bookIDInfo` VALUES ('A12', 1, 'C', '谭浩强', '0');
INSERT INTO `bookIDInfo` VALUES ('A13', 1, 'C', '谭浩强', '1');
INSERT INTO `bookIDInfo` VALUES ('A21', 2, 'English', '刘旭斌', '1');
INSERT INTO `bookIDInfo` VALUES ('A22', 2, 'English', '刘旭斌', '0');
INSERT INTO `bookIDInfo` VALUES ('A31', 3, 'JAVA', '蔡立', '0');
INSERT INTO `bookIDInfo` VALUES ('A32', 3, 'JAVA', '蔡立', '1');
INSERT INTO `bookIDInfo` VALUES ('A41', 4, '高等数学', '明道', '1');
INSERT INTO `bookIDInfo` VALUES ('A42', 4, '高等数学', '明道', '1');
INSERT INTO `bookIDInfo` VALUES ('A51', 5, 'C++程序设计', 'Mark', '0');
INSERT INTO `bookIDInfo` VALUES ('A52', 5, 'C++程序设计', 'Mark', '0');
INSERT INTO `bookIDInfo` VALUES ('A53', 5, 'C++程序设计', 'Mark', '1');
INSERT INTO `bookIDInfo` VALUES ('A54', 5, 'C++程序设计', 'Mark', '1');
INSERT INTO `bookIDInfo` VALUES ('A61', 6, 'Python程序设计', 'Jack', '0');
INSERT INTO `bookIDInfo` VALUES ('A62', 6, 'Python程序设计', 'Jack', '1');
INSERT INTO `bookIDInfo` VALUES ('A63', 6, 'Python程序设计', 'Jack', '1');

-- ----------------------------
-- Table structure for bookInfo
-- ----------------------------
DROP TABLE IF EXISTS `bookInfo`;
CREATE TABLE `bookInfo`  (
  `bookNum` int(5) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remainNum` int(5) NOT NULL,
  `price` float(10, 2) NULL DEFAULT NULL,
  `publisher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageURL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bookContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bookNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookInfo
-- ----------------------------
INSERT INTO `bookInfo` VALUES (1, 'C', '谭浩强', 'Computer', 1, 25.60, '西北工业大学出版社', 'images/b1.jpg', 'C语言是一种应用非常广泛的结构化程序设计语言，既适合用于编写应用程序，有适合于编写系统软件');
INSERT INTO `bookInfo` VALUES (2, ' English', '刘旭斌', 'Englsih', 0, 31.20, '北京大学出版社', 'images/b2.jpg', '大学英语读写教程是为了提高大学生英语水平而编写的');
INSERT INTO `bookInfo` VALUES (3, 'JAVA', '蔡立', 'Computer', 1, 33.80, '北京大学出版社', 'images/b2.jpg', 'dgver');
INSERT INTO `bookInfo` VALUES (4, 'college Math', '明道', 'Math', 2, 18.90, '复旦大学出版社', 'images/b2.jpg', 'erg');
INSERT INTO `bookInfo` VALUES (5, 'C++', 'Mark', 'Computer', 2, 19.60, '西北工业大学出版社', 'images/b3.jpg', 'rgtrbh');
INSERT INTO `bookInfo` VALUES (6, 'Python ', 'Jack', 'Computer', 2, 21.50, '北京大学出版社', 'images/b5.jpg', 'rhgtyj');

-- ----------------------------
-- Table structure for borrowInfo
-- ----------------------------
DROP TABLE IF EXISTS `borrowInfo`;
CREATE TABLE `borrowInfo`  (
  `bookID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrowDate` date NULL DEFAULT NULL,
  `returnDate` date NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `borrowInfo_ibfk_1`(`userID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrowInfo
-- ----------------------------
INSERT INTO `borrowInfo` VALUES ('A11', 'C', '0173975', '王小明', '谭浩强', '2019-07-02', '2019-07-24', 1);
INSERT INTO `borrowInfo` VALUES ('A12', 'C', '0173974', '黄小冬', '谭浩强', '2019-07-02', '2019-07-17', 9);
INSERT INTO `borrowInfo` VALUES ('A51', 'C++', '0173975', '王小明', 'Mark', '2019-07-02', '2019-08-02', 10);
INSERT INTO `borrowInfo` VALUES ('A52', 'C++', '1173559', '蔡成功', 'Mark', '2019-07-03', '2019-10-03', 11);
INSERT INTO `borrowInfo` VALUES ('A22', ' English', '0173974', '黄小冬', '刘旭斌', '2019-07-03', '2019-08-03', 13);
INSERT INTO `borrowInfo` VALUES ('A61', 'Python ', '0173975', '王小明', 'Jack', '2019-07-03', '2019-08-03', 14);
INSERT INTO `borrowInfo` VALUES ('A31', 'JAVA', '1173559', '蔡成功', '蔡立', '2019-07-03', '2019-10-03', 15);

-- ----------------------------
-- Table structure for userInfo
-- ----------------------------
DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo`  (
  `userID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrowed` int(5) NULL DEFAULT NULL,
  `allowLend` int(5) NULL DEFAULT NULL,
  `ownMoney` float(5, 0) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userInfo
-- ----------------------------
INSERT INTO `userInfo` VALUES ('0173974', '黄小冬', '12345', '男', NULL, '14683467578@163.com', '学生', 2, 18, 0, 1);
INSERT INTO `userInfo` VALUES ('0173975', '王小明', '12345', '男', NULL, '19297259246@qq.com', '学生', 3, 17, 0, 2);
INSERT INTO `userInfo` VALUES ('1173556', '李红', '123456', '女', NULL, '35346545@qq.com', '管理员', NULL, NULL, 0, 3);
INSERT INTO `userInfo` VALUES ('1173559', '蔡成功', '123456', '男', NULL, '436525436@163.com', '管理员', 2, 38, 0, 4);
INSERT INTO `userInfo` VALUES ('1173975', 'erg', '123', '男', NULL, '232453@13w.com', 'student', NULL, NULL, NULL, 5);

-- ----------------------------
-- Procedure structure for addBID
-- ----------------------------
DROP PROCEDURE IF EXISTS `addBID`;
delimiter ;;
CREATE PROCEDURE `addBID`(IN bNum INT(11),IN num INT,IN bName varchar(10),IN au varchar(10))
BEGIN
DECLARE bID varchar(20);
DECLARE i int DEFAULT 1;

	 while i<=num DO
	 set bID=CONCAT('A',bNum,i);
	 INSERT into bookIDInfo values(bID,bNum,bName,au,"1");
	 set i=i+1;
	 END WHILE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for CheckBorrow
-- ----------------------------
DROP PROCEDURE IF EXISTS `CheckBorrow`;
delimiter ;;
CREATE PROCEDURE `CheckBorrow`(IN uID varchar(10),IN bName VARCHAR(10))
BEGIN
 DECLARE num int;
 set num=(SELECT count(*) from borrowInfo where userID=uID and bookName=bName);
 
 if(num>=1) then
 SELECT num;
 end if;
 
 if(num=0) then
 SELECT 0;
 end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for findBID
-- ----------------------------
DROP PROCEDURE IF EXISTS `findBID`;
delimiter ;;
CREATE PROCEDURE `findBID`(IN bNum INT)
BEGIN
DECLARE bID VARCHAR(10);
	set @bID=(SELECT bookID from bookIDInfo WHERE state='1' and bookNum=bNum order by bookID limit 1);	
	SELECT @bID;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table bookInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `addBookID`;
delimiter ;;
CREATE TRIGGER `addBookID` AFTER INSERT ON `bookInfo` FOR EACH ROW BEGIN
DECLARE bNum INT(5);
DECLARE bName VARCHAR(10);
DECLARE au VARCHAR(10);
DECLARE reNum INT(5);
set bNum=new.bookNum;
set bName=new.bookName;
set au=new.author;
set reNum=new.remainNum;
CALL addBID(bNum,reNum,bName,au);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `upID`;
delimiter ;;
CREATE TRIGGER `upID` AFTER INSERT ON `borrowInfo` FOR EACH ROW BEGIN
declare bID varchar(20);
set bID=new.bookID;
update bookIDInfo SET state='0' where bookID=bID;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `upNum`;
delimiter ;;
CREATE TRIGGER `upNum` AFTER INSERT ON `borrowInfo` FOR EACH ROW BEGIN
declare au varchar(10);
declare bname varchar(10);
declare rn int;
set au=new.author;
set bname=new.bookName;
set rn=(select remainNum from bookInfo where bookName=bname and author=au);
update bookInfo SET remainNum=rn-1 where bookName=bname and author=au;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `upBook`;
delimiter ;;
CREATE TRIGGER `upBook` AFTER INSERT ON `borrowInfo` FOR EACH ROW BEGIN
declare bo int;
declare allow int;
declare uID varchar(10);
declare iden varchar(10);
set uID=new.userID;
set bo=(select borrowed from userInfo where userID=uID);
set allow =(select allowLend from userInfo where userID=uID);

if LEFT(uID,1)='0' then 
update userInfo SET borrowed=bo+1 where userID=uID;
update userInfo SET allowLend=19-bo where userID=uID;
end if;

if LEFT(uID,1)='1' then 
update userInfo SET borrowed=bo+1 where userID=uID;
update userInfo SET allowLend=39-bo where userID=uID;
end if;

End
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `downID`;
delimiter ;;
CREATE TRIGGER `downID` AFTER DELETE ON `borrowInfo` FOR EACH ROW BEGIN
declare bID varchar(20);
set bID=old.bookID;
update bookIDInfo SET state='1' where bookID=bID;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `downNum`;
delimiter ;;
CREATE TRIGGER `downNum` AFTER DELETE ON `borrowInfo` FOR EACH ROW BEGIN
declare au varchar(10);
declare bname varchar(10);
declare rn int;
set au=old.author;
set bname=old.bookName;
set rn=(select remainNum from bookInfo where bookName=bname and author=au);
update bookInfo SET remainNum=rn+1 where bookName=bname and author=au;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table borrowInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `downBook`;
delimiter ;;
CREATE TRIGGER `downBook` AFTER DELETE ON `borrowInfo` FOR EACH ROW BEGIN
declare bo int;
declare allow int;
declare uID varchar(10);
declare iden varchar(10);
set uID=old.userID;
set bo=(select borrowed from userInfo where userID=uID);
set allow =(select allowLend from userInfo where userID=uID);

if LEFT(uID,1)='0' then 
update userInfo SET borrowed=bo-1 where userID=uID;
update userInfo SET allowLend=21-bo where userID=uID;
end if;

if LEFT(uID,1)='1' then 
update userInfo SET borrowed=bo-1 where userID=uID;
update userInfo SET allowLend=41-bo where userID=uID;
end if;

End
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table userInfo
-- ----------------------------
DROP TRIGGER IF EXISTS `addAno`;
delimiter ;;
CREATE TRIGGER `addAno` AFTER INSERT ON `userInfo` FOR EACH ROW BEGIN
DECLARE iName varchar(255);
DECLARE uID varchar(10);
DECLARE uName varchar(10);
DECLARE num int;
set num=(select COUNT(*) from SystemInfo);
set uID=new.userID;
set uName=new.userName;
INSERT INTO SystemInfo VALUES(num+1,"欢迎邮件",'1',uID,CONCAT("欢迎您，尊敬的",uName,"用户!"),Now());
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
