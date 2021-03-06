
CREATE TABLE USR_HUB (
       USR_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       USR_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (USR_HUB_ID)
);


CREATE TABLE USR_DATES (
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       USR_DTE_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       USR_DTE_PASSWD_EFF_DTE DATE,
       USR_DTE_PASSWD_CHG_DTE DATE,
       USR_DTE_REGISTRATION_DTE DATE,
       USR_DTE_LAST_MDOORACTV_DTE DATE,
       PRIMARY KEY (USR_HUB_ID, USR_DTE_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE USR_FLAGS (
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       USR_FLG_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       USR_FLG_INTEREST_INFA INTEGER DEFAULT 0,
       USR_FLG_INTEREST_BRIO INTEGER DEFAULT 0,
       USR_FLG_INTEREST_OP  INTEGER DEFAULT 0,
       USR_FLG_INTEREST_DW  INTEGER DEFAULT 0,
       USR_FLG_INTEREST_MD  INTEGER DEFAULT 0,
       USR_FLG_EMAIL_OPT_IN INTEGER DEFAULT 0,
       USR_FLG_ISA_BAD_EMAIL INTEGER DEFAULT 0,
       USR_FLG_MDOOR_LOGIN  INTEGER DEFAULT 0,
       USR_FLG_ISA_EMPLOYEE INTEGER DEFAULT 0,
       USR_FLG_LOGIN_LOCKED INTEGER DEFAULT 0,
       PRIMARY KEY (USR_HUB_ID, USR_FLG_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE IP_HUB (
       IP_HUB_STR           VARCHAR2(16) NOT NULL,
       IP_HUB_KEY           DECIMAL(15) NOT NULL,
       IP_HUB_LOD_DTS       DATE DEFAULT CURRENT_TIMESTAMP,
       IP_HUB_REC_SRC       VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (IP_HUB_KEY)
);


CREATE TABLE GEO_CNTRY_HUB (
       GEO_CNTRY_DOM_CD     VARCHAR2(6),
       GEO_CNTRY_HUB_ID     DECIMAL(12) NOT NULL,
       GEO_CNTRY_CONTINENT_NME VARCHAR2(80),
       GEO_CNTRY_LOD_DTS    DATE DEFAULT CURRENT_TIMESTAMP,
       GEO_CNTRY_REC_SRC    VARCHAR(6) DEFAULT 'NONE',
       GEO_CNTRY_NME        VARCHAR2(80),
       PRIMARY KEY (GEO_CNTRY_HUB_ID)
);


CREATE TABLE SRV_HUB (
       SRV_HUB_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_HUB_NAME         VARCHAR2(80),
       SRV_HUB_REC_SRC      VARCHAR(6) NOT NULL DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID)
);


CREATE TABLE DOM_LNK (
       DOM_LNK_ID           DECIMAL(12) NOT NULL,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       DOM_HUB_NME          VARCHAR2(125),
       IP_HUB_KEY           DECIMAL(15) NOT NULL,
       GEO_CNTRY_HUB_ID     DECIMAL(12),
       DOM_HUB_PORT_NUM     DECIMAL(10) NOT NULL DEFAULT 0,
       DOM_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       DOM_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (DOM_LNK_ID), 
       FOREIGN KEY (IP_HUB_KEY)
                             REFERENCES IP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_CNTRY_HUB
                             ON DELETE SET NULL, 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE IP_DOM_RNG_HUB (
       DOM_LNK_ID           DECIMAL(12) NOT NULL,
       IP_DOM_RNG_ID        DECIMAL(12) NOT NULL,
       IP_DOM_RNG_START_NUM DECIMAL(15) NOT NULL,
       IP_DOM_RNG_END_NUM   DECIMAL(15) NOT NULL,
       IP_DOM_RNG_ADDR      VARCHAR2(15) NOT NULL,
       IP_DOM_RNG_LOD_DTS   DATE DEFAULT CURRENT_TIMESTAMP,
       IP_DOM_RNG_REC_SRC   VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (IP_DOM_RNG_ID), 
       FOREIGN KEY (DOM_LNK_ID)
                             REFERENCES DOM_LNK
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE VLP_HUB (
       VLP_HUB_VALUE        VARCHAR(20) NOT NULL,
       VLP_HUB_ID           DECIMAL(12) NOT NULL,
       VLP_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       VLP_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (VLP_HUB_ID)
);


CREATE TABLE KYP_HUB (
       KYP_HUB_NAME         VARCHAR(20),
       KYP_HUB_ID           DECIMAL(12) NOT NULL,
       KYP_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       KYP_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (KYP_HUB_ID)
);


CREATE TABLE DYN_KYP_HUB (
       VLP_HUB_ID           DECIMAL(12) NOT NULL,
       DYN_KYP_HUB_ID       DECIMAL(12) NOT NULL,
       KYP_HUB_ID           DECIMAL(12) NOT NULL,
       DYN_KYP_HUB_DELIMITER VARCHAR(20),
       DYN_KYP_HUB_LOD_DTS  DATE DEFAULT CURRENT_TIMESTAMP,
       DYN_KYP_HUB_REC_SRC  VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (DYN_KYP_HUB_ID), 
       FOREIGN KEY (VLP_HUB_ID)
                             REFERENCES VLP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (KYP_HUB_ID)
                             REFERENCES KYP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE STAT_CD_HUB (
       STAT_CD_HUB_REC_SRC  VARCHAR(6) DEFAULT 'NONE',
       STAT_CD_HUB_ID       DECIMAL(12) NOT NULL,
       STAT_CD_HUB_DESC     VARCHAR2(255) NOT NULL,
       STAT_CD_HUB_LOD_DTS  DATE DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (STAT_CD_HUB_ID)
);


CREATE TABLE RBT_HUB (
       RBT_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           VARCHAR2(30) NOT NULL,
       RBT_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (RBT_HUB_ID)
);


CREATE TABLE ACM_HUB (
       ACM_HUB_NAME         VARCHAR2(100),
       ACM_HUB_ID           DECIMAL(12) NOT NULL,
       RBT_HUB_ID           VARCHAR2(30) NOT NULL,
       ACM_HUB_VER          VARCHAR2(30),
       ACM_HUB_OS_NAME      VARCHAR2(100),
       ACM_HUB_OS_VER       VARCHAR2(30),
       ACM_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       ACM_HUB_HDW_TYPE     VARCHAR2(100),
       ACM_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (ACM_HUB_ID), 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE VSTR_HUB (
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       VSTR_HUB_ID          DECIMAL(12) NOT NULL,
       ACM_HUB_ID           DECIMAL(12) NOT NULL,
       IP_HUB_KEY           DECIMAL(15) NOT NULL,
       VSTR_HUB_LOD_DTS     DATE DEFAULT CURRENT_TIMESTAMP,
       VSTR_HUB_REC_SRC     VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (VSTR_HUB_ID), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (ACM_HUB_ID)
                             REFERENCES ACM_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (IP_HUB_KEY)
                             REFERENCES IP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_TYP_HUB (
       OBJ_TYP_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       OBJ_TYP_CD           VARCHAR(20) NOT NULL,
       OBJ_TYP_DESC         VARCHAR(20),
       OBJ_TYP_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (OBJ_TYP_CD)
);


CREATE TABLE DIR_HUB (
       DOM_LNK_ID           DECIMAL(12) NOT NULL,
       DIR_HUB_ID           DECIMAL(12) NOT NULL,
       DIR_HUB_PATH         VARCHAR2(20) NOT NULL,
       DIR_HUB_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       DIR_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (DIR_HUB_ID), 
       FOREIGN KEY (DOM_LNK_ID)
                             REFERENCES DOM_LNK
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_HUB (
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       DIR_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_TYP_CD           VARCHAR(20),
       OBJ_HUB_NME          VARCHAR(20) NOT NULL,
       OBJ_HUB_LOD_DTS      VARCHAR(6) DEFAULT 'NONE',
       OBJ_HUB_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_TYP_CD)
                             REFERENCES OBJ_TYP_HUB
                             ON DELETE SET NULL, 
       FOREIGN KEY (DIR_HUB_ID)
                             REFERENCES DIR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE REQ_LNK (
       REQ_LNK_DTS          DATE DEFAULT CURRENT_TIMESTAMP,
       REQ_LNK_ID           DECIMAL(12) NOT NULL,
       STAT_CD_HUB_ID       DECIMAL(12) NOT NULL,
       VSTR_HUB_ID          DECIMAL(12) NOT NULL,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       REQ_LNK_REQ_BYTES    DECIMAL(12),
       REQ_LNK_SENT_BYTES   DECIMAL(12),
       REQ_LNK_TIME_TAKEN   DECIMAL(12),
       REQ_LNK_METHOD       VARCHAR(20) NOT NULL,
       REQ_LNK_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       REQ_LNK_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID), 
       FOREIGN KEY (STAT_CD_HUB_ID)
                             REFERENCES STAT_CD_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (VSTR_HUB_ID)
                             REFERENCES VSTR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE REQ_REF_DYN_LNK (
       DYN_KYP_HUB_ID       DECIMAL(12) NOT NULL,
       REQ_LNK_ID           DECIMAL(12) NOT NULL,
       REQ_REF_DYN_LNK_LOD_DTS CHAR(18),
       REQ_REF_DYN_LNK_REC_SRC VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID, DYN_KYP_HUB_ID), 
       FOREIGN KEY (DYN_KYP_HUB_ID)
                             REFERENCES DYN_KYP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (REQ_LNK_ID)
                             REFERENCES REQ_LNK
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE REQ_DYN_LNK (
       DYN_KYP_HUB_ID       DECIMAL(12) NOT NULL,
       REQ_LNK_ID           DECIMAL(12) NOT NULL,
       REQ_DYN_LNK_SEQ_ID   DECIMAL(12) NOT NULL,
       REQ_DYN_LNK_LOD_DTS  DATE DEFAULT CURRENT_TIMESTAMP,
       REQ_DYN_LNK_REC_SRC  VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID, REQ_DYN_LNK_SEQ_ID, DYN_KYP_HUB_ID), 
       FOREIGN KEY (DYN_KYP_HUB_ID)
                             REFERENCES DYN_KYP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (REQ_LNK_ID)
                             REFERENCES REQ_LNK
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE CKE_KYP_HUB (
       VLP_HUB_ID           DECIMAL(12) NOT NULL,
       CKE_KYP_HUB_ID       DECIMAL(12) NOT NULL,
       KYP_HUB_ID           DECIMAL(12) NOT NULL,
       CKE_KYP_HUB_LOD_DTS  DATE DEFAULT CURRENT_TIMESTAMP,
       CKE_KYP_HUB_REC_SRC  VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (CKE_KYP_HUB_ID), 
       FOREIGN KEY (VLP_HUB_ID)
                             REFERENCES VLP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (KYP_HUB_ID)
                             REFERENCES KYP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE CKE_VSTR_LNK (
       CKE_VSTR_LNK_DELIM   VARCHAR(20),
       VSTR_HUB_ID          DECIMAL(12) NOT NULL,
       CKE_KYP_HUB_ID       DECIMAL(12) NOT NULL,
       CKE_VSTR_LNK_SEQ_ID  DECIMAL(12) NOT NULL,
       CKE_VSTR_LNK_LOD_DTS DATE DEFAULT CURRENT_TIMESTAMP,
       CKE_VSTR_LNK_REC_SRC VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (CKE_KYP_HUB_ID, CKE_VSTR_LNK_SEQ_ID, VSTR_HUB_ID), 
       FOREIGN KEY (CKE_KYP_HUB_ID)
                             REFERENCES CKE_KYP_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (VSTR_HUB_ID)
                             REFERENCES VSTR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_CTX (
       OBJ_CTX_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_CTX_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       OBJ_CTX_PG_FUNCTION  VARCHAR2(255),
       OBJ_CTX_LOCAL        VARCHAR2(255),
       OBJ_CTX_OVERALL      VARCHAR2(255),
       PRIMARY KEY (OBJ_HUB_ID, OBJ_CTX_LOD_DTS), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE SRV_CUSTM (
       SRV_CUSTM_LOD_DTS    DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_CUSTM_SEQ_ID     INTEGER,
       SRV_CUSTM_REC_SRC    VARCHAR(6) DEFAULT 'NONE',
       SRV_CUSTM_CODE       VARCHAR2(30),
       SRV_CUSTM_TEXT       VARCHAR2(255),
       SRV_CUST_END_DTS     DATE DEFAULT NULL,
       PRIMARY KEY (SRV_HUB_ID, SRV_CUSTM_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE SRV_SFTW (
       SRV_SFTW_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_SFTW_END_DTS     DATE DEFAULT NULL,
       SRV_SFTW_VNDR        VARCHAR(20),
       SRV_SFTW_VER         VARCHAR2(20),
       SRV_SFTW_REC_SRC     VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID, SRV_SFTW_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE SRV_HDW (
       SRV_HDW_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_HDW_END_DTS      DATE DEFAULT NULL,
       SRV_HDW_NME          VARCHAR(20),
       SRV_HDW_MAKE         VARCHAR(20),
       SRV_HDW_CPU          VARCHAR(20),
       SRV_HDW_RAM          VARCHAR(20),
       SRV_HDW_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID, SRV_HDW_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE SRV_OS (
       SRV_OS_LOD_DTS       DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_OS_NME           VARCHAR(20),
       SRV_OS_VER           VARCHAR(20),
       SRV_OS_REC_SRC       VARCHAR(6) DEFAULT 'NONE',
       SRV_OS_END_DTS       DATE DEFAULT NULL,
       PRIMARY KEY (SRV_HUB_ID, SRV_OS_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE SRV_PICT (
       SRV_HUB_ID           DECIMAL(12) NOT NULL,
       SRV_PIC_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_CUSTM_LOD_DTS    DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_SFTW_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HDW_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_OS_LOD_DTS       DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (SRV_PIC_LOD_DTS, SRV_HUB_ID), 
       FOREIGN KEY (SRV_HUB_ID, SRV_CUSTM_LOD_DTS)
                             REFERENCES SRV_CUSTM
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (SRV_HUB_ID, SRV_SFTW_LOD_DTS)
                             REFERENCES SRV_SFTW
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (SRV_HUB_ID, SRV_HDW_LOD_DTS)
                             REFERENCES SRV_HDW
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (SRV_HUB_ID, SRV_OS_LOD_DTS)
                             REFERENCES SRV_OS
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_CUSTM_HUB (
       OBJ_CUSTM_LOD_DTS    DATE DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_CUSTM_REC_SRC    VARCHAR(6) DEFAULT 'NONE',
       OBJ_CUSTM_CODE       VARCHAR2(30) NOT NULL,
       OBJ_CUSTM_NAME       VARCHAR2(255),
       PRIMARY KEY (OBJ_CUSTM_CODE, OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE DIR_STRUCT_HUB (
       DIR_STRUCT_HUB_ID    DECIMAL(12) NOT NULL,
       DIR_HUB_ID           DECIMAL(12) NOT NULL,
       DIR_STRUCT_HUB_NAME  VARCHAR2(20),
       DIR_STRUCT_HUB_LOD_DTS DATE DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (DIR_HUB_ID, DIR_STRUCT_HUB_ID), 
       FOREIGN KEY (DIR_HUB_ID)
                             REFERENCES DIR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_FLGS (
       OBJ_FLGS_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_FLGS_REC_SRC     VARCHAR(6) DEFAULT 'NONE',
       OBJ_FLGS_ISA_ENTRY_PG DECIMAL(1) NOT NULL,
       OBJ_FLGS_ISA_INTERNAL_PG DECIMAL(1) NOT NULL,
       OBJ_FLGS_ISA_SEARCH_ENGINE DECIMAL(1) NOT NULL,
       OBJ_FLGS_ISA_PRIVATE_PG DECIMAL(1) NOT NULL,
       OBJ_FLGS_ISA_SECURED_PG DECIMAL(1) NOT NULL,
       OBJ_FLGS_ISA_DYNAMIC_PG DECIMAL(1) NOT NULL,
       PRIMARY KEY (OBJ_HUB_ID, OBJ_FLGS_LOD_DTS), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_TXT_HUB (
       OBJ_TXT_HUB_SEQ_ID   DECIMAL(12) NOT NULL,
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_TXT_HUB_LOD_DTS  DATE DEFAULT CURRENT_TIMESTAMP,
       OBJ_TXT_HUB_REC_SRC  VARCHAR(6) DEFAULT 'NONE',
       OBJ_TXT_HUB_TXT      VARCHAR2(255),
       PRIMARY KEY (OBJ_HUB_ID, OBJ_TXT_HUB_SEQ_ID), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE OBJ_PIC (
       OBJ_HUB_ID           DECIMAL(12) NOT NULL,
       OBJ_PIC_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_CTX_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_FLGS_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (OBJ_PIC_LOD_DTS, OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_HUB_ID, OBJ_CTX_LOD_DTS)
                             REFERENCES OBJ_CTX
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (OBJ_HUB_ID, OBJ_FLGS_LOD_DTS)
                             REFERENCES OBJ_FLGS
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE RBT_DTL (
       RBT_DTL_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           VARCHAR2(30) NOT NULL,
       RBT_DTL_NAME         VARCHAR2(60),
       RBT_DTL_CVR_URL      VARCHAR2(145),
       RBT_DTL_DTLS_URL     VARCHAR2(145),
       RBT_DTL_OWNER_NAME   VARCHAR2(60),
       RBT_DTL_OWN_URL      VARCHAR2(80),
       RBT_DTL_OWN_EMAIL    VARCHAR2(80),
       RBT_DTL_STATUS       VARCHAR2(80),
       RBT_DTL_PURPOSE      VARCHAR2(1000),
       RBT_DTL_TYPE         VARCHAR2(60),
       RBT_DTL_PLTFRM       VARCHAR2(80),
       RBT_DTL_AVAIL        VARCHAR2(90),
       RBT_DTL_EXCLUSION_FLG INTEGER DEFAULT 0,
       RBT_DTL_EXCLSN_USR_AGENT VARCHAR2(162),
       RBT_DTL_NOINDX       VARCHAR2(86) DEFAULT NULL,
       RBT_DTL_HOST         VARCHAR2(100),
       RBT_DTL_FROM         VARCHAR2(34),
       RBT_DTL_USR_AGENT    VARCHAR2(77),
       RBT_DTL_LANG         VARCHAR2(255),
       RBT_DTL_DESC         VARCHAR2(2000),
       RBT_DTL_HIST         VARCHAR2(500),
       RBT_DTL_ENVRNMT      VARCHAR2(350),
       RBT_DTL_MOD_DT       VARCHAR2(80),
       RBT_DTL_MOD_BY       VARCHAR2(80),
       RBT_DTL_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       PRIMARY KEY (RBT_HUB_ID, RBT_DTL_LOD_DTS), 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE GEO_TZ_HUB (
       GEO_TZ_NME           VARCHAR2(20),
       GEO_TZ_LOD_DTS       DATE DEFAULT CURRENT_TIMESTAMP,
       GEO_TZ_REC_SRC       VARCHAR(6) DEFAULT 'NONE',
       GEO_CNTRY_HUB_ID     DECIMAL(12) NOT NULL,
       GEO_TZ_HUB_ID        DECIMAL(12) NOT NULL,
       PRIMARY KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID), 
       FOREIGN KEY (GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_CNTRY_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE GEO_PRV_LNK (
       GEO_PRV_NME          VARCHAR2(20),
       GEO_PRV_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       GEO_PRV_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       GEO_PRV_HUB_ID       DECIMAL(12) NOT NULL,
       GEO_CNTRY_HUB_ID     DECIMAL(12) NOT NULL,
       GEO_TZ_HUB_ID        DECIMAL(12) NOT NULL,
       PRIMARY KEY (GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID, GEO_PRV_HUB_ID), 
       FOREIGN KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_TZ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE GEO_STT_HUB (
       GEO_STT_NME          VARCHAR(20),
       GEO_STT_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       GEO_STT_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       GEO_TZ_HUB_ID        DECIMAL(12) NOT NULL,
       GEO_STT_CD           VARCHAR2(20) NOT NULL,
       GEO_CNTRY_HUB_ID     DECIMAL(12) NOT NULL,
       PRIMARY KEY (GEO_STT_CD, GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID), 
       FOREIGN KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_TZ_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE GEO_LOC_LNK (
       GEO_CNTRY_HUB_ID     DECIMAL(12),
       GEO_TZ_HUB_ID        DECIMAL(12),
       GEO_STT_CD           VARCHAR(20),
       GEO_PRV_HUB_ID       DECIMAL(12),
       GEO_LOC_HUB_ID       DECIMAL(12) NOT NULL,
       GEO_LOC_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       GEO_LOC_REC_SRC      VARCHAR(6) DEFAULT 'NONE',
       GEO_LOC_CITY_NAME    VARCHAR2(255),
       PRIMARY KEY (GEO_LOC_HUB_ID), 
       FOREIGN KEY (GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID, GEO_PRV_HUB_ID)
                             REFERENCES GEO_PRV_LNK
                             ON DELETE SET NULL, 
       FOREIGN KEY (GEO_STT_CD, GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID)
                             REFERENCES GEO_STT_HUB
                             ON DELETE SET NULL
);


CREATE TABLE USR_INFO (
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       USR_INFO_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_INFO_LOGIN_ID    VARCHAR2(30),
       USR_INFO_USER_NAME   VARCHAR2(255),
       USR_INFO_FIRST_NAME  VARCHAR2(20),
       USR_INFO_LAST_NAME   VARCHAR2(20),
       USR_INFO_FAX_NUM     VARCHAR2(50),
       USR_INFO_PHONE_NUM   VARCHAR2(50),
       GEO_LOC_HUB_ID       DECIMAL(12) NOT NULL,
       USR_INFO_EMAIL_ADDR  VARCHAR2(255),
       USR_INFO_REC_SRC     VARCHAR(6) DEFAULT 'NONE',
       USR_INFO_ADDR_TYPE   VARCHAR2(30),
       USR_INFO_ADDR1       VARCHAR2(50),
       USR_INFO_PO_BOX      VARCHAR2(255),
       USR_INFO_POSTAL_CD   VARCHAR2(30),
       USR_INFO_ADDR2       VARCHAR2(50),
       USR_INFO_POSITION    VARCHAR2(50),
       USR_INFO_CELL_PHONE  VARCHAR2(50),
       USR_INFO_HOW_FOUND   VARCHAR2(50),
       USR_INFO_REG_SOURCE  VARCHAR2(50),
       USR_INFO_REMOTE_INFO VARCHAR2(100),
       USR_INFO_PROFILE_CHG_WHO VARCHAR2(50),
       PRIMARY KEY (USR_HUB_ID, USR_INFO_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (GEO_LOC_HUB_ID)
                             REFERENCES GEO_LOC_LNK
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE USR_PIC (
       USR_PIC_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_HUB_ID           DECIMAL(12) NOT NULL,
       USR_INFO_LOD_DTS     DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_FLG_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       USR_DTE_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (USR_HUB_ID, USR_PIC_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID, USR_DTE_LOD_DTS)
                             REFERENCES USR_DATES
                             ON DELETE SET NULL, 
       FOREIGN KEY (USR_HUB_ID, USR_FLG_LOD_DTS)
                             REFERENCES USR_FLAGS
                             ON DELETE SET NULL, 
       FOREIGN KEY (USR_HUB_ID, USR_INFO_LOD_DTS)
                             REFERENCES USR_INFO
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT, 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE RBT_PIC (
       RBT_PIC_LOD_DTS      DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           VARCHAR2(30) NOT NULL,
       RBT_DTL_LOD_DTS      DATE DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (RBT_HUB_ID, RBT_PIC_LOD_DTS), 
       FOREIGN KEY (RBT_HUB_ID, RBT_DTL_LOD_DTS)
                             REFERENCES RBT_DTL
                             ON DELETE SET NULL, 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);


CREATE TABLE CLNDR_DTL (
       CLNDR_DTE            DATE NOT NULL,
       CLNDR_WK_START_DAY_FLG DECIMAL(2),
       CLNDR_JDTE           DECIMAL(8),
       CLNDR_YR_NBR         DECIMAL(8),
       CLNDR_MNTH_NBR       DECIMAL(8),
       CLNDR_QTR_NBR        DECIMAL(8),
       CLNDR_WK_NBR         DECIMAL(8),
       CLNDR_DOM_NBR        DECIMAL(8),
       CLNDR_WRK_DAY_FLG    DECIMAL(2),
       CLNDR_HLDY_FLG       DECIMAL(2),
       CLNDR_HLDY_DESC      VARCHAR2(50),
       CLNDR_UNPLND_HLDY_FLG DECIMAL(2),
       CLNDR_DOW_NME        VARCHAR2(9),
       CLNDR_WK_START_DTE   DATE,
       CLNDR_WK_END_DTE     DATE,
       CLNDR_WK_END_DAY_FLG DECIMAL(2),
       CLNDR_DAY_END_DTE    DATE,
       CLNDR_MNTH_NME       VARCHAR2(9),
       CLNDR_MNTH_START_DTE DATE,
       CLNDR_MNTH_END_DTE   DATE,
       CLNDR_MNTH_END_DAY_FLG DECIMAL(2),
       CLNDR_MNTH_START_DAY_FLG DECIMAL(2),
       CLNDR_QTR_NME        VARCHAR2(12),
       CLNDR_QTR_END_DTE    DATE,
       CLNDR_QTR_START_DTE  DATE,
       CLNDR_QTR_END_DAY_FLG DECIMAL(2),
       CLNDR_QTR_START_DAY_FLG DECIMAL(2),
       CLNDR_YR_START_DTE   DATE,
       CLNDR_YR_END_DTE     DATE,
       CLNDR_YR_END_DAY_FLG DECIMAL(2),
       CLNDR_YR_START_DAY_FLG DECIMAL(2),
       CLNDR_SEASON_NME     VARCHAR2(6),
       PRIMARY KEY (CLNDR_DTE)
);


CREATE TABLE CTL_DTE (
       CLNDR_DTE            DATE NOT NULL,
       CTL_DTE_TODAY        DATE DEFAULT CURRENT_TIMESTAMP,
       CTL_DTE_CUR_WK       DECIMAL(10),
       CTL_DTE_CUR_MONTH    DECIMAL(10),
       CTL_DTE_CUR_YR       DECIMAL(10),
       PRIMARY KEY (CLNDR_DTE), 
       FOREIGN KEY (CLNDR_DTE)
                             REFERENCES CLNDR_DTL
                             ON DELETE RESTRICT
                             ON UPDATE RESTRICT
);



