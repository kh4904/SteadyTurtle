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

-- 테이블 turtle.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `mName` varchar(50) DEFAULT NULL,
  `bNum` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `bTitle` varchar(50) DEFAULT NULL,
  `bNote` varchar(1000) DEFAULT NULL,
  `bDate` date DEFAULT sysdate(),
  `bCate` varchar(50) DEFAULT NULL,
  `bReply` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`bNum`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.board:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT IGNORE INTO `board` (`mName`, `bNum`, `bTitle`, `bNote`, `bDate`, `bCate`, `bReply`) VALUES
	('에이', 1, 'ㅎㅇㅎㅇ', '안녕하세요', '2021-05-16', '상품관련', '오호호호 안녕하세요'),
	('최진표', 2, '이게뭐죠?', '이게뭔가요?', '2021-05-16', '상품관련', '글쎼요..?'),
	('에이', 3, '제품에 이상이많아요', '환불요청을하고싶은데 어디를 이용하면될까요??', '2021-05-17', '상품관련', '환불요청게시판이용바랍니다.'),
	('원태연', 14, '고객전화번호좀여', '번호알고싶네요.', '2021-05-31', '상품관련', '제 번호는 귀해서요ㅎ.'),
	('원태연', 15, '프로틴 반개만팔아주세요', 'ㅈㄱㄴ', '2021-05-31', '상품관련', '반으로 쪼개지실래요?'),
	('원태연', 16, '세일기간있나요', 'ㅈㄱㄴ', '2021-05-31', '상품관련', '없습니다.'),
	('장혁수', 22, '배송언제되나요?', '배송언제 오나요?', '2021-06-08', '배송관련', '답변없음.'),
	('장혁수', 23, '택배상태가이상합니다.', '택배가 너무 파손되었는데 해명점요', '2021-06-08', '기타', '답변없음.');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 turtle.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cartNum` int(11) NOT NULL,
  `mId` varchar(50) NOT NULL,
  `pNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  `addDate` date NOT NULL DEFAULT sysdate(),
  `pPrice` int(11) DEFAULT NULL,
  `pName` varchar(50) DEFAULT NULL,
  `pUrl` varchar(255) DEFAULT NULL,
  `pCate` varchar(50) DEFAULT NULL,
  `pShip` varchar(50) DEFAULT NULL,
  `pCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartNum`,`mId`,`pNum`) USING BTREE,
  KEY `cart_mId` (`mId`),
  KEY `cart_pNum` (`pNum`),
  CONSTRAINT `cart_mId` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `cart_pNum` FOREIGN KEY (`pNum`) REFERENCES `product` (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.cart:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT IGNORE INTO `cart` (`cartNum`, `mId`, `pNum`, `cartStock`, `addDate`, `pPrice`, `pName`, `pUrl`, `pCate`, `pShip`, `pCount`) VALUES
	(7017, 'aaa', 11, 1, '2021-06-07', 800000, '하체튼튼철봉', '\\HealthImg\\h1.jpg', '헬스기구', '0', NULL),
	(7018, 'aaa', 10, 4, '2021-06-07', 4000, '덤벨', '\\HealthImg\\Dumbbell.PNG', '헬스기구', '0', NULL),
	(9010, 'wyt15', 4, 1, '2021-06-08', 11000, '프로틴(ISOLATE)', '\\FoodImg\\f1.jpg', '운동식품', '0', NULL),
	(9022, 'wyt15', 12, 1, '2021-06-08', 800000, '어깨당겨기구', '\\HealthImg\\LatPullDown.PNG', '헬스기구', '0', NULL),
	(9024, 'wyt15', 10, 1, '2021-06-08', 4000, '덤벨', '\\HealthImg\\Dumbbell.PNG', '헬스기구', '0', NULL);
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
	(11001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `cart_seq` ENABLE KEYS */;

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
  `jNum` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `jName` varchar(50) DEFAULT NULL,
  `jCate` varchar(50) DEFAULT NULL,
  `jShipPrice` int(11) DEFAULT NULL,
  `jMile` int(11) DEFAULT NULL,
  `jPrice` int(50) DEFAULT NULL,
  `jCount` int(50) DEFAULT NULL,
  `jCustomer` varchar(50) DEFAULT NULL,
  `jId` varchar(50) DEFAULT NULL,
  `jEmail` varchar(50) DEFAULT NULL,
  `userAddr1` varchar(50) DEFAULT NULL,
  `userAddr2` varchar(50) DEFAULT NULL,
  `userAddr3` varchar(50) DEFAULT NULL,
  `jCatchName` varchar(50) DEFAULT NULL,
  `jPhone` varchar(50) DEFAULT NULL,
  `jUrl` varchar(50) DEFAULT NULL,
  `jShip` varchar(50) DEFAULT NULL,
  `jJumunDate` date DEFAULT sysdate(),
  `jFinishDate` date DEFAULT sysdate(),
  `jState` varchar(50) DEFAULT NULL,
  `jMemo` varchar(50) DEFAULT NULL,
  `pNum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.jumun:~14 rows (대략적) 내보내기
/*!40000 ALTER TABLE `jumun` DISABLE KEYS */;
INSERT IGNORE INTO `jumun` (`jNum`, `jName`, `jCate`, `jShipPrice`, `jMile`, `jPrice`, `jCount`, `jCustomer`, `jId`, `jEmail`, `userAddr1`, `userAddr2`, `userAddr3`, `jCatchName`, `jPhone`, `jUrl`, `jShip`, `jJumunDate`, `jFinishDate`, `jState`, `jMemo`, `pNum`) VALUES
	('999312', '어깨당겨기구', '헬스기구', 0, 400, 800000, 1, '원태연', 'wty123', 'foew8@naver.com', '경기 남양주시 진접읍 경복대로512번길 3', '51235', 'fasdasd', '원태연', '5123', '\\HealthImg\\LatPullDown.PNG', '환불완료', '2021-06-08', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 12),
	('947964', '덤벨', '헬스기구', 0, 200, 4000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '서울 강남구 강남대로156길 8', '102동 502호', ' (신사동)', '장혁수', '01047739480', '\\HealthImg\\Dumbbell.PNG', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 10),
	('999999', '하체튼튼철봉', '헬스기구', 0, 200, 800000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '서울 강남구 강남대로156길 8', '102동 502호', ' (신사동)', '장혁수', '01047739480', '\\HealthImg\\h1.jpg', '환불완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 11),
	('931528', '요가매트', '요가상품', 0, 0, 8000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강북구 4.19로13길 3', '경남아너스빌', ' (수유동)', '추효동', '01047739485', '\\YogaImg\\YogaFoamBlur.PNG', '배송완료', '2021-06-08', '2021-06-09', '배송', '부재시 경비실에 맡겨주세요.', 18),
	('931585', '핸들링봉', '요가상품', 0, 0, 11000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강북구 4.19로13길 3', '경남아너스빌', ' (수유동)', '추효동', '01047739485', '\\YogaImg\\y1.jpg', '배송완료', '2021-06-07', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 15),
	('955555', '맛있닭(닭가슴살)', '운동식품', 0, 200, 5000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '0', '0', '0', '장혁수', '010111112331', '\\FoodImg\\ChickenBreast.PNG', '배송완료', '2021-06-07', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 1),
	('941039', '런닝머신', '헬스기구', 0, 0, 400000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 노원구 덕릉로 94길 6 경남아너스빌 102동 502호', '경남', ' (천호동)', '장혁수', '012245412', '\\HealthImg\\RunningMachine.PNG', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 13),
	('987474', '프로틴(ISOLATE)', '운동식품', 0, 1000, 11000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강남구 언주로159길 5', '경남', ' (신사동)', '장혁수', '0104987431', '\\FoodImg\\f1.jpg', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 4),
	('961342', '요가복(여성)', '요가상품', 3000, 1000, 22000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강서구 곰달래로15가길 15', '경남', ' (화곡동)', '추효동', '01047739480', '\\YogaImg\\YogaClothes.PNG', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 17),
	('961342', '아이스고구마', '운동식품', 0, 1000, 2600, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강서구 곰달래로15가길 15', '경남', ' (화곡동)', '추효동', '01047739480', '\\FoodImg\\SweatPotato.jpg', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 8),
	('999998', '덤벨', '헬스기구', 0, 1000, 4000, 1, '추효동', 'wkdgurtn', 'cncn@naver', '서울 강서구 곰달래로15가길 15', '경남', ' (화곡동)', '추효동', '01047739480', '\\HealthImg\\Dumbbell.PNG', '배송완료', '2021-06-08', '2021-06-08', '배송', '부재시 경비실에 맡겨주세요.', 10),
	('907023', '돌기마사지봉', '요가상품', 0, 100, 2000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '경기 성남시 수정구 산성대로515번길 1', '102', ' (양지동)', '장혁수', '4534534', '\\YogaImg\\y2.jpg', '환불완료', '2021-06-08', '2021-06-09', '배송', '부재시 경비실에 맡겨주세요.', 16),
	('946836', '아이스고구마', '운동식품', 0, 0, 2600, 1, '장혁수', 'wyt15', 'emak18@naver.com', '서울 노원구 덕릉로 94길 6 경남아너스빌 102동 502호', '102', ' (공항동)', '장혁수', '010477931', '\\FoodImg\\SweatPotato.jpg', '배송완료', '2021-06-08', '2021-06-09', '배송', '부재시 경비실에 맡겨주세요.', 8),
	('954485', '맛있닭(닭가슴살)', '운동식품', 0, 1200, 5000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '충북 청주시 서원구 1순환로 627', '102', ' (사창동)', '장혁수', '010477773241', '\\FoodImg\\ChickenBreast.PNG', '배송완료', '2021-06-08', '2021-06-09', '배송', '부재시 경비실에 맡겨주세요.', 1),
	('959852', '핸들링봉', '요가상품', 0, 200, 11000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '충북 청주시 서원구 1순환로 627', '102호', ' (사창동)', '장혁수', '0104641315', '\\YogaImg\\y1.jpg', '배송완료', '2021-06-08', '2021-06-09', '배송', '부재시 경비실에 맡겨주세요.', 15),
	('921054', '요가 밴드', '요가상품', 0, 100, 105000, 3, '장혁수', 'wyt15', 'emak18@naver.com', '광주 남구 2순환로 1508', '102호', ' (송하동)', '장혁수', '01047743411', '\\YogaImg\\YogaBand.PNG', '배송완료', '2021-06-10', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 27),
	('921055', '요가 밴드', '요가상품', 0, 0, 70000, 2, '에이', 'aaa', 'aaa@naver.com', '서울 노원구 덕릉로 94길 6 경남아너스빌 102동 502호', '504호', ' (수유동)', '너가받아', '01012348874', '\\YogaImg\\YogaBand.PNG', '배송완료', '2021-06-10', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 27),
	('921056', '요가 밴드', '요가상품', 0, 0, 35000, 1, '씨씨', 'ccc', 'ccc33@naver.com', '강원 정선군 정선읍 5일장길 8', '항호', '(중계동)', '너가받아', '01088452414', '\\YogaImg\\YogaBand.PNG', '배송완료', '2021-06-10', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 27),
	('934056', '스쿼트기구', '헬스기구', 0, 500, 700000, 1, '장혁수', 'wyt15', 'emak18@naver.com', '경기 부천시 경인로412번길 9', '202호', ' (소사본동, 정안스타빌)', '장혁수', '01047738948', '\\HealthImg\\Squat.PNG', '배송중', '2021-06-10', NULL, '승인', '부재시 경비실에 맡겨주세요.', 14),
	('925137', '곤약젤리', '운동식품', 0, 200, 3500, 1, '장혁수', 'wyt15', 'emak18@naver.com', '서울 강남구 강남대로42길 11', '202호', ' (도곡동)', '장혁수', '01047891205', '\\FoodImg\\KonjacJelly.PNG', '배송중', '2021-06-10', NULL, '승인', '부재시 경비실에 맡겨주세요.', 23),
	('424732', '런닝머신', '헬스기구', 0, 0, 400000, 1, '원태연', 'wty123', 'foew8@naver.com', '경기 광주시 오포읍 오포로520번길 5-1', '502호', '(중계동)', '원태연', '01049981024', '\\HealthImg\\RunningMachine.PNG', '배송중', '2021-06-10', NULL, '승인', '부재시 경비실에 맡겨주세요.', 13),
	('424732', '핸들링봉', '요가상품', 0, 0, 11000, 1, '원태연', 'wty123', 'foew8@naver.com', '경기 광주시 오포읍 오포로520번길 5-1', '502호', '(중계동)', '원태연', '01049981024', '\\YogaImg\\y1.jpg', '배송완료', '2021-06-10', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 15),
	('424732', '다이어트 도시락', '운동식품', 0, 0, 6000, 1, '원태연', 'wty123', 'foew8@naver.com', '경기 광주시 오포읍 오포로520번길 5-1', '502호', '(중계동)', '원태연', '01049981024', '\\FoodImg\\DietLunchBox.jpg', '환불요청', '2021-06-10', '2021-06-10', '배송', '부재시 경비실에 맡겨주세요.', 3);
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
  `muserAddr1` varchar(50) DEFAULT NULL,
  `muserAddr2` varchar(50) DEFAULT NULL,
  `muserAddr3` varchar(50) DEFAULT NULL,
  `mGrade` varchar(50) DEFAULT NULL,
  `mNote` varchar(1000) DEFAULT NULL,
  `mMile` int(15) DEFAULT NULL,
  `mCumulmile` int(15) DEFAULT NULL,
  `mMaster` int(2) DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.member:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT IGNORE INTO `member` (`mId`, `mPw`, `mName`, `mGender`, `mPhone`, `mBirth`, `mEmail`, `muserAddr1`, `muserAddr2`, `muserAddr3`, `mGrade`, `mNote`, `mMile`, `mCumulmile`, `mMaster`) VALUES
	('aaa', 'aaa', '에이', '여성', '01011112222', '2021-05-24', 'aaa@naver.com', '경기도 에이에이', '11', '(에이동)', '골드', '없음.', 730, 760, 0),
	('bbb', '222', '비비', '여성', '01022221111', '2021-05-11', 'bbb22@naver.com', '경기도 비비해', '22리', '(비비동)', '실버', '없음.', 0, 0, 0),
	('casd', '123', 'cas', '남성', '12341', '2021-06-22', 'as@naver.c', '노원구 cas', '54', '(cas동)', '브론즈', '없음.', 0, 0, 0),
	('ccc', '333', '씨씨', '여성', '01054872154', '2021-05-11', 'ccc33@naver.com', '서울 씨씨해', '33로 4', '(씨씨놉)', '실버', '없음.', 350, 350, 0),
	('ccc123', '123', 'asdas', '남성', '123123', '2021-06-29', 'as@naver.c', '노원구', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '브론즈', '없음.', 0, 0, 0),
	('ddd', '444', '디디', '남성', '01033367842', '2021-05-11', 'ddd44@naver.com', '전라북도 덜덜해 덜덜리 55길 8', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '플래티넘', '없음.', 0, 0, 0),
	('ggw21', 'gg521', '김규헌', '남성', '01087761245', '2021-05-11', 'gg121@naver.com', '서울 헬스해 헬스로 24길 5', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '플래티넘', '없음.', 0, 0, 1),
	('gow12', 'faa64', '이동진', '남성', '01055432158', '2021-05-11', 'gow64@naver.com', '서울 운동구 빠릇리 88길 8', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '플래티넘', '없음.', 0, 0, 1),
	('wkdgurtn', 'wkdgurtn', '추효동', '남성', '01066677788', '2021-05-10', 'cncn@naver', '당고개 어딘가', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '브론즈', '없음.', 2546, 4746, 0),
	('wty123', '123', '원태연', '남성', '01089764124', '2021-05-11', 'foew8@naver.com', '서울 꾸준동 꾸준리 88길 7', '33로 4', ' (논현동, 휴먼스페이스주상복합아파트)', '플래티넘', '없음.', 7476, 7596, 1),
	('wyt15', 's554', '장혁수', '남성', '01054871159', '1998-03-04', 'emak18@naver.com', '서울 노원구 덕릉로 94길 6', '102동', '(중계동)', '플래티넘', '관리자입니다.', 10829, 18281, 1);
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
	(3001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `my_seq` ENABLE KEYS */;

-- 테이블 turtle.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `pNum` int(11) NOT NULL,
  `pName` varchar(50) DEFAULT NULL,
  `pCate` varchar(50) DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pShip` varchar(50) DEFAULT NULL,
  `pCount` int(11) DEFAULT NULL,
  `pCountSell` int(11) DEFAULT NULL,
  `pCumulSell` int(11) DEFAULT NULL,
  `pMile` int(11) DEFAULT NULL,
  `pUrl` varchar(255) DEFAULT NULL,
  `pMan` int(11) DEFAULT NULL,
  `pWoman` int(11) DEFAULT NULL,
  `pImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.product:~24 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT IGNORE INTO `product` (`pNum`, `pName`, `pCate`, `pPrice`, `pShip`, `pCount`, `pCountSell`, `pCumulSell`, `pMile`, `pUrl`, `pMan`, `pWoman`, `pImg`) VALUES
	(1, '맛있닭(닭가슴살)', '운동식품', 5000, '무료배송', 99, 300, 90000, 1, '\\FoodImg\\ChickenBreast.PNG', 200, 100, '\\FoodImg\\ChickenBreast.PNG'),
	(3, '다이어트 도시락', '운동식품', 6000, '무료배송', 286, 600, 108000, 1, '\\FoodImg\\DietLunchBox.jpg', 100, 500, '\\FoodImg\\DietLunchBox.jpg'),
	(4, '프로틴(ISOLATE)', '운동식품', 11000, '무료배송', 299, 300, 88000, 1, '\\FoodImg\\f1.jpg', 100, 200, '\\FoodImg\\f1.jpg'),
	(5, '프로틴(초콜릿맛)', '운동식품', 12000, '무료배송', 300, 450, 60000, 1, '\\FoodImg\\f2.jpg', 200, 150, '\\FoodImg\\f2.jpg'),
	(6, '프로틴(에이치프로틴)', '운동식품', 9000, '무료배송', 289, 361, 126000, 1, '\\FoodImg\\f3.jpg', 127, 234, '\\FoodImg\\f3.jpg'),
	(7, '새우샐러드', '운동식품', 3000, '무료배송', 295, 1252, 36000, 1, '\\FoodImg\\Salad.jpg', 1047, 205, '\\FoodImg\\Salad.jpg'),
	(8, '아이스고구마', '운동식품', 2600, '무료배송', 293, 461, 46800, 1, '\\FoodImg\\SweatPotato.jpg', 204, 257, '\\FoodImg\\SweatPotato.jpg'),
	(9, '벤치프레스', '헬스기구', 1200000, '무료배송', 300, 705, 6000000, 1, '\\HealthImg\\BenchPress.PNG', 504, 201, '\\HealthImg\\BenchPress.PNG'),
	(10, '덤벨', '헬스기구', 4000, '무료배송', 261, 641, 144000, 1, '\\HealthImg\\Dumbbell.PNG', 440, 201, '\\HealthImg\\Dumbbell.PNG'),
	(11, '하체튼튼철봉', '헬스기구', 800000, '무료배송', 299, 702, 9600000, 1, '\\HealthImg\\h1.jpg', 201, 501, '\\HealthImg\\h1.jpg'),
	(12, '어깨당겨기구', '헬스기구', 800000, '무료배송', 298, 207, 3200000, 1, '\\HealthImg\\LatPullDown.PNG', 102, 105, '\\HealthImg\\LatPullDown.PNG'),
	(13, '런닝머신', '헬스기구', 400000, '무료배송', 297, 1050, 3200000, 1, '\\HealthImg\\RunningMachine.PNG', 850, 200, '\\HealthImg\\RunningMachine.PNG'),
	(14, '스쿼트기구', '헬스기구', 700000, '무료배송', 296, 1111, 6300000, 1, '\\HealthImg\\Squat.PNG', 541, 570, '\\HealthImg\\Squat.PNG'),
	(15, '핸들링봉', '요가상품', 11000, '무료배송', 292, 648, 176000, 1, '\\YogaImg\\y1.jpg', 124, 524, '\\YogaImg\\y1.jpg'),
	(16, '돌기마사지봉', '요가상품', 2000, '무료배송', 285, 719, 48000, 1, '\\YogaImg\\y2.jpg', 147, 572, '\\YogaImg\\y2.jpg'),
	(17, '요가복(여성)', '요가상품', 22000, '일반배송', 297, 583, 176000, 2, '\\YogaImg\\YogaClothes.PNG', 125, 458, '\\YogaImg\\YogaClothes.PNG'),
	(18, '요가매트', '요가상품', 8000, '무료배송', 292, 542, 120000, 1, '\\YogaImg\\YogaFoamBlur.PNG', 302, 240, '\\YogaImg\\YogaFoamBlur.PNG'),
	(19, '요가매트(칼라)', '요가상품', 9000, '무료배송', 297, 985, 72000, 1, '\\YogaImg\\YogaMat.PNG', 145, 840, '\\YogaImg\\YogaMat.PNG'),
	(21, '닭가슴살 소시지', '운동식품', 6000, '무료배송', 100, 492, 18000, 1, '\\FoodImg\\ChickenSausage.PNG', 245, 247, '\\FoodImg\\ChickenSausage.PNG'),
	(23, '곤약젤리', '운동식품', 3500, '무료배송', 98, 658, 31000, 1, '\\FoodImg\\KonjacJelly.PNG', 457, 201, '\\FoodImg\\KonjacJelly.PNG'),
	(24, '요가 짐 볼', '요가상품', 35000, '무료배송', 94, 311, 228000, 1, '\\YogaImg\\YogaZymBall.PNG', 206, 105, '\\YogaImg\\YogaZymBall.PNG'),
	(25, '허리 보호 벨트', '헬스기구', 45000, '무료배송', 100, 880, 700000, 1, '\\HealthImg\\WaistBelt.PNG', 402, 478, '\\HealthImg\\WaistBelt.PNG'),
	(26, '손목 보호 장갑', '헬스기구', 25000, '무료배송', 100, 417, 700000, 1, '\\HealthImg\\Gloves.PNG', 240, 177, '\\HealthImg\\Gloves.PNG'),
	(27, '요가 밴드', '요가상품', 35000, '무료배송', 94, 473, 228000, 1, '\\YogaImg\\YogaBand.PNG', 205, 268, '\\YogaImg\\YogaBand.PNG');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 turtle.refundboard 구조 내보내기
CREATE TABLE IF NOT EXISTS `refundboard` (
  `rNum` int(255) NOT NULL AUTO_INCREMENT,
  `rId` varchar(50) DEFAULT NULL,
  `rName` varchar(50) DEFAULT NULL,
  `rEmail` varchar(50) DEFAULT NULL,
  `rPhone` varchar(50) DEFAULT NULL,
  `rGrade` varchar(50) DEFAULT NULL,
  `rNumber` int(11) DEFAULT NULL,
  `rProduct` varchar(50) DEFAULT NULL,
  `rUrl` varchar(50) DEFAULT NULL,
  `rNote` varchar(50) DEFAULT NULL,
  `rDate` date DEFAULT sysdate(),
  `rJumunDate` date DEFAULT sysdate(),
  `rFinishDate` date DEFAULT sysdate(),
  `rImg` varchar(255) DEFAULT NULL,
  `rCheck` int(11) DEFAULT NULL,
  PRIMARY KEY (`rNum`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.refundboard:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `refundboard` DISABLE KEYS */;
INSERT IGNORE INTO `refundboard` (`rNum`, `rId`, `rName`, `rEmail`, `rPhone`, `rGrade`, `rNumber`, `rProduct`, `rUrl`, `rNote`, `rDate`, `rJumunDate`, `rFinishDate`, `rImg`, `rCheck`) VALUES
	(1, 'wkdgurtn', '추효동', 'cncn@naver', '01066677788', '브론즈', 1111999, '다이어트 도시락', '\\FoodImg\\DietLunchBox.jpg', '상한거같은 맛이예요 유통기한도 아슬아슬하고 환불요청합니다. ', '2021-05-19', '2021-05-17', '2021-05-18', '\\FoodImg\\DietLunchBox.jpg', 1),
	(2, 'ggw21', '김규헌', 'gg121@naver.com', '01087761245', '플래티넘', 1111998, '어깨당겨기구', '\\HealthImg\\h1.jpg', '어깨당겨기구가아니라 온몸이 당기네요 환불요청합니다.', '2021-05-19', '2021-05-15', '2021-05-18', '\\HealthImg\\h1.jpg', 1),
	(3, 'toowm654', '원태연', 'foew8@naver.com', '01089764124', '플래티넘', 1111105, '덤벨', '\\HealthImg\\Dumbbell.PNG', '철인줄알았는데 고무네요. 환불요청합니다.', '2021-05-28', '2021-05-26', '2021-05-28', '\\HealthImg\\Dumbbell.PNG', 1),
	(16, 'wyt15', '장혁수', 'emak18@naver.com', '01054871154', '플래티넘', 1111236, '핸들링봉', '\\YogaImg\\y1.jpg', '제발되어라', '2021-06-01', '2021-06-01', '2021-06-01', '\\YogaImg\\y1.jpg', 1),
	(24, 'wty123', '원태연', 'foew8@naver.com', '01089764124', '플래티넘', 999312, '어깨당겨기구', '\\HealthImg\\LatPullDown.PNG', '너무 빡세네요.', '2021-06-10', '2021-06-08', '2021-06-10', '\\\\a8cd51e8-1190-4140-ab69-cff3c290d0eb_환불용.jpg', 1),
	(25, 'wty123', '원태연', 'foew8@naver.com', '01089764124', '플래티넘', 424732, '다이어트 도시락', '\\FoodImg\\DietLunchBox.jpg', '너무 맛없어요.', '2021-06-10', '2021-06-10', '2021-06-10', '\\\\1f500b21-6fa0-4875-b445-8e4689d04627_프로틴진상.jpg', 0);
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

-- 테이블 데이터 turtle.sell:~39 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT IGNORE INTO `sell` (`sProduct`, `sId`, `sCate`, `sPrice`, `sCount`, `sCustomer`, `sGender`, `sDate`) VALUES
	('프로틴(초콜릿맛)', 'wkdgurtn', '운동식품', 1800000, 100, '추효동', '남성', '2021-04-02'),
	('프로틴(초콜릿맛)', 'wyt15', '운동식품', 510000, 660, '장혁수', '남성', '2021-05-21'),
	('덤벨', 'ggw21', '헬스기구', 155012, 220, '김규헌', '남성', '2021-05-21'),
	('덤벨', 'gow12', '헬스기구', 1506000, 1005, '이동진', '남성', '2021-05-21'),
	('핸들링봉', 'bbb', '요가상품', 4900000, 1850, '비비', '남성', '2021-04-02'),
	('하체튼튼철봉', 'aaa', '헬스기구', 1200000, 560, '에이', '여성', '2021-06-10'),
	('덤벨', 'aaa', '운동식품', 400000, 200, '에이', '여성', '2021-04-02'),
	('새우샐러드', 'wty1235', '운동식품', 2712000, 200, '원태연', '남성', '2021-03-30'),
	('다이어트 도시락', 'wty123', '운동식품', 2800000, 1480, '원태연', '남성', '2021-04-02'),
	('핸들링봉', 'aaa', '요가상품', 1500000, 900, '에이', '여성', '2021-04-02'),
	('프로틴(에이치프로틴)', 'wty1236', '운동식품', 1790000, 221, '원태연', '남성', '2021-06-10'),
	('런닝머신', 'wty123', '헬스기구', 482000, 1105, '원태연', '남성', '2021-06-10'),
	('다이어트 도시락', 'wty123', '운동식품', 1500000, 505, '원태연', '남성', '2021-06-10'),
	('하체튼튼철봉', 'wyt15', '헬스기구', 799800, 1800, '장혁수', '남성', '2021-03-30'),
	('덤벨', 'wyt15', '헬스기구', 1900000, 500, '장혁수', '남성', '2021-04-02'),
	('돌기마사지봉', 'wyt15', '요가상품', 1600000, 1600, '장혁수', '남성', '2021-06-10'),
	('맛있닭(닭가슴살)', 'wkdgurtn', '운동식품', 148000, 200, '추효동', '남성', '2021-06-10'),
	('핸들링봉', 'wkdgurtn', '요가상품', 4400000, 400, '추효동', '남성', '2021-03-30'),
	('덤벨', 'wkdgurtn', '헬스기구', 6600000, 1250, '추효동', '남성', '2021-04-02'),
	('아이스고구마', 'wkdgurtn', '운동식품', 2400000, 800, '추효동', '남성', '2021-06-10'),
	('요가복(여성)', 'wkdgurtn', '요가상품', 2410500, 760, '추효동', '남성', '2021-05-21'),
	('프로틴(ISOLATE)', 'wkdgurtn', '운동식품', 1000000, 642, '추효동', '남성', '2021-06-10'),
	('런닝머신', 'wkdgurtn', '헬스기구', 4520800, 111, '추효동', '남성', '2021-06-10'),
	('아이스고구마', 'wyt15', '운동식품', 2600, 1, '장혁수', '남성', '2021-06-10'),
	('맛있닭(닭가슴살)', 'wyt15', '운동식품', 3800, 1, '장혁수', '남성', '2021-06-10'),
	('핸들링봉', 'wyt15', '요가상품', 10800, 1, '장혁수', '남성', '2021-06-10'),
	('돌기마사지봉', 'wyt15', '요가상품', 1900, 1, '장혁수', '남성', '2021-06-10'),
	('요가매트', 'wkdgurtn', '요가상품', 8000, 1, '추효동', '남성', '2021-06-10'),
	('덤벨', 'bbb', '헬스기구', 148000, 640, '비비', '여성', '2021-06-10'),
	('아이스고구마', 'bbb', '운동식품', 148000, 900, '비비', '여성', '2021-05-21'),
	('아이스고구마', 'bbb', '운동식품', 148000, 500, '비비', '여성', '2021-04-02'),
	('아이스고구마', 'bbb', '운동식품', 148000, 300, '비비', '여성', '2021-06-10'),
	('벤치프레스', 'aaa', '헬스기구', 1200000, 560, '에이', '여성', '2021-04-02'),
	('벤치프레스', 'aaa', '요가상품', 1200000, 560, '에이', '여성', '2021-03-30'),
	('맛있닭(닭가슴살)', 'aaa', '운동식품', 1500000, 300, '에이', '여성', '2021-03-30'),
	('벤치프레스', 'aaa', '헬스기구', 400000, 240, '에이', '여성', '2021-05-21'),
	('핸들링봉', 'aaa', '요가상품', 1500000, 670, '에이', '여성', '2021-06-10'),
	('핸들링봉', 'aaa', '요가상품', 1500000, 1600, '에이', '여성', '2021-05-21'),
	('벤치프레스', 'aaa', '헬스기구', 400000, 350, '에이', '여성', '2021-06-10'),
	('아이스고구마', 'bbb', '운동식품', 148000, 1105, '비비', '여성', '2021-06-10'),
	('어깨당겨기구', 'wty123', '헬스기구', 799600, 1, '원태연', '남성', '2021-06-10'),
	('요가 밴드', 'ccc', '요가상품', 35000, 1, '씨씨', '남성', '2021-06-10'),
	('요가 밴드', 'aaa', '요가상품', 140000, 2, '에이', '남성', '2021-06-10'),
	('요가 밴드', 'wyt15', '요가상품', 314900, 3, '장혁수', '남성', '2021-06-10'),
	('다이어트 도시락', 'wty123', '운동식품', 6000, 1, '원태연', '남성', '2021-06-10'),
	('핸들링봉', 'wty123', '요가상품', 11000, 1, '원태연', '남성', '2021-06-10');
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;

-- 테이블 turtle.tbl_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `orderId` varchar(50) NOT NULL,
  `pNum` int(11) DEFAULT NULL,
  `mId` varchar(50) NOT NULL,
  `jCatchName` varchar(50) NOT NULL,
  `userAddr1` varchar(20) NOT NULL,
  `userAddr2` varchar(50) NOT NULL,
  `userAddr3` varchar(50) NOT NULL,
  `jPhone` varchar(30) NOT NULL,
  `total_sum` int(11) NOT NULL,
  `orderDate` date NOT NULL DEFAULT sysdate(),
  `jMemo` varchar(50) DEFAULT NULL,
  `jSumPrice` int(11) DEFAULT NULL,
  KEY `tbl_order_mId` (`mId`),
  KEY `tbl_order_pNum` (`pNum`),
  CONSTRAINT `tbl_order_mId` FOREIGN KEY (`mId`) REFERENCES `member` (`mId`),
  CONSTRAINT `tbl_order_pNum` FOREIGN KEY (`pNum`) REFERENCES `product` (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.tbl_order:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_order` (`orderId`, `pNum`, `mId`, `jCatchName`, `userAddr1`, `userAddr2`, `userAddr3`, `jPhone`, `total_sum`, `orderDate`, `jMemo`, `jSumPrice`) VALUES
	('20210607_579861', 17, 'wty123', '원태연', '서울 노원구 누원로 28', '5123', ' (상계동, 수락리버시티 3단지)', '0', 3, '2021-06-07', '0', 66000),
	('20210607_579861', 18, 'wty123', '원태연', '서울 노원구 누원로 28', '5123', ' (상계동, 수락리버시티 3단지)', '0', 2, '2021-06-07', '0', 16000),
	('20210607_579861', 15, 'wty123', '원태연', '서울 노원구 누원로 28', '5123', ' (상계동, 수락리버시티 3단지)', '0', 3, '2021-06-07', '0', 33000);
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;

-- 테이블 turtle.tbl_order_details 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details` (
  `orderDetailsNum` int(11) NOT NULL,
  `orderId` varchar(50) NOT NULL,
  `pNum` int(11) NOT NULL,
  `cartStock` int(11) NOT NULL,
  PRIMARY KEY (`orderDetailsNum`),
  KEY `tbl_order_pNum` (`pNum`),
  CONSTRAINT `tbl_order_details_pNum` FOREIGN KEY (`pNum`) REFERENCES `product` (`pNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 turtle.tbl_order_details:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order_details` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_order_details` (`orderDetailsNum`, `orderId`, `pNum`, `cartStock`) VALUES
	(3021, '20210606_589973', 14, 1),
	(3022, '20210606_589973', 8, 3);
/*!40000 ALTER TABLE `tbl_order_details` ENABLE KEYS */;

-- 테이블 turtle.tbl_order_details_seq 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_order_details_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 turtle.tbl_order_details_seq:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order_details_seq` DISABLE KEYS */;
INSERT IGNORE INTO `tbl_order_details_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(4001, 1, 9223372036854775806, 1, 1, 1000, 0, 0);
/*!40000 ALTER TABLE `tbl_order_details_seq` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
