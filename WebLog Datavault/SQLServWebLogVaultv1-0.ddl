
CREATE TABLE USR_HUB (
       USR_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       USR_HUB_ID           numeric(12) NOT NULL,
       USR_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (USR_HUB_ID)
)
go


CREATE TABLE USR_DATES (
       USR_HUB_ID           numeric(12) NOT NULL,
       USR_DTE_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       USR_DTE_PASSWD_EFF_DTE datetime NULL,
       USR_DTE_PASSWD_CHG_DTE datetime NULL,
       USR_DTE_REGISTRATION_DTE datetime NULL,
       USR_DTE_LAST_MDOORACTV_DTE datetime NULL,
       PRIMARY KEY (USR_HUB_ID, USR_DTE_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
)
go


CREATE TABLE USR_FLAGS (
       USR_HUB_ID           numeric(12) NOT NULL,
       USR_FLG_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       USR_FLG_INTEREST_INFA int NULL DEFAULT 0,
       USR_FLG_INTEREST_BRIO int NULL DEFAULT 0,
       USR_FLG_INTEREST_OP  int NULL DEFAULT 0,
       USR_FLG_INTEREST_DW  int NULL DEFAULT 0,
       USR_FLG_INTEREST_MD  int NULL DEFAULT 0,
       USR_FLG_EMAIL_OPT_IN int NULL DEFAULT 0,
       USR_FLG_ISA_BAD_EMAIL int NULL DEFAULT 0,
       USR_FLG_MDOOR_LOGIN  int NULL DEFAULT 0,
       USR_FLG_ISA_EMPLOYEE int NULL DEFAULT 0,
       USR_FLG_LOGIN_LOCKED int NULL DEFAULT 0,
       PRIMARY KEY (USR_HUB_ID, USR_FLG_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
)
go


CREATE TABLE IP_HUB (
       IP_HUB_STR           varchar(16) NOT NULL,
       IP_HUB_KEY           numeric(15) NOT NULL,
       IP_HUB_LOD_DTS       datetime NULL DEFAULT CURRENT_TIMESTAMP,
       IP_HUB_REC_SRC       varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (IP_HUB_KEY)
)
go


CREATE TABLE GEO_CNTRY_HUB (
       GEO_CNTRY_DOM_CD     varchar(6) NULL,
       GEO_CNTRY_HUB_ID     numeric(12) NOT NULL,
       GEO_CNTRY_CONTINENT_NME varchar(80) NULL,
       GEO_CNTRY_LOD_DTS    datetime NULL DEFAULT CURRENT_TIMESTAMP,
       GEO_CNTRY_REC_SRC    varchar(6) NULL DEFAULT 'NONE',
       GEO_CNTRY_NME        varchar(80) NULL,
       PRIMARY KEY (GEO_CNTRY_HUB_ID)
)
go


CREATE TABLE SRV_HUB (
       SRV_HUB_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_HUB_NAME         varchar(80) NULL,
       SRV_HUB_REC_SRC      varchar(6) NOT NULL DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID)
)
go


CREATE TABLE DOM_LNK (
       DOM_LNK_ID           numeric(12) NOT NULL,
       SRV_HUB_ID           numeric(12) NOT NULL,
       DOM_HUB_NME          varchar(125) NULL,
       IP_HUB_KEY           numeric(15) NOT NULL,
       GEO_CNTRY_HUB_ID     numeric(12) NULL,
       DOM_HUB_PORT_NUM     numeric(10) NOT NULL DEFAULT 0,
       DOM_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       DOM_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (DOM_LNK_ID), 
       FOREIGN KEY (IP_HUB_KEY)
                             REFERENCES IP_HUB, 
       FOREIGN KEY (GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_CNTRY_HUB, 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE IP_DOM_RNG_HUB (
       DOM_LNK_ID           numeric(12) NOT NULL,
       IP_DOM_RNG_ID        numeric(12) NOT NULL,
       IP_DOM_RNG_START_NUM numeric(15) NOT NULL,
       IP_DOM_RNG_END_NUM   numeric(15) NOT NULL,
       IP_DOM_RNG_ADDR      varchar(15) NOT NULL,
       IP_DOM_RNG_LOD_DTS   datetime NULL DEFAULT CURRENT_TIMESTAMP,
       IP_DOM_RNG_REC_SRC   varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (IP_DOM_RNG_ID), 
       FOREIGN KEY (DOM_LNK_ID)
                             REFERENCES DOM_LNK
)
go


CREATE TABLE VLP_HUB (
       VLP_HUB_VALUE        varchar(20) NOT NULL,
       VLP_HUB_ID           numeric(12) NOT NULL,
       VLP_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       VLP_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (VLP_HUB_ID)
)
go


CREATE TABLE KYP_HUB (
       KYP_HUB_NAME         varchar(20) NULL,
       KYP_HUB_ID           numeric(12) NOT NULL,
       KYP_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       KYP_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (KYP_HUB_ID)
)
go


CREATE TABLE DYN_KYP_HUB (
       VLP_HUB_ID           numeric(12) NOT NULL,
       DYN_KYP_HUB_ID       numeric(12) NOT NULL,
       KYP_HUB_ID           numeric(12) NOT NULL,
       DYN_KYP_HUB_DELIMITER varchar(20) NULL,
       DYN_KYP_HUB_LOD_DTS  datetime NULL DEFAULT CURRENT_TIMESTAMP,
       DYN_KYP_HUB_REC_SRC  varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (DYN_KYP_HUB_ID), 
       FOREIGN KEY (VLP_HUB_ID)
                             REFERENCES VLP_HUB, 
       FOREIGN KEY (KYP_HUB_ID)
                             REFERENCES KYP_HUB
)
go


CREATE TABLE STAT_CD_HUB (
       STAT_CD_HUB_REC_SRC  varchar(6) NULL DEFAULT 'NONE',
       STAT_CD_HUB_ID       numeric(12) NOT NULL,
       STAT_CD_HUB_DESC     varchar(255) NOT NULL,
       STAT_CD_HUB_LOD_DTS  datetime NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (STAT_CD_HUB_ID)
)
go


CREATE TABLE RBT_HUB (
       RBT_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           varchar(30) NOT NULL,
       RBT_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (RBT_HUB_ID)
)
go


CREATE TABLE ACM_HUB (
       ACM_HUB_NAME         varchar(100) NULL,
       ACM_HUB_ID           numeric(12) NOT NULL,
       RBT_HUB_ID           varchar(30) NOT NULL,
       ACM_HUB_VER          varchar(30) NULL,
       ACM_HUB_OS_NAME      varchar(100) NULL,
       ACM_HUB_OS_VER       varchar(30) NULL,
       ACM_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       ACM_HUB_HDW_TYPE     varchar(100) NULL,
       ACM_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (ACM_HUB_ID), 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
)
go


CREATE TABLE VSTR_HUB (
       USR_HUB_ID           numeric(12) NOT NULL,
       VSTR_HUB_ID          numeric(12) NOT NULL,
       ACM_HUB_ID           numeric(12) NOT NULL,
       IP_HUB_KEY           numeric(15) NOT NULL,
       VSTR_HUB_LOD_DTS     datetime NULL DEFAULT CURRENT_TIMESTAMP,
       VSTR_HUB_REC_SRC     varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (VSTR_HUB_ID), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB, 
       FOREIGN KEY (ACM_HUB_ID)
                             REFERENCES ACM_HUB, 
       FOREIGN KEY (IP_HUB_KEY)
                             REFERENCES IP_HUB
)
go


CREATE TABLE OBJ_TYP_HUB (
       OBJ_TYP_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_TYP_CD           varchar(20) NOT NULL,
       OBJ_TYP_DESC         varchar(20) NULL,
       OBJ_TYP_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (OBJ_TYP_CD)
)
go


CREATE TABLE DIR_HUB (
       DOM_LNK_ID           numeric(12) NOT NULL,
       DIR_HUB_ID           numeric(12) NOT NULL,
       DIR_HUB_PATH         varchar(20) NOT NULL,
       DIR_HUB_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       DIR_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (DIR_HUB_ID), 
       FOREIGN KEY (DOM_LNK_ID)
                             REFERENCES DOM_LNK
)
go


CREATE TABLE OBJ_HUB (
       OBJ_HUB_ID           numeric(12) NOT NULL,
       DIR_HUB_ID           numeric(12) NOT NULL,
       OBJ_TYP_CD           varchar(20) NULL,
       OBJ_HUB_NME          varchar(20) NOT NULL,
       OBJ_HUB_LOD_DTS      varchar(6) NULL DEFAULT 'NONE',
       OBJ_HUB_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_TYP_CD)
                             REFERENCES OBJ_TYP_HUB, 
       FOREIGN KEY (DIR_HUB_ID)
                             REFERENCES DIR_HUB
)
go


CREATE TABLE REQ_LNK (
       REQ_LNK_DTS          datetime NULL DEFAULT CURRENT_TIMESTAMP,
       REQ_LNK_ID           numeric(12) NOT NULL,
       STAT_CD_HUB_ID       numeric(12) NOT NULL,
       VSTR_HUB_ID          numeric(12) NOT NULL,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       REQ_LNK_REQ_BYTES    numeric(12) NULL,
       REQ_LNK_SENT_BYTES   numeric(12) NULL,
       REQ_LNK_TIME_TAKEN   numeric(12) NULL,
       REQ_LNK_METHOD       varchar(20) NOT NULL,
       REQ_LNK_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       REQ_LNK_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID), 
       FOREIGN KEY (STAT_CD_HUB_ID)
                             REFERENCES STAT_CD_HUB, 
       FOREIGN KEY (VSTR_HUB_ID)
                             REFERENCES VSTR_HUB, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE REQ_REF_DYN_LNK (
       DYN_KYP_HUB_ID       numeric(12) NOT NULL,
       REQ_LNK_ID           numeric(12) NOT NULL,
       REQ_REF_DYN_LNK_LOD_DTS char(18) NULL,
       REQ_REF_DYN_LNK_REC_SRC varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID, DYN_KYP_HUB_ID), 
       FOREIGN KEY (DYN_KYP_HUB_ID)
                             REFERENCES DYN_KYP_HUB, 
       FOREIGN KEY (REQ_LNK_ID)
                             REFERENCES REQ_LNK
)
go


CREATE TABLE REQ_DYN_LNK (
       DYN_KYP_HUB_ID       numeric(12) NOT NULL,
       REQ_LNK_ID           numeric(12) NOT NULL,
       REQ_DYN_LNK_SEQ_ID   numeric(12) NOT NULL,
       REQ_DYN_LNK_LOD_DTS  datetime NULL DEFAULT CURRENT_TIMESTAMP,
       REQ_DYN_LNK_REC_SRC  varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (REQ_LNK_ID, REQ_DYN_LNK_SEQ_ID, DYN_KYP_HUB_ID), 
       FOREIGN KEY (DYN_KYP_HUB_ID)
                             REFERENCES DYN_KYP_HUB, 
       FOREIGN KEY (REQ_LNK_ID)
                             REFERENCES REQ_LNK
)
go


CREATE TABLE CKE_KYP_HUB (
       VLP_HUB_ID           numeric(12) NOT NULL,
       CKE_KYP_HUB_ID       numeric(12) NOT NULL,
       KYP_HUB_ID           numeric(12) NOT NULL,
       CKE_KYP_HUB_LOD_DTS  datetime NULL DEFAULT CURRENT_TIMESTAMP,
       CKE_KYP_HUB_REC_SRC  varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (CKE_KYP_HUB_ID), 
       FOREIGN KEY (VLP_HUB_ID)
                             REFERENCES VLP_HUB, 
       FOREIGN KEY (KYP_HUB_ID)
                             REFERENCES KYP_HUB
)
go


CREATE TABLE CKE_VSTR_LNK (
       CKE_VSTR_LNK_DELIM   varchar(20) NULL,
       VSTR_HUB_ID          numeric(12) NOT NULL,
       CKE_KYP_HUB_ID       numeric(12) NOT NULL,
       CKE_VSTR_LNK_SEQ_ID  numeric(12) NOT NULL,
       CKE_VSTR_LNK_LOD_DTS datetime NULL DEFAULT CURRENT_TIMESTAMP,
       CKE_VSTR_LNK_REC_SRC varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (CKE_KYP_HUB_ID, CKE_VSTR_LNK_SEQ_ID, VSTR_HUB_ID), 
       FOREIGN KEY (CKE_KYP_HUB_ID)
                             REFERENCES CKE_KYP_HUB, 
       FOREIGN KEY (VSTR_HUB_ID)
                             REFERENCES VSTR_HUB
)
go


CREATE TABLE OBJ_CTX (
       OBJ_CTX_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_CTX_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       OBJ_CTX_PG_FUNCTION  varchar(255) NULL,
       OBJ_CTX_LOCAL        varchar(255) NULL,
       OBJ_CTX_OVERALL      varchar(255) NULL,
       PRIMARY KEY (OBJ_HUB_ID, OBJ_CTX_LOD_DTS), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE SRV_CUSTM (
       SRV_CUSTM_LOD_DTS    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_CUSTM_SEQ_ID     int NULL,
       SRV_CUSTM_REC_SRC    varchar(6) NULL DEFAULT 'NONE',
       SRV_CUSTM_CODE       varchar(30) NULL,
       SRV_CUSTM_TEXT       varchar(255) NULL,
       SRV_CUST_END_DTS     datetime NOT NULL DEFAULT NULL,
       PRIMARY KEY (SRV_HUB_ID, SRV_CUSTM_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE SRV_SFTW (
       SRV_SFTW_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_SFTW_END_DTS     datetime NOT NULL DEFAULT NULL,
       SRV_SFTW_VNDR        varchar(20) NULL,
       SRV_SFTW_VER         varchar(20) NULL,
       SRV_SFTW_REC_SRC     varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID, SRV_SFTW_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE SRV_HDW (
       SRV_HDW_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_HDW_END_DTS      datetime NULL DEFAULT NULL,
       SRV_HDW_NME          varchar(20) NULL,
       SRV_HDW_MAKE         varchar(20) NULL,
       SRV_HDW_CPU          varchar(20) NULL,
       SRV_HDW_RAM          varchar(20) NULL,
       SRV_HDW_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (SRV_HUB_ID, SRV_HDW_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE SRV_OS (
       SRV_OS_LOD_DTS       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_OS_NME           varchar(20) NULL,
       SRV_OS_VER           varchar(20) NULL,
       SRV_OS_REC_SRC       varchar(6) NULL DEFAULT 'NONE',
       SRV_OS_END_DTS       datetime NOT NULL DEFAULT NULL,
       PRIMARY KEY (SRV_HUB_ID, SRV_OS_LOD_DTS), 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE SRV_PICT (
       SRV_HUB_ID           numeric(12) NOT NULL,
       SRV_PIC_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_CUSTM_LOD_DTS    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_SFTW_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_HDW_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       SRV_OS_LOD_DTS       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (SRV_PIC_LOD_DTS, SRV_HUB_ID), 
       FOREIGN KEY (SRV_HUB_ID, SRV_CUSTM_LOD_DTS)
                             REFERENCES SRV_CUSTM, 
       FOREIGN KEY (SRV_HUB_ID, SRV_SFTW_LOD_DTS)
                             REFERENCES SRV_SFTW, 
       FOREIGN KEY (SRV_HUB_ID, SRV_HDW_LOD_DTS)
                             REFERENCES SRV_HDW, 
       FOREIGN KEY (SRV_HUB_ID, SRV_OS_LOD_DTS)
                             REFERENCES SRV_OS, 
       FOREIGN KEY (SRV_HUB_ID)
                             REFERENCES SRV_HUB
)
go


CREATE TABLE OBJ_CUSTM_HUB (
       OBJ_CUSTM_LOD_DTS    datetime NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_CUSTM_REC_SRC    varchar(6) NULL DEFAULT 'NONE',
       OBJ_CUSTM_CODE       varchar(30) NOT NULL,
       OBJ_CUSTM_NAME       varchar(255) NULL,
       PRIMARY KEY (OBJ_CUSTM_CODE, OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE DIR_STRUCT_HUB (
       DIR_STRUCT_HUB_ID    numeric(12) NOT NULL,
       DIR_HUB_ID           numeric(12) NOT NULL,
       DIR_STRUCT_HUB_NAME  varchar(20) NULL,
       DIR_STRUCT_HUB_LOD_DTS datetime NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (DIR_HUB_ID, DIR_STRUCT_HUB_ID), 
       FOREIGN KEY (DIR_HUB_ID)
                             REFERENCES DIR_HUB
)
go


CREATE TABLE OBJ_FLGS (
       OBJ_FLGS_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_FLGS_REC_SRC     varchar(6) NULL DEFAULT 'NONE',
       OBJ_FLGS_ISA_ENTRY_PG numeric(1) NOT NULL,
       OBJ_FLGS_ISA_INTERNAL_PG numeric(1) NOT NULL,
       OBJ_FLGS_ISA_SEARCH_ENGINE numeric(1) NOT NULL,
       OBJ_FLGS_ISA_PRIVATE_PG numeric(1) NOT NULL,
       OBJ_FLGS_ISA_SECURED_PG numeric(1) NOT NULL,
       OBJ_FLGS_ISA_DYNAMIC_PG numeric(1) NOT NULL,
       PRIMARY KEY (OBJ_HUB_ID, OBJ_FLGS_LOD_DTS), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE OBJ_TXT_HUB (
       OBJ_TXT_HUB_SEQ_ID   numeric(12) NOT NULL,
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_TXT_HUB_LOD_DTS  datetime NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_TXT_HUB_REC_SRC  varchar(6) NULL DEFAULT 'NONE',
       OBJ_TXT_HUB_TXT      varchar(255) NULL,
       PRIMARY KEY (OBJ_HUB_ID, OBJ_TXT_HUB_SEQ_ID), 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE OBJ_PIC (
       OBJ_HUB_ID           numeric(12) NOT NULL,
       OBJ_PIC_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_CTX_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       OBJ_FLGS_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (OBJ_PIC_LOD_DTS, OBJ_HUB_ID), 
       FOREIGN KEY (OBJ_HUB_ID, OBJ_CTX_LOD_DTS)
                             REFERENCES OBJ_CTX, 
       FOREIGN KEY (OBJ_HUB_ID, OBJ_FLGS_LOD_DTS)
                             REFERENCES OBJ_FLGS, 
       FOREIGN KEY (OBJ_HUB_ID)
                             REFERENCES OBJ_HUB
)
go


CREATE TABLE RBT_DTL (
       RBT_DTL_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           varchar(30) NOT NULL,
       RBT_DTL_NAME         varchar(60) NULL,
       RBT_DTL_CVR_URL      varchar(145) NULL,
       RBT_DTL_DTLS_URL     varchar(145) NULL,
       RBT_DTL_OWNER_NAME   varchar(60) NULL,
       RBT_DTL_OWN_URL      varchar(80) NULL,
       RBT_DTL_OWN_EMAIL    varchar(80) NULL,
       RBT_DTL_STATUS       varchar(80) NULL,
       RBT_DTL_PURPOSE      varchar(1000) NULL,
       RBT_DTL_TYPE         varchar(60) NULL,
       RBT_DTL_PLTFRM       varchar(80) NULL,
       RBT_DTL_AVAIL        varchar(90) NULL,
       RBT_DTL_EXCLUSION_FLG int NULL DEFAULT 0,
       RBT_DTL_EXCLSN_USR_AGENT varchar(162) NULL,
       RBT_DTL_NOINDX       varchar(86) NULL DEFAULT NULL,
       RBT_DTL_HOST         varchar(100) NULL,
       RBT_DTL_FROM         varchar(34) NULL,
       RBT_DTL_USR_AGENT    varchar(77) NULL,
       RBT_DTL_LANG         varchar(255) NULL,
       RBT_DTL_DESC         varchar(2000) NULL,
       RBT_DTL_HIST         varchar(500) NULL,
       RBT_DTL_ENVRNMT      varchar(350) NULL,
       RBT_DTL_MOD_DT       varchar(80) NULL,
       RBT_DTL_MOD_BY       varchar(80) NULL,
       RBT_DTL_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       PRIMARY KEY (RBT_HUB_ID, RBT_DTL_LOD_DTS), 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
)
go


CREATE TABLE GEO_TZ_HUB (
       GEO_TZ_NME           varchar(20) NULL,
       GEO_TZ_LOD_DTS       datetime NULL DEFAULT CURRENT_TIMESTAMP,
       GEO_TZ_REC_SRC       varchar(6) NULL DEFAULT 'NONE',
       GEO_CNTRY_HUB_ID     numeric(12) NOT NULL,
       GEO_TZ_HUB_ID        numeric(12) NOT NULL,
       PRIMARY KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID), 
       FOREIGN KEY (GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_CNTRY_HUB
)
go


CREATE TABLE GEO_PRV_LNK (
       GEO_PRV_NME          varchar(20) NULL,
       GEO_PRV_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       GEO_PRV_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       GEO_PRV_HUB_ID       numeric(12) NOT NULL,
       GEO_CNTRY_HUB_ID     numeric(12) NOT NULL,
       GEO_TZ_HUB_ID        numeric(12) NOT NULL,
       PRIMARY KEY (GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID, GEO_PRV_HUB_ID), 
       FOREIGN KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_TZ_HUB
)
go


CREATE TABLE GEO_STT_HUB (
       GEO_STT_NME          varchar(20) NULL,
       GEO_STT_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       GEO_STT_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       GEO_TZ_HUB_ID        numeric(12) NOT NULL,
       GEO_STT_CD           varchar(20) NOT NULL,
       GEO_CNTRY_HUB_ID     numeric(12) NOT NULL,
       PRIMARY KEY (GEO_STT_CD, GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID), 
       FOREIGN KEY (GEO_TZ_HUB_ID, GEO_CNTRY_HUB_ID)
                             REFERENCES GEO_TZ_HUB
)
go


CREATE TABLE GEO_LOC_LNK (
       GEO_CNTRY_HUB_ID     numeric(12) NULL,
       GEO_TZ_HUB_ID        numeric(12) NULL,
       GEO_STT_CD           varchar(20) NULL,
       GEO_PRV_HUB_ID       numeric(12) NULL,
       GEO_LOC_HUB_ID       numeric(12) NOT NULL,
       GEO_LOC_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       GEO_LOC_REC_SRC      varchar(6) NULL DEFAULT 'NONE',
       GEO_LOC_CITY_NAME    varchar(255) NULL,
       PRIMARY KEY (GEO_LOC_HUB_ID), 
       FOREIGN KEY (GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID, GEO_PRV_HUB_ID)
                             REFERENCES GEO_PRV_LNK, 
       FOREIGN KEY (GEO_STT_CD, GEO_CNTRY_HUB_ID, GEO_TZ_HUB_ID)
                             REFERENCES GEO_STT_HUB
)
go


CREATE TABLE USR_INFO (
       USR_HUB_ID           numeric(12) NOT NULL,
       USR_INFO_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_INFO_LOGIN_ID    varchar(30) NULL,
       USR_INFO_USER_NAME   varchar(255) NULL,
       USR_INFO_FIRST_NAME  varchar(20) NULL,
       USR_INFO_LAST_NAME   varchar(20) NULL,
       USR_INFO_FAX_NUM     varchar(50) NULL,
       USR_INFO_PHONE_NUM   varchar(50) NULL,
       GEO_LOC_HUB_ID       numeric(12) NOT NULL,
       USR_INFO_EMAIL_ADDR  varchar(255) NULL,
       USR_INFO_REC_SRC     datetime NULL DEFAULT CURRENT_TIMESTAMP,
       USR_INFO_ADDR_TYPE   varchar(30) NULL,
       USR_INFO_ADDR1       varchar(50) NULL,
       USR_INFO_PO_BOX      varchar(255) NULL,
       USR_INFO_POSTAL_CD   varchar(30) NULL,
       USR_INFO_ADDR2       varchar(50) NULL,
       USR_INFO_POSITION    varchar(50) NULL,
       USR_INFO_CELL_PHONE  varchar(50) NULL,
       USR_INFO_HOW_FOUND   varchar(50) NULL,
       USR_INFO_REG_SOURCE  varchar(50) NULL,
       USR_INFO_REMOTE_INFO varchar(100) NULL,
       USR_INFO_PROFILE_CHG_WHO varchar(50) NULL,
       PRIMARY KEY (USR_HUB_ID, USR_INFO_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB, 
       FOREIGN KEY (GEO_LOC_HUB_ID)
                             REFERENCES GEO_LOC_LNK
)
go


CREATE TABLE USR_PIC (
       USR_PIC_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_HUB_ID           numeric(12) NOT NULL,
       USR_INFO_LOD_DTS     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       USR_FLG_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       USR_DTE_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (USR_HUB_ID, USR_PIC_LOD_DTS), 
       FOREIGN KEY (USR_HUB_ID, USR_DTE_LOD_DTS)
                             REFERENCES USR_DATES, 
       FOREIGN KEY (USR_HUB_ID, USR_FLG_LOD_DTS)
                             REFERENCES USR_FLAGS, 
       FOREIGN KEY (USR_HUB_ID, USR_INFO_LOD_DTS)
                             REFERENCES USR_INFO, 
       FOREIGN KEY (USR_HUB_ID)
                             REFERENCES USR_HUB
)
go


CREATE TABLE RBT_PIC (
       RBT_PIC_LOD_DTS      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       RBT_HUB_ID           varchar(30) NOT NULL,
       RBT_DTL_LOD_DTS      datetime NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (RBT_HUB_ID, RBT_PIC_LOD_DTS), 
       FOREIGN KEY (RBT_HUB_ID, RBT_DTL_LOD_DTS)
                             REFERENCES RBT_DTL, 
       FOREIGN KEY (RBT_HUB_ID)
                             REFERENCES RBT_HUB
)
go


CREATE TABLE CLNDR_DTL (
       CLNDR_DTE            DATETIME NOT NULL,
       CLNDR_WK_START_DAY_FLG NUMERIC(2) NULL,
       CLNDR_JDTE           NUMERIC(8) NULL,
       CLNDR_YR_NBR         NUMERIC(8) NULL,
       CLNDR_MNTH_NBR       NUMERIC(8) NULL,
       CLNDR_QTR_NBR        NUMERIC(8) NULL,
       CLNDR_WK_NBR         NUMERIC(8) NULL,
       CLNDR_DOM_NBR        NUMERIC(8) NULL,
       CLNDR_WRK_DAY_FLG    NUMERIC(2) NULL,
       CLNDR_HLDY_FLG       NUMERIC(2) NULL,
       CLNDR_HLDY_DESC      VARCHAR(50) NULL,
       CLNDR_UNPLND_HLDY_FLG NUMERIC(2) NULL,
       CLNDR_DOW_NME        VARCHAR(9) NULL,
       CLNDR_WK_START_DTE   DATETIME NULL,
       CLNDR_WK_END_DTE     DATETIME NULL,
       CLNDR_WK_END_DAY_FLG NUMERIC(2) NULL,
       CLNDR_DAY_END_DTE    DATETIME NULL,
       CLNDR_MNTH_NME       VARCHAR(9) NULL,
       CLNDR_MNTH_START_DTE DATETIME NULL,
       CLNDR_MNTH_END_DTE   DATETIME NULL,
       CLNDR_MNTH_END_DAY_FLG NUMERIC(2) NULL,
       CLNDR_MNTH_START_DAY_FLG NUMERIC(2) NULL,
       CLNDR_QTR_NME        VARCHAR(12) NULL,
       CLNDR_QTR_END_DTE    DATETIME NULL,
       CLNDR_QTR_START_DTE  DATETIME NULL,
       CLNDR_QTR_END_DAY_FLG NUMERIC(2) NULL,
       CLNDR_QTR_START_DAY_FLG NUMERIC(2) NULL,
       CLNDR_YR_START_DTE   DATETIME NULL,
       CLNDR_YR_END_DTE     DATETIME NULL,
       CLNDR_YR_END_DAY_FLG NUMERIC(2) NULL,
       CLNDR_YR_START_DAY_FLG NUMERIC(2) NULL,
       CLNDR_SEASON_NME     VARCHAR(6) NULL,
       PRIMARY KEY (CLNDR_DTE)
)
go


CREATE TABLE CTL_DTE (
       CLNDR_DTE            DATETIME NOT NULL,
       CTL_DTE_TODAY        datetime NULL DEFAULT CURRENT_TIMESTAMP,
       CTL_DTE_CUR_WK       numeric(10) NULL,
       CTL_DTE_CUR_MONTH    numeric(10) NULL,
       CTL_DTE_CUR_YR       numeric(10) NULL,
       PRIMARY KEY (CLNDR_DTE), 
       FOREIGN KEY (CLNDR_DTE)
                             REFERENCES CLNDR_DTL
)
go



