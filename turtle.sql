-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- turtle 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `turtle` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `turtle`;

-- 테이블 turtle.basket 구조 내보내기
CREATE TABLE IF NOT EXISTS `basket` (
  `mId` varchar(50) DEFAULT NULL,
  `pName` varchar(50) DEFAULT NULL,
  `pCountsSell` int(50) DEFAULT NULL,
  `pPrice` int(50) DEFAULT NULL,
  `pPriceSell` int(50) DEFAULT NULL,
  `pUrl` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.basket:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT IGNORE INTO `basket` (`mId`, `pName`, `pCountsSell`, `pPrice`, `pPriceSell`, `pUrl`) VALUES
	('wty123', '프로틴(초콜릿맛)', 1, 8000, 8000, 'resources/assets/FoodImg/f2.jpg'),
	('wty123', '덤벨', 1, 4000, 4000, 'resources/assets/HealthImg/Dumbbell.PNG'),
	('wty123', '벤치프레스', 2, 1200000, 2400000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wty159', '덤벨', 1, 4000, 4000, 'resources/assets/HealthImg/Dumbbell.PNG'),
	('wty159', '요가복(여성)', 1, 22000, 22000, 'resources/assets/YogaImg/YogaClothes.PNG'),
	('wty159', '요가매트', 3, 8000, 24000, 'resources/assets/YogaImg/YogaFoamBlur.PNG'),
	('wty123', '새우샐러드', 2, 3000, 6000, 'resources/assets/FoodImg/Salad.jpg'),
	('wty123', '핸들링봉', 3, 11000, 33000, 'resources/assets/YogaImg/y1.jpg'),
	('wty123', '스쿼트기구', 2, 700000, 1400000, 'resources/assets/HealthImg/Squat.PNG'),
	('wty123', '어깨당겨기구', 4, 800000, 3200000, 'resources/assets/HealthImg/LatPullDown.PNG'),
	('wty123', '벤치프레스', 1, 1200000, 1200000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wty123', '벤치프레스', 1, 1200000, 1200000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wty123', '벤치프레스', 1, 1200000, 1200000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wty123', '요가복(여성)', 1, 22000, 22000, 'resources/assets/YogaImg/YogaClothes.PNG'),
	('wty123', '벤치프레스', 1, 1200000, 1200000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wty123', '벤치프레스', 1, 1200000, 1200000, 'resources/assets/HealthImg/BenchPress.PNG'),
	('wkdgurtn', '맛있닭(닭가슴살)', 1, 5000, 5000, 'resources/assets/FoodImg/ChickenBreast.PNG'),
	('wkdgurtn', '하체튼튼철봉', 1, 800000, 800000, 'resources/assets/HealthImg/h1.jpg'),
	('wkdgurtn', '핸들링봉', 1, 11000, 11000, 'resources/assets/YogaImg/y1.jpg'),
	('wkdgurtn', '다이어트 도시락', 1, 6000, 6000, 'resources/assets/FoodImg/DietLunchBox.jpg'),
	('wkdgurtn', '다이어트 도시락', 1, 6000, 6000, 'resources/assets/FoodImg/DietLunchBox.jpg'),
	('wkdgurtn', '돌기마사지봉', 1, 2000, 2000, 'resources/assets/YogaImg/y2.jpg'),
	('wkdgurtn', '덤벨', 1, 4000, 4000, 'resources/assets/HealthImg/Dumbbell.PNG'),
	('wkdgurtn', '요가복(여성)', 1, 22000, 22000, 'resources/assets/YogaImg/YogaClothes.PNG'),
	('wyt15', '하체튼튼철봉', 2, 800000, 1600000, 'resources/assets/HealthImg/h1.jpg'),
	('wkdgurtn', '다이어트 도시락', 2, 6000, 12000, 'resources/assets/FoodImg/DietLunchBox.jpg');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;

-- 테이블 turtle.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `mName` varchar(50) DEFAULT NULL,
  `bNum` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `bTitle` varchar(50) DEFAULT NULL,
  `bNote` varchar(1000) DEFAULT NULL,
  `bDate` date DEFAULT sysdate(),
  `bCate` varchar(50) DEFAULT NULL,
  `bReply` varchar(50) DEFAULT '답변없음.',
  PRIMARY KEY (`bNum`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.board:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT IGNORE INTO `board` (`mName`, `bNum`, `bTitle`, `bNote`, `bDate`, `bCate`, `bReply`) VALUES
	('에이', 1, '제품에 이상이많아요', '환불요청을하고싶은데 어디를 이용하면될까요??', '2021-05-17', '상품관련', '그냥써주세요.'),
	('장혁수', 2, '안녕하세요', '죽을맛이예요', '2021-05-25', '기타', '안녕안해요.'),
	('장혁수', 3, '테스트입니다', '그만하고싶어요', '2021-05-25', '배송관련', '더 하셔야됩니다 슨생님'),
	('에이', 11, '찐확인', '테스트 완료', '2021-05-30', '상품관련', '답변없음.');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 turtle.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cartNum` int(11) NOT NULL,
  `mId` varchar(50) NOT NULL,
  `pNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  `addDate` date NOT NULL DEFAULT sysdate(),
  PRIMARY KEY (`cartNum`,`mId`),
  KEY `cart_mId` (`mId`),
  KEY `cart_pNum` (`pNum`),
  CONSTRAINT `cart_mId` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `cart_pNum` FOREIGN KEY (`pNum`) REFERENCES `product` (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.cart:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT IGNORE INTO `cart` (`cartNum`, `mId`, `pNum`, `cartStock`, `addDate`) VALUES
	(1013, 'wty123', 1, 2, '2021-05-30'),
	(1014, 'wty123', 10, 3, '2021-05-30'),
	(1015, 'aaa', 16, 1, '2021-05-30'),
	(1016, 'aaa', 4, 4, '2021-05-30'),
	(1017, 'aaa', 13, 2, '2021-05-30'),
	(1018, 'wty123', 17, 3, '2021-05-30'),
	(2001, 'wyt15', 2, 1, '2021-05-30'),
	(2002, 'wkdgurtn', 15, 1, '2021-05-30'),
	(2003, 'wkdgurtn', 18, 1, '2021-05-30'),
	(2004, 'wkdgurtn', 16, 1, '2021-05-30'),
	(2005, 'wyt15', 3, 1, '2021-05-30'),
	(2006, 'wyt15', 3, 1, '2021-05-30');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 turtle.cart_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 turtle.cart_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart_seq` DISABLE KEYS */;
INSERT IGNORE INTO `cart_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(3001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `cart_seq` ENABLE KEYS */;

-- 테이블 turtle.cashlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `cashlist` (
  `cNum` int(50) NOT NULL AUTO_INCREMENT,
  `mId` varchar(50) DEFAULT NULL,
  `mName` varchar(50) DEFAULT NULL,
  `pPrice` int(50) DEFAULT NULL,
  `pCount` int(50) DEFAULT NULL,
  `pCate` varchar(50) DEFAULT NULL,
  `pName` varchar(50) DEFAULT NULL,
  `mAddr` varchar(50) DEFAULT NULL,
  `mEmail` varchar(50) DEFAULT NULL,
  `cMailNum` varchar(50) DEFAULT NULL,
  `cName` varchar(50) DEFAULT NULL,
  `cPhone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cNum`)
) ENGINE=InnoDB AUTO_INCREMENT=1111120 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.cashlist:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cashlist` DISABLE KEYS */;
INSERT IGNORE INTO `cashlist` (`cNum`, `mId`, `mName`, `pPrice`, `pCount`, `pCate`, `pName`, `mAddr`, `mEmail`, `cMailNum`, `cName`, `cPhone`) VALUES
	(1111111, 'wty123', '원태연', 400000, 1, '헬스기구', '런닝머신', NULL, NULL, NULL, NULL, NULL),
	(1111112, 'wty123', '원태연', 10000, 3, 'aaaa', 'bbbb', NULL, NULL, NULL, NULL, NULL),
	(1111115, 'wkdgurtn', '추효동', 2000, 1, '요가상품', '돌기마사지봉', '당고개 어딘가', 'cncn@naver', '100000', '추효동', '1011112222'),
	(1111116, 'wyt15', '장혁수', 18000, 3, '운동식품', '다이어트 도시락', '서울 노원구 꾸준로94길 7', 'emak18@naver.com', '1122', '장혁수', '11111111');
/*!40000 ALTER TABLE `cashlist` ENABLE KEYS */;

-- 테이블 turtle.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `FILE_NO` int(11) DEFAULT NULL,
  `BNO` int(11) DEFAULT NULL,
  `ORG_FILE_NAME` varchar(50) DEFAULT NULL,
  ` STORED_FILE_NAME` varchar(50) DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `REGDATE` date DEFAULT NULL,
  `DEL_GB` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- 테이블 turtle.jumun 구조 내보내기
CREATE TABLE IF NOT EXISTS `jumun` (
  `jNum` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(50) DEFAULT NULL,
  `jShipPrice` int(11) DEFAULT NULL,
  `jMile` int(11) DEFAULT NULL,
  `jPrice` int(50) DEFAULT NULL,
  `jCount` int(50) DEFAULT NULL,
  `jCustomer` varchar(50) DEFAULT NULL,
  `jId` varchar(50) DEFAULT NULL,
  `jUrl` varchar(50) DEFAULT NULL,
  `jShip` varchar(50) DEFAULT NULL,
  `jJumunDate` date DEFAULT sysdate(),
  `jFinishDate` date DEFAULT sysdate(),
  `jState` varchar(50) DEFAULT NULL,
  `jMemo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jNum`)
) ENGINE=InnoDB AUTO_INCREMENT=1111240 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.jumun:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `jumun` DISABLE KEYS */;
INSERT IGNORE INTO `jumun` (`jNum`, `jName`, `jShipPrice`, `jMile`, `jPrice`, `jCount`, `jCustomer`, `jId`, `jUrl`, `jShip`, `jJumunDate`, `jFinishDate`, `jState`, `jMemo`) VALUES
	(1111234, '프로틴(초콜릿맛)', 3000, 1000, 16000, 2, '장혁수', 'wyt15', 'resources/assets/FoodImg/f2.jpg', '배송중', '2021-05-11', '2021-05-11', '승인', '부재시 경비실에 맡겨주세요.'),
	(1111235, '하체튼튼철봉', 3000, 1000, 800000, 1, '원태연', 'toowm554', 'resources/assets/HealthImg/h1.jpg', '배송완료', '2021-05-17', '2021-05-17', '승인', '부재시 경비실에 맡겨주세요.'),
	(1111236, '핸들링봉', 3000, 500, 33000, 3, '장혁수', 'wyt15', 'resources/assets/YogaImg/y1.jpg', '배송완료', '2021-05-18', '2021-05-18', '승인', '부재시 경비실에 맡겨주세요.'),
	(1111237, '하체튼튼철봉', 3000, 1000, 800000, 1, '추효동', 'wkdgurtn', 'resources/assets/HealthImg/h1.jpg', '배송완료', '2021-05-31', '2021-05-31', '승인', '문앞에 놔주세요.'),
	(1111238, '핸들링봉', 3000, 300, 11000, 1, '추효동', 'wkdgurtn', 'resources/assets/YogaImg/y1.jpg', '배송중', '2021-05-24', '2021-05-24', '미승인', '문앞에 놔주세요.'),
	(1111239, '프로틴(초콜릿맛)', 3000, 1000, 16000, 2, '추효동', 'wkdgurtn', 'resources/assets/FoodImg/f2.jpg', '배송준비', '2021-05-31', '2021-05-31', '미승인', '부재시 경비실에 맡겨주세요.');
/*!40000 ALTER TABLE `jumun` ENABLE KEYS */;

-- 테이블 turtle.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `mId` varchar(50) NOT NULL,
  `mPw` varchar(50) DEFAULT NULL,
  `mName` varchar(50) DEFAULT NULL,
  `mGender` varchar(50) DEFAULT NULL,
  `mPhone` varchar(15) DEFAULT NULL,
  `mBirth` date DEFAULT NULL,
  `mEmail` varchar(50) DEFAULT NULL,
  `mAddr` varchar(50) DEFAULT NULL,
  `mGrade` varchar(50) DEFAULT NULL,
  `mNote` varchar(1000) DEFAULT NULL,
  `mList` varchar(50) DEFAULT NULL,
  `mMile` int(15) DEFAULT NULL,
  `mCumulmile` int(15) DEFAULT NULL,
  `mMaster` int(2) DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.member:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT IGNORE INTO `member` (`mId`, `mPw`, `mName`, `mGender`, `mPhone`, `mBirth`, `mEmail`, `mAddr`, `mGrade`, `mNote`, `mList`, `mMile`, `mCumulmile`, `mMaster`) VALUES
	('aaa', 'aaa', '에이', '여성', '01011112222', '2021-05-24', 'aaa@naver.com', '경기도 에이동 에이에이 11', '골드', NULL, NULL, 30, 60, 0),
	('bbb', '222', '비비', '여성', '01022221111', '2021-05-11', 'bbb22@naver.com', '경기도 비비동 비비해 22리', '실버', NULL, NULL, 0, 0, 0),
	('ccc', '333', '씨씨', '여성', '01054872154', '2021-05-11', 'ccc33@naver.com', '서울 씨씨해 씨씨놉 33로 4', '실버', NULL, NULL, 0, 0, 0),
	('ddd', '444', '디디', '남성', '01033367842', '2021-05-11', 'ddd44@naver.com', '전라북도 덜덜해 덜덜리 55길 8', '플래티넘', NULL, NULL, 0, 0, 0),
	('ggw21', 'gg521', '김규헌', '남성', '01087761245', '2021-05-11', 'gg121@naver.com', '서울 헬스해 헬스로 24길 5', '플래티넘', NULL, NULL, 0, 0, 1),
	('gow12', 'faa64', '이동진', '남성', '01055432158', '2021-05-11', 'gow64@naver.com', '서울 운동구 빠릇리 88길 8', '플래티넘', NULL, NULL, 0, 0, 1),
	('toowm654', 'bb55', '원태연', '남성', '01089764124', '2021-05-11', 'foew8@naver.com', '서울 꾸준동 꾸준리 88길 7', '플래티넘', NULL, NULL, 0, 0, 1),
	('wkdgurtn', 'wkdgurtn', '추효동', '남성', '01066677788', '2021-05-10', 'cncn@naver', '당고개 어딘가', '브론즈', NULL, NULL, 0, 0, 0),
	('wyt15', 's554', '장혁수', '남성', '01054871154', '1998-03-04', 'emak18@naver.com', '서울 노원구 꾸준로94길 7', '플래티넘', NULL, NULL, 300, 1500, 1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 turtle.my_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `my_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 turtle.my_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `my_seq` DISABLE KEYS */;
INSERT IGNORE INTO `my_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(1001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `my_seq` ENABLE KEYS */;

-- 테이블 turtle.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `pNum` int(11) NOT NULL,
  `pName` varchar(50) DEFAULT NULL,
  `pCate` varchar(50) DEFAULT NULL,
  `pPrice` int(50) DEFAULT NULL,
  `pShip` varchar(50) DEFAULT NULL,
  `pCount` int(11) DEFAULT NULL,
  `pCountSell` int(11) DEFAULT NULL,
  `pCumulSell` int(11) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pUrl` varchar(50) DEFAULT NULL,
  `pMan` int(11) DEFAULT NULL,
  `pWoman` int(11) DEFAULT NULL,
  PRIMARY KEY (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.product:~18 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`pNum`, `pName`, `pCate`, `pPrice`, `pShip`, `pCount`, `pCountSell`, `pCumulSell`, `pMile`, `pUrl`, `pMan`, `pWoman`) VALUES
	(1, '맛있닭(닭가슴살)', '운동식품', 5000, '무료배송', 300, 5, 25000, 1, 'resources/assets/FoodImg/ChickenBreast.PNG', 1, 2),
	(2, '다이어트 도시락', '운동식품', 6000, '무료배송', 50, 3, 18000, 1, 'resources/assets/FoodImg/DietLunchBox.jpg', 1, 2),
	(3, '프로틴(ISOLATE)', '운동식품', 11000, '무료배송', 60, 7, 77000, 1, 'resources/assets/FoodImg/f1.jpg', 1, 2),
	(4, '프로틴(초콜릿맛)', '운동식품', 12000, '무료배송', 80, 5, 60000, 1, 'resources/assets/FoodImg/f2.jpg', 2, 1),
	(5, '프로틴(에이치프로틴)', '운동식품', 9000, '무료배송', 300, 8, 72000, 1, 'resources/assets/FoodImg/f3.jpg', 3, 1),
	(6, '새우샐러드', '운동식품', 3000, '무료배송', 300, 4, 12000, 1, 'resources/assets/FoodImg/Salad.jpg', 2, 1),
	(7, '아이스고구마', '운동식품', 2600, '무료배송', 300, 3, 7800, 1, 'resources/assets/FoodImg/SweatPotato.jpg', 8, 1),
	(8, '벤치프레스', '헬스기구', 1200000, '무료배송', 100, 6, 7200000, 1, 'resources/assets/HealthImg/BenchPress.PNG', 5, 0),
	(9, '덤벨', '헬스기구', 4000, '무료배송', 100, 4, 16000, 1, 'resources/assets/HealthImg/Dumbbell.PNG', 3, 1),
	(10, '하체튼튼철봉', '헬스기구', 800000, '무료배송', 100, 9, 7200000, 1, 'resources/assets/HealthImg/h1.jpg', 1, 0),
	(11, '어깨당겨기구', '헬스기구', 800000, '무료배송', 100, 2, 1600000, 1, 'resources/assets/HealthImg/LatPullDown.PNG', 1, 1),
	(12, '런닝머신', '헬스기구', 400000, '무료배송', 100, 5, 2000000, 1, 'resources/assets/HealthImg/RunningMachine.PNG', 3, 2),
	(13, '스쿼트기구', '헬스기구', 700000, '무료배송', 100, 1, 700000, 1, 'resources/assets/HealthImg/Squat.PNG', 9, 1),
	(14, '핸들링봉', '요가상품', 11000, '무료배송', 100, 8, 88000, 1, 'resources/assets/YogaImg/y1.jpg', 1, 7),
	(15, '돌기마사지봉', '요가상품', 2000, '무료배송', 100, 12, 24000, 1, 'resources/assets/YogaImg/y2.jpg', 4, 8),
	(16, '요가복(여성)', '요가상품', 22000, '일반배송', 100, 5, 110000, 2, 'resources/assets/YogaImg/YogaClothes.PNG', 0, 5),
	(17, '요가매트', '요가상품', 8000, '무료배송', 100, 7, 56000, 1, 'resources/assets/YogaImg/YogaFoamBlur.PNG', 1, 6),
	(18, '요가매트(칼라)', '요가상품', 9000, '무료배송', 100, 2, 18000, 1, 'resources/assets/YogaImg/YogaMat.PNG', 1, 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 turtle.refundboard 구조 내보내기
CREATE TABLE IF NOT EXISTS `refundboard` (
  `rNum` int(255) NOT NULL AUTO_INCREMENT,
  `rId` varchar(50) DEFAULT NULL,
  `rName` varchar(50) DEFAULT NULL,
  `rEmail` varchar(50) DEFAULT NULL,
  `rPhone` varchar(50) DEFAULT NULL,
  `rGrade` varchar(50) DEFAULT NULL,
  `rProduct` varchar(50) DEFAULT NULL,
  `rUrl` varchar(50) DEFAULT NULL,
  `rNote` varchar(50) DEFAULT NULL,
  `rDate` date DEFAULT sysdate(),
  `rJumunDate` date DEFAULT sysdate(),
  `rFinishDate` date DEFAULT sysdate(),
  `rCheck` int(11) DEFAULT NULL,
  PRIMARY KEY (`rNum`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.refundboard:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `refundboard` DISABLE KEYS */;
INSERT IGNORE INTO `refundboard` (`rNum`, `rId`, `rName`, `rEmail`, `rPhone`, `rGrade`, `rProduct`, `rUrl`, `rNote`, `rDate`, `rJumunDate`, `rFinishDate`, `rCheck`) VALUES
	(1, 'wkdgurtn', '추효동', 'cncn@naver', '01066677788', '브론즈', '다이어트 도시락', 'resources/assets/FoodImg/DietLunchBox.jpg', '상한거같은 맛이예요 유통기한도 아슬아슬하고 환불요청합니다. ', '2021-05-19', '2021-05-17', '2021-05-18', 1),
	(2, 'ggw21', '김규헌', 'gg121@naver.com', '01087761245', '플래티넘', '어깨당겨기구', 'resources/assets/HealthImg/LatPullDown.PNG', '어깨당겨기구가아니라 온몸이 당기네요 환불요청합니다.', '2021-05-19', '2021-05-15', '2021-05-18', 1),
	(3, 'toowm654', '원태연', 'foew8@naver.com', '01089764124', '플래티넘', '덤벨', 'resources/assets/HealthImg/Dumbbell.PNG', '철인줄알았는데 고무네요. 환불요청합니다.', '2021-05-28', '2021-05-26', '2021-05-28', 0),
	(5, 'wyt15', '장혁수', 'emak18@naver.com', '01054871154', '플래티넘', '핸들링봉', 'resources/assets/YogaImg/y1.jpg', '고무가아니네요.', '2021-05-28', '2021-05-18', '2021-05-18', 0);
/*!40000 ALTER TABLE `refundboard` ENABLE KEYS */;

-- 테이블 turtle.sell 구조 내보내기
CREATE TABLE IF NOT EXISTS `sell` (
  `sProduct` varchar(50) DEFAULT NULL,
  `sId` varchar(50) DEFAULT NULL,
  `sCate` varchar(50) DEFAULT NULL,
  `sPrice` int(50) DEFAULT NULL,
  `sCount` int(50) DEFAULT NULL,
  `sCustomer` varchar(50) DEFAULT NULL,
  `sGender` varchar(50) DEFAULT NULL,
  `sDate` date DEFAULT sysdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.sell:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT IGNORE INTO `sell` (`sProduct`, `sId`, `sCate`, `sPrice`, `sCount`, `sCustomer`, `sGender`, `sDate`) VALUES
	('프로틴(초콜릿맛)', 'wkdgurtn', '운동식품', 8000, 1, '추효동', '남성', '2021-05-21'),
	('프로틴(초콜릿맛)', 'wyt15', '운동식품', 16000, 2, '장혁수', '남성', '2021-05-21'),
	('덤벨', 'ggw21', '헬스기구', 4000, 1, '김규헌', '남성', '2021-05-21'),
	('덤벨', 'gow12', '헬스기구', 40000, 10, '이동진', '남성', '2021-05-21'),
	('핸들링봉', 'bbb', '요가상품', 55000, 5, '비비', '여성', '2021-05-21'),
	('벤치프레스', 'aaa', '헬스기구', 1200000, 1, '에이', '여성', '2021-05-21');
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
