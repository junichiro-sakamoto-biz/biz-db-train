

/* Create Tables */

-- tweet本体
CREATE TABLE TWEETS
(
	ID BIGINT NOT NULL UNIQUE AUTO_INCREMENT COMMENT 'id',
	USER_ID BIGINT NOT NULL COMMENT '投稿主 : user id',
	CONTENT VARCHAR(140) NOT NULL COMMENT '本文',
	TWEETED_AT DATETIME NOT NULL COMMENT 'ツイートされた時間 : ユーザーがツイートリクエストを作成したタイミング',
	CREATED_AT DATETIME NOT NULL COMMENT '作成した時のタイムスタンプ',
	UPDATED_AT DATETIME NOT NULL COMMENT '最終更新時のタイムスタンプ',
	PRIMARY KEY (ID)
) ENGINE = InnoDB COMMENT = 'ツイート : tweet本体';


-- twitterのuserを保存します。
CREATE TABLE USERS
(
	ID BIGINT NOT NULL UNIQUE AUTO_INCREMENT COMMENT 'id : user id',
	NAME VARCHAR(255) NOT NULL COMMENT '名前',
	MAILADDRESS VARCHAR(255) NOT NULL COMMENT 'メールアドレス',
	PASSWORD VARCHAR(255) NOT NULL COMMENT 'パスワード',
	DISPLAY_NAME VARCHAR(20) NOT NULL COMMENT '表示名',
	CREATED_AT DATETIME NOT NULL COMMENT '作成した時のタイムスタンプ',
	UPDATED_AT DATETIME NOT NULL COMMENT '最終更新時のタイムスタンプ',
	PRIMARY KEY (ID)
) ENGINE = InnoDB COMMENT = 'ユーザー : twitterのuserを保存します。';



/* Create Indexes */

CREATE UNIQUE INDEX UQ_USERS_NAME USING BTREE ON USERS (NAME ASC);
CREATE UNIQUE INDEX UQ_USERS_EMAIL USING BTREE ON USERS (MAILADDRESS ASC);



/* Create Foreign Keys */

ALTER TABLE TWEETS
	ADD CONSTRAINT FK_TWEETS_USERS FOREIGN KEY (USER_ID)
	REFERENCES USERS (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



