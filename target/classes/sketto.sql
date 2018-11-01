
--------------------------------------------------------
--  DDL for Table CHATLIBRARY
--------------------------------------------------------

  CREATE TABLE "CHATLIBRARY" 
   (	"ID" VARCHAR2(50), 
	"MEETINGNO" NUMBER, 
	"INPUTDATE" DATE DEFAULT SYSDATE, 
	"ORIGINALFILE" VARCHAR2(100), 
	"SAVEDFILE" VARCHAR2(100), 
	"FILENUM" NUMBER
   )
--------------------------------------------------------
--  DDL for Table CHECKBOX
--------------------------------------------------------

  CREATE TABLE "CHECKBOX" 
   (	"CNO" NUMBER, 
	"PJNO" NUMBER, 
	"PNO" NUMBER, 
	"TEXT" VARCHAR2(1000), 
	"CHECKED" NUMBER
   )
--------------------------------------------------------
--  DDL for Table MEETING
--------------------------------------------------------

  CREATE TABLE "MEETING" 
   (	"MEETINGNO" NUMBER, 
	"ID" VARCHAR2(50), 
	"MEETINGDATE" DATE DEFAULT SYSDATE, 
	"PJNO" NUMBER, 
	"MEETINGTEXT" VARCHAR2(500), 
	"MEETINGTITLE" VARCHAR2(500)
   )
--------------------------------------------------------
--  DDL for Table MEETINGMEMLIST
--------------------------------------------------------

  CREATE TABLE "MEETINGMEMLIST" 
   (	"MEETINGNO" NUMBER, 
	"ID" VARCHAR2(50), 
	"NAME" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"ID" VARCHAR2(500), 
	"PW" VARCHAR2(500), 
	"NAME" VARCHAR2(500)
   )
--------------------------------------------------------
--  DDL for Table PJINVITEDLIST
--------------------------------------------------------

  CREATE TABLE "PJINVITEDLIST" 
   (	"PJNO" NUMBER, 
	"ID" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table PJMEMLIST
--------------------------------------------------------

  CREATE TABLE "PJMEMLIST" 
   (	"ID" VARCHAR2(50), 
	"PJNO" NUMBER
   )
--------------------------------------------------------
--  DDL for Table PLAN
--------------------------------------------------------

  CREATE TABLE "PLAN" 
   (	"PNO" NUMBER, 
	"PLANNAME" VARCHAR2(100), 
	"PSTARTDATE" DATE DEFAULT SYSDATE, 
	"PENDDATE" DATE DEFAULT SYSDATE+7, 
	"PJNO" NUMBER, 
	"ID" VARCHAR2(1000), 
	"PRIORITY" NUMBER DEFAULT 9, 
	"PROGRESS" NUMBER DEFAULT 0, 
	"COLOR" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table PROJECT
--------------------------------------------------------

  CREATE TABLE "PROJECT" 
   (	"PJNO" NUMBER, 
	"PJTITLE" VARCHAR2(100) DEFAULT '새 프로젝트 이름', 
	"ID" VARCHAR2(50), 
	"STARTDATE" DATE DEFAULT SYSDATE, 
	"ENDDATE" DATE DEFAULT SYSDATE+30
   )
--------------------------------------------------------
--  DDL for Sequence CHATROOMLIST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CHATROOMLIST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence CNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence FILENUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FILENUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence MEETINGNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MEETINGNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PJNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PJNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE
--------------------------------------------------------
--  DDL for Sequence PNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE

--------------------------------------------------------
--  Constraints for Table CHATLIBRARY
--------------------------------------------------------

  ALTER TABLE "CHATLIBRARY" MODIFY ("MEETINGNO" NOT NULL ENABLE)
  ALTER TABLE "CHATLIBRARY" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CHATLIBRARY" ADD PRIMARY KEY ("FILENUM") ENABLE
--------------------------------------------------------
--  Constraints for Table CHECKBOX
--------------------------------------------------------

  ALTER TABLE "CHECKBOX" ADD CONSTRAINT "CHECKBOX_PK" PRIMARY KEY ("CNO") ENABLE
  ALTER TABLE "CHECKBOX" MODIFY ("CNO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEETING
--------------------------------------------------------

  ALTER TABLE "MEETING" ADD UNIQUE ("MEETINGTITLE") ENABLE
  ALTER TABLE "MEETING" ADD PRIMARY KEY ("MEETINGNO") ENABLE
  ALTER TABLE "MEETING" MODIFY ("PJNO" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("MEETINGDATE" NOT NULL ENABLE)
  ALTER TABLE "MEETING" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "MEMBER" MODIFY ("NAME" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PJINVITEDLIST
--------------------------------------------------------

  ALTER TABLE "PJINVITEDLIST" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PJMEMLIST
--------------------------------------------------------

  ALTER TABLE "PJMEMLIST" ADD PRIMARY KEY ("ID") DISABLE
  ALTER TABLE "PJMEMLIST" MODIFY ("PJNO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PLAN
--------------------------------------------------------

  ALTER TABLE "PLAN" ADD PRIMARY KEY ("PNO") ENABLE
  ALTER TABLE "PLAN" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "PLAN" MODIFY ("PJNO" NOT NULL ENABLE)
  ALTER TABLE "PLAN" MODIFY ("PLANNAME" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "PROJECT" ADD PRIMARY KEY ("PJNO") ENABLE
  ALTER TABLE "PROJECT" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "PROJECT" MODIFY ("PJTITLE" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table CHATLIBRARY
--------------------------------------------------------

  ALTER TABLE "CHATLIBRARY" ADD CONSTRAINT "CHATID_FK" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE
  ALTER TABLE "CHATLIBRARY" ADD CONSTRAINT "MEETINGNO_FK" FOREIGN KEY ("MEETINGNO")
	  REFERENCES "MEETING" ("MEETINGNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table MEETING
--------------------------------------------------------

  ALTER TABLE "MEETING" ADD CONSTRAINT "MEETINGID_FK" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE
  ALTER TABLE "MEETING" ADD CONSTRAINT "MEETINGPJNO_FK" FOREIGN KEY ("PJNO")
	  REFERENCES "PROJECT" ("PJNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table MEETINGMEMLIST
--------------------------------------------------------

  ALTER TABLE "MEETINGMEMLIST" ADD CONSTRAINT "ID_MML_FK" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE
  ALTER TABLE "MEETINGMEMLIST" ADD CONSTRAINT "MEETINGNO_MML_FK" FOREIGN KEY ("MEETINGNO")
	  REFERENCES "MEETING" ("MEETINGNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table PJINVITEDLIST
--------------------------------------------------------

  ALTER TABLE "PJINVITEDLIST" ADD CONSTRAINT "INVITEDPJNO_FK" FOREIGN KEY ("PJNO")
	  REFERENCES "PROJECT" ("PJNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table PJMEMLIST
--------------------------------------------------------

  ALTER TABLE "PJMEMLIST" ADD CONSTRAINT "MEMID_FK" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE
  ALTER TABLE "PJMEMLIST" ADD CONSTRAINT "MEMPJNO_FK" FOREIGN KEY ("PJNO")
	  REFERENCES "PROJECT" ("PJNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table PLAN
--------------------------------------------------------

  ALTER TABLE "PLAN" ADD CONSTRAINT "PLANPJNO_FK" FOREIGN KEY ("PJNO")
	  REFERENCES "PROJECT" ("PJNO") ON DELETE CASCADE ENABLE
--------------------------------------------------------
--  Ref Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "PROJECT" ADD CONSTRAINT "ID_FK" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE
