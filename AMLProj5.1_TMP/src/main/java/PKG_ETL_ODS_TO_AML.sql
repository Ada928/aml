CREATE OR REPLACE PACKAGE BODY "PKG_ETL_ODS_TO_AML" IS

  -- 0 ͣ��DEBUG��Ϣ���,1 ����DEBUG��Ϣ���
  GV_DEBUG NUMBER := 0;
  -- һ�����������־����
  GV_LINE_LMT NUMBER := 200;
  GV_LOG_TO VARCHAR2(10) := 'LOGTAB';

  /*
  * TITLE:        ���ݿ��������ж��Ƿ������ͻ�
  * DESCRIPTION:  ��ǰһ�����ڿ��ͻ��Ŀͻ�Ϊ�����ͻ�
  */
  FUNCTION F00_ISNEWCUSTMER(CRDATE  IN VARCHAR2, --�����ͻ���������
                            PATTERN IN VARCHAR2) RETURN CHAR IS
    OADDCUSTOME CHAR(1);
  BEGIN
    OADDCUSTOME := CASE WHEN ADD_MONTHS(TO_DATE(CRDATE, PATTERN), 1) >= SYSDATE - 1 THEN '1' ELSE '0' END;
    RETURN OADDCUSTOME;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('cus_add���ڸ�ʽ����' || CRDATE);
      RETURN NULL;
  END;


  /**
  * TITLE      : ȡ���������ӳ�����ֵ</P>
  * DESCRIPTION: ͨ��Դϵͳ����Ӧ�Ĵ������T87_ETL_CODE_MAP��ȡ����Ӧ�����д���</P>
  *              IN_CODE_TYPE  ÿһ����������</P>
  *              IN_CODE_SOU   Դϵͳ�Ĵ���</P>
  *              LV_CODE_RH    ���ص����д���</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-13
  */
  FUNCTION F01_ETL_CODE_MAP(IN_CODE_TYPE IN VARCHAR2,
                                       IN_CODE_SOU  IN VARCHAR2)
    RETURN VARCHAR2 IS
    LV_CODE_RH VARCHAR2(10);
  BEGIN
    IF ( IN_CODE_SOU IS NULL OR IN_CODE_TYPE IS NULL ) THEN
       LV_CODE_RH := NULL;
    ELSE
    BEGIN
        SELECT MIN(T.CODE_RH)
        INTO LV_CODE_RH
        FROM T87_ETL_CODE_MAP T
        WHERE T.CODE_TYPE = IN_CODE_TYPE
              AND T.CODE_SOU = IN_CODE_SOU;
        EXCEPTION
        WHEN OTHERS THEN
             LV_CODE_RH := NULL;
     END;
     END IF;

    RETURN LV_CODE_RH;
  END;


  /*
  * TITLE      : ת����ҵ����
  * DESCRIPTION:
  * PARAMETERS :
  *   IN:
  *         ��DTINPUTDT���ַ�����������
  *         ��PATTERN�����ַ�����������ģʽ
  *
  *  OUT:
  * RETURN     ��Date��������,���ת�����󷵻�null
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  FUNCTION F02_TRANSFER_INDUSTRYKEY(IINDUSTRYKEY IN VARCHAR2) RETURN VARCHAR2 IS
    OINDUSTRYKEY VARCHAR2(2);
  BEGIN
    OINDUSTRYKEY := CASE WHEN LENGTH(IINDUSTRYKEY)=1 THEN '2'||IINDUSTRYKEY
                         ELSE '2O' end;
    RETURN OINDUSTRYKEY;
  END;


  /*
  * TITLE      : �����ַ�������ת����date����
  * DESCRIPTION:
  * PARAMETERS :
  *   IN:
  *         ��DTINPUTDT���ַ�����������
  *         ��PATTERN�����ַ�����������ģʽ
  *
  *  OUT:
  * RETURN     ��Date��������,���ת�����󷵻�null
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  FUNCTION F03_STRINGTODATE(DTINPUTDT IN VARCHAR2, PATTERN IN VARCHAR2) RETURN DATE IS
    LV_DATE DATE;
  BEGIN
    IF DTINPUTDT IS NULL THEN
      RETURN NULL;
    END IF;

    BEGIN
      LV_DATE := TO_DATE(DTINPUTDT, PATTERN);
    EXCEPTION
      WHEN OTHERS THEN
        LV_DATE := NULL;
    END;
    RETURN LV_DATE;
  END;


  /**
  * TITLE      : ����������ʱ����ɽ���ʱ��</P>
  * DESCRIPTION: �������������ַ�����ʱ����ϳ�Ϊ����ʱ��</P>
  *              IN_DATE        ԭ����</P>
  *              IN_TIME        ԭ���׽��</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-21
  */
  FUNCTION F04_STRING_TO_TIMESTEMP(IN_DATE IN DATE, IN_TIME IN VARCHAR2)
    RETURN DATE IS
    LV_DT_TIME  DATE;
    LV_DATE_STR VARCHAR2(10);
    LV_TIME_STR VARCHAR2(8);

  BEGIN
    --��Date������ת��Ϊ�ַ���
    IF IN_DATE IS NULL THEN
      RETURN NULL;
    END IF;

    BEGIN
      LV_DATE_STR := TO_CHAR(IN_DATE, 'YYYY-MM-DD');
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
    END;
    --������ֵ��������ɽ���ʱ��
    IF IN_TIME IS NULL THEN
      RETURN IN_DATE;
    ELSE
      BEGIN
        LV_TIME_STR := SUBSTR('000000' || IN_TIME,LENGTH('000000' || IN_TIME) - 5,2) || ':' ||  --ʱ��ǰ��λ
                       SUBSTR('000000' || IN_TIME,LENGTH('000000' || IN_TIME) - 3,2) || ':' ||  --ʱ���м���λ
                       SUBSTR('000000' || IN_TIME,LENGTH('000000' || IN_TIME) - 1,2);           --ʱ�������λ
        LV_DT_TIME  := TO_DATE(LV_DATE_STR || ' ' || LV_TIME_STR,'YYYY-MM-DD HH24:MI:SS'); --�ַ���ʱ��ת��Ϊʱ������
      EXCEPTION
        WHEN OTHERS THEN
          RETURN NULL;
      END;
    END IF;

    RETURN LV_DT_TIME;
  END;

  /**
  * TITLE      : ���׽����������Һ���Ԫ</P>
  * DESCRIPTION: ͨ������T87_EXCHANGE_RATE�������׽������Ϊ����һ���Ԫ</P>
  *              IN_CURRENCY_CD        ԭ����</P>
  *              IN_AMT                ԭ���׽��</P>
  *              OUT_CURRENCY_CD       Ŀ�����</P>
  *              LV_EXCHANGE_RATE      �������</P>
  *              LV_AMT                ���صĽ��׽��</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-14
  */
  FUNCTION F05_TRANSFER_EXCHANGE_RATE(IN_CURRENCY_CD  IN VARCHAR2,
                                      IN_AMT          IN NUMBER,
                                      OUT_CURRENCY_CD IN VARCHAR2)
    RETURN NUMBER IS
    LV_EXCHANGE_RATE NUMBER(12, 6);
    LV_AMT           NUMBER(18, 2);
  BEGIN
    --ȡ������һ���
    IF OUT_CURRENCY_CD = 'CNY' THEN
      SELECT T.RMB_FX_RATE/T.CURRENCY_UNIT
        INTO LV_EXCHANGE_RATE
        FROM T87_EXCHANGE_RATE T
       WHERE T.CURRENCY_CD = IN_CURRENCY_CD;
      --ȡ����Ԫ����
    ELSIF OUT_CURRENCY_CD = 'USD' THEN
      SELECT T.USD_FX_RATE/T.CURRENCY_UNIT
        INTO LV_EXCHANGE_RATE
        FROM T87_EXCHANGE_RATE T
       WHERE T.CURRENCY_CD = IN_CURRENCY_CD;
    END IF;
    LV_AMT := ABS(IN_AMT) * LV_EXCHANGE_RATE;

    RETURN LV_AMT;
  END;

  /*
  * TITLE      : �ַ���ת������
  * DESCRIPTION:
  * PARAMETERS :
  *   IN: ��ICARD_TYPE��
  *
  *  OUT:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  FUNCTION F07_STRINGTONUMBER(SNUM IN VARCHAR2) RETURN NUMBER IS
    LV_SNUM VARCHAR2(45);
    LV_NUMBER NUMBER(30,2);
  BEGIN
    LV_SNUM := TRIM(SNUM);
    IF LV_SNUM IS NULL THEN
      RETURN NULL;
    END IF;

    BEGIN
      LV_NUMBER := TO_NUMBER(LV_SNUM);
    EXCEPTION
      WHEN OTHERS THEN
        LV_NUMBER := null;
    END;

    RETURN LV_NUMBER;
  END;


  /*
  * TITLE      : �����˻���������ͻ�
  * DESCRIPTION: �ӵ������˻���ϵ ���ѯ���˻��Ƿ��Ѿ���������ͻ���,
                 ���������������������ͻ��ţ�VP+�˺ţ�,����ͻ���,�������˻���ϵ��
  * PARAMETERS :
  *   IN:
  *       ��P_ORGANKEY�� Ҫ������ͻ�����������
  *       ��P_PARTY_CLASS_CD�� Ҫ������ͻ��ſͻ�����
  *       ��P_ACCT_NUM�� Ҫ������ͻ��ŵ��˺�
  *  OUT:
  *       ��P_HOST_CUST_ID�� ����ͻ���
  *       ��P_NAME�� ����ͻ����� ������ͻ���
  * RETURN     :  ����ͻ���
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-20
  * MODIFY BY  :
  * MODIFY DATE:
  */
  FUNCTION F08_GEN_VIRTUAL_PARTY(P_ORGANKEY IN VARCHAR2, P_PARTY_CLASS_CD IN VARCHAR2, P_ACCT_NUM VARCHAR2, P_HOST_CUST_ID OUT VARCHAR2, P_NAME OUT VARCHAR2) RETURN VARCHAR2 IS
    LV_PARTY_ID VARCHAR2(40);
  BEGIN
    BEGIN
      SELECT PARTY_ID
      INTO LV_PARTY_ID
      FROM T47_PARTY_ACCT_RELA RELA
      WHERE RELA.ACCT_NUM = P_ACCT_NUM;       -- �ӵ������˻���ϵ ���ѯ���˻��Ƿ��Ѿ���������ͻ���

      -- ���˻��ѽ�������ͻ�
      P_HOST_CUST_ID := LV_PARTY_ID;
      P_NAME         := '����ͻ�';

    EXCEPTION
      WHEN OTHERS THEN -- ���˺�û�н���������ͻ���
        LV_PARTY_ID    := 'VP'||P_ACCT_NUM;
        P_HOST_CUST_ID := LV_PARTY_ID;
        P_NAME         := '����ͻ�';

        -- ���뵱�����˻���ϵ
        INSERT INTO T47_PARTY_ACCT_RELA
          (PARTY_ID, ACCT_NUM, RELATION_CD, START_DT, END_DT)
        VALUES
          (LV_PARTY_ID,
           P_ACCT_NUM,
           '01',
           SYSDATE,
           TO_DATE('3000-12-31', 'YYYY-MM-DD'));
        -- ����ͻ���
        INSERT INTO T47_PARTY
          (PARTY_ID,
           HOST_CUST_ID,
           PARTY_CLASS_CD,
           NEW_IND,
           AML1_TYPE_CD,
           PARTY_STATUS_CD,
           PARTY_CHN_NAME,
           CARD_TYPE,
           CARD_NO,
           LAST_UPD_DT,
           CREATE_DT,
           ORGANKEY
           )
        VALUES
          (LV_PARTY_ID,
           LV_PARTY_ID,
           P_PARTY_CLASS_CD,
           '1',
           '', -- AML����1:���ˣ�01���� 02�Ǿ���˾��51:�������Ļ��ء�����Ȩ�����ء��������ء�˾�����ء����»��ء�������Э����52:�����ž����侯����53:���ջ���54:֤ȯ��Ӫ����
           '0',
           P_NAME,
           '51', -- ֤������ 01:�������֤����ʱ�������֤�򻧿ڲ�02���������֤���򾯲����֤��03���۰ľ��������ڵ�ͨ��֤��̨����������ڵ�ͨ��֤����������Ч����֤��04������05������51:��������֤
           'ZJ'||P_ACCT_NUM,
           SYSDATE,
           SYSDATE,
           P_ORGANKEY
           );

    END;

    RETURN LV_PARTY_ID;
  END;

  /**
  * TITLE      : �鿴�����Ƿ��Ѵ��ڻ�������</P>
  * DESCRIPTION: ͨ���������ŵ�������T00_ORGAN�в�ѯ�Ƿ����</P>
  *              IN_ORGANKEY   ��������</P>
  *              LV_IS_EXIST   ����ֵ</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-23
  */
  FUNCTION F09_ORGAN_IS_EXIST(IN_ORGANKEY IN VARCHAR2) RETURN BOOLEAN IS
    LV_IS_EXIST BOOLEAN;
    LV_COUNT    NUMBER := 0;
  BEGIN
    SELECT COUNT(T.ORGANKEY)
      INTO LV_COUNT
      FROM T00_ORGAN T
     WHERE T.ORGANKEY = IN_ORGANKEY;
    IF (LV_COUNT > 0) THEN
      LV_IS_EXIST := TRUE;
    ELSE
      LV_IS_EXIST := FALSE;
    END IF;

    RETURN LV_IS_EXIST;
  END;

  /**
  * TITLE      : ȡ�����е�������</P>
  * DESCRIPTION: ͨ��4λ�����������T87_AREA_MAP��ȡ�����д���</P>
  *              IN_AREA  4λ��������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */

  FUNCTION F10_PBC_AREA_4_TO_6(IN_AREA IN VARCHAR2) RETURN VARCHAR2  IS
    LV_PBC_AREA VARCHAR2(6);
  BEGIN
       IF IN_AREA IS NULL THEN
          LV_PBC_AREA := NULL;
       ELSE
       BEGIN
            SELECT T.PBC_AREAKEY
            INTO LV_PBC_AREA
            FROM T87_AREA_MAP T
            WHERE T.UNION_CITYNO = IN_AREA;
            EXCEPTION
            WHEN OTHERS THEN
                 LV_PBC_AREA := NULL;
       END;
       END IF;

       RETURN LV_PBC_AREA;
  END;

  /**
  * TITLE      : ȡ����������</P>
  * DESCRIPTION: ͨ�����ִ������T87_CURRENCY��ȡ����������</P>
  *              IN_CURRENCY_CD  ����</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */

  FUNCTION F11_CURRENCY_NAME(IN_CURRENCY_CD IN VARCHAR2) RETURN VARCHAR2  IS
    LV_CURRENCY_NAME VARCHAR2(64);
  BEGIN
       IF IN_CURRENCY_CD IS NULL THEN
          LV_CURRENCY_NAME := NULL;
       ELSE
       BEGIN
           SELECT T.CURRENCY_NAME
           INTO LV_CURRENCY_NAME
           FROM T87_CURRENCY T
           WHERE T.CURRENCY_CD = IN_CURRENCY_CD;
           EXCEPTION
           WHEN OTHERS THEN
                LV_CURRENCY_NAME := NULL;
       END;
       END IF;

       RETURN LV_CURRENCY_NAME;
  END;


  /**
  * TITLE      : ȡ���ͻ�����</P>
  * DESCRIPTION: ͨ���ͻ�������� T47_PARTY ��ȡ���ͻ�����</P>
  *              IN_CURRENCY_CD  ����</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */

  FUNCTION F12_PARTY_NAME(IN_PARTY_ID IN VARCHAR2) RETURN VARCHAR2  IS
    LV_PARTY_CHN_NAME VARCHAR2(200);
  BEGIN
       IF IN_PARTY_ID IS NULL THEN
          LV_PARTY_CHN_NAME := NULL;
       ELSE
       BEGIN
            SELECT T.PARTY_CHN_NAME
            INTO LV_PARTY_CHN_NAME
            FROM T47_PARTY T
            WHERE T.PARTY_ID = IN_PARTY_ID;
            EXCEPTION
            WHEN OTHERS THEN
                 LV_PARTY_CHN_NAME := NULL;
       END;
       END IF;

       RETURN LV_PARTY_CHN_NAME;
  END;

  /**
  * TITLE      : ȡ���ͻ�����</P>
  * DESCRIPTION: ͨ���ͻ�������� T47_PARTY ��ȡ���ͻ�����</P>
  *              IN_CURRENCY_CD  ����</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */

  FUNCTION F13_PARTY_ID(IN_ZHDH IN VARCHAR2,IN_KHDH IN VARCHAR2 ) RETURN VARCHAR2  IS
    LV_PARTY_ID VARCHAR2(40);
  BEGIN
       IF IN_ZHDH IS NULL AND IN_KHDH IS NULL THEN
          LV_PARTY_ID := NULL;
       ELSE
       BEGIN
            SELECT T.PARTY_ID
            INTO LV_PARTY_ID
            FROM ODS.ODS_DSKHXXWJ T
            WHERE T.ZHDH = IN_ZHDH;
            EXCEPTION
            WHEN OTHERS THEN
                 LV_PARTY_ID := NULL;
            IF LV_PARTY_ID IS NULL THEN
            BEGIN
                 SELECT T.PARTY_ID
                 INTO LV_PARTY_ID
                 FROM ODS.ODS_DSKHXXWJ T
                 WHERE T.ZHDH = IN_KHDH;
                 EXCEPTION
                 WHEN OTHERS THEN
                      LV_PARTY_ID := NULL;
           END;
           END IF;
       END;
       END IF;

       RETURN LV_PARTY_ID;
  END;


  /*
  * TITLE      :�鴦��˽�ͻ��Ŀ�������
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  FUNCTION F14_PARTY_ORGANKEY(IN_PARTY_ID IN VARCHAR2) RETURN VARCHAR2  IS
    LV_PARTY_ORGANKEY VARCHAR2(10);
  BEGIN
       IF IN_PARTY_ID IS NULL  THEN
          LV_PARTY_ORGANKEY := NULL;
       ELSE
       BEGIN
            SELECT MIN(T.KHDQDH || T.KHJGDH) AS ORGANKEY
            INTO LV_PARTY_ORGANKEY
            FROM ODS.ODS_DSKHXXWJ T
            WHERE T.PARTY_ID = IN_PARTY_ID;
            EXCEPTION
            WHEN OTHERS THEN
                 LV_PARTY_ORGANKEY := NULL;
        END;
        END IF;

        RETURN LV_PARTY_ORGANKEY;

  END;

  /*
  * TITLE      :�鴦��˽�ͻ��Ŀ�������
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  FUNCTION F15_CONTAIN_CHAR(IN_OPP_NAME IN VARCHAR2,IN_TYPE IN VARCHAR2) RETURN BOOLEAN  IS
  CURSOR CURS_PARTY_STR IS
         SELECT T.PARTY_STRING
         FROM T87_PARTY_CLASS T
         WHERE T.PUB_PRI_FLG = IN_TYPE;

  LV_IS_CONTAIN BOOLEAN := FALSE;
  LV_PARTY_STRING VARCHAR2(50);

  BEGIN
       IF IN_OPP_NAME IS NULL  THEN
          LV_IS_CONTAIN := FALSE;
       ELSE
       BEGIN
            OPEN CURS_PARTY_STR;
            LOOP
                FETCH CURS_PARTY_STR
                INTO LV_PARTY_STRING;
                EXIT WHEN CURS_PARTY_STR%NOTFOUND;
                IF INSTR(IN_OPP_NAME,LV_PARTY_STRING,1,1) = 0 THEN
                   LV_IS_CONTAIN :=FALSE;
                ELSE
                BEGIN
                   LV_IS_CONTAIN :=TRUE;
                   EXIT;
                END;
                END IF;
             END LOOP;
             CLOSE CURS_PARTY_STR;
       END;
       END IF;

       RETURN LV_IS_CONTAIN;

  END;

  /*
  * TITLE      :ͨ�����״���鿴�����Ƿ����
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  FUNCTION F16_IS_FILTER_TX_CD(IN_TX_CD IN VARCHAR2,IN_TX_FLAG IN VARCHAR2) RETURN BOOLEAN  IS
  LV_IS_FILTER BOOLEAN := FALSE;
  LV_TX_CD VARCHAR2(8) := NULL;

  BEGIN
       IF IN_TX_CD IS NULL OR IN_TX_FLAG IS NULL THEN
       BEGIN
            LV_TX_CD := NULL;
       END;
       ELSE
       BEGIN
           SELECT T.TX_CD
           INTO LV_TX_CD
           FROM T18_CONFIG_TX_CD T
           WHERE T.TX_CD = IN_TX_CD AND
                 T.TX_FLAG = IN_TX_FLAG;
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
           BEGIN
                LV_TX_CD     := NULL;
           END;
       END;
       END IF;

       IF LV_TX_CD IS NULL THEN LV_IS_FILTER :=FALSE;
       ELSE LV_IS_FILTER := TRUE;
       END IF;

       RETURN LV_IS_FILTER;
  END;

  /*
  * TITLE      :ͨ����Ŀ���Ų鿴�����Ƿ����
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  FUNCTION F17_IS_FILTER_SUBJECT(IN_SUBJECT_NUM IN VARCHAR2,IN_FLAG IN VARCHAR2) RETURN BOOLEAN  IS
  LV_IS_FILTER BOOLEAN := FALSE;
  LV_SUBJECT_NUM VARCHAR2(8) := NULL;

  BEGIN
       IF IN_SUBJECT_NUM IS NULL OR IN_FLAG IS NULL THEN
       BEGIN
            LV_SUBJECT_NUM := NULL;
       END;
       ELSE
       BEGIN
           SELECT T.SUBJECT_NUM
           INTO LV_SUBJECT_NUM
           FROM T18_CONFIG_SUBJECT T
           WHERE T.SUBJECT_NUM = IN_SUBJECT_NUM AND
                 T.SUBJECT_FLAG = IN_FLAG;
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
           BEGIN
                LV_SUBJECT_NUM     := NULL;
           END;
       END;
       END IF;

       IF LV_SUBJECT_NUM IS NULL THEN LV_IS_FILTER :=FALSE;
       ELSE LV_IS_FILTER := TRUE;
       END IF;

       RETURN LV_IS_FILTER;
  END;

  /*
  * TITLE      :ͨ�� ��Ŀ���� + ���״��� �鿴�����Ƿ����
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  FUNCTION F18_IS_FILTER_SUBJECT_TX_CD(IN_SUBJECT_NUM IN VARCHAR2,IN_TX_CD IN VARCHAR2) RETURN BOOLEAN  IS
  LV_IS_FILTER BOOLEAN := FALSE;

  BEGIN
       IF IN_SUBJECT_NUM IS NULL OR IN_TX_CD IS NULL THEN
       BEGIN
            LV_IS_FILTER := FALSE;
       END;
       ELSE
       BEGIN
            IF (IN_SUBJECT_NUM = '220431') AND
               ( ( IN_TX_CD = '1601') OR   --�Թ����ڿ���
                 ( IN_TX_CD = '1611') OR   --�ֽ�����
                 ( IN_TX_CD = '1613') OR   --ϵͳ��ת��
                 ( IN_TX_CD = '2600') OR   --��λ���ڴ���
                 ( IN_TX_CD = '1662') )    --���гжһ�Ʊ�տ�
            THEN
                LV_IS_FILTER := TRUE;
            ELSE
                LV_IS_FILTER := FALSE;
            END IF;
       END;
       END IF;

       RETURN LV_IS_FILTER;
  END;

/*
  * TITLE      :ͨ���˺Ų鿴�����Ƿ����
  * DESCRIPTION:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2009-03-01
  */
  FUNCTION F19_IS_FILTER_ACCT_NUM(IN_ACCT_NUM IN VARCHAR2,IN_FLAG IN VARCHAR2) RETURN BOOLEAN  IS
  LV_IS_FILTER BOOLEAN := FALSE;
  LV_ACCT_NUM VARCHAR2(48) := NULL;

  BEGIN
       IF IN_ACCT_NUM IS NULL OR IN_FLAG IS NULL THEN
       BEGIN
            LV_ACCT_NUM := NULL;
       END;
       ELSE
       BEGIN
           SELECT T.ACCT_NUM
           INTO LV_ACCT_NUM
           FROM T18_CONFIG_ACCT_NUM T
           WHERE T.ACCT_NUM = IN_ACCT_NUM AND
                 T.ACCT_NUM_FLAG = IN_FLAG;
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
           BEGIN
                LV_ACCT_NUM     := NULL;
           END;
       END;
       END IF;

       IF LV_ACCT_NUM IS NULL THEN LV_IS_FILTER :=FALSE;
       ELSE LV_IS_FILTER := TRUE;
       END IF;

       RETURN LV_IS_FILTER;
  END;
/*
  * TITLE      :ͨ�����֤�Ż�ó�������
  * DESCRIPTION:
  * COPYRIGHT  :
  * COMPANY    :
  * AUTHOR     ��HXX
  * VERSION    ��1.0
  * DATE       : 2015-07-28
  */
  FUNCTION F20_GET_BIRTH_DT(IN_ZJHM IN VARCHAR2,IN_ZJZL IN VARCHAR2) RETURN DATE  IS
  LV_BIRTH_DT DATE;

  BEGIN
       IF IN_ZJHM IS NULL OR IN_ZJZL IS NULL THEN
       BEGIN
            LV_BIRTH_DT := NULL;
       END;
       ELSE
       BEGIN
           SELECT TO_DATE(SUBSTR(T.ZJHM, 7, 8), 'YYYYMMDD')
           INTO LV_BIRTH_DT
           FROM ODS.ODS_DSKHB T
           WHERE T.ZJHM = IN_ZJHM
             AND T.ZJZL = IN_ZJZL
             AND LENGTH(T.ZJHM) = 18;
           EXCEPTION
           WHEN OTHERS THEN
           BEGIN
                LV_BIRTH_DT     := NULL;
           END;
       END;
       END IF;

       RETURN LV_BIRTH_DT;
  END;
  /*
  * TITLE      : ����ʱ��Ϣ���
  * DESCRIPTION: ��GV_DEBUG=0 ͣ��DEBUG��Ϣ���,GV_DEBUG=1 ����DEBUG��Ϣ���
  * PARAMETERS :
  *   IN:
  *             ��P_DISP��Ҫ�����Ϣ
  *
  *  OUT:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  PROCEDURE P00_LOGINFO(P_DISP VARCHAR2) AS
  BEGIN
    IF GV_DEBUG=1 THEN
      --DBMS_OUTPUT.PUT('DEBUG INFO('||TO_CHAR(SYSDATE,'MM-DD HH24:MI:SS')||'):');
      P00_DISP(P_DISP,'DEBUG');
    END IF;
  END;


  /*
  * TITLE      : �������й����г�����־
  * DESCRIPTION: ����GV_DEBUGӰ��,�����־
  * PARAMETERS :
  *   IN:
  *          ��P_ERROR��Ҫ����Ĵ�����Ϣ
  *
  *  OUT:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  PROCEDURE P00_ERRORINFO(P_ERROR VARCHAR2) AS
  BEGIN
    --DBMS_OUTPUT.PUT('ERROR INFO('||TO_CHAR(SYSDATE,'MM-DD HH24:MI:SS')||'):');
    P00_DISP(P_ERROR,'ERROR');
  END;


  /*
  * TITLE      : ��־���
  * DESCRIPTION: ��������GV_LOG_TO='LOGTAB'�������־��T18_logtab,��������ڿ���̨
  * PARAMETERS :
  *   IN: ��ICARD_TYPE��
  *
  *  OUT:
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  PROCEDURE P00_DISP(P_DISP VARCHAR2, P_TYPE VARCHAR2) AS
    LV_SUBSTR VARCHAR2(255);
    LEN NUMBER;
    POS NUMBER;
  BEGIN
    /*IF GV_LOG_TO = 'LOGTAB' THEN
      INSERT INTO T18_LOGTAB(LOG_TIME, LOG_TYPE, LOG_INFO) VALUES(SYSDATE, P_TYPE, P_DISP);
      COMMIT;
    ELSE    */
      IF P_TYPE='DEBGE' THEN
        DBMS_OUTPUT.PUT('DEBUG INFO('||TO_CHAR(SYSDATE,'MM-DD HH24:MI:SS')||'):');
      ELSE
        DBMS_OUTPUT.PUT('ERROR INFO('||TO_CHAR(SYSDATE,'MM-DD HH24:MI:SS')||'):');
      END IF;
      -- ����̨���ÿ����255�ַ�����,���Ա����ȡ�������
      LEN := LENGTH(P_DISP);
      IF LEN <= GV_LINE_LMT THEN
        DBMS_OUTPUT.PUT_LINE(P_DISP);
      ELSE
        POS := 1;
        WHILE (LEN-POS)>GV_LINE_LMT
          LOOP
            LV_SUBSTR := SUBSTR(P_DISP, POS, GV_LINE_LMT);
            POS := POS + GV_LINE_LMT;
            DBMS_OUTPUT.PUT_LINE(LV_SUBSTR);
          END LOOP;
        LV_SUBSTR := SUBSTR(P_DISP, POS, LEN-POS+1);
        DBMS_OUTPUT.PUT_LINE(LV_SUBSTR);
      END IF;
    /*END IF;*/
  END;


  /**
  * TITLE      : �����Ŀ���ű�</P>
  * DESCRIPTION: ����Ŀ���������ش����ODS.ODS_KMDHB���뵽AML.T87_SUBJECT</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-21
  */
  PROCEDURE P01_T87_SUBJECT(DTINPUTDT IN VARCHAR2) AS

  BEGIN
    MERGE INTO T87_SUBJECT T1
    USING (SELECT T2.KMDH, --��Ŀ����
                  T2.KMMC, --��Ŀ����
                  T2.KMCC --��Ŀ�洢
             FROM ODS.ODS_KMDHB T2 ) T3
    ON (T1.SUBJECTKEY = T3.KMDH)
    --��Ŀ�����Ѵ��������
    WHEN MATCHED THEN
      UPDATE
         SET T1.SUBJECTNAME = T3.KMMC, T1.SUBJECTTYPE = T3.KMCC
      --��Ŀ���Ų����������

    WHEN NOT MATCHED THEN
      INSERT
        (T1.SUBJECTKEY, T1.SUBJECTNUM, T1.SUBJECTNAME, T1.SUBJECTTYPE)
      VALUES
        (T3.KMDH, T3.KMDH, T3.KMMC, T3.KMCC);
    COMMIT;

  END;


  /**
  * TITLE      : ���뽻�״����</P>
  * DESCRIPTION: �����״��������ش����ODS.ODS_JYLB���뵽AML.T87_TX_CD</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-21
  */
  PROCEDURE P02_T87_TX_CD(DTINPUTDT IN VARCHAR2) AS

  BEGIN
    MERGE INTO T87_TX_CD T1
    USING (SELECT T2.JYDM, --���״���
                  T2.JYMC, --��������
                  T2.JYSM --����˵��
             FROM ODS.ODS_JYLB T2 ) T3
    ON (T1.TX_CD = T3.JYDM)
    WHEN MATCHED THEN
      UPDATE SET T1.TX_NAME = T3.JYMC, T1.TX_DES = T3.JYSM
    WHEN NOT MATCHED THEN
      INSERT
        (T1.TX_CD, T1.TX_NAME, T1.TX_DES, T1.FLAG)
      VALUES
        (T3.JYDM, T3.JYMC, T3.JYSM, '1');
    COMMIT;
  END;


  /**
  * TITLE      : �����ұ�����</P>
  * DESCRIPTION: ������ұ�����Ϣ</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */
  PROCEDURE P03_T87_CURRENCY(DTINPUTDT IN VARCHAR2) AS

  BEGIN
       MERGE INTO T87_CURRENCY T
       USING (SELECT T1.GJHBFH AS CURRENCY_CD,
                     T1.HBZWMC
              FROM ODS.ODS_HBB T1 ) T2
       ON (T.CURRENCY_CD = T2.CURRENCY_CD)

       WHEN MATCHED THEN
         UPDATE SET T.CURRENCY_NAME = T2.HBZWMC
       WHEN NOT MATCHED THEN
         INSERT ( T.CURRENCY_CD,
                  T.CURRENCY_SYMBOL,
                  T.CURRENCY_NAME,
                  T.CREATE_DT,
                  T.CREATE_USR)
         VALUES ( T2.CURRENCY_CD,
                  T2.CURRENCY_CD,
                  T2.HBZWMC,
                  SYSDATE,
                  'admin');
       COMMIT;
  END;


  /**
  * TITLE      : ���������������</P>
  * DESCRIPTION: ������ֱ�����������Һ���Ԫ�Ļ���</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-31
  */
  PROCEDURE P04_T87_EXCHANGE_RATE(DTINPUTDT IN VARCHAR2) AS

     LV_HBZL VARCHAR2(2); --��������
     LV_CURRENCY_CD T87_EXCHANGE_RATE.CURRENCY_CD%TYPE;
     LV_GJHBFH VARCHAR2(3);--���ʻ��ҷ���
     LV_ZJJG DECIMAL(16, 10);--�м�۸�
     LV_DFBZ VARCHAR2(2);--�Է�����
     LV_HBDW T87_EXCHANGE_RATE.CURRENCY_UNIT%TYPE; --���ҵ�λ
     LV_CURRENCY_NAME T87_EXCHANGE_RATE.CURRENCY_NAME%TYPE;--����������
     LV_TARGET_CURRENCY T87_EXCHANGE_RATE.CURRENCY_CD%TYPE;
     LV_SXRQ DATE;--��Ч����
     LV_ZZRQ DATE;--��ֹ����

    CURSOR CURS_T87_RATE IS
    SELECT HBZL   ,
           GJHBFH ,
           DFBZ,
           HBDW,
           ZJJG   ,
           SXRQ   ,
           ZZRQ
    FROM ODS.ODS_HLB H ;

  BEGIN
    OPEN CURS_T87_RATE ;
      LOOP
       FETCH CURS_T87_RATE
        INTO LV_HBZL,
             LV_GJHBFH,
             LV_DFBZ,
             LV_HBDW,
             LV_ZJJG,
             LV_SXRQ,
             LV_ZZRQ;
        EXIT WHEN CURS_T87_RATE%NOTFOUND;

        LV_CURRENCY_CD := F01_ETL_CODE_MAP('1006',LV_HBZL);
        LV_TARGET_CURRENCY := F01_ETL_CODE_MAP('1006',LV_DFBZ);
        LV_CURRENCY_NAME := F11_CURRENCY_NAME(LV_CURRENCY_CD);

        IF LV_TARGET_CURRENCY = 'CNY' OR LV_TARGET_CURRENCY = 'USD' THEN
         UPDATE T87_EXCHANGE_RATE ER
         SET
             ER.CURRENCY_SYMBOL =  LV_GJHBFH,
             ER.CURRENCY_NAME   =  LV_CURRENCY_NAME,
             ER.CURRENCY_UNIT   =  LV_HBDW,
             ER.RMB_FX_RATE     =  CASE WHEN RMB_FX_RATE IS NULL THEN
                                        CASE WHEN  LV_TARGET_CURRENCY ='CNY' THEN LV_ZJJG END
                                        ELSE RMB_FX_RATE END ,
             ER.USD_FX_RATE     =  CASE WHEN USD_FX_RATE IS NULL THEN
                                        CASE WHEN  LV_TARGET_CURRENCY ='USD' THEN LV_ZJJG END
                                        ELSE USD_FX_RATE END ,
             ER.CREATE_DT       =  LV_SXRQ,
             ER.END_DT          =  LV_ZZRQ
          WHERE CURRENCY_CD = LV_CURRENCY_CD;
           IF (SQL%NOTFOUND) THEN
           INSERT INTO T87_EXCHANGE_RATE ER (
              ER.CURRENCY_CD,
              ER.CURRENCY_SYMBOL,
              ER.CURRENCY_UNIT,
              ER.CURRENCY_NAME,
              ER.RMB_FX_RATE,
              ER.USD_FX_RATE,
              ER.CREATE_DT,
              ER.END_DT
           )VALUES(
              LV_HBZL,
              LV_GJHBFH,
              LV_CURRENCY_NAME,
              LV_HBDW,
              CASE WHEN  LV_TARGET_CURRENCY ='CNY' THEN LV_ZJJG END,
              CASE WHEN  LV_TARGET_CURRENCY ='USD' THEN LV_ZJJG END,
              LV_SXRQ,
              LV_ZZRQ
           );
           END IF;
           COMMIT;
       END IF;
    END LOOP;
    CLOSE CURS_T87_RATE;

  END;

  /**
  * TITLE      : ȫ�����б�</P>
  * DESCRIPTION: ��ȫ�����б�����</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIZHY
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  */
  PROCEDURE P05_T87_UNION(DTINPUTDT IN VARCHAR2) AS

  BEGIN

    BEGIN
      MERGE INTO T87_UNION T
      USING (SELECT trim(RH.ZFHHH) as ZFHHH,
                    trim(RH.SZJDDM) as SZJDDM,
                    SUBSTR(trim(RH.ZFHHM), 1, 64) AS UNION_NAME,
                    SUBSTR(trim(RH.ZFHJC), 1, 64) AS UNION_SIMPLE_NAME
               FROM ODS.ODS_RHZFHHZB RH
              WHERE RH.ZFHHH IS NOT NULL) T1
      ON (T.UNIONORGKEY = T1.ZFHHH)
      WHEN MATCHED THEN
        UPDATE
           SET T.COUNTRY_CD        = 'CHN', --Ĭ��Ϊ 11���ִ���֧��ϵͳ�к�
               T.CITY_CD           = nvl(F10_PBC_AREA_4_TO_6(substr(zfhhh,
                                                                    4,
                                                                    4)),
                                         F10_PBC_AREA_4_TO_6(T1.SZJDDM)),
               T.UNION_TYPE        = '11', --Ĭ��Ϊ CHN
               T.UNION_NAME        = T1.UNION_NAME,
               T.UNION_SIMPLE_NAME = T1.UNION_SIMPLE_NAME
      WHEN NOT MATCHED THEN
        INSERT
          (T.UNIONORGKEY,
           T.COUNTRY_CD,
           T.CITY_CD,
           T.UNION_TYPE,
           T.UNION_NAME,
           T.UNION_SIMPLE_NAME)
        VALUES
          (T1.ZFHHH,
           'CHN',
           F10_PBC_AREA_4_TO_6(T1.SZJDDM),
           '11',
           T1.UNION_NAME,
           T1.UNION_SIMPLE_NAME);
      COMMIT;

    END;
    BEGIN
      MERGE INTO T87_UNION T
      USING (SELECT trim(RH.JGHH) as JGHH,
                    trim(RH.CCPC) as CCPC,
                    SUBSTR(trim(RH.JGQC), 1, 64) AS UNION_NAME,
                    SUBSTR(trim(RH.JGJC), 1, 64) AS UNION_SIMPLE_NAME
               FROM ODS.ODS_ZFHMHHZB RH
              WHERE RH.JGHH IS NOT NULL) T1
      ON (T.UNIONORGKEY = T1.JGHH)
      WHEN MATCHED THEN
        UPDATE
           SET T.COUNTRY_CD        = 'CHN', --Ĭ��Ϊ 11���ִ���֧��ϵͳ�к�
               T.CITY_CD           = F10_PBC_AREA_4_TO_6(T1.CCPC),
               T.UNION_TYPE        = '11', --Ĭ��Ϊ CHN
               T.UNION_NAME        = T1.UNION_NAME,
               T.UNION_SIMPLE_NAME = T1.UNION_SIMPLE_NAME
      WHEN NOT MATCHED THEN
        INSERT
          (T.UNIONORGKEY,
           T.COUNTRY_CD,
           T.CITY_CD,
           T.UNION_TYPE,
           T.UNION_NAME,
           T.UNION_SIMPLE_NAME)
        VALUES
          (T1.JGHH,
           'CHN',
           F10_PBC_AREA_4_TO_6(T1.CCPC),
           '11',
           T1.UNION_NAME,
           T1.UNION_SIMPLE_NAME);
      COMMIT;

    END;
  END;


  /**
  * TITLE      : ���������</P>
  * DESCRIPTION: �����������ݽ�����ش����ODS.ODS_JGB���뵽
  *                            AML.T00_ORGAN,
  *                            AML.TOO_ORGAN_TEMP
  *                            AML_T87_UNION_ORGAN
  *                            ֻ���в������
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-22
  */
  PROCEDURE P06_T00_ORGAN(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    --�����α�
    CURSOR CURS_ORGAN IS
      SELECT T2.DQDH || T2.JGDH AS ORGANKEY,
             T2.DQDH,
             T2.JGMC,
             T2.DQDH || T2.SJJGDH AS UPORGANKEY,
             T2.DZ,
             T2.DHHM,
             T2.LXR,
             T2.ZFHHH,
             T2.WGBM
        FROM ODS.ODS_JGB T2
        UNION ALL
        SELECT T22.ORGANKEY AS ORGANKEY,
               '69',
               T22.ORGANNAME,
               T22.UPORGANKEY,
               T22.ORGANADDRESS,
               T22.TELEPHONE,
               T22.LINKMAN,
               T22.UNIONORGKEY,
               ''
        FROM t00_ya_fh T22;
    --�����α��и����ֶα���
    LV_ORGANKEY     T00_ORGAN.ORGANKEY%TYPE; --������
    LV_ORGANNAME    T00_ORGAN.ORGANNAME%TYPE; --��������
    LV_ORGANLEVEL   T00_ORGAN.ORGANLEVEL%TYPE; --��������
    LV_UPORGANKEY   T00_ORGAN.UPORGANKEY%TYPE; --�ϼ���������
    LV_ORGANADDRESS T00_ORGAN.ORGANADDRESS%TYPE; --������ַ
    LV_TELEPHONE    T00_ORGAN.TELEPHONE%TYPE; --�绰����
    LV_LINKMAN      T00_ORGAN.LINKMAN%TYPE; --��ϵ��
    LV_VALIDATEDATE T00_ORGAN.VALIDATEDATE%TYPE; --������Ч����
    LV_UNIONORGKEY  T87_UNION_ORGAN.UNIONORGKEY%TYPE; --�ִ�֧��ϵͳ�к�
    LV_ORG_AREA     T87_UNION_ORGAN.ORG_AREA%TYPE; --����������������
    LV_DQDH         VARCHAR2(2); --Դ������λ��������
    LV_WGBM         VARCHAR2(12); --Դ������ֽܾ��ڻ�������
    LV_report_organkey VARCHAR2(15);
BEGIN

  LV_REPORT_ORGANKEY := '010115117002477';

  OPEN CURS_ORGAN;
  LOOP
    FETCH CURS_ORGAN
      INTO LV_ORGANKEY, LV_DQDH, LV_ORGANNAME, LV_UPORGANKEY, LV_ORGANADDRESS, LV_TELEPHONE, LV_LINKMAN, LV_UNIONORGKEY, LV_WGBM;
    EXIT WHEN CURS_ORGAN%NOTFOUND;
    BEGIN
    IF (NOT F09_ORGAN_IS_EXIST(LV_ORGANKEY)) THEN
        LV_ORG_AREA        := F01_ETL_CODE_MAP('1010', LV_ORGANKEY);
        IF LV_ORGANKEY = '69100' THEN
          LV_ORGANLEVEL := '0'; --���л�������Ϊ0
          LV_UPORGANKEY := '-1'; --�����ϼ�����Ϊ1
          --�������л�����
          INSERT INTO T07_REPORT_ORGAN
            (INNER_ORGANKEY, --��������
             ORGANNAME, --��������
             REPORT_ORGANKEY, --���ͻ�������
             SEQ_TABLENAME)
          VALUES
            (LV_ORGANKEY,
             LV_ORGANNAME,
             LV_REPORT_ORGANKEY,
             'T07_PBC_SEQUENCE');
        ELSE
          IF LV_ORGANKEY IN ('69200', '69300','69400','69500','69600','69700','69800','69110','69900','69120','69778') OR LV_ORGANKEY LIKE '6910%' THEN
            LV_ORGANLEVEL := '1'; --���л�������Ϊ1
            LV_UPORGANKEY := '69100'; --�����ϼ�����Ϊ����
          ELSIF LV_ORGANKEY IN ('69801','69802','69803','69804','69805','69806','69821','69822','69823','69824','69826') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69200'; --����Ӫҵ��
          ELSIF LV_ORGANKEY IN ('69807','69818') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69300'; --��ɽ֧��
          ELSIF LV_ORGANKEY IN ('69808','69810') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69400'; --����֧��
          ELSIF LV_ORGANKEY IN ('69812','69813') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69500';  --ʯ�޷���
          ELSIF LV_ORGANKEY IN ('69814','69815','69825') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69600';  --��Դ֧��
          ELSIF LV_ORGANKEY IN ('69816') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69700';  --��ȫ����
          ELSIF LV_ORGANKEY IN ('69819') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69800';  --����֧��
          ELSIF LV_ORGANKEY IN ('69820') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69900';  --«ɽ����
          /**ELSIF LV_ORGANKEY IN ('69696','69697') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69900';  --�������
          ELSIF LV_ORGANKEY IN ('69698','69699') THEN
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
            LV_UPORGANKEY := '69110';  --��Դ����**/
          ELSE
            LV_ORGANLEVEL := '2'; --֧�л�������Ϊ2
          END IF;
        END IF;
        --���뵽������T00_ORGAN
        INSERT INTO T00_ORGAN
          (ORGANKEY, --���������ڲ�ʹ��
           ORGANNO, --������
           ORGANNAME, --��������
           ORGANSF, --��������1
           ORGANLEVEL, --��������
           UPORGANKEY, --�ϼ�����Ϊ��1������
           ORGANADDRESS, --��ϸ��ַ
           TELEPHONE, --�绰����
           LINKMAN, --��ϵ������
           VALIDATEDATE,
           CREATEDATE, --��Чʱ��
           ORG_AREA, --������������
           UNIONORGKEY) --�ִ�֧��ϵͳ�к�
        VALUES
          (LV_ORGANKEY,
           LV_ORGANKEY,
           LV_ORGANNAME,
           LV_ORGANNAME,
           LV_ORGANLEVEL,
           LV_UPORGANKEY,
           LV_ORGANADDRESS,
           LV_TELEPHONE,
           LV_LINKMAN,
           LV_INPUTDT,
           LV_INPUTDT,
           LV_ORG_AREA,
           LV_UNIONORGKEY);
      END IF;
    END;
  END LOOP;

  DELETE FROM T87_UNION_ORGAN;

  INSERT INTO T87_UNION_ORGAN
    (ORGANKEY, --��������
     ORG_AREA, --����������������
     UNIONORGKEY) --�ִ�֧��ϵͳ�к�
    SELECT ORGANKEY, ORG_AREA, UNIONORGKEY FROM T00_ORGAN;

  DELETE FROM T07_REPORT_ORGAN_MAP;
  --�������л�����
  INSERT INTO T07_REPORT_ORGAN_MAP
    (ORGANKEY, --��������
     REPORT_ORGANKEY) --���ͻ�������
    SELECT ORGANKEY, LV_REPORT_ORGANKEY FROM T00_ORGAN;

  --���´���ӳ���
  MERGE INTO T87_ETL_CODE_MAP T
  USING (SELECT * FROM T00_ORGAN WHERE ORG_AREA IS NOT NULL) T1
  ON (T.CODE_SOU = T1.ORGANKEY AND T.CODE_TYPE = '1010')
  WHEN NOT MATCHED THEN
    INSERT
      (CODE_TYPE, CODE_DES, CODE_RH, CODE_SOU)
    VALUES
      ('1010', '���е�������', T1.ORG_AREA, T1.ORGANKEY)
  WHEN MATCHED THEN
    UPDATE SET T.CODE_RH = T1.ORG_AREA;
  COMMIT;
END;

  /**
  * TITLE      : �����Ա��</P>
  * DESCRIPTION: ����Ա�����ݽ�����ش����ODS.ODS_JGB���뵽AML.T47_STAFF
  *
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-22
  */
  PROCEDURE P07_T47_STAFF(DTINPUTDT IN VARCHAR2) AS

  BEGIN
        MERGE INTO T47_STAFF T
        USING ( SELECT T1.DQDH || T1.JGDH AS ORGANKEY,
                       T1.GYDH,
                       T1.GYXM,
                       T1.BMZ,
                       T1.GYJB,
                       T1.QDZL
                FROM ODS.ODS_GYB T1 ) T2
        ON ( T.STAFFKEY = T2.GYDH )
        WHEN MATCHED THEN
             UPDATE SET T.STAFF_NAME = T2.GYXM,
                        T.ORGANKEY = T2.ORGANKEY,
                        T.DEPKEY = T2.BMZ,
                        T.STAFF_LEVEL = T2.GYJB/*,
                        T.CHANNEL_TYPE_CD = T2.QDZL*/ --modify by hxx
        WHEN NOT MATCHED THEN
             INSERT ( T.STAFFKEY,
                      T.HOST_TELLER,
                      T.STAFF_NAME,
                      T.ORGANKEY,
                      T.DEPKEY,
                      T.STAFF_LEVEL/*,
                      T.CHANNEL_TYPE_CD*/) --modify by hxx
             VALUES ( T2.GYDH,
                      T2.GYDH,
                      T2.GYXM,
                      T2.ORGANKEY,
                      T2.BMZ,
                      T2.GYJB/*,
                      T2.QDZL */);
        COMMIT;

  END;

  /**
  * TITLE      : ����ժҪ��</P>
  * DESCRIPTION: ��ժҪ�����ݽ�����ش����ODS.ODS_ZYB���뵽AML.TOO_ZYB</P>
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-21
  */
  PROCEDURE P09_T00_ZYB(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
    MERGE INTO T00_ZYB T1
          USING (SELECT T2.ZYDH, --ժҪ����
                        T2.ZYSM, --ժҪ����
                        T2.ZYJC, --ժҪ���
                        T2.JYLX, --��������
                        T2.JLZT --��¼״̬
                   FROM ODS.ODS_ZYB T2 ) T3
          ON (T1.ZYDH = T3.ZYDH)
          WHEN MATCHED THEN
            UPDATE
               SET T1.ZYSM = T3.ZYSM,
                   T1.ZYJC = T3.ZYJC,
                   T1.JYLX = T3.JYLX,
                   T1.JLZT = T3.JYLX
          WHEN NOT MATCHED THEN
            INSERT
              (T1.ZYDH, T1.ZYSM, T1.ZYJC, T1.JYLX, T1.JLZT, T1.INPUT_DT)
            VALUES
              (T3.ZYDH, T3.ZYSM, T3.ZYJC, T3.JYLX, T3.JLZT,LV_INPUTDT );
          COMMIT;
  END;

  /**
  * TITLE      : �ͻ���Ϣ��</P>
  * DESCRIPTION: ���ͻ���Ϣ������������,�����Թ���˽�ͻ���Ϣ
  * �������淶��P10_��Ӧ����,ϸ�����߼������ɴ�P11��P19������</P>
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-08-27
  */
  PROCEDURE P10_T47_PARTY(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
  BEGIN
     -- �ͻ��ֶԹ��ͻ����˽�ͻ����д���
     IF TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_PARTY_C THEN
        P11_T47_PARTY_C(DTINPUTDT,TASKKEY);       --����Թ��ͻ���Ϣ
     ELSIF  TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_PARTY_I THEN
        P12_T47_PARTY_I(DTINPUTDT,TASKKEY);        --�����˽�ͻ���Ϣ
     ELSIF  TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_PARTY_NEW THEN
         --�����Ƿ������ͻ���������ʱ�䳬��һ���µ������ͻ�����Ϊ�������ͻ�
     BEGIN
         UPDATE T47_PARTY T
         SET T.NEW_IND='0'
         WHERE T.NEW_IND='1' AND ( T.CREATE_DT <  SYSDATE - 10) ;
         --UPDATE T07_BLACKLIST SET create_dt = F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD'),modify_dt = F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
         --UPDATE T07_WHITELIST_INFO SET create_dt = F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD'),modify_dt= F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
         delete from T45_EBANK_OP;
         insert into T45_EBANK_OP
         select 'KHK' || b.host_custno,
         case when OPER_TYPE in ('3','5') then '01' else '03' end,
         cert_type || cert_no,
         cert_type || cert_no,
         oper_nm,
         CASE WHEN F01_ETL_CODE_MAP('1023',cert_type) IS NULL THEN '15'
              ELSE F01_ETL_CODE_MAP('1023',cert_type) END,
         cert_no,
         OPER_TEL,
         case when OPER_TYPE in ('3','5') then '1' else '2' end,
         case when oper_state in ('1', '2') then '1' when oper_state = '3' then '0' end,
         to_date(a.CREATE_DATE, 'yyyymmdd'),
         sysdate
    from ods.ODS_OPERATOR_TABLE a,
         (select distinct cust_no, host_custno from ods.ODS_ACC_INFO) b
   where a.cust_no = b.cust_no
     and a.oper_state <> '3';
         COMMIT;
     END;
     END IF;
  END;

  /**
  * TITLE      : �Թ��ͻ�</P>
  * DESCRIPTION: �Թ��ͻ�
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-12-19
  */
  PROCEDURE P11_T47_PARTY_C(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
    MERGE INTO T47_PARTY T
    USING ( SELECT 'KHK' || T1.KHDH AS KHDH,      --�ͻ���
                   T1.DQDH || T1.KHJGDH AS ORGANKEY,    --��������
                   '99' AS AML1_TYPE_CD,             --aml����1
                   '01' AS AML2_TYPE_CD,             --aml����2
                   T1.KHMC,      --�ͻ�����
                   T1.YWMC1,      --Ӣ������
                   CASE WHEN F01_ETL_CODE_MAP('1023',T1.ZJZL) IS NULL THEN '22'
                        ELSE F01_ETL_CODE_MAP('1023',T1.ZJZL) END
                   AS CARD_TYPE,                  --֤������
                   CASE WHEN LENGTH(T1.ZJHM) = 10 AND T1.ZJHM LIKE '%-%' THEN REPLACE(T1.ZJHM,'-','')
                        ELSE T1.ZJHM END AS ZJHM,       --֤������
                   'CHN' AS COUNTRY_CD ,              --��������
                   T1.KHRQ,        --��������
                   case when lengthb(SUBSTR(ZZHM, 1, 6))=length(SUBSTR(ZZHM, 1, 6)) then SUBSTR(ZZHM,1,6) end AS COUNTRY_RESIDENCE,
                   T1.BGDZ AS ADDR1,
                   CASE WHEN LENGTH(T1.DHHM)<>11 OR (LENGTH(T1.DHHM)=11 AND T1.DHHM LIKE '0%') THEN T1.DHHM END AS TEL_NO,
                   CASE WHEN LENGTH(T1.DHHM)=11 AND T1.DHHM NOT LIKE '0%' THEN T1.DHHM END AS CELL_NO,
                   case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1'  when  t1.jlzt='0' then '4' end as party_status_cd
             FROM ODS.ODS_DGKHXXWJ T1 ) T2
      ON ( T.PARTY_ID = T2.KHDH )
      /*WHEN MATCHED THEN
         UPDATE SET T.LAST_UPD_DT = LV_INPUTDT,
                    T.LAST_UPD_USER = 'ADMIN'*/
      WHEN NOT MATCHED THEN
        INSERT (T.PARTY_ID,           --�ͻ���
                T.HOST_CUST_ID,       --�ͻ���
                T.PARTY_CLASS_CD,     --����������  C:�Թ������� I:���˵�����
                T.ORGANKEY,           --¼�����
                T.NEW_IND,
                T.AML1_TYPE_CD,       --AML����1
                T.AML2_TYPE_CD,       --AML����2
                T.PARTY_CHN_NAME,     --��������������
                T.PARTY_ENG_NAME,      --Ӣ������
                T.CARD_TYPE,          --֤������
                T.CARD_NO,            --֤������
                T.COUNTRY_RESIDENCE,  --���ڵ�
                T.COUNTRY_CD,         --��������
                T.ADDR1,              --��ַ1
                --T.POSTALCODE,         --��������
                T.TEL_NO,             --�̶��绰
                T.CELL_NO,            --�ƶ��绰
                --T.EMAIL_ADDR,         --�����ʼ�
                T.CREATE_DT,          --���ͻ�ʱ��ʱ��
                T.LAST_UPD_DT,
                T.LAST_UPD_USER,
                T.TEMP1,
                t.objorgankey,
                t.party_status_cd)
        VALUES (T2.KHDH,      --�ͻ���
                T2.KHDH,--�ͻ���
                'C',                  --����������  C:�Թ������� I:���˵�����
                T2.ORGANKEY,            --¼�����
                '1',                   --�Ƿ������ͻ�,Ĭ��Ϊ�����ͻ�
                T2.AML1_TYPE_CD,       --�������ӦAML1_TYPE_CD����
                T2.AML2_TYPE_CD,       --�������ӦAML2_TYPE_CD����
                T2.KHMC,         --����
                T2.YWMC1,      --Ӣ������
                CASE WHEN T2.ZJHM IS NULL THEN NULL
                     WHEN T2.CARD_TYPE = '21' AND LENGTH(T2.ZJHM)<>'9' THEN '22'
                     ELSE T2.CARD_TYPE END,  --֤������
                T2.ZJHM,           --֤������
                T2.COUNTRY_RESIDENCE,--���ڵ�
                T2.COUNTRY_CD,        --��������
                T2.ADDR1,             --��ַ1
                --T2.POST_CODE,          --��������
                T2.TEL_NO,       --�̶��绰
                T2.CELL_NO,       --�ƶ��绰
                --T2.EMAIL,              --�����ʼ�
                CASE WHEN T2.KHRQ IS NULL THEN LV_INPUTDT
                     ELSE T2.KHRQ
                END,               --¼��ʱ��
                LV_INPUTDT,
                'ADMIN',
                'C',
                T2.ORGANKEY,
                t2.party_status_cd );
        COMMIT;
        --���¶Թ��ͻ���Ϣ
        MERGE INTO T47_PARTY T
        USING ( SELECT 'KHK' || T1.KHDH AS KHDH,      --�ͻ���
                   T1.DQDH || T1.KHJGDH AS ORGANKEY,    --��������
                   '99' AS AML1_TYPE_CD,             --aml����1
                   '01' AS AML2_TYPE_CD,             --aml����2
                   T1.KHMC,      --�ͻ�����
                   T1.YWMC1,      --Ӣ������
                   CASE WHEN F01_ETL_CODE_MAP('1023',T1.ZJZL) IS NULL THEN '22'
                        ELSE F01_ETL_CODE_MAP('1023',T1.ZJZL) END
                   AS CARD_TYPE,                  --֤������
                   CASE WHEN LENGTH(T1.ZJHM) = 10 AND T1.ZJHM LIKE '%-%' THEN REPLACE(T1.ZJHM,'-','')
                        ELSE T1.ZJHM END AS ZJHM,       --֤������
                   'CHN' AS COUNTRY_CD ,              --��������
                   T1.KHRQ,        --��������
                   case when lengthb(SUBSTR(ZZHM, 1, 6))=length(SUBSTR(ZZHM, 1, 6)) then SUBSTR(ZZHM,1,6) end AS COUNTRY_RESIDENCE,
                   T1.BGDZ AS ADDR1,
                   CASE WHEN LENGTH(T1.DHHM)<>11 OR (LENGTH(T1.DHHM)=11 AND T1.DHHM LIKE '0%') THEN T1.DHHM END AS TEL_NO,
                   CASE WHEN LENGTH(T1.DHHM)=11 AND T1.DHHM NOT LIKE '0%' THEN T1.DHHM END AS CELL_NO,
                   case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1'  when  t1.jlzt='0' then '4' end as party_status_cd
                   FROM ODS.ODS_DGKHXXWJ T1 WHERE T1.GXRQ =LV_INPUTDT) T2
            ON ( T.PARTY_ID = T2.KHDH)
            WHEN MATCHED THEN
               UPDATE SET T.ORGANKEY = T2.ORGANKEY,
                          T.PARTY_CHN_NAME = T2.KHMC,
                          T.ADDR1 = T2.ADDR1,
                          T.CARD_NO = T2.ZJHM,
                          T.LAST_UPD_DT = LV_INPUTDT,
                          T.LAST_UPD_USER = 'ADMIN';

       COMMIT;

       --���¶Թ��ͻ���������Ч�˻������˻����˻���ȫ����������Ĭ��1001
       UPDATE T37_PARTY_RESULT T
          SET T.FRISTAPPRALEVEL = '1001', T.EMENDATIONLEVEL = '1001'
        WHERE T.PARTY_ID IN (SELECT T.PARTY_ID
                        FROM T47_PARTY T
                       WHERE PARTY_CLASS_CD = 'C'
                         AND PARTY_STATUS_CD <> '0');
       COMMIT;
  END;

  /**
  * TITLE      : ��˽�ͻ�</P>
  * DESCRIPTION: ��˽�ͻ�
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-11
  */
  PROCEDURE P12_T47_PARTY_I(DTINPUTDT IN VARCHAR2, TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    V_SQL1     VARCHAR2(100);
    V_SQL2     VARCHAR2(100);

    CURSOR CURS_DSBIRTH_DT IS
      SELECT T.PARTY_ID, SUBSTR(T.ZJHM, 7, 8) AS BIRTH_DT
        FROM ODS.ODS_DSKHB T
       WHERE LENGTH(T.ZJHM) = 18;

    LV_PARTY_ID ODS.ODS_DSKHB.PARTY_ID%TYPE;
    LV_BIRTH_DT VARCHAR2(8);

  BEGIN
    V_SQL1 := 'TRUNCATE TABLE DSKHRQ_TEMP';
    V_SQL2 := 'TRUNCATE TABLE DSBIRTH_DT';
    EXECUTE IMMEDIATE V_SQL1;
    EXECUTE IMMEDIATE V_SQL2;

    OPEN CURS_DSBIRTH_DT;
    LOOP
      FETCH CURS_DSBIRTH_DT
        INTO LV_PARTY_ID, LV_BIRTH_DT;
      EXIT WHEN CURS_DSBIRTH_DT%NOTFOUND;
      BEGIN
        INSERT INTO DSBIRTH_DT
          SELECT LV_PARTY_ID, TO_DATE(LV_BIRTH_DT, 'YYYYMMDD') FROM DUAL;
        COMMIT;
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END LOOP;
    CLOSE CURS_DSBIRTH_DT;

    --��˽�ͻ��л����˻�������������Ļ����˻�����
    INSERT INTO DSKHRQ_TEMP
      SELECT PARTY_ID, KHRQ, KHJGDH
        FROM (SELECT ROW_NUMBER() OVER(PARTITION BY A.PARTY_ID ORDER BY NVL(B.KHRQ,to_date('19000101','yyyymmdd')) DESC ) AS NUM,
                     A.PARTY_ID,
                     B.KHRQ,
                     B.DQDH || B.JGDH AS KHJGDH
                FROM ODS.ODS_DSKHXXWJ A
                INNER JOIN (SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ, DQDH, JGDH
                            FROM ODS.ODS_DSHQZWJ where jlzt NOT IN('0','2')
                          ) B ON (A.ZHDH = B.ZHDH))
       WHERE NUM = 1;
       commit;

    --��˽�ͻ�û�л����˻����뵽�����������
    INSERT INTO DSKHRQ_TEMP
    select T2.PARTY_ID,T2.KHRQ, T2.KHJGDH FROM (
      SELECT PARTY_ID, KHRQ, KHJGDH
        FROM (SELECT ROW_NUMBER() OVER(PARTITION BY A.PARTY_ID ORDER BY NVL(B.KHRQ,to_date('19000101','yyyymmdd')) DESC) AS NUM,
                     A.PARTY_ID,
                     B.KHRQ,
                     B.DQDH || B.JGDH AS KHJGDH
                FROM ODS.ODS_DSKHXXWJ A
                INNER JOIN (SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ, DQDH, JGDH
                            FROM ODS.ODS_DQZWJ
                           WHERE KMDH LIKE '2112%' and jlzt NOT IN('0','2')) B ON (A.ZHDH = B.ZHDH))
       WHERE NUM = 1) T2 WHERE NOT EXISTS (select 1 from DSKHRQ_TEMP T1 WHERE T2.PARTY_ID = T1.PARTY_ID);
    commit;

    --��˽�ͻ���������Ч�˻������˻����˻���ȫ����������Ĭ��1001
    UPDATE T37_PARTY_RESULT T
       SET T.FRISTAPPRALEVEL = '1001', T.EMENDATIONLEVEL = '1001'
     WHERE T.PARTY_ID IN
       (SELECT T1.PARTY_ID
          FROM T37_PARTY_RESULT T1
         WHERE NOT EXISTS
         (SELECT 1 FROM DSKHRQ_TEMP T2 WHERE T1.PARTY_ID = T2.PARTY_ID)
           AND T1.PARTY_CLASS_CD = 'I');
    COMMIT;

    --��˽�ͻ��Ѿ������Ŀͻ�
    INSERT INTO DSKHRQ_TEMP
    select T2.PARTY_ID,T2.KHRQ, T2.KHJGDH FROM (
      SELECT PARTY_ID, KHRQ, KHJGDH
        FROM (SELECT ROW_NUMBER() OVER(PARTITION BY A.PARTY_ID ORDER BY NVL(B.KHRQ,to_date('19000101','yyyymmdd')) DESC) AS NUM,
                     A.PARTY_ID,
                     B.KHRQ,
                     B.DQDH || B.JGDH AS KHJGDH
                FROM ODS.ODS_DSKHXXWJ A
                INNER JOIN (SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ, DQDH, JGDH
                            FROM ODS.ODS_DSHQZWJ where jlzt='2'
                            UNION ALL
                             SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ, DQDH, JGDH
                              FROM ODS.ODS_DQZWJ
                             WHERE KMDH LIKE '2112%' and jlzt ='2') B ON (A.ZHDH = B.ZHDH))
       WHERE NUM = 1) T2 WHERE NOT EXISTS (select 1 from DSKHRQ_TEMP T1 WHERE T2.PARTY_ID = T1.PARTY_ID);
    commit;
    /*INSERT INTO DSKHRQ_TEMP
      SELECT PARTY_ID, KHRQ, KHJGDH
        FROM (SELECT ROW_NUMBER() OVER(PARTITION BY A.PARTY_ID ORDER BY B.KHRQ) AS NUM,
                     A.PARTY_ID,
                     B.KHRQ,
                     A.KHDQDH || A.KHJGDH AS KHJGDH
                FROM ODS.ODS_DSKHXXWJ A
                LEFT JOIN (SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ
                            FROM ODS.ODS_DSHQZWJ where jlzt<>'2'
                          UNION ALL
                          SELECT NVL(KHDH, ZHDH) AS ZHDH, KHRQ
                            FROM ODS.ODS_DQZWJ
                           WHERE KMDH LIKE '2112%' and jlzt<>'2') B ON (A.ZHDH = B.ZHDH))
       WHERE NUM = 1;
       commit;*/

    MERGE INTO T47_PARTY T
    USING ( SELECT T1.PARTY_ID, --�ͻ�����
                   'I' AS PARTY_CLASS_CD, --�ͻ����ͣ���˽�ͻ� I
                   --F14_PARTY_ORGANKEY(T1.PARTY_ID) AS ORGANKEY, --��������
                   CASE WHEN F01_ETL_CODE_MAP('1023',T1.ZJZL) = '13'  OR
                             F01_ETL_CODE_MAP('1023',T1.ZJZL) = '14'  THEN '02'
                        ELSE '01' END
                   AS AML1_TYPE_CD,  --���пͻ�����1 01������ 02���Ǿ���
                   '02' AS AML2_TYPE_CD, --���пͻ�����2 02����Ȼ��
                   T1.ZWXM AS PARTY_CHN_NAME, --��������
                   T1.YWXM AS PARTY_ENG_NAME, --Ӣ������
                   CASE WHEN F01_ETL_CODE_MAP('1023',T1.ZJZL) IS NULL THEN '15'
                        ELSE F01_ETL_CODE_MAP('1023',T1.ZJZL) END
                   AS CARD_TYPE,  --֤������
                   T1.ZJHM AS CARD_NO, --֤������
                   c.BIRTH_DT AS BIRTH_DT, --��������
                   CASE WHEN D.GJ IS NOT NULL THEN D.GJ
                        WHEN F01_ETL_CODE_MAP('1024',T1.ZJZL) IS NULL THEN 'CHN'
                        ELSE F01_ETL_CODE_MAP('1024',T1.ZJZL) END
                   AS COUNTRY_CD,          --��������
                   T1.DZ1 AS ADDR1 ,
                   case when length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))<>11  OR (length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))=11 AND nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) LIKE '0%') then nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) end AS TEL_NO,
                   case when length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))=11 AND nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) NOT LIKE '0%' then nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) end AS CELL_NO,
                   b.khrq AS CREATE_DT,
                   CASE WHEN LENGTH(T1.ZJHM)>=15 THEN substr(T1.ZJHM,1,6) END as COUNTRY_RESIDENCE,
                   case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1'  when  t1.jlzt='0' then '4' end as party_status_cd ,
                   B.KHJGDH AS ORGANKEY
            FROM ODS.ODS_DSKHB T1 left join DSKHRQ_TEMP b on(t1.PARTY_ID=b.PARTY_ID) left join DSBIRTH_DT c on (t1.PARTY_ID=c.PARTY_ID)
            LEFT JOIN ODS.ODS_DSKHBCB D ON T1.PARTY_ID=D.ZJZL||D.ZJHM
            where exists(select 1 from ODS.ODS_DSKHXXWJ t2 where t1.PARTY_ID=t2.PARTY_ID))  T3
    ON ( T.PARTY_ID = T3.PARTY_ID )
    /*WHEN MATCHED THEN
         UPDATE SET LAST_UPD_DT = LV_INPUTDT,
                    LAST_UPD_USER = 'ADMIN'*/
    WHEN NOT MATCHED THEN
         INSERT  ( T.PARTY_ID,
                   T.HOST_CUST_ID,
                   T.PARTY_CLASS_CD,
                   T.NEW_IND,
                   T.ORGANKEY,
                   T.AML1_TYPE_CD,
                   T.AML2_TYPE_CD,
                   T.PARTY_CHN_NAME,
                   T.PARTY_ENG_NAME,
                   T.CARD_TYPE,
                   T.CARD_NO,
                   T.BIRTH_DT,
                   T.COUNTRY_CD,
                   T.LAST_UPD_DT,
                   T.LAST_UPD_USER,
                   T.TEMP1,
                   T.ADDR1,
                   T.TEL_NO,
                   T.CELL_NO,
                   T.CREATE_DT,
                   T.COUNTRY_RESIDENCE,
                   T.PARTY_STATUS_CD,
                   T.OBJORGANKEY)
         VALUES  ( T3.PARTY_ID,
                   T3.PARTY_ID,
                   T3.PARTY_CLASS_CD,
                   '1',
                   T3.ORGANKEY,
                   T3.AML1_TYPE_CD,
                   T3.AML2_TYPE_CD,
                   T3.PARTY_CHN_NAME,
                   T3.PARTY_ENG_NAME,
                   CASE WHEN T3.CARD_NO IS NULL THEN NULL
                        WHEN T3.CARD_TYPE = '11' THEN
                        CASE WHEN LENGTH(T3.CARD_NO) = 15 THEN  T3.CARD_TYPE
                             WHEN LENGTH(T3.CARD_NO) = 18 THEN  T3.CARD_TYPE
                             ELSE '15'
                        END
                        ELSE T3.CARD_TYPE END ,  --֤������
                   T3.CARD_NO,
                   T3.BIRTH_DT,
                   T3.COUNTRY_CD,
                   LV_INPUTDT,
                   'ADMIN',
                   'I',
                   T3.ADDR1,
                   T3.TEL_NO,
                   T3.CELL_NO,
                   T3.CREATE_DT,
                   T3.COUNTRY_RESIDENCE,
                   T3.PARTY_STATUS_CD,
                   T3.ORGANKEY);
    COMMIT;

    --���¶�˽�ͻ���Ϣ
    MERGE INTO T47_PARTY T
    USING ( SELECT T1.PARTY_ID, --�ͻ�����
                   T1.ZWXM AS PARTY_CHN_NAME, --��������
                   CASE WHEN F01_ETL_CODE_MAP('1023',T1.ZJZL) IS NULL THEN '15'
                        ELSE F01_ETL_CODE_MAP('1023',T1.ZJZL) END
                   AS CARD_TYPE,  --֤������
                   T1.ZJHM AS CARD_NO, --֤������
                   CASE WHEN D.GJ IS NOT NULL THEN D.GJ
                        WHEN F01_ETL_CODE_MAP('1024',T1.ZJZL) IS NULL THEN 'CHN'
                        ELSE F01_ETL_CODE_MAP('1024',T1.ZJZL) END
                   AS COUNTRY_CD,          --��������
                   T1.DZ1 AS ADDR1 ,
                   case when length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))<>11  OR (length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))=11 AND nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) LIKE '0%') then nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) end AS TEL_NO,
                   case when length(nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh))=11 AND nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) NOT LIKE '0%' then nvl(nvl(nvl(yddh,jtdh),bgdh),jtdh) end AS CELL_NO,
                   B.khrq AS CREATE_DT,
                   B.KHJGDH AS ORGANKEY
            FROM ODS.ODS_DSKHB T1 left join DSKHRQ_TEMP b on(t1.PARTY_ID=b.PARTY_ID) left join DSBIRTH_DT c on (t1.PARTY_ID=c.PARTY_ID)
            LEFT JOIN ODS.ODS_DSKHBCB D ON T1.PARTY_ID=D.ZJZL||D.ZJHM
            where exists(select 1 from ODS.ODS_DSKHXXWJ t2 where t1.PARTY_ID=t2.PARTY_ID) AND T1.GXRQ = LV_INPUTDT)  T3
    ON ( T.PARTY_ID = T3.PARTY_ID )
    WHEN MATCHED THEN
         UPDATE SET T.PARTY_CHN_NAME = T3.PARTY_CHN_NAME,
                    T.COUNTRY_CD = T3.COUNTRY_CD,
                    T.ADDR1 = T3.ADDR1,
                    T.TEL_NO = T3.TEL_NO,
                    T.CELL_NO = T3.CELL_NO,
                    T.CARD_TYPE = T3.CARD_TYPE,
                    T.CARD_NO = T3.CARD_NO,
                    T.CREATE_DT = T3.CREATE_DT,--���¿�������
                    T.ORGANKEY = T3.ORGANKEY,--���¹�������
                    LAST_UPD_DT = LV_INPUTDT,
                    LAST_UPD_USER = 'ADMIN';
    COMMIT;

    /*UPDATE T47_PARTY T
    SET T.ORGANKEY = ( SELECT MIN(T1.KHDQDH || T1.KHJGDH)
                       FROM ODS.ODS_DSKHXXWJ T1
                       WHERE T.PARTY_ID = T1.PARTY_ID ),
        T.TEMP1 = 'I'
    WHERE T.TEMP1 = 'N';*/--modify by hxx
    /*MERGE INTO T47_PARTY T
    USING (SELECT T1T.PARTY_ID, MIN(KHDQDH || KHJGDH) AS ORGANKEY
  FROM ODS.ODS_DSKHXXWJ T1T,
       (SELECT PARTY_ID, MIN(GXRQ) AS MINGXRQ
          FROM ODS.ODS_DSKHXXWJ
         GROUP BY PARTY_ID) T2T
 WHERE T1T.PARTY_ID = T2T.PARTY_ID
   AND T1T.GXRQ = T2T.MINGXRQ
 GROUP BY T1T.PARTY_ID) T2
    ON (T.PARTY_ID = T2.PARTY_ID)
    WHEN MATCHED THEN
      UPDATE
         SET T.ORGANKEY = T2.ORGANKEY, T.TEMP1 = 'I',T.OBJORGANKEY=T2.ORGANKEY
       WHERE T.TEMP1 = 'N';
    COMMIT;*/

  END;


  /**
  * TITLE      : ��˾�ͻ���Ϣ��</P>
  * DESCRIPTION: ����˾�ͻ���Ϣ������,�����Թ��ͻ���Ϣ</P>
  * �������淶��P20_��Ӧ����,ϸ�����߼������ɴ�P21��P29������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-08-27
  */
  PROCEDURE P20_T47_CORPORATION(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
       MERGE INTO T47_CORPORATION T
       USING ( SELECT 'KHK' || T1.KHDH AS PARTY_ID,
                      CASE WHEN F01_ETL_CODE_MAP('1025',T1.SSHY) IS NULL THEN '2O' --Ĭ��Ϊ ������2O
                            ELSE F01_ETL_CODE_MAP('1025',T1.SSHY) END
                      AS INDUSTRYKEY,   --��ҵ
                      T1.ZJHM, --ע��֤��
                      T1.ZCZJ, --ע���ʱ�
                      CASE WHEN F01_ETL_CODE_MAP('1006',T1.ZCHBZL) IS NULL THEN 'CNY' --Ĭ��Ϊ�����
                           ELSE F01_ETL_CODE_MAP('1006',T1.ZCHBZL) END
                      AS ENROL_FUND_CURRENCY_CD, --ע���ʱ��ұ����
                      T1.FRMC,
                      CASE WHEN F01_ETL_CODE_MAP('1023',T1.FRZJZL) IS NULL THEN '22'
                           ELSE F01_ETL_CODE_MAP('1023',T1.FRZJZL) END
                      AS LEGAL_CARD_TYPE,       --����֤������
                      T1.FRZJHM,
                      T1.DQDH || T1.KHJGDH AS ORGANKEY,
                      case when ZCSXQX=to_date('18991231','yyyymmdd') then null else ZCSXQX end AS ISSUE_LICENSE_DT,
                      case when ZCYXQX=to_date('18991231','yyyymmdd') then null else ZCYXQX end AS LICENCE_END_DT,
                      qyjyfw AS MAIN_MANAGE_SCOPE ,
                      T1.FRZJZL||T1.FRZJHM as LEGAL_PARTY_ID,
                      T1.YWMC2 AS NATION_AFFAIR_NO,
                      T1.YWDZ2 AS LOCAL_AFFAIR_NO
               FROM ODS.ODS_DGKHXXWJ T1 ) T2
       ON ( T.PARTY_ID = T2.PARTY_ID )
      /* WHEN MATCHED THEN
            UPDATE SET T.COMPANY_TYPE_CD = NULL*/   --�ͻ���Ϣ����Ҫ����
       WHEN NOT MATCHED THEN
            INSERT ( T.PARTY_ID,         --�����˱��
                   T.INDUSTRYKEY,      --��ҵ
                   T.BUSINESS_LICENCE, --Ӫҵִ�պ�
                   T.ENROL_FUND_AMT,   --ע���ʱ�
                   T.ENROL_FUND_CURRENCY_CD,--ע���ʱ��ұ����
                   T.LEGAL_OBJ,        --����������
                   T.LEGAL_CARD_TYPE,  --����������֤������
                   T.LEGAL_CARD_NO,
                   T.OBJORGANKEY,      --����������֤������,
                   T.ISSUE_LICENSE_DT,
                   T.LICENCE_END_DT,
                   T.MAIN_MANAGE_SCOPE,
                   T.INCOME_DT,
                   T.LEGAL_PARTY_ID,
                   T.NATION_AFFAIR_NO,
                   T.LOCAL_AFFAIR_NO)
            VALUES ( T2.PARTY_ID,
                     T2.INDUSTRYKEY,
                     T2.ZJHM,
                     T2.ZCZJ,
                     T2.ENROL_FUND_CURRENCY_CD,
                     T2.FRMC,
                     CASE WHEN T2.FRZJHM IS NULL THEN NULL
                          WHEN T2.LEGAL_CARD_TYPE = '21' THEN
                          CASE WHEN LENGTH(T2.FRZJHM)<>'9' THEN '22'
                               ELSE T2.LEGAL_CARD_TYPE
                          END
                          ELSE T2.LEGAL_CARD_TYPE END,  --֤������
                     T2.FRZJHM,
                     T2.ORGANKEY,
                     T2.ISSUE_LICENSE_DT,
                     T2.LICENCE_END_DT,
                     T2.MAIN_MANAGE_SCOPE,
                     F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD'),
                     T2.LEGAL_PARTY_ID,
                     T2.NATION_AFFAIR_NO,
                     T2.LOCAL_AFFAIR_NO);
       COMMIT;

       --���¶Թ��ͻ���Ϣ
       MERGE INTO T47_CORPORATION T
       USING ( SELECT 'KHK' || T1.KHDH AS PARTY_ID,
                      CASE WHEN F01_ETL_CODE_MAP('1025',T1.SSHY) IS NULL THEN '2O' --Ĭ��Ϊ ������2O
                            ELSE F01_ETL_CODE_MAP('1025',T1.SSHY) END
                      AS INDUSTRYKEY,   --��ҵ
                      T1.ZJHM, --ע��֤��
                      T1.ZCZJ, --ע���ʱ�
                      CASE WHEN F01_ETL_CODE_MAP('1006',T1.ZCHBZL) IS NULL THEN 'CNY' --Ĭ��Ϊ�����
                           ELSE F01_ETL_CODE_MAP('1006',T1.ZCHBZL) END
                      AS ENROL_FUND_CURRENCY_CD, --ע���ʱ��ұ����
                      T1.FRMC,
                      CASE WHEN F01_ETL_CODE_MAP('1023',T1.FRZJZL) IS NULL THEN '22'
                           ELSE F01_ETL_CODE_MAP('1023',T1.FRZJZL) END
                      AS LEGAL_CARD_TYPE,       --����֤������
                      T1.FRZJHM,
                      T1.DQDH || T1.KHJGDH AS ORGANKEY,
                      case when ZCSXQX=to_date('18991231','yyyymmdd') then null else ZCSXQX end AS ISSUE_LICENSE_DT,
                      case when ZCYXQX=to_date('18991231','yyyymmdd') then null else ZCYXQX end AS LICENCE_END_DT,
                      qyjyfw AS MAIN_MANAGE_SCOPE ,
                      T1.FRZJZL||T1.FRZJHM as LEGAL_PARTY_ID,
                      T1.YWMC2 AS NATION_AFFAIR_NO,
                      T1.YWDZ2 AS LOCAL_AFFAIR_NO
               FROM ODS.ODS_DGKHXXWJ T1 WHERE T1.GXRQ = LV_INPUTDT) T2
       ON ( T.PARTY_ID = T2.PARTY_ID )
       WHEN MATCHED THEN
            UPDATE SET T.MAIN_MANAGE_SCOPE = T2.MAIN_MANAGE_SCOPE,
                       T.BUSINESS_LICENCE = T2.ZJHM,
                       T.LICENCE_END_DT = T2.LICENCE_END_DT,
                       T.LEGAL_OBJ = T2.FRMC,
                       T.NATION_AFFAIR_NO = T2.NATION_AFFAIR_NO,
                       T.LOCAL_AFFAIR_NO = T2.LOCAL_AFFAIR_NO,
                       T.LAST_UPD_DT = LV_INPUTDT,
                       T.LAST_UPD_USER = 'ADMIN';

       COMMIT;
  END;

  /**
  * TITLE      : ���˿ͻ���Ϣ��</P>
  * DESCRIPTION: �����˿ͻ���Ϣ������,������˽�ͻ���Ϣ</P>
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��XUFENG
  * VERSION    ��1.0
  * DATE       : 2007-12-12
  * MODIFY BY  : FCQ
  * MODIFY DATE: 2008-06-01
  *
  */
  PROCEDURE P30_T47_INDIVIDUAL(DTINPUTDT IN VARCHAR2, TASKKEY IN VARCHAR2) AS
   LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
   V_SQL1 varchar2(100);
 BEGIN

   V_SQL1 := 'TRUNCATE TABLE DSKHHY_TEMP';
   INSERT INTO DSKHHY_TEMP
     select zjzl, zjhm, hy
       from (SELECT DISTINCT CASE
                               WHEN IDTYPE = '1' THEN
                                '0'
                               WHEN IDTYPE = '2' THEN
                                '7'
                               WHEN IDTYPE = '3' THEN
                                '4'
                               WHEN IDTYPE IN ('4', '8') THEN
                                '5'
                               WHEN IDTYPE = 'C' THEN
                                '0'
                               ELSE
                                '8'
                             end as zjzl,
                             B.IDNO as zjhm,
                             SUBSTR(A.INDUSTRY_TYPE, 1, 1) as hy,
                             ROW_NUMBER() OVER(PARTITION BY B.IDNO ORDER BY a.isdate DESC) NUM
               FROM ODS.ODS_LOANCINO A, ODS.ODS_CUSTOMER_INFO B
              WHERE A.CUSTCD = B.CUSTCD
                AND A.INDUSTRY_TYPE IS NOT NULL)
      where num = 1;

    EXECUTE IMMEDIATE V_SQL1;
      MERGE INTO T47_INDIVIDUAL T        --AML������Ϣ��
      USING (SELECT T1.PARTY_ID ,          --�����˱��
                    CASE WHEN F01_ETL_CODE_MAP('1028',nvl(b.zy,T1.ZY)) IS NULL THEN '1H'   --Ĭ��Ϊ 1H:�������������Ͷ���
                         ELSE F01_ETL_CODE_MAP('1028',nvl(b.zy,T1.ZY)) END
                    AS OCCUPATION,
                    B.SFZYXQ AS CARD_END_DT, --֤��������,
                    T1.xb AS gender,
                    nvl(F01_ETL_CODE_MAP('1025',c.hy),b.zy) as industry
               FROM ODS.ODS_DSKHB T1
               left join ods.ods_dskhbcb b on T1.party_id = b.zjzl || b.zjhm
               left join DSKHHY_TEMP c on t1.zjzl||t1.zjhm =c.zjzl||c.zjhm
               where exists(select 1 from ODS.ODS_DSKHXXWJ t2 where t1.PARTY_ID=t2.PARTY_ID)) T2
      ON (T2.PARTY_ID = T.PARTY_ID)
      /*WHEN MATCHED THEN
           UPDATE SET T.INDIV_INCOME = NULL*/  --�ͻ���Ϣ����Ҫ����
      WHEN NOT MATCHED THEN
           INSERT ( T.PARTY_ID ,  --�����˱��
                    T.OCCUPATION,  --ְҵ
                    T.CARD_END_DT,--֤��������
                    T.GENDER,
                    T.INDUSTRY  )
           VALUES ( T2.PARTY_ID, --�����˱��
                    T2.OCCUPATION,  --ְҵ
                    T2.CARD_END_DT,--֤��������
                    T2.GENDER,
                    T2.INDUSTRY);
      COMMIT;

    MERGE INTO T47_INDIVIDUAL T
    USING (SELECT PARTY_ID, MIN(KHDQDH || KHJGDH) AS ORGANKEY
             FROM ODS.ODS_DSKHXXWJ
            GROUP BY PARTY_ID) T2
    ON (T.PARTY_ID = T2.PARTY_ID)
    WHEN MATCHED THEN
      UPDATE
         SET T.OBJORGANKEY = T2.ORGANKEY;
    COMMIT;

    --���¸��˿ͻ���Ϣ
     MERGE INTO T47_INDIVIDUAL T        --AML������Ϣ��
      USING (SELECT T1.PARTY_ID ,          --�����˱��
                    CASE WHEN F01_ETL_CODE_MAP('1028',nvl(b.zy,T1.ZY)) IS NULL THEN '1H'   --Ĭ��Ϊ 1H:�������������Ͷ���
                         ELSE F01_ETL_CODE_MAP('1028',nvl(b.zy,T1.ZY)) END
                    AS OCCUPATION,
                    B.SFZYXQ AS CARD_END_DT, --֤��������,
                    T1.xb AS gender
               FROM ODS.ODS_DSKHB T1
               left join ods.ods_dskhbcb b on T1.party_id = b.zjzl || b.zjhm
               left join DSKHHY_TEMP c on t1.zjzl||t1.zjhm =c.zjzl||c.zjhm
               where exists(select 1 from ODS.ODS_DSKHXXWJ t2 where t1.PARTY_ID=t2.PARTY_ID) AND T1.gxrq = LV_INPUTDT) T2
      ON (T2.PARTY_ID = T.PARTY_ID)
      WHEN MATCHED THEN
        UPDATE SET T.GENDER = T2.GENDER,
                   T.OCCUPATION = T2.OCCUPATION,
                   T.CARD_END_DT = T2.CARD_END_DT,
                   T.LAST_UPD_DT = LV_INPUTDT,
                   T.LAST_UPD_USER = 'ADMIN';
      COMMIT;

  END;

  /**
  * TITLE      : ��˽����˻���Ϣ��</P>
  * DESCRIPTION: ����˽����˻���Ϣ������</P>
  * �������淶��P50_��Ӧ����,ϸ�����߼������ɴ�P51��P59������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  */
  PROCEDURE P40_T47_CP_DEPOSIT(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS

  BEGIN
  IF  TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_CP_DEPOSIT_HQ THEN
     P41_T47_CP_DEPOSIT_HQ(DTINPUTDT,TASKKEY);
  ELSIF TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_CP_DEPOSIT_DQ THEN
     P42_T47_CP_DEPOSIT_DQ(DTINPUTDT,TASKKEY);
  END IF;

  END;


 /**
  * TITLE      : �Թ����ڴ���˻���Ϣ��</P>
  * DESCRIPTION: ���Թ����ڴ���˻���Ϣ������</P>
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     : FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  PROCEDURE P41_T47_CP_DEPOSIT_HQ(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
       MERGE INTO T47_CP_DEPOSIT T
       USING ( SELECT T1.ZHDH AS ACCT_NUM,     --�˺�
                      'KHK' || T1.KHDH AS PARTY_ID,     --�ͻ���
                      '01' AS ACCT_TYPE_CD, --ԭ�˻�����
                      T1.ZHXZ,
                      CASE WHEN F01_ETL_CODE_MAP('1031',T1.ZHSX) IS NULL THEN '9'  --Ĭ��Ϊ ������ 9
                           ELSE F01_ETL_CODE_MAP('1031',T1.ZHSX) END
                      AS ACCT_PROPERTY_CD,                --���㻧����
                      CASE WHEN F01_ETL_CODE_MAP('1030',T1.ZHXZ) IS NULL THEN '01' --Ĭ��Ϊ ���㻧�� 01
                           ELSE F01_ETL_CODE_MAP('1030',T1.ZHXZ) END
                      AS CORP_TYPE_CD,   --��ҵ�˻�����
                      T1.DQDH || T1.JGDH AS ORGANKEY, --��������
                      CASE WHEN F01_ETL_CODE_MAP('1006',HBZL) IS NULL THEN 'CNY'   --Ĭ��Ϊ �����
                           ELSE F01_ETL_CODE_MAP('1006',HBZL) END
                      AS CURRENCY_CD, --����
                      T1.KMDH,        --��Ŀ
                      T1.KHRQ,        --��������
                      T1.QXRQ,        --��Ϣ����
                      T1.KHJE,        --�������
                      T1.SRYE,        --�������
                      T1.ZHYE,        --�˻����
                      case when t1.jlzt='2' then t1.jyrq else F03_STRINGTODATE('3000-12-31','YYYY-MM-DD') end AS CLOSE_DT,
                      T1.KHMC,
                      case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1' when  t1.jlzt='5' then '2' end as ACCT_STATUS_CD,
                      T1.SJYRQ  AS LAST_OCCUR_DT
               FROM ODS.ODS_HQDGZWJ T1 ) T2
       ON ( T.ACCT_NUM = T2.ACCT_NUM )
       WHEN MATCHED THEN
            UPDATE SET T.PARTY_ID = T2.PARTY_ID,
                       T.HOST_CUST_ID = T2.PARTY_ID,
                       T.LAST_AMT_VAL = T2.SRYE,
                       T.AMT_VAL = T2.ZHYE,
                       T.LAST_OCCUR_DT = T2.LAST_OCCUR_DT,
                       T.LAST_UPD_DT = LV_INPUTDT
       WHEN NOT MATCHED THEN
            INSERT ( T.ACCT_NUM,
                     T.PARTY_ID,
                     T.HOST_CUST_ID,
                     T.PARTY_CHN_NAME,
                     T.ACCT_TYPE_CD,
                     T.CORP_TYPE_CD,
                     T.ACCT_PROPERTY_CD,
                     T.AML_ACCT_TYPE_CD,
                     T.ORGANKEY,
                     T.ACCT_ORG_NUM,
                     T.CURRENCY_CD,
                     T.SUBJECTNO,
                     T.OPEN_DT,
                     T.ACCT_PROCESSING_DT,
                     T.OPEN_AMT,
                     T.LAST_AMT_VAL,
                     T.AMT_VAL,
                     T.CLOSE_DT,
                     T.LAST_UPD_DT,
                     T.ACCT_MODIFIER_NUM,
                     T.ACCT_STATUS_CD,
                     T.LAST_OCCUR_DT )
            VALUES ( T2.ACCT_NUM,
                     T2.PARTY_ID,
                     T2.PARTY_ID,
                     T2.KHMC, --F12_PARTY_NAME(T2.PARTY_ID),
                     T2.ACCT_TYPE_CD,
                     T2.CORP_TYPE_CD,
                     T2.ACCT_PROPERTY_CD,
                     CASE WHEN CURRENCY_CD = 'CNY' THEN
                               CASE WHEN F01_ETL_CODE_MAP('1029',T2.ACCT_PROPERTY_CD) IS NULL THEN '0012'
                                    ELSE F01_ETL_CODE_MAP('1029',T2.ACCT_PROPERTY_CD) END
                          ELSE
                               CASE WHEN F01_ETL_CODE_MAP('1029',T2.ZHXZ) IS NULL THEN '2600'
                               ELSE F01_ETL_CODE_MAP('1029',T2.ZHXZ) END
                          END,
                     T2.ORGANKEY,
                     T2.ORGANKEY,
                     T2.CURRENCY_CD,
                     T2.KMDH,
                     T2.KHRQ,
                     T2.QXRQ,
                     T2.KHJE,
                     T2.SRYE,
                     T2.ZHYE,
                     T2.CLOSE_DT,
                     LV_INPUTDT,
                     T2.ACCT_NUM,
                     T2.ACCT_STATUS_CD,
                     T2.LAST_OCCUR_DT);
       COMMIT;

  END;

    /**
  * TITLE      : �Թ����ڴ���˻���Ϣ��</P>
  * DESCRIPTION: ���Թ����ڴ���˻���Ϣ������</P>
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     : FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-01
  */
  PROCEDURE P42_T47_CP_DEPOSIT_DQ(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
       MERGE INTO T47_CP_DEPOSIT T
       USING ( SELECT T1.ZHDH AS ACCT_NUM,     --�˺�
                      'KHK' || T1.KHDH AS PARTY_ID,     --�ͻ���
                      '02' AS ACCT_TYPE_CD, --ԭ�˻�����
                      T1.ZHXZ,
                      '9' AS ACCT_PROPERTY_CD,                --���㻧����
                      CASE WHEN F01_ETL_CODE_MAP('1030',T1.ZHXZ) IS NULL THEN '29' --Ĭ��Ϊ ������ 29
                           ELSE F01_ETL_CODE_MAP('1030',T1.ZHXZ) END
                      AS CORP_TYPE_CD,   --��ҵ�˻�����
                      T1.DQDH || T1.JGDH AS ORGANKEY, --��������
                      CASE WHEN F01_ETL_CODE_MAP('1006',HBZL) IS NULL THEN 'CNY'   --Ĭ��Ϊ �����
                           ELSE F01_ETL_CODE_MAP('1006',HBZL) END
                      AS CURRENCY_CD, --����
                      T1.KMDH,        --��Ŀ
                      T1.KHRQ,        --��������
                      T1.QXRQ,        --��Ϣ����
                      T1.KHJE,        --�������
                      T1.SRYE,        --�������
                      T1.ZHYE,        --�˻����
                      case when t1.jlzt='2' then t1.jyrq else F03_STRINGTODATE('3000-12-31','YYYY-MM-DD') end AS CLOSE_DT,
                      T1.KHMC,
                      case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1' when  t1.jlzt='5' then '2' end as ACCT_STATUS_CD,
                      T1.DQRQ AS MATURE_DT ,
                      T1.SJYRQ  AS LAST_OCCUR_DT
               FROM ODS.ODS_DQZWJ T1
               WHERE T1.YWDH = '002' ) T2
       ON ( T.ACCT_NUM = T2.ACCT_NUM )
       WHEN MATCHED THEN
            UPDATE SET T.PARTY_ID = T2.PARTY_ID,
                       T.HOST_CUST_ID = T2.PARTY_ID,
                       T.LAST_AMT_VAL = T2.SRYE,
                       T.AMT_VAL = T2.ZHYE,
                       T.MATURE_DT = T2.MATURE_DT,
                       T.LAST_OCCUR_DT = T2.LAST_OCCUR_DT,
                       T.LAST_UPD_DT = LV_INPUTDT
       WHEN NOT MATCHED THEN
            INSERT ( T.ACCT_NUM,
                     T.PARTY_ID,
                     T.HOST_CUST_ID,
                     T.PARTY_CHN_NAME,
                     T.ACCT_TYPE_CD,
                     T.CORP_TYPE_CD,
                     T.ACCT_PROPERTY_CD,
                     T.AML_ACCT_TYPE_CD,
                     T.ORGANKEY,
                     T.ACCT_ORG_NUM,
                     T.CURRENCY_CD,
                     T.SUBJECTNO,
                     T.OPEN_DT,
                     T.ACCT_PROCESSING_DT,
                     T.OPEN_AMT,
                     T.LAST_AMT_VAL,
                     T.AMT_VAL,
                     T.CLOSE_DT,
                     T.LAST_UPD_DT,
                     T.ACCT_MODIFIER_NUM,
                     T.ACCT_STATUS_CD )
            VALUES ( T2.ACCT_NUM,
                     T2.PARTY_ID,
                     T2.PARTY_ID,
                     T2.KHMC, --F12_PARTY_NAME(T2.PARTY_ID),
                     T2.ACCT_TYPE_CD,
                     T2.CORP_TYPE_CD,
                     T2.ACCT_PROPERTY_CD,
                     CASE WHEN CURRENCY_CD = 'CNY' THEN
                               CASE WHEN F01_ETL_CODE_MAP('1029',T2.ACCT_PROPERTY_CD) IS NULL THEN '0012'
                                    ELSE F01_ETL_CODE_MAP('1029',T2.ACCT_PROPERTY_CD) END
                          ELSE
                               CASE WHEN F01_ETL_CODE_MAP('1029',T2.ZHXZ) IS NULL THEN '2600'
                               ELSE F01_ETL_CODE_MAP('1029',T2.ZHXZ) END
                          END,
                     T2.ORGANKEY,
                     T2.ORGANKEY,
                     T2.CURRENCY_CD,
                     T2.KMDH,
                     T2.KHRQ,
                     T2.QXRQ,
                     T2.KHJE,
                     T2.SRYE,
                     T2.ZHYE,
                     T2.CLOSE_DT,
                     LV_INPUTDT,
                     T2.ACCT_NUM,
                     T2.ACCT_STATUS_CD);
       COMMIT;

  END;


  /**
  * TITLE      : ��˽����˻���Ϣ��</P>
  * DESCRIPTION: ����˽����˻���Ϣ������</P>
  * �������淶��P50_��Ӧ����,ϸ�����߼������ɴ�P51��P59������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  */
  PROCEDURE P50_T47_ID_DEPOSIT(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
  BEGIN
  IF  TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_ID_DEPOSIT_HQ THEN
     P51_T47_ID_DEPOSIT_HQ(DTINPUTDT,TASKKEY);
  ELSIF TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_ID_DEPOSIT_DQ THEN
     P52_T47_ID_DEPOSIT_DQ(DTINPUTDT,TASKKEY);
  /*ELSIF TASKKEY = PKG_AML_ETL_MAIN.TASKKEY_T47_ID_DEPOSIT_PARTY THEN
  BEGIN
       UPDATE T47_ID_DEPOSIT T
       SET T.PARTY_ID = ( SELECT O.PARTY_ID
                          FROM ODS.ODS_DSKHXXWJ O
                          WHERE O.ZHDH = T.ACCT_NUM )
       WHERE T.PARTY_ID IS NULL;

       COMMIT;

       UPDATE T47_ID_DEPOSIT T
       SET T.PARTY_ID = ( SELECT O.PARTY_ID
                          FROM ODS.ODS_DSKHXXWJ O
                          WHERE O.ZHDH = T.ACCT_MODIFIER_NUM )
       WHERE T.PARTY_ID IS NULL AND T.ACCT_MODIFIER_NUM <> '0000';

       COMMIT;

  END;*/
  END IF;

  END;


  PROCEDURE P51_T47_ID_DEPOSIT_HQ(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
   BEGIN
     MERGE INTO T47_ID_DEPOSIT T    --AML��˽����˻���Ϣ
     USING ( SELECT T1.ZHDH AS ACCT_NUM,        --�ʺ�
                    b.PARTY_ID AS PARTY_ID,
                    T1.KHDH AS CARD_NO,
                    '01' AS ACCT_TYPE_CD, --ԭ�˻�����
                    T1.DQDH || T1.JGDH AS ORGANKEY,        --����
                    CASE WHEN F01_ETL_CODE_MAP('1006',T1.HBZL) IS NULL THEN 'CNY'
                         ELSE F01_ETL_CODE_MAP('1006',T1.HBZL) END
                    AS CURRENCY_CD,        --����
                    T1.KMDH,        --��Ŀ
                    T1.KHRQ,        --��������
                    T1.QXRQ,        --��Ϣ����
                    T1.KHJE,        --�������
                    T1.SRYE,        --�������
                    T1.ZHYE,         --�ʻ����
                    T1.KHXM,
                    case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1' when  t1.jlzt='5' then '2' end as ACCT_STATUS_CD,
                    case when t1.jlzt='2' then t1.jyrq else F03_STRINGTODATE('3000-12-31','YYYY-MM-DD') end AS CLOSE_DT,
                    T1.SJYRQ  AS LAST_OCCUR_DT
             FROM ODS.ODS_DSHQZWJ T1
             left join ODS.ODS_DSKHXXWJ b on(nvl(t1.khdh,t1.zhdh)=b.zhdh)) T2
     ON( T2.ACCT_NUM = T.ACCT_NUM)
     WHEN MATCHED THEN
          UPDATE SET T.PARTY_ID = T2.PARTY_ID,
                     T.HOST_CUST_ID = T2.PARTY_ID,
                     T.LAST_UPD_DT = LV_INPUTDT,
                     T.LAST_AMT_VAL = T2.SRYE,
                     T.AMT_VAL = T2.ZHYE,
                     T.LAST_OCCUR_DT =T2.LAST_OCCUR_DT
     WHEN NOT MATCHED THEN
          INSERT ( T.ACCT_NUM           ,
                   T.ACCT_MODIFIER_NUM,
                   T.PARTY_ID           ,
                   T.HOST_CUST_ID,
                   T.PARTY_CHN_NAME,
                   T.ACCT_TYPE_CD,
                   T.AML_ACCT_TYPE_CD ,
                   T.ORGANKEY           ,
                   T.ACCT_ORG_NUM,
                   T.CURRENCY_CD        ,
                   T.SUBJECTNO          ,
                   T.OPEN_DT            ,
                   T.ACCT_PROCESSING_DT ,
                   T.OPEN_AMT           ,
                   T.LAST_AMT_VAL       ,
                   T.AMT_VAL            ,
                   T.LAST_UPD_DT,
                   T.ACCT_STATUS_CD,
                   T.CLOSE_DT,
                   T.LAST_OCCUR_DT )
          VALUES ( T2.ACCT_NUM,
                   T2.ACCT_NUM,
                   T2.PARTY_ID,
                   T2.PARTY_ID,
                   T2.KHXM, --F12_PARTY_NAME(T2.PARTY_ID),
                   T2.ACCT_TYPE_CD,
                   '0017' ,
                   T2.ORGANKEY,
                   T2.ORGANKEY,
                   T2.CURRENCY_CD,
                   T2.KMDH,
                   T2.KHRQ,
                   T2.QXRQ,
                   T2.KHJE,
                   T2.SRYE,
                   T2.ZHYE,
                   LV_INPUTDT,
                   T2.ACCT_STATUS_CD,
                   T2.CLOSE_DT,
                   T2.LAST_OCCUR_DT);
     COMMIT;

 END;


  PROCEDURE P52_T47_ID_DEPOSIT_DQ(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
   BEGIN
     MERGE INTO T47_ID_DEPOSIT T    --AML��˽����˻���Ϣ
     USING ( SELECT T1.ZHDH AS ACCT_NUM,        --�ʺ�
                    b.PARTY_ID AS PARTY_ID,
                    T1.KHDH AS CARD_NO,
                    '02' AS ACCT_TYPE_CD, --ԭ�˻�����
                    T1.DQDH || T1.JGDH AS ORGANKEY,        --����
                    CASE WHEN F01_ETL_CODE_MAP('1006',T1.HBZL) IS NULL THEN 'CNY'
                         ELSE F01_ETL_CODE_MAP('1006',T1.HBZL) END
                    AS CURRENCY_CD,        --����
                    T1.KMDH,        --��Ŀ
                    T1.KHRQ,        --��������
                    T1.QXRQ,        --��Ϣ����
                    T1.KHJE,        --�������
                    T1.SRYE,        --�������
                    T1.ZHYE,         --�ʻ����
                    T1.KHMC,
                    case when t1.jlzt='1' then '0'  when  t1.jlzt='2' then '1' when  t1.jlzt='5' then '2' end as ACCT_STATUS_CD,
                    case when t1.jlzt='2' then t1.jyrq else F03_STRINGTODATE('3000-12-31','YYYY-MM-DD') end AS CLOSE_DT,
                    T1.DQRQ AS MATURE_DT ,
                    T1.SJYRQ  AS LAST_OCCUR_DT
             FROM ODS.ODS_DQZWJ T1
             left join ODS.ODS_DSKHXXWJ b on(nvl(t1.khdh,t1.zhdh)=b.zhdh)
             WHERE T1.YWDH <>'002'  ) T2
     ON( T2.ACCT_NUM = T.ACCT_NUM)
     WHEN MATCHED THEN
          UPDATE SET T.PARTY_ID = T2.PARTY_ID,
                     T.HOST_CUST_ID = T2.PARTY_ID,
                     T.LAST_UPD_DT = LV_INPUTDT,
                     T.MATURE_DT = T2.MATURE_DT,
                     T.LAST_AMT_VAL = T2.SRYE,
                     T.AMT_VAL = T2.ZHYE,
                     T.LAST_OCCUR_DT = T2.LAST_OCCUR_DT
     WHEN NOT MATCHED THEN
          INSERT ( T.ACCT_NUM           ,
                   T.ACCT_MODIFIER_NUM ,
                   T.PARTY_ID           ,
                   T.HOST_CUST_ID,
                   T.PARTY_CHN_NAME,
                   T.ACCT_TYPE_CD,
                   T.AML_ACCT_TYPE_CD ,
                   T.ORGANKEY           ,
                   T.ACCT_ORG_NUM,
                   T.CURRENCY_CD        ,
                   T.SUBJECTNO          ,
                   T.OPEN_DT            ,
                   T.ACCT_PROCESSING_DT ,
                   T.OPEN_AMT           ,
                   T.LAST_AMT_VAL       ,
                   T.AMT_VAL            ,
                   T.LAST_UPD_DT,
                   T.ACCT_STATUS_CD,
                   T.CLOSE_DT,
                   T.MATURE_DT,
                   T.LAST_OCCUR_DT )
          VALUES ( T2.ACCT_NUM,
                   T2.ACCT_NUM,
                   T2.PARTY_ID,
                   T2.PARTY_ID,
                   T2.KHMC, --F12_PARTY_NAME(T2.PARTY_ID),
                   T2.ACCT_TYPE_CD,
                   '7101' ,
                   T2.ORGANKEY,
                   T2.ORGANKEY,
                   T2.CURRENCY_CD,
                   T2.KMDH,
                   T2.KHRQ,
                   T2.QXRQ,
                   T2.KHJE,
                   T2.SRYE,
                   T2.ZHYE,
                   LV_INPUTDT,
                   T2.ACCT_STATUS_CD,
                   T2.CLOSE_DT,
                   T2.MATURE_DT,
                   T2.LAST_OCCUR_DT );
     COMMIT;

 END;



  /**
  * TITLE      : ծ����Ϣ��</P>
  * DESCRIPTION: ��ծ����Ϣ������,�����Թ���˽������Ϣ</P>
  * �������淶��P60_��Ӧ����,ϸ�����߼������ɴ�P61��P69������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  */
  PROCEDURE P60_T47_LOAN_ACCT(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
     MERGE INTO T47_LOAN_ACCT L
     USING( SELECT  T.ZHDH AS ACCT_NUM,     --�����˺�
                    CASE WHEN T.KHDH is not null THEN 'KHK' || T.KHDH
                         ELSE T1.party_id END
                    AS PARTY_ID,     --�ͻ�id
                    T.KHMC,            --�ͻ�����
                    T.DQDH || T.JGDH AS ORGANKEY,     --������
                    CASE WHEN F01_ETL_CODE_MAP('1006',T.HBZL) IS NULL THEN 'CNY'
                         ELSE F01_ETL_CODE_MAP('1006',T.HBZL) END
                    AS CURRENCY_CD,        --����
                    T.KMDH,     --��Ŀ��
                    T.ZHYE,     --�ʻ����
                    T.KHRQ,     --��������
                    T.KHJE,     --�������
                    T.LLSXRQ,   --��Ϣ��
                    T.DQRQ,     --������
                    T.LLDH     --����
            FROM ODS.ODS_DKHZWJ T
            left join ODS.ODS_DSKHXXWJ t1 on(t.zhdh=t1.zhdh)) T2
     ON ( L.ACCT_NUM = T2.ACCT_NUM )
     WHEN MATCHED THEN
          UPDATE SET L.PARTY_ID = T2.PARTY_ID,
                     L.HOST_CUST_ID = T2.PARTY_ID,
                     L.LAST_UPD_DT = LV_INPUTDT
     WHEN NOT MATCHED THEN
          INSERT ( L.CB_PK,
                   L.ACCT_NUM          ,
                   L.PARTY_ID          ,
                   L.HOST_CUST_ID,
                   L.PARTY_CHN_NAME    ,
                   L.ORGANKEY          ,
                   L.ACCT_ORG_NUM,
                   L.CURRENCY_CD       ,
                   L.SUBJECTNO         ,
                   L.AMT_VAL           ,
                   L.OPEN_DT           ,
                   L.ACCT_PROCESSING_DT,
                   L.SETTLE_DT         ,
                   L.CLOSE_DT,
                   L.ACCT_MODIFIER_NUM)
          VALUES ( T2.ACCT_NUM,
                   T2.ACCT_NUM,
                   T2.PARTY_ID,
                   T2.PARTY_ID,
                   T2.KHMC,
                   T2.ORGANKEY,
                   T2.ORGANKEY,
                   T2.CURRENCY_CD,
                   T2.KMDH,
                   T2.ZHYE,
                   T2.KHRQ,
                   T2.LLSXRQ,
                   CASE WHEN T2.ZHYE = 0 THEN LV_INPUTDT
                        ELSE F03_STRINGTODATE('3000-12-31','YYYY-MM-DD') END,
                   F03_STRINGTODATE('3000-12-31','YYYY-MM-DD'),
                   T2.ACCT_NUM);
     COMMIT;

  END;

  /**
  * TITLE      : ������ˮ�м��</P>
  * DESCRIPTION: �ȵ���ǰ�Ľ������ݵ�������ˮ�м��</P>
  * �������淶��P70_��Ӧ����,ϸ�����߼������ɴ�P71��P79������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  */
  PROCEDURE P70_T47_TRANSACTION_MID(DTINPUTDT IN VARCHAR2,TASKKEY IN VARCHAR2) AS
  BEGIN
     IF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_INST THEN
          -- �ӷ�¼�н����н���������Ϣ����
          P71_T47_TRANS_MID_INSERT(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_SELF THEN
           -- ����ӳ�����ֱ�Ӹ��¶�Ӧ�ֶ�
          P72_TRANS_TEMP_FIXED_UNFIXED(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_RETURN THEN
           -- ������Ҫ�߼�ת���������ֶ�,��������Ϣ
          P73_TRANS_TEMP_RETURN_CREDIT(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_FILTER THEN
           -- ������Ҫ�߼�ת���������ֶ�,��������Ϣ
          P74_TRANS_TEMP_FILTER(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_TWINS THEN
           -- ������Ҫ�߼�ת���������ֶ�,��������Ϣ
          P75_TRANS_TEMP_ONE_TO_ONE(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_OPP_NATIVE THEN
           -- ������Ҫ�߼�ת���������ֶ�,��������Ϣ
          P76_T47_TRANS_OPP_NATIVE(DTINPUTDT);
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_JOIN_REG THEN
     BEGIN
           -- [��������]+[��������]+[������ˮ��]+[�����ʺ�]+[������]
          P77_TRANS_TEMP_JOIN_REGISTER_5(DTINPUTDT);
           -- [��������]+[��������]+[������ˮ��]+[�����ʺ�]
          P77_TRANS_TEMP_JOIN_REGISTER_4(DTINPUTDT);
           -- [��������]+[��������]+[������ˮ��]
          P77_TRANS_TEMP_JOIN_REGISTER_3(DTINPUTDT);
     END;
     ELSIF  TASKKEY=PKG_AML_ETL_MAIN.TASKKEY_T47_TRANS_PUBLIC THEN
     BEGIN
          --�ж϶Է��Ƿ����пͻ�
          P78_TRANS_TEMP_ISPARTY(DTINPUTDT);
          -- ������Ҫ�߼�ת���������ֶ�,��������Ϣ
          P79_T47_TRANS_UPD_PUBLIC(DTINPUTDT);
          --OPP_PARTY_CLASS
          P80_TRANS_TEMP_OPP_PARTY_CLASS(DTINPUTDT);
          --�����Ƿ��貹¼
          P81_T47_TRANS_TEMP_RE_IND(DTINPUTDT);
     END;
     END IF;

     BEGIN
      INSERT INTO T47_TRANS_TEMP_BAK
        SELECT TRANSACTIONKEY,
               CPZXH,
               CPZNXH,
               JYDQDH,
               TX_NO,
               VOUCHER_NO,
               ORGANKEY,
               TX_DT,
               DT_TIME,
               ACCT_NUM,
               ACCT_TYPE_CD,
               PARTY_ID,
               HOST_CUST_ID,
               PARTY_CHN_NAME,
               CARD_TYPE,
               CARD_NO,
               PBC_PARTY_CLASS_CD,
               PARTY_CLASS_CD,
               TX_CD,
               CB_TX_CD,
               JZJYDM,
               BUS_TYPE_CD,
               SUBJECTNO,
               KMCC,
               TX_TYPE_CD,
               DEBIT_CREDIT,
               RECEIVE_PAY_CD,
               CASH_TRANS_FLAG,
               CASH_IND,
               CURRENCY_CD,
               CURR_CD,
               AMT,
               CNY_AMT,
               USD_AMT,
               AMT_VAL,
               REMIT_TYPE_CD,
               ZYDH,
               DES,
               USE_DES,
               OPP_SYS_ID,
               OPP_ISPARTY,
               OPP_ACCT_NUM,
               OPP_ACCT_TYPE_CD,
               OPP_PARTY_ID,
               OPP_NAME,
               OPP_CARD_TYPE,
               OPP_CARD_NO,
               OPP_PARTY_CLASS_CD,
               OPP_PBC_PARTY_CLASS_CD,
               OPP_AREA,
               OPP_COUNTRY,
               OPP_ORGAN_TYPE,
               OPP_ORGANKEY,
               OPP_ORGANNAME,
               OPP_TX_DT,
               OPP_OFF_SHORE_IND,
               ORG_TRANS_RELA,
               TSCTKEY,
               OVERAREA_IND,
               SETTLE_TYPE_CD,
               TX_GO_COUNTRY,
               TX_GO_AREA,
               TX_OCCUR_COUNTRY,
               TX_OCCUR_AREA,
               AMT_CD,
               BATCH_IND,
               TELLER,
               RE_IND,
               ADDTIONAL,
               RE_DT,
               TX_DIRECT,
               TOKEN_NO,
               CHANNEL,
               CAL_IND,
               RULE_IND,
               CANCEL_IND,
               HANDLE_STATUS_CD,
               AGENT_NAME,
               AGENT_CARD_TYPE,
               AGENT_CARD_NO,
               AGENT_COUNTRY,
               CHECK_TELLER,
               LAST_UPD_USR,
               DEPOSIT_PERIOD,
               BIZ_TYPE_CD,
               YWCKH,
               DISPOSE_TYPE,
               IS_DISPOSED,
               IS_DELETED,
               XZXH,
               UPDATE_DT,
               TEMP1,
               TEMP2,
               TEMP3,
               TEMP4
          FROM T47_TRANS_TEMP T
         WHERE T.PARTY_ID IS NULL
           AND T.TX_DT = TO_DATE(DTINPUTDT, 'YYYY-MM-DD');

      COMMIT;

      DELETE FROM T47_TRANS_TEMP T WHERE T.PARTY_ID IS NULL;

      COMMIT;

    END;
  END;

  /**
  * TITLE      : ������ˮ�м�����</P>
  * DESCRIPTION: �ӷ�¼���н���ģ�齻�׿ͻ������׻�����Ϣ�����м���ˮ��</P>
  *              ��¼����ͼ V_STMT_FIELTER �Ƚ����˽��׹��ˣ�����ͼ������䣩
  * �������淶��P70_��Ӧ����,ϸ�����߼������ɴ�P71��P79������</P>
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-08
  */
  PROCEDURE P71_T47_TRANS_MID_INSERT(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    --�����α�
    CURSOR CURS_CPWJ IS
      SELECT TO_CHAR(CPZXH) || TO_CHAR(CPZNXH) AS TRANSACTIONKEY, --Ψһ��ʶ���� CPZXH + CPZNXH
             CPZXH, --��Ʊ�����
             CPZNXH, --��Ʊ�������
             JYDQDH, --Դϵͳ��λ���׵�������
             GYLSH AS TX_NO, --��Ա��ˮ��
             CASE WHEN JYJGDH <> '101' THEN JYDQDH || JYJGDH ELSE CASE WHEN KHJGDH<>'101' THEN KHDQDH || KHJGDH ELSE KHDQDH||'801' END END AS ORGANKEY, --���׻������� JYDQDH + JYJGDH
             JYRQ AS TX_DT, --��������
             F04_STRING_TO_TIMESTEMP(JYRQ, JYSJ) AS DT_TIME, --����ʱ��
             ZHDH AS ACCT_NUM, --���������ʺ�
             JYDM AS CB_TX_CD, --ԭ���״���
             JZJYDM, --���˽��״���
             KMDH AS SUBJECTNO, --��Ŀ����
             F01_ETL_CODE_MAP('1001',JDBJ) AS DEBIT_CREDIT, --������
             F01_ETL_CODE_MAP('1003',XZBZ) AS CASH_TRANS_FLAG, --��ת���
             CASE
               WHEN F01_ETL_CODE_MAP('1006',HBZL) IS NULL THEN 'CNY'
               ELSE F01_ETL_CODE_MAP('1006',HBZL) END AS CURRENCY_CD, --���б��ִ���
             JYJE AS AMT, --���׽��
             ZHYE AS AMT_VAL, --�˻����
             ZYDH, --ժҪ����
             JYGY AS TELLER, --���׹�Ա
             PZDH AS TOKEN_NO, --ƾ֤����
             F01_ETL_CODE_MAP('1008',QDZL) AS CHANNEL, --��������
             CASE --���ˣ�
               WHEN BCZBZ = '2' AND CBBZ = '0' THEN
                '2' --    BCZBZ = '2' ���ձ�������CBBZ = '0'����
               WHEN BCZBZ = '0' AND CBBZ = '3' THEN
                '2' --    BCZBZ = '0'������CBBZ = '3'���ճ�
               ELSE
                '0' --���������������
             END AS CANCEL_IND, --Ĩ�˱�־
             SQGY AS CHECK_TELLER, --���˹�Ա
             YWCKH AS YWCKH, --ҵ��ο���
             XZXH AS XZXH, --�������
             ETL_DATE AS UPDATE_DT --��������
        FROM ODS.ODS_CPWJ
       WHERE JYRQ = LV_INPUTDT
         AND JYJE >= 0 --���׽��С��0�Ĳ����뷴ϴǮϵͳ
         AND ((BCZBZ = '1' AND CBBZ <> '0') OR --�ų�bczbz +�����ʱ�־��cbbz+�岹��־����ϣ�1��0��0��1
             (BCZBZ = '0' AND CBBZ <> '1'))
         --AND JYJGDH <> '101'
         AND JYJGDH <> '102'
         AND JYJGDH <> '103'
         AND JYJGDH <> '104';

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY     T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_CPZXH              T47_TRANS_TEMP.CPZXH%TYPE;
    LV_CPZNXH             T47_TRANS_TEMP.CPZNXH%TYPE;
    LV_JYDQDH             T47_TRANS_TEMP.JYDQDH%TYPE;
    LV_TX_NO              T47_TRANS_TEMP.TX_NO%TYPE;
    LV_ORGANKEY           T47_TRANS_TEMP.ORGANKEY%TYPE;
    LV_TX_DT              T47_TRANS_TEMP.TX_DT%TYPE;
    LV_DT_TIME            T47_TRANS_TEMP.DT_TIME%TYPE;
    LV_ACCT_NUM           T47_TRANS_TEMP.ACCT_NUM%TYPE;
    LV_ACCT_TYPE_CD       T47_TRANS_TEMP.ACCT_TYPE_CD%TYPE;
    LV_PARTY_ID           T47_TRANS_TEMP.PARTY_ID%TYPE;
    LV_PARTY_CHN_NAME     T47_TRANS_TEMP.PARTY_CHN_NAME%TYPE;
    LV_CARD_TYPE          T47_TRANS_TEMP.CARD_TYPE%TYPE;
    LV_CARD_NO            T47_TRANS_TEMP.CARD_NO%TYPE;
    LV_PBC_PARTY_CLASS_CD T47_TRANS_TEMP.PBC_PARTY_CLASS_CD%TYPE;
    LV_PARTY_CLASS_CD     T47_TRANS_TEMP.PARTY_CLASS_CD%TYPE;
    LV_CB_TX_CD           T47_TRANS_TEMP.CB_TX_CD%TYPE;
    LV_JZJYDM             T47_TRANS_TEMP.JZJYDM%TYPE;
    LV_SUBJECTNO          T47_TRANS_TEMP.SUBJECTNO%TYPE;
    LV_KMCC               T47_TRANS_TEMP.KMCC%TYPE;
    LV_DEBIT_CREDIT       T47_TRANS_TEMP.DEBIT_CREDIT%TYPE;
    LV_CASH_TRANS_FLAG    T47_TRANS_TEMP.CASH_TRANS_FLAG%TYPE;
    LV_CURRENCY_CD        T47_TRANS_TEMP.CURRENCY_CD%TYPE;
    LV_AMT                T47_TRANS_TEMP.AMT%TYPE;
    LV_CNY_AMT            T47_TRANS_TEMP.CNY_AMT%TYPE;
    LV_USD_AMT            T47_TRANS_TEMP.USD_AMT%TYPE;
    LV_AMT_VAL            T47_TRANS_TEMP.AMT_VAL%TYPE;
    LV_ZYDH               T47_TRANS_TEMP.ZYDH%TYPE;
    LV_DES                T47_TRANS_TEMP.DES%TYPE;
    LV_USE_DES            T47_TRANS_TEMP.USE_DES%TYPE;
    LV_AMT_CD             T47_TRANS_TEMP.AMT_CD%TYPE;
    LV_TELLER             T47_TRANS_TEMP.TELLER%TYPE;
    LV_TOKEN_NO           T47_TRANS_TEMP.TOKEN_NO%TYPE;
    LV_CHANNEL            T47_TRANS_TEMP.CHANNEL%TYPE;
    LV_CANCEL_IND         T47_TRANS_TEMP.CANCEL_IND%TYPE;
    LV_CHECK_TELLER       T47_TRANS_TEMP.CHECK_TELLER%TYPE;
    LV_YWCKH              T47_TRANS_TEMP.YWCKH%TYPE;
    LV_XZXH               T47_TRANS_TEMP.XZXH%TYPE;
    LV_UPDATE_DT          T47_TRANS_TEMP.UPDATE_DT%TYPE;

    LV_FILTER_TRANS       BOOLEAN := FALSE; --���ڱ�ʶ���������Ƿ������

  BEGIN
    --���������ˮ��ʱ�����ݣ�ÿ�δ�����Ľ���
    DELETE FROM T47_TRANS_TEMP;
    COMMIT;
    OPEN CURS_CPWJ;
    LOOP
      FETCH CURS_CPWJ
        INTO LV_TRANSACTIONKEY, --Ψһ��ʶ���� CPZXH + CPZNXH
      LV_CPZXH, --��Ʊ�����
      LV_CPZNXH, --��Ʊ�������
      LV_JYDQDH, --Դϵͳ��λ���׵�������
      LV_TX_NO, --��Ա��ˮ��
      LV_ORGANKEY, --���׻������� JYDQDH + JYJGDH
      LV_TX_DT, --��������
      LV_DT_TIME, --����ʱ��
      LV_ACCT_NUM, --���������ʺ�
      LV_CB_TX_CD, --ԭ���״���
      LV_JZJYDM, --���˽��״���
      LV_SUBJECTNO, --��Ŀ����
      LV_DEBIT_CREDIT, --������
      LV_CASH_TRANS_FLAG, --��ת���
      LV_CURRENCY_CD, --���б��ִ���
      LV_AMT, --���׽��
      LV_AMT_VAL, --�˻����
      LV_ZYDH, --ժҪ����
      LV_TELLER, --���׹�Ա
      LV_TOKEN_NO, --ƾ֤����
      LV_CHANNEL, --��������
      LV_CANCEL_IND, --Ĩ�˱�־
      LV_CHECK_TELLER, --���˹�Ա
      LV_YWCKH, --ҵ��ο���
      LV_XZXH, --�������
      LV_UPDATE_DT; --��������
      EXIT WHEN CURS_CPWJ%NOTFOUND;


      LV_FILTER_TRANS := F16_IS_FILTER_TX_CD(LV_CB_TX_CD,'07');  --ͨ�����״���鿴�Ƿ������

      IF NOT LV_FILTER_TRANS THEN         --������״���ȷ������˲������Ŀ����
         LV_FILTER_TRANS := F17_IS_FILTER_SUBJECT(LV_SUBJECTNO,'07'); --ͨ����Ŀ���Ų鿴�Ƿ������
      END IF;

      IF NOT LV_FILTER_TRANS THEN         --���ȷ������˲��������ش���
         LV_FILTER_TRANS := F18_IS_FILTER_SUBJECT_TX_CD(LV_SUBJECTNO,LV_CB_TX_CD); --ͨ�� ��Ŀ���� + ���״��� �鿴�����Ƿ����
      END IF;

      IF NOT LV_FILTER_TRANS THEN
      BEGIN
          --��Э���ȡ�����������Ӧ�Ŀͻ������������˻�����
          BEGIN
            SELECT CUSTOMER_ID, --�ͻ�����
                   AML_ACCT_TYPE_CD --�����˻�����
              INTO LV_PARTY_ID, LV_ACCT_TYPE_CD
              FROM T47_AGREEMENT
             WHERE ACCT_NUM = LV_ACCT_NUM;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              BEGIN
                LV_PARTY_ID     := NULL;
                LV_ACCT_TYPE_CD := NULL;
              END;
          END;

          --��ͻ���ȡ����������Ŀͻ������Ϣ
          BEGIN
            SELECT PARTY_CLASS_CD, --�ͻ����� ��C�Թ��ͻ� I��˽�ͻ�
                   AML2_TYPE_CD, --���пͻ����� 01:����;02:��Ȼ�ˣ�03:���幤�̻���04:������֯
                   PARTY_CHN_NAME, --�ͻ�����
                   CARD_TYPE, --֤������
                   CARD_NO --֤������
              INTO LV_PARTY_CLASS_CD,
                   LV_PBC_PARTY_CLASS_CD,
                   LV_PARTY_CHN_NAME,
                   LV_CARD_TYPE,
                   LV_CARD_NO
              FROM T47_PARTY
             WHERE PARTY_ID = LV_PARTY_ID;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              BEGIN
                LV_PARTY_CLASS_CD     := NULL;
                LV_PBC_PARTY_CLASS_CD := NULL;
                LV_PARTY_CHN_NAME     := NULL;
                LV_CARD_TYPE          := NULL;
                LV_CARD_NO            := NULL;
              END;
          END;

          --���Ŀ���ű�ȡ����Ŀ�洢
          BEGIN
            SELECT SUBJECTTYPE --��Ŀ����
              INTO LV_KMCC
              FROM T87_SUBJECT
             WHERE SUBJECTKEY = LV_SUBJECTNO;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              LV_KMCC := NULL;
          END;

          --��ժҪ��ȡ��ժҪ����
          BEGIN
            SELECT ZYSM --ժҪ˵��
              INTO LV_DES
              FROM T00_ZYB
             WHERE ZYDH = LV_ZYDH;
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              LV_DES := NULL;
          END;

          INSERT INTO T47_TRANS_TEMP
            (TRANSACTIONKEY, --Ψһ��ʶ���� CPZXH + CPZNXH
             CPZXH, --��Ʊ�����
             CPZNXH, --��Ʊ�������
             JYDQDH, --��λ���׵�������
             TX_NO, --��Ա��ˮ��
             VOUCHER_NO, --��Ʊ��
             ORGANKEY, --���׻�������
             TX_DT, --��������
             DT_TIME, --����ʱ��
             ACCT_NUM, --���������ʺ�
             ACCT_TYPE_CD, --�����˻�����
             PARTY_ID, --��������ͻ�����
             HOST_CUST_ID, --ԭ�ͻ�����
             PARTY_CHN_NAME, --�ͻ�����
             CARD_TYPE, --֤������
             CARD_NO, --֤������
             PBC_PARTY_CLASS_CD, --���пͻ�����  01:����;02:��Ȼ�ˣ�03:���幤�̻���04:������֯
             PARTY_CLASS_CD, --�ͻ����� ��C�Թ��ͻ� I��˽�ͻ�
             CB_TX_CD, --ԭ���״���
             JZJYDM, --���˽��״���
             SUBJECTNO, --��Ŀ����
             KMCC, --��Ŀ�洢
             TX_TYPE_CD, --��������
             DEBIT_CREDIT, --������
             RECEIVE_PAY_CD, --�ո����
             CASH_TRANS_FLAG, --��ת���
             CASH_IND, --�ֳ����
             CURRENCY_CD, --���б��ִ���
             CURR_CD, --����ұ�־
             AMT, --���׽��
             CNY_AMT, --������ҽ��
             USD_AMT, --����Ԫ���
             AMT_VAL, --�˻����
             ZYDH, --ժҪ����
             DES, --ժҪ˵��
             TELLER, --���׹�Ա
             TOKEN_NO, --ƾ֤����
             CHANNEL, --��������
             CANCEL_IND, --Ĩ�˱�־
             HANDLE_STATUS_CD, --Ԥ������״̬
             CHECK_TELLER, --���˹�Ա
             YWCKH, --ҵ��ο���
             DISPOSE_TYPE, --��������
             IS_DISPOSED, --�Ƿ��Ѵ���
             IS_DELETED, --�Ƿ����
             XZXH, --�������
             UPDATE_DT) --��������
          VALUES
            (LV_TRANSACTIONKEY, --Ψһ��ʶ���� CPZXH + CPZNXH
             LV_CPZXH, --��Ʊ�����
             LV_CPZNXH, --��Ʊ�������
             LV_JYDQDH, --��λ���׵�������
             LV_TX_NO, --��Ա��ˮ��
             LV_CPZXH, --��Ʊ��
             LV_ORGANKEY, --���׻�������
             LV_TX_DT, --��������
             LV_DT_TIME, --����ʱ��
             LV_ACCT_NUM, --���������ʺ�
             LV_ACCT_TYPE_CD, --�����˻�����
             LV_PARTY_ID, --��������ͻ�����
             LV_PARTY_ID, --ԭ�ͻ�����
             LV_PARTY_CHN_NAME, --�ͻ�����
             LV_CARD_TYPE, --֤������
             LV_CARD_NO, --֤������
             LV_PBC_PARTY_CLASS_CD, --���пͻ�����  01:����;02:��Ȼ�ˣ�03:���幤�̻���04:������֯
             LV_PARTY_CLASS_CD, --�ͻ����� ��C�Թ��ͻ� I��˽�ͻ�
             LV_CB_TX_CD, --ԭ���״���
             LV_JZJYDM, --���˽��״���
             LV_SUBJECTNO, --��Ŀ����
             LV_KMCC, --��Ŀ�洢
             F01_ETL_CODE_MAP('1004',LV_CASH_TRANS_FLAG), --�������� ͨ����ת��ǲ�T87_ETL_CODE_MAP
             LV_DEBIT_CREDIT, --������
             F01_ETL_CODE_MAP('1002',LV_DEBIT_CREDIT), --�ո���� ͨ�������ǲ�T87_ETL_CODE_MAP
             LV_CASH_TRANS_FLAG, --��ת���
             F01_ETL_CODE_MAP('1005',LV_CASH_TRANS_FLAG), --�ֳ���� ͨ����ת��ǲ�T87_ETL_CODE_MAP
             LV_CURRENCY_CD, --���б��ִ���
             CASE WHEN F01_ETL_CODE_MAP('1007',LV_CURRENCY_CD) IS NULL THEN '1'
                  ELSE F01_ETL_CODE_MAP('1007',LV_CURRENCY_CD) END, --����ұ�־ ͨ����ת��ǲ�T87_ETL_CODE_MAP  �鲻��Ĭ��Ϊ����
             LV_AMT, --���׽��
             CASE WHEN LV_CURRENCY_CD = 'CNY' THEN LV_AMT
                  ELSE F05_TRANSFER_EXCHANGE_RATE(LV_CURRENCY_CD, LV_AMT, 'CNY')
             END, --������ҽ��
             F05_TRANSFER_EXCHANGE_RATE(LV_CURRENCY_CD, LV_AMT, 'USD'), --����Ԫ���
             LV_AMT_VAL, --�˻����
             LV_ZYDH, --ժҪ����
             LV_DES, --ժҪ˵��
             LV_TELLER, --���׹�Ա
             LV_TOKEN_NO, --ƾ֤����
             LV_CHANNEL, --��������
             LV_CANCEL_IND, --Ĩ�˱�־
             '0', --Ԥ������״̬��Ĭ��Ϊ 0 ��ʾδ����
             LV_CHECK_TELLER, --���˹�Ա
             LV_YWCKH, --ҵ��ο���
             '0', --�������� Ĭ��λ0��ʾδ���� ��Ҫ���������Ҷ���ʱ�ĸ�������
             '0', --�Ƿ��Ѵ��� Ĭ��Ϊ0��ʾδ���� 1��ʾ�ý����Ѵ���
             '0', --�Ƿ���� Ĭ��Ϊ0��ʾ�����ˣ���Ϊ1���ʾ�ý��ײ����뽻�ױ�
             LV_XZXH, --�������
             LV_UPDATE_DT); --��������
        COMMIT;
        END;
        END IF;
    END LOOP;
    CLOSE CURS_CPWJ;
  END;


  /**
  * TITLE      : ����ͬһ�ͻ����˻�֮��ķǻ���ת���ڽ���</P>
  * DESCRIPTION: ��һ����Ʊ���ڣ�ͬһ���ͻ��µĲ�ͬ�˻�֮��Ķ���ת���ڡ�</P>
  *              ����ת���ڡ�����ת���ڵĽ��ף�����
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '1'
  *              DISPOSE_TYPE = '1'
  *              ��������Ϊ��
  *                          ��Ʊ�������ȣ�
  *                          �ͻ�������ȣ�
  *                          ������ȣ�
  *                          һ����Ŀ�洢Ϊ2�������˻�����
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-14
  */
  PROCEDURE P72_TRANS_TEMP_FIXED_UNFIXED(DTINPUTDT IN VARCHAR2) AS

  CURSOR CURS_FIXED_UNFIXED IS
      SELECT T1.CPZXH
        FROM T47_TRANS_TEMP T1, T47_TRANS_TEMP T2
       WHERE T1.IS_DISPOSED = '0'
         AND T2.IS_DISPOSED = '0'
         AND T1.KMCC = '2'
         AND T1.CPZXH = T2.CPZXH
         AND T1.PARTY_ID = T2.PARTY_ID
         AND T1.DEBIT_CREDIT <> T2.DEBIT_CREDIT;
    LV_CPZXH T47_TRANS_TEMP.CPZXH%TYPE;
  BEGIN
    OPEN CURS_FIXED_UNFIXED;
    LOOP
      FETCH CURS_FIXED_UNFIXED
        INTO LV_CPZXH;
      EXIT WHEN CURS_FIXED_UNFIXED%NOTFOUND;
      IF LV_CPZXH IS NOT NULL THEN
        UPDATE T47_TRANS_TEMP T
           SET T.IS_DISPOSED  = '1',
               T.IS_DELETED   = '1',
               T.DISPOSE_TYPE = '1'
         WHERE T.CPZXH = LV_CPZXH;
      END IF;
      COMMIT;
    END LOOP;
    CLOSE CURS_FIXED_UNFIXED;
  END;

  /**
  * TITLE      : ������ǰ�����ཻ��</P>
  * DESCRIPTION: ������ǰ�����Ľ��ף��������˻���Ϣ��Ϊ�����˻��Ķ�����Ϣ������
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '0'
  *              DISPOSE_TYPE = '3'
  *              ��������Ϊ��
  *                          ��Ʊ�������ȣ�
  *                          һ����Ŀ�洢Ϊ0��1�������˻�����
  *                          һ����Ŀ�洢Ϊ3�������˻�����
  *                          �����˻����׽����ڵ��ڴ����˻����׽�
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-14
  */
  PROCEDURE P73_TRANS_TEMP_RETURN_CREDIT(DTINPUTDT IN VARCHAR2) AS

   --�����α�
   CURSOR CURS_RETURN_CREDIT IS
      SELECT T1.TRANSACTIONKEY,
             T2.ACCT_NUM,
             T2.ACCT_TYPE_CD,
             T2.PARTY_ID,
             T2.PARTY_CHN_NAME,
             T2.CARD_TYPE,
             T2.CARD_NO,
             T2.PBC_PARTY_CLASS_CD,
             T2.PARTY_CLASS_CD
        FROM T47_TRANS_TEMP T1, T47_TRANS_TEMP T2
       WHERE T1.IS_DISPOSED = '0'
         AND T2.IS_DISPOSED = '0'
         AND T2.KMCC = '3'
         AND (T1.KMCC = '0' OR T1.KMCC = '1')
         AND T1.CPZXH = T2.CPZXH
         AND T1.AMT >= T2.AMT;

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY     T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_ACCT_NUM           T47_TRANS_TEMP.ACCT_NUM%TYPE;
    LV_ACCT_TYPE_CD       T47_TRANS_TEMP.ACCT_TYPE_CD%TYPE;
    LV_PARTY_ID           T47_TRANS_TEMP.PARTY_ID%TYPE;
    LV_PARTY_CHN_NAME     T47_TRANS_TEMP.PARTY_CHN_NAME%TYPE;
    LV_CARD_TYPE          T47_TRANS_TEMP.CARD_TYPE%TYPE;
    LV_CARD_NO            T47_TRANS_TEMP.CARD_NO%TYPE;
    LV_PBC_PARTY_CLASS_CD T47_TRANS_TEMP.PBC_PARTY_CLASS_CD%TYPE;
    LV_PARTY_CLASS_CD     T47_TRANS_TEMP.PARTY_CLASS_CD%TYPE;
    LV_TX_CD              T47_TRANS_TEMP.TX_CD%TYPE;
    LV_DISPOSE_TYPE       T47_TRANS_TEMP.DISPOSE_TYPE%TYPE;
    LV_IS_DISPOSED        T47_TRANS_TEMP.IS_DISPOSED%TYPE;

  BEGIN
    OPEN CURS_RETURN_CREDIT;
    LOOP
      FETCH CURS_RETURN_CREDIT
        INTO LV_TRANSACTIONKEY, LV_ACCT_NUM, LV_ACCT_TYPE_CD, LV_PARTY_ID, LV_PARTY_CHN_NAME, LV_CARD_TYPE, LV_CARD_NO, LV_PBC_PARTY_CLASS_CD, LV_PARTY_CLASS_CD;
      EXIT WHEN CURS_RETURN_CREDIT%NOTFOUND;

      LV_DISPOSE_TYPE := '3';
      LV_IS_DISPOSED  := '1';
      LV_TX_CD        := '3014'; --���������н��״���
      IF LV_TRANSACTIONKEY IS NOT NULL THEN
        UPDATE T47_TRANS_TEMP T
           SET T.OPP_ACCT_NUM           = LV_ACCT_NUM,
               T.OPP_ACCT_TYPE_CD       = LV_ACCT_TYPE_CD,
               T.OPP_PARTY_ID           = LV_PARTY_ID,
               T.OPP_NAME               = LV_PARTY_CHN_NAME,
               T.OPP_CARD_TYPE          = LV_CARD_TYPE,
               T.OPP_CARD_NO            = LV_CARD_NO,
               T.OPP_PBC_PARTY_CLASS_CD = LV_PBC_PARTY_CLASS_CD,
               T.OPP_PARTY_CLASS_CD     = LV_PARTY_CLASS_CD,
               T.TX_CD                  = LV_TX_CD,
               T.RE_IND                 = '0',     --���貹¼
               T.DISPOSE_TYPE           = LV_DISPOSE_TYPE,
               T.IS_DISPOSED            = LV_IS_DISPOSED
         WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;
        COMMIT;
      END IF;
    END LOOP;
    CLOSE CURS_RETURN_CREDIT;
  END;

  /**
  * TITLE      : �����״�����˽���</P>
  * DESCRIPTION: �������ࡢ�ڲ����ࡢ�������ཻ�׹��ˣ�����
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '1'
  *              DISPOSE_TYPE = '4'
  *              ��������Ϊ��
  *                          ��Ŀ�洢Ϊ3�������4���ڲ�����5�����⣩
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-14
  */
  PROCEDURE P74_TRANS_TEMP_FILTER(DTINPUTDT IN VARCHAR2) AS

  BEGIN
    UPDATE T47_TRANS_TEMP T
       SET T.IS_DISPOSED = '1', T.IS_DELETED = '1', T.DISPOSE_TYPE = '4'
     WHERE T.KMCC = '3'     --������
        OR T.KMCC = '4'     --�ڲ�����
        OR T.KMCC = '5';    --��������
    COMMIT;
  END;

  /**
  * TITLE      : �����ϸ�һ��һ���Ľ���</P>
  * DESCRIPTION: ����һ����Ʊ���ڣ�ֻ�������ͻ����ף�һ��һ��������
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '0'
  *              DISPOSE_TYPE = '5'
  *              ��������Ϊ��
  *                          ��Ʊ��������
  *                          ֻ����������
  *                          ����෴
  *                          ���׽�����
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-14
  */
  PROCEDURE P75_TRANS_TEMP_ONE_TO_ONE(DTINPUTDT IN VARCHAR2) AS

    --�����α�
    CURSOR CURS_T47_TRANS_TEMP_ONE_TO_ONE IS
      SELECT T4.CPZXH, T4.CPZNXH
        FROM T47_TRANS_TEMP T4,
             (SELECT T2.CPZXH
                FROM (SELECT T1.CPZXH,
                             (CASE WHEN T1.DEBIT_CREDIT = 'D' THEN -1
                                   WHEN T1.DEBIT_CREDIT = 'C' THEN  1 END)
                             AS DEBIT_CREDIT,
                             (CASE WHEN T1.DEBIT_CREDIT = 'D' THEN -1 * T1.AMT
                                   WHEN T1.DEBIT_CREDIT = 'C' THEN  1 * T1.AMT END)
                             AS AMT
                        FROM T47_TRANS_TEMP T1
                       WHERE T1.IS_DISPOSED = '0') T2
               GROUP BY T2.CPZXH
              HAVING COUNT(T2.CPZXH) = 2 AND SUM(T2.DEBIT_CREDIT) = 0 AND SUM(T2.AMT) = 0) T3
       WHERE T4.IS_DISPOSED = '0'
         AND T3.CPZXH = T4.CPZXH;

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY     T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_CPZXH              T47_TRANS_TEMP.CPZXH%TYPE;
    LV_CPZNXH             T47_TRANS_TEMP.CPZNXH%TYPE;
    LV_ACCT_NUM           T47_TRANS_TEMP.ACCT_NUM%TYPE;
    LV_ACCT_TYPE_CD       T47_TRANS_TEMP.ACCT_TYPE_CD%TYPE;
    LV_PARTY_ID           T47_TRANS_TEMP.PARTY_ID%TYPE;
    LV_PARTY_CHN_NAME     T47_TRANS_TEMP.PARTY_CHN_NAME%TYPE;
    LV_CARD_TYPE          T47_TRANS_TEMP.CARD_TYPE%TYPE;
    LV_CARD_NO            T47_TRANS_TEMP.CARD_NO%TYPE;
    LV_PBC_PARTY_CLASS_CD T47_TRANS_TEMP.PBC_PARTY_CLASS_CD%TYPE;
    LV_PARTY_CLASS_CD     T47_TRANS_TEMP.PARTY_CLASS_CD%TYPE;
    LV_TX_CD              T47_TRANS_TEMP.TX_CD%TYPE;
    LV_DISPOSE_TYPE       T47_TRANS_TEMP.DISPOSE_TYPE%TYPE;
    LV_IS_DISPOSED        T47_TRANS_TEMP.IS_DISPOSED%TYPE;
    LV_NO_DATA            BOOLEAN := FALSE;
  BEGIN
    OPEN CURS_T47_TRANS_TEMP_ONE_TO_ONE;
    LOOP
      FETCH CURS_T47_TRANS_TEMP_ONE_TO_ONE
        INTO LV_CPZXH, LV_CPZNXH;
      EXIT WHEN CURS_T47_TRANS_TEMP_ONE_TO_ONE%NOTFOUND;
      BEGIN
        SELECT T1.TRANSACTIONKEY,
               T2.ACCT_NUM,
               T2.ACCT_TYPE_CD,
               T2.PARTY_ID,
               T2.PARTY_CHN_NAME,
               T2.CARD_TYPE,
               T2.CARD_NO,
               T2.PBC_PARTY_CLASS_CD,
               T2.PARTY_CLASS_CD
          INTO LV_TRANSACTIONKEY,
               LV_ACCT_NUM,
               LV_ACCT_TYPE_CD,
               LV_PARTY_ID,
               LV_PARTY_CHN_NAME,
               LV_CARD_TYPE,
               LV_CARD_NO,
               LV_PBC_PARTY_CLASS_CD,
               LV_PARTY_CLASS_CD
          FROM T47_TRANS_TEMP T1, T47_TRANS_TEMP T2
         WHERE T1.CPZXH = LV_CPZXH
           AND T1.CPZNXH = LV_CPZNXH
           AND T1.CPZXH = T2.CPZXH
           AND T1.CPZNXH != T2.CPZNXH;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          LV_NO_DATA := TRUE;
        WHEN OTHERS THEN
          LV_NO_DATA := TRUE;
      END;
      IF NOT LV_NO_DATA THEN
        BEGIN
          LV_DISPOSE_TYPE := '5';
          LV_IS_DISPOSED  := '1';
          IF LV_TRANSACTIONKEY IS NOT NULL THEN
            UPDATE T47_TRANS_TEMP T
               SET T.OPP_ACCT_NUM           = LV_ACCT_NUM,
                   T.OPP_ACCT_TYPE_CD       = LV_ACCT_TYPE_CD,
                   T.OPP_PARTY_ID           = LV_PARTY_ID,
                   T.OPP_NAME               = LV_PARTY_CHN_NAME,
                   T.OPP_CARD_TYPE          = LV_CARD_TYPE,
                   T.OPP_CARD_NO            = LV_CARD_NO,
                   T.OPP_PBC_PARTY_CLASS_CD = LV_PBC_PARTY_CLASS_CD,
                   T.OPP_PARTY_CLASS_CD     = LV_PARTY_CLASS_CD,
                   T.RE_IND                 = '0',
                   T.DISPOSE_TYPE           = LV_DISPOSE_TYPE,
                   T.IS_DISPOSED            = LV_IS_DISPOSED
             WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;

            COMMIT;

          END IF;
        END;
      END IF;
    END LOOP;
    CLOSE CURS_T47_TRANS_TEMP_ONE_TO_ONE;
  END;


  /*
  * TITLE      :ȡ���Ǽǲ���Ϣ�����뽻�׶��ֱ�
  * DESCRIPTION:
  * PARAMETERS :
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  : FCQ
  * MODIFY DATE: 2008-06-02
  */
  PROCEDURE P76_T47_TRANS_OPP_NATIVE(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
  BEGIN
     --Ϊ�����ظ����룬��ɾ������ı�ϵͳ���뽻��
     DELETE FROM T47_TRANS_OPP_NATIVE;
     COMMIT;

     --����������:�ǼǱ��������ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'DLJYWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.JYDQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.JYDQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   F01_ETL_CODE_MAP('1001',T2.JDBJ),
                   T2.JYJE,
                   T2.ZHDH,
                   T2.KHDM,
                   NULL,
                   T2.DFZH,
                   NULL,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'DLJYWJ',
                   'SHXXB'
            FROM ODS.ODS_DLJYWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�����֤ȯ�ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'DLZQWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.JYDQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.JYDQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   F01_ETL_CODE_MAP('1001',T2.JDBJ),
                   T2.JYJE,
                   T2.ZHDH,
                   CASE WHEN T2.DFZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.DFZH END,
                   NULL,
                   T2.DFZH,
                   NULL,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'DLZQWJ',
                   NULL
            FROM ODS.ODS_DLZQWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ��������ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'JJJYWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   F01_ETL_CODE_MAP('1001',T2.JDBJ),
                   T2.JYJE,
                   T2.XGZH,
                   CASE  WHEN T2.DFZHDH IS NULL THEN NULL
                         ELSE 'ZH' || T2.DFZHDH END,
                   NULL,
                   T2.DFZHDH,
                   NULL,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'JJJYWJ',
                   NULL
            FROM ODS.ODS_JJJYWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�ͬ��Ʊ���ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'TCPJWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   CASE WHEN T2.JHLX IN ('1','3','5','7') THEN 'D'
                        WHEN T2.JHLX IN ('2','4','6','8') THEN 'C' END,
                   T2.JYJE,
                   T2.ZHDH,
                   CASE WHEN T2.DFZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.DFZH END,
                   T2.DFZHMC,
                   T2.DFZH,
                   T2.DFHH,
                   CASE WHEN T2.DFHH IS NULL THEN NULL
                        ELSE '14' END,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'TCPJWJ',
                   NULL
            FROM ODS.ODS_TCPJWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ��շѽɿ�¼���ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'SFJKLRB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || SUBSTR(T2.YHWDH,3,2) || T2.GYLSH || DJB_PK.NEXTVAL,
                   SUBSTR(T2.YHWDH,3,2),
                   T2.GYLSH,
                   T2.JYRQ,
                   'D',
                   NULL,
                   T2.ZHDM,
                   CASE WHEN T2.JFRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.JFRZH END,
                   T2.JFRCC,
                   T2.JFRZH,
                   T2.JFRKHH,
                   CASE WHEN T2.JFRKHH IS NULL THEN NULL
                        ELSE '14' END,
                   '0',
                   '000000',
                   CASE WHEN F01_ETL_CODE_MAP('1010',SUBSTR(T2.YHWDH,3,2)) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',SUBSTR(T2.YHWDH,3,2)),
                   CASE WHEN F01_ETL_CODE_MAP('1010',SUBSTR(T2.YHWDH,3,2)) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',SUBSTR(T2.YHWDH,3,2)),
                   'SFJKLRB',
                   NULL
            FROM ODS.ODS_SFJKLRB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ����������ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'CGYWLSB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.JYDQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.JYDQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   F01_ETL_CODE_MAP('1001',T2.JDBJ),
                   T2.JYJE,
                   T2.ZHDH,
                   CASE WHEN T2.DFZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.DFZH END,
                   NULL,
                   T2.DFZH,
                   NULL,
                   NULL,
                   '0',
                   '000000',
                   CASE WHEN F01_ETL_CODE_MAP('1010',T2.JYDQDH||T2.JYJGDH) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',T2.JYDQDH||T2.JYJGDH),
                   CASE WHEN F01_ETL_CODE_MAP('1010',T2.JYDQDH||T2.JYJGDH) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',T2.JYDQDH||T2.JYJGDH),
                   'CGYWLSB',
                   NULL
            FROM ODS.ODS_CGYWLSB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�����ˮ�ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2,
                   T1.JYJE1,
                   T1.JYJE2 )
          ( SELECT 'JKLSWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.JYDQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.JYDQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   F01_ETL_CODE_MAP('1001',T2.JDBJ),
                   T2.JYJE,
                   T2.JKKH,
                   CASE WHEN T2.DFZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.DFZH END,
                   NULL,
                   CASE WHEN T2.DFZH IS NULL THEN T2.JSZH
                        ELSE T2.DFZH END, --�޶Է��˺ţ�ȡ�����ڲ���
                   NULL,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'JKLSWJ',
                   NULL,
                   T2.JYJE1,
                   T2.JYJE2
            FROM ODS.ODS_JKLSWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;
     BEGIN
                 --����֧������  ADD BY YINJS 20140811
      INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK,               --��������
                   T1.DQDH,               --��������
                   T1.TX_NO,               --��ˮ��
                   T1.TX_DT,               --��������
                   T1.ACCT_NUM,           --���������˻�
                   T1.DEBIT_CREDIT,       --�������������
                   T1.OPP_COUNTRY,         --�Է����ڻ�������
                   T1.OPP_AREA,            --�Է���������
                   T1.OPP_ORGAN_TYPE,      --�Է���������
                   T1.OPP_ORGANKEY,       --�Է�����
                   T1.OPP_ORGANNAME,      --�Է���������
                   T1.OPP_PARTY_ID,       --�Է��ͻ���
                   T1.OPP_NAME,            --�Է�����
                   T1.OPP_ACCT_NUM,       --�Է��˺�
                   T1.OPP_OFF_SHORE_IND,   --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY,             --������֧���״���
                   T1.TX_GO_COUNTRY,       --����ȥ�����
                   T1.TX_GO_AREA,         --����ȥ��������
                   T1.TX_OCCUR_COUNTRY,    --���׷�������
                   T1.TX_OCCUR_AREA,      --���׷�����
                   T1.AMT,                 --���׽��
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'DJYWWZB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   T2.FKRZH,
                   'D',
                   'CHN',
                   NULL,
                   '14',
                   T2.SKRKHH,
                   '',
                   CASE WHEN T2.SKRZH IS NULL THEN NULL
                        ELSE 'FBH'||T2.SKRZH END,
                   T2.SKRMC,
                   T2.SKRZH,
                   '0',
                   '000000',
                   'CHN',
                   NULL,
                   'CHN',
                   T2.DQDH,
                   T2.JYJE,
                   'DJYWWZB',
                   NULL
            FROM ODS.ODS_DJYWWZB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;
      END;
      BEGIN
                --����֧������                     ADD BY YINJS 20140811
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK,               --��������
                   T1.DQDH,               --��������
                   T1.TX_NO,               --��ˮ��
                   T1.TX_DT,               --��������
                   T1.ACCT_NUM,           --���������˻�
                   T1.DEBIT_CREDIT,       --�������������
                   T1.OPP_COUNTRY,         --�Է����ڻ�������
                   T1.OPP_AREA,            --�Է���������
                   T1.OPP_ORGAN_TYPE,      --�Է���������
                   T1.OPP_ORGANKEY,       --�Է�����
                   T1.OPP_ORGANNAME,      --�Է���������
                   T1.OPP_PARTY_ID,       --�Է��ͻ���
                   T1.OPP_NAME,            --�Է�����
                   T1.OPP_ACCT_NUM,       --�Է��˺�
                   T1.OPP_OFF_SHORE_IND,   --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY,             --������֧���״���
                   T1.TX_GO_COUNTRY,       --����ȥ�����
                   T1.TX_GO_AREA,         --����ȥ��������
                   T1.TX_OCCUR_COUNTRY,    --���׷�������
                   T1.TX_OCCUR_AREA,      --���׷�����
                   T1.AMT,                 --���׽��
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'DJYWLZB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   NVL(T2.HCLSH,T2.GYLSH),
                   T2.JYRQ,
                   T2.SKRZH,
                   'C',
                   'CHN',
                   NULL,
                   '14',
                   T2.FKRKHH,
                   '',
                   CASE WHEN T2.FKRZH IS NULL THEN NULL
                        ELSE 'FBH'||T2.FKRZH END,
                   T2.FKRMC,
                   T2.FKRZH,
                   '0',
                   '000000',
                   'CHN',
                   NULL,
                   'CHN',
                   T2.DQDH,
                   T2.JYJE,
                   'DJYWLZB',
                   NULL
            FROM ODS.ODS_DJYWLZB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;
      END;

     --����������:�ǼǱ����ճи��ǼǱ�(��������Ϊ�շ�)�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_ORGANNAME,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'TSCFDJB' || TO_CHAR(T2.DJRQ,'YYYY-MM-DD') || T2.DQDH || T2.DJGYLS || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.DJGYLS,
                   T2.DJRQ,
                   'C',
                   NULL,
                   T2.WTRZH,
                   CASE WHEN T2.FKRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.FKRZH END,
                   T2.FKRMC,
                   T2.FKRZH,
                   NULL,
                   NULL,
                   T2.FKHM,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'TSCFDJB',
                   NULL
            FROM ODS.ODS_TSCFDJB T2
            WHERE T2.DJRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ����ճи��ǼǱ�(��������Ϊ����)�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_ORGANNAME,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'TSCFDJB' || TO_CHAR(T2.DJRQ,'YYYY-MM-DD') || T2.DQDH || T2.DJGYLS || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.DJGYLS,
                   T2.DJRQ,
                   'D',
                   NULL,
                   T2.WTHM,
                   CASE WHEN T2.WTRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.WTRZH END,
                   T2.WTRMC,
                   T2.WTRZH,
                   NULL,
                   NULL,
                   T2.FKHM,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'TSCFDJB',
                   NULL
            FROM ODS.ODS_TSCFDJB T2
            WHERE T2.DJRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�ϵͳ�ڱ����ļ��ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_ORGANNAME,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'XTNBWWJ' || TO_CHAR(T2.FBRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.FBRQ,
                   'C',
                   T2.JYJE,
                   T2.SKRZH,
                   CASE WHEN T2.FKRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.FKRZH END,
                   T2.FKRMC,
                   T2.FKRZH,
                   T2.DFDQDH||T2.DFJGDH,
                   CASE WHEN T2.DFJGDH IS NULL THEN NULL
                        ELSE '13' END,
                   NULL,
                   '0',
                   '000000',
                   CASE WHEN F01_ETL_CODE_MAP('1010',T2.DFDQDH||T2.DFJGDH) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',T2.DFDQDH||T2.DFJGDH),
                   CASE WHEN F01_ETL_CODE_MAP('1010',T2.DFDQDH||T2.DFJGDH) IS NULL THEN NULL
                        ELSE 'CHN' END,
                   F01_ETL_CODE_MAP('1010',T2.DFDQDH||T2.DFJGDH),
                   'XTNBWWJ',
                   NULL
            FROM ODS.ODS_XTNBWWJ T2
            WHERE T2.FBRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�֧�������ļ�(����������)�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_ORGANNAME,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'ZFBWWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   'D',
                   T2.JYJE,
                   T2.ZFFKRZH,
                   CASE WHEN T2.ZFSKRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.ZFSKRZH END,
                   T2.ZFSKRMC,
                   T2.ZFSKRZH,
                   T2.ZFSKRHH,
                   CASE WHEN T2.ZFSKRHH IS NULL THEN NULL
                        ELSE '14' END,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'ZFBWWJ',
                   NULL
            FROM ODS.ODS_ZFBWWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�֧�������ļ����տ������壩�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK, --��������
                   T1.DQDH, --��������
                   T1.TX_NO, --��ˮ��
                   T1.TX_DT, --��������
                   T1.DEBIT_CREDIT, --�������������
                   T1.AMT, --���׽��
                   T1.ACCT_NUM, --���������˻�
                   T1.OPP_PARTY_ID, --�Է��ͻ���
                   T1.OPP_NAME,--�Է�����
                   T1.OPP_ACCT_NUM, --�Է��˺�
                   T1.OPP_ORGANKEY, --�Է�����
                   T1.OPP_ORGAN_TYPE,--�Է���������
                   T1.OPP_ORGANNAME,--�Է���������
                   T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY, --������֧���״���
                   T1.OPP_COUNTRY, --�Է����ڻ�������
                   T1.OPP_AREA,--�Է���������
                   T1.TX_GO_COUNTRY, --����ȥ�����
                   T1.TX_GO_AREA, --����ȥ��������
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'ZFBWWJ' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   'C',
                   T2.JYJE,
                   T2.ZFSKRZH,
                   CASE WHEN T2.ZFFKRZH IS NULL THEN NULL
                        ELSE 'ZH' || T2.ZFFKRZH END,
                   T2.ZFFKRMC,
                   T2.ZFFKRZH,
                   T2.ZFFKRHH,
                   CASE WHEN T2.ZFFKRHH IS NULL THEN NULL
                        ELSE '14' END,
                   NULL,
                   '0',
                   '000000',
                   NULL,
                   NULL,
                   NULL,
                   NULL,
                   'ZFBWWJ',
                   NULL
            FROM ODS.ODS_ZFBWWJ T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;

     END;

     --����������:�ǼǱ�С�����ҵ����ϸ���˱�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK,               --��������
                   T1.DQDH,               --��������
                   T1.TX_NO,               --��ˮ��
                   T1.TX_DT,               --��������
                   T1.ACCT_NUM,           --���������˻�
                   T1.DEBIT_CREDIT,       --�������������
                   T1.OPP_COUNTRY,         --�Է����ڻ�������
                   T1.OPP_AREA,            --�Է���������
                   T1.OPP_ORGAN_TYPE,      --�Է���������
                   T1.OPP_ORGANKEY,       --�Է�����
                   T1.OPP_ORGANNAME,      --�Է���������
                   T1.OPP_PARTY_ID,       --�Է��ͻ���
                   T1.OPP_NAME,            --�Է�����
                   T1.OPP_ACCT_NUM,       --�Է��˺�
                   T1.OPP_OFF_SHORE_IND,   --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY,             --������֧���״���
                   T1.TX_GO_COUNTRY,       --����ȥ�����
                   T1.TX_GO_AREA,         --����ȥ��������
                   T1.TX_OCCUR_COUNTRY,    --���׷�������
                   T1.TX_OCCUR_AREA,      --���׷�����
                   T1.AMT,                 --���׽��
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'XEDJYWMXLZB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   T2.ZFSKRZH,
                   'C',
                   'CHN',
                   CASE WHEN T2.FBZXDM IS NULL THEN NULL
                        ELSE T2.FBZXDM||'00' END,
                   '14',
                   T2.ZFFBHH,
                   '',
                   CASE WHEN T2.ZFFKRZH IS NULL THEN NULL
                        ELSE 'FBH'||T2.ZFFKRZH END,
                   T2.ZFFKRMC,
                   T2.ZFFKRZH,
                   '0',
                   '000000',
                   'CHN',
                   CASE WHEN T2.FBZXDM IS NULL THEN NULL
                        ELSE T2.FBZXDM||'00' END,
                   'CHN',
                   T2.DQDH,
                   T2.JYJE,
                   'XEDJYWMXLZB',
                   NULL
            FROM ODS.XEDJYWMXLZB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;
     END;

     --����������:�ǼǱ�С�����ҵ����ϸ���˱�ĵ��롿
     BEGIN
          INSERT INTO T47_TRANS_OPP_NATIVE T1
                 ( T1.CB_PK,               --��������
                   T1.DQDH,               --��������
                   T1.TX_NO,               --��ˮ��
                   T1.TX_DT,               --��������
                   T1.ACCT_NUM,           --���������˻�
                   T1.DEBIT_CREDIT,       --�������������
                   T1.OPP_COUNTRY,         --�Է����ڻ�������
                   T1.OPP_AREA,            --�Է���������
                   T1.OPP_ORGAN_TYPE,      --�Է���������
                   T1.OPP_ORGANKEY,       --�Է�����
                   T1.OPP_ORGANNAME,      --�Է���������
                   T1.OPP_PARTY_ID,       --�Է��ͻ���
                   T1.OPP_NAME,            --�Է�����
                   T1.OPP_ACCT_NUM,       --�Է��˺�
                   T1.OPP_OFF_SHORE_IND,   --�Է��Ƿ��밶�˻�
                   T1.TSCTKEY,             --������֧���״���
                   T1.TX_GO_COUNTRY,       --����ȥ�����
                   T1.TX_GO_AREA,         --����ȥ��������
                   T1.TX_OCCUR_COUNTRY,    --���׷�������
                   T1.TX_OCCUR_AREA,      --���׷�����
                   T1.AMT,                 --���׽��
                   T1.DJB_NAME,
                   T1.DJB_NAME2 )
          ( SELECT 'XEDJYWMXWZB' || TO_CHAR(T2.JYRQ,'YYYY-MM-DD') || T2.DQDH || T2.GYLSH || DJB_PK.NEXTVAL,
                   T2.DQDH,
                   T2.GYLSH,
                   T2.JYRQ,
                   T2.ZFFKRZH,
                   'D',
                   'CHN',
                   CASE WHEN T2.SBZXDM IS NULL THEN NULL
                        ELSE T2.SBZXDM||'00' END,
                   '14',
                   T2.ZFSBHH,
                   '',
                   CASE WHEN T2.ZFSKRZH IS NULL THEN NULL
                        ELSE 'FBH'||T2.ZFSKRZH END,
                   T2.ZFSKRMC,
                   T2.ZFSKRZH,
                   '0',
                   '000000',
                   'CHN',
                   CASE WHEN T2.SBZXDM IS NULL THEN NULL
                        ELSE T2.SBZXDM||'00' END,
                   'CHN',
                   T2.DQDH,
                   T2.JYJE,
                   'XEDJYWMXWZB',
                   NULL
            FROM ODS.XEDJYWMXWZB T2
            WHERE T2.JYRQ = LV_INPUTDT );

            COMMIT;
     END;

    BEGIN
      --�������л��ǼǱ� ADD BY ZHUYF 20150923

      INSERT INTO T47_TRANS_OPP_NATIVE T1
        (T1.CB_PK, --��������
         T1.DQDH, --��������
         T1.TX_NO, --��ˮ��
         T1.TX_DT, --��������
         T1.ACCT_NUM, --���������˻�
         T1.DEBIT_CREDIT, --�������������
         T1.OPP_COUNTRY, --�Է����ڻ�������
         T1.OPP_AREA, --�Է���������
         T1.OPP_ORGAN_TYPE, --�Է���������
         T1.OPP_ORGANKEY, --�Է�����
         T1.OPP_ORGANNAME, --�Է���������
         T1.OPP_PARTY_ID, --�Է��ͻ���
         T1.OPP_NAME, --�Է�����
         T1.OPP_ACCT_NUM, --�Է��˺�
         T1.OPP_OFF_SHORE_IND, --�Է��Ƿ��밶�˻�
         T1.TSCTKEY, --������֧���״���
         T1.TX_GO_COUNTRY, --����ȥ�����
         T1.TX_GO_AREA, --����ȥ��������
         T1.TX_OCCUR_COUNTRY, --���׷�������
         T1.TX_OCCUR_AREA, --���׷�����
         T1.AMT, --���׽��
         T1.DJB_NAME,
         T1.DJB_NAME2)
        (SELECT 'WSYHHKDJB' || TO_CHAR(T2.JYRQ, 'YYYY-MM-DD') || T2.JYDQDH ||
                T2.GYLSH || DJB_PK.NEXTVAL,
                T2.JYDQDH,
                T2.GYLSH,
                T2.JYRQ,
                T2.ZHDH,
                'D',
                'CHN',
                NULL,
                '14',
                CASE
                  WHEN T2.DFDQDH || T2.DFJGDH IS NOT NULL THEN
                   T2.DFDQDH || T2.DFJGDH
                  WHEN ASCII(SUBSTR(T2.SBHM, 1, 1)) >= 128 THEN
                   (SELECT UNIONORGKEY FROM T87_UNION WHERE UNION_NAME=T2.SBHM AND ROWNUM=1)
                  ELSE
                   T2.SBHM
                END,
                T2.SBHM,
                CASE
                  WHEN T2.SKDWZH IS NULL THEN
                   NULL
                  ELSE
                   'FBH' || T2.SKDWZH
                END,
                T2.SKDWMC,
                T2.SKDWZH,
                '0',
                '000000',
                'CHN',
                NULL,
                'CHN',
                T2.JYDQDH,
                T2.JYJE,
                'WSYHHKDJB',
                NULL
           FROM ODS.ODS_WSYHHKDJB T2
          WHERE T2.JYRQ = LV_INPUTDT
            AND NOT EXISTS (SELECT 1
                   FROM T47_TRANS_OPP_NATIVE T3
                  WHERE T2.GYLSH = T3.TX_NO
                    AND T2.JYRQ = T3.TX_DT
                    AND T2.ZHDH = T3.ACCT_NUM
                    AND T2.JYDQDH = T3.DQDH
                    AND T3.DEBIT_CREDIT = 'D'));

      COMMIT;
    END;

    END;


  /**
  * TITLE      :�����Ǽǲ����ϱ��ҳ����׶�����Ϣ</P>
  * DESCRIPTION: �� [��������]+[��������]+[������ˮ��] ������Ʊ�ļ��͵Ǽǲ���
  *              �ҳ����׶�����Ϣ������
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '0'
  *              DISPOSE_TYPE = '7'
  *              ��������Ϊ��
  *                          ���׵������
  *                          �����������
  *                          ��Ա��ˮ�����
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-15
  */
  PROCEDURE P77_TRANS_TEMP_JOIN_REGISTER_3(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    --�����α�
    CURSOR CURS_TRANS_TEMP_JOIN_REGISTER IS
      SELECT T1.TRANSACTIONKEY,
             T1.CPZXH,
             T2.OPP_COUNTRY,
             T2.OPP_AREA,
             T2.OPP_ORGAN_TYPE,
             T2.OPP_ORGANKEY,
             T2.OPP_ORGANNAME,
             T2.OPP_PARTY_ID,
             T2.OPP_NAME,
             T2.OPP_ACCT_NUM,
             T2.OPP_OFF_SHORE_IND,
             T2.OPP_ACCT_TYPE_CD,
             T2.OPP_CARD_TYPE,
             T2.OPP_CARD_NO,
             T2.OPP_PBC_PARTY_CLASS_CD,
             T2.OPP_PARTY_CLASS_CD,
             T2.TSCTKEY,
             T2.TX_GO_COUNTRY,
             T2.TX_GO_AREA,
             T2.TX_OCCUR_COUNTRY,
             T2.TX_OCCUR_AREA,
             T2.JYJE1,
             T2.JYJE2
        FROM T47_TRANS_TEMP T1, T47_TRANS_OPP_NATIVE T2
       WHERE T1.IS_DISPOSED = '0'
         AND T1.TX_DT = T2.TX_DT
         AND T1.JYDQDH = T2.DQDH
         AND T1.TX_NO = T2.TX_NO;

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY         T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_CPZXH                  T47_TRANS_TEMP.CPZXH%TYPE;
    LV_OPP_COUNTRY            T47_TRANS_OPP_NATIVE.OPP_COUNTRY%TYPE;
    LV_OPP_AREA               T47_TRANS_OPP_NATIVE.OPP_AREA%TYPE;
    LV_OPP_ORGAN_TYPE         T47_TRANS_OPP_NATIVE.OPP_ORGAN_TYPE%TYPE;
    LV_OPP_ORGANKEY           T47_TRANS_OPP_NATIVE.OPP_ORGANKEY%TYPE;
    LV_OPP_ORGANNAME          T47_TRANS_OPP_NATIVE.OPP_ORGANNAME%TYPE;
    LV_OPP_PARTY_ID           T47_TRANS_OPP_NATIVE.OPP_PARTY_ID%TYPE;
    LV_OPP_NAME               T47_TRANS_OPP_NATIVE.OPP_NAME%TYPE;
    LV_OPP_ACCT_NUM           T47_TRANS_OPP_NATIVE.OPP_ACCT_NUM%TYPE;
    LV_OPP_OFF_SHORE_IND      T47_TRANS_OPP_NATIVE.OPP_OFF_SHORE_IND%TYPE;
    LV_OPP_ACCT_TYPE_CD       T47_TRANS_OPP_NATIVE.OPP_ACCT_TYPE_CD%TYPE;
    LV_OPP_CARD_TYPE          T47_TRANS_OPP_NATIVE.OPP_CARD_TYPE%TYPE;
    LV_OPP_CARD_NO            T47_TRANS_OPP_NATIVE.OPP_CARD_NO%TYPE;
    LV_OPP_PBC_PARTY_CLASS_CD T47_TRANS_OPP_NATIVE.OPP_PBC_PARTY_CLASS_CD%TYPE;
    LV_OPP_PARTY_CLASS_CD     T47_TRANS_OPP_NATIVE.OPP_PARTY_CLASS_CD%TYPE;
    LV_TSCTKEY                T47_TRANS_OPP_NATIVE.TSCTKEY%TYPE;
    LV_TX_GO_COUNTRY          T47_TRANS_OPP_NATIVE.TX_GO_COUNTRY%TYPE;
    LV_TX_GO_AREA             T47_TRANS_OPP_NATIVE.TX_GO_AREA%TYPE;
    LV_TX_OCCUR_COUNTRY       T47_TRANS_OPP_NATIVE.TX_OCCUR_COUNTRY%TYPE;
    LV_TX_OCCUR_AREA          T47_TRANS_OPP_NATIVE.TX_OCCUR_AREA%TYPE;
    LV_JYJE1                  T47_TRANS_OPP_NATIVE.JYJE1%TYPE;
    LV_JYJE2                  T47_TRANS_OPP_NATIVE.JYJE2%TYPE;
    LV_DISPOSE_TYPE           T47_TRANS_TEMP.DISPOSE_TYPE%TYPE;
    LV_IS_DISPOSED            T47_TRANS_TEMP.IS_DISPOSED%TYPE;

  BEGIN
    OPEN CURS_TRANS_TEMP_JOIN_REGISTER;
    LOOP
      FETCH CURS_TRANS_TEMP_JOIN_REGISTER
        INTO LV_TRANSACTIONKEY, LV_CPZXH, LV_OPP_COUNTRY, LV_OPP_AREA, LV_OPP_ORGAN_TYPE, LV_OPP_ORGANKEY, LV_OPP_ORGANNAME, LV_OPP_PARTY_ID, LV_OPP_NAME, LV_OPP_ACCT_NUM, LV_OPP_OFF_SHORE_IND, LV_OPP_ACCT_TYPE_CD, LV_OPP_CARD_TYPE, LV_OPP_CARD_NO, LV_OPP_PBC_PARTY_CLASS_CD, LV_OPP_PARTY_CLASS_CD, LV_TSCTKEY, LV_TX_GO_COUNTRY, LV_TX_GO_AREA, LV_TX_OCCUR_COUNTRY, LV_TX_OCCUR_AREA,LV_JYJE1,LV_JYJE2;
      EXIT WHEN CURS_TRANS_TEMP_JOIN_REGISTER%NOTFOUND;

      IF LV_TRANSACTIONKEY IS NOT NULL THEN
        LV_DISPOSE_TYPE := '7';
        LV_IS_DISPOSED  := '1';
        UPDATE T47_TRANS_TEMP T
           SET T.OPP_COUNTRY            = LV_OPP_COUNTRY,
               T.OPP_AREA               = LV_OPP_AREA,
               T.OPP_ORGAN_TYPE         = LV_OPP_ORGAN_TYPE,
               T.OPP_ORGANKEY           = LV_OPP_ORGANKEY,
               T.OPP_ORGANNAME          = LV_OPP_ORGANNAME,
               T.OPP_PARTY_ID           = LV_OPP_PARTY_ID,
               T.OPP_NAME               = LV_OPP_NAME,
               T.OPP_ACCT_NUM           = LV_OPP_ACCT_NUM,
               T.OPP_OFF_SHORE_IND      = LV_OPP_OFF_SHORE_IND,
               T.OPP_ACCT_TYPE_CD       = LV_OPP_ACCT_TYPE_CD,
               T.OPP_CARD_TYPE          = LV_OPP_CARD_TYPE,
               T.OPP_CARD_NO            = LV_OPP_CARD_NO,
               T.OPP_PBC_PARTY_CLASS_CD = LV_OPP_PBC_PARTY_CLASS_CD,
               T.OPP_PARTY_CLASS_CD     = LV_OPP_PARTY_CLASS_CD,
               T.TSCTKEY                = LV_TSCTKEY,
               T.TX_GO_COUNTRY          = LV_TX_GO_COUNTRY,
               T.TX_GO_AREA             = LV_TX_GO_AREA,
               T.TX_OCCUR_COUNTRY       = LV_TX_OCCUR_COUNTRY,
               T.TX_OCCUR_AREA          = LV_TX_OCCUR_AREA,
               T.RE_IND                 = '0',
               T.DISPOSE_TYPE           = LV_DISPOSE_TYPE,
               T.IS_DISPOSED            = LV_IS_DISPOSED,
               T.JYJE1                  = LV_JYJE1,
               T.JYJE2                  = LV_JYJE2
         WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;
        COMMIT;
      END IF;
    END LOOP;
  END;


  /**
  * TITLE      :�����Ǽǲ����ϱ��ҳ����׶�����Ϣ</P>
  * DESCRIPTION: �� [��������]+[��������]+[������ˮ��]+[�����ʺ�] ������Ʊ�ļ��͵Ǽǲ���
  *              �ҳ����׶�����Ϣ������
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '0'
  *              DISPOSE_TYPE = '8'
  *              ��������Ϊ��
  *                          ���׵������
  *                          �����������
  *                          ��Ա��ˮ�����
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-15
  */
  PROCEDURE P77_TRANS_TEMP_JOIN_REGISTER_4(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    --�����α�
    CURSOR CURS_TRANS_TEMP_JOIN_REGISTER IS
      SELECT T1.TRANSACTIONKEY,
             T1.CPZXH,
             T2.OPP_COUNTRY,
             T2.OPP_AREA,
             T2.OPP_ORGAN_TYPE,
             T2.OPP_ORGANKEY,
             T2.OPP_ORGANNAME,
             T2.OPP_PARTY_ID,
             T2.OPP_NAME,
             T2.OPP_ACCT_NUM,
             T2.OPP_OFF_SHORE_IND,
             T2.OPP_ACCT_TYPE_CD,
             T2.OPP_CARD_TYPE,
             T2.OPP_CARD_NO,
             T2.OPP_PBC_PARTY_CLASS_CD,
             T2.OPP_PARTY_CLASS_CD,
             T2.TSCTKEY,
             T2.TX_GO_COUNTRY,
             T2.TX_GO_AREA,
             T2.TX_OCCUR_COUNTRY,
             T2.TX_OCCUR_AREA,
             T2.JYJE1,
             T2.JYJE2
        FROM T47_TRANS_TEMP T1, T47_TRANS_OPP_NATIVE T2
       WHERE T1.IS_DISPOSED = '0'
         AND T1.TX_DT = T2.TX_DT
         AND T1.JYDQDH = T2.DQDH
         AND T1.TX_NO = T2.TX_NO
         AND T1.ACCT_NUM = T2.ACCT_NUM;

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY         T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_CPZXH                  T47_TRANS_TEMP.CPZXH%TYPE;
    LV_OPP_COUNTRY            T47_TRANS_OPP_NATIVE.OPP_COUNTRY%TYPE;
    LV_OPP_AREA               T47_TRANS_OPP_NATIVE.OPP_AREA%TYPE;
    LV_OPP_ORGAN_TYPE         T47_TRANS_OPP_NATIVE.OPP_ORGAN_TYPE%TYPE;
    LV_OPP_ORGANKEY           T47_TRANS_OPP_NATIVE.OPP_ORGANKEY%TYPE;
    LV_OPP_ORGANNAME          T47_TRANS_OPP_NATIVE.OPP_ORGANNAME%TYPE;
    LV_OPP_PARTY_ID           T47_TRANS_OPP_NATIVE.OPP_PARTY_ID%TYPE;
    LV_OPP_NAME               T47_TRANS_OPP_NATIVE.OPP_NAME%TYPE;
    LV_OPP_ACCT_NUM           T47_TRANS_OPP_NATIVE.OPP_ACCT_NUM%TYPE;
    LV_OPP_OFF_SHORE_IND      T47_TRANS_OPP_NATIVE.OPP_OFF_SHORE_IND%TYPE;
    LV_OPP_ACCT_TYPE_CD       T47_TRANS_OPP_NATIVE.OPP_ACCT_TYPE_CD%TYPE;
    LV_OPP_CARD_TYPE          T47_TRANS_OPP_NATIVE.OPP_CARD_TYPE%TYPE;
    LV_OPP_CARD_NO            T47_TRANS_OPP_NATIVE.OPP_CARD_NO%TYPE;
    LV_OPP_PBC_PARTY_CLASS_CD T47_TRANS_OPP_NATIVE.OPP_PBC_PARTY_CLASS_CD%TYPE;
    LV_OPP_PARTY_CLASS_CD     T47_TRANS_OPP_NATIVE.OPP_PARTY_CLASS_CD%TYPE;
    LV_TSCTKEY                T47_TRANS_OPP_NATIVE.TSCTKEY%TYPE;
    LV_TX_GO_COUNTRY          T47_TRANS_OPP_NATIVE.TX_GO_COUNTRY%TYPE;
    LV_TX_GO_AREA             T47_TRANS_OPP_NATIVE.TX_GO_AREA%TYPE;
    LV_TX_OCCUR_COUNTRY       T47_TRANS_OPP_NATIVE.TX_OCCUR_COUNTRY%TYPE;
    LV_TX_OCCUR_AREA          T47_TRANS_OPP_NATIVE.TX_OCCUR_AREA%TYPE;
    LV_JYJE1                  T47_TRANS_OPP_NATIVE.JYJE1%TYPE;
    LV_JYJE2                  T47_TRANS_OPP_NATIVE.JYJE2%TYPE;
    LV_DISPOSE_TYPE           T47_TRANS_TEMP.DISPOSE_TYPE%TYPE;
    LV_IS_DISPOSED            T47_TRANS_TEMP.IS_DISPOSED%TYPE;

  BEGIN
    OPEN CURS_TRANS_TEMP_JOIN_REGISTER;
    LOOP
      FETCH CURS_TRANS_TEMP_JOIN_REGISTER
        INTO LV_TRANSACTIONKEY, LV_CPZXH, LV_OPP_COUNTRY, LV_OPP_AREA, LV_OPP_ORGAN_TYPE, LV_OPP_ORGANKEY, LV_OPP_ORGANNAME, LV_OPP_PARTY_ID, LV_OPP_NAME, LV_OPP_ACCT_NUM, LV_OPP_OFF_SHORE_IND, LV_OPP_ACCT_TYPE_CD, LV_OPP_CARD_TYPE, LV_OPP_CARD_NO, LV_OPP_PBC_PARTY_CLASS_CD, LV_OPP_PARTY_CLASS_CD, LV_TSCTKEY, LV_TX_GO_COUNTRY, LV_TX_GO_AREA, LV_TX_OCCUR_COUNTRY, LV_TX_OCCUR_AREA,LV_JYJE1,LV_JYJE2;
      EXIT WHEN CURS_TRANS_TEMP_JOIN_REGISTER%NOTFOUND;

      IF LV_TRANSACTIONKEY IS NOT NULL THEN
        LV_DISPOSE_TYPE := '8';
        LV_IS_DISPOSED  := '1';
        UPDATE T47_TRANS_TEMP T
           SET T.OPP_COUNTRY            = LV_OPP_COUNTRY,
               T.OPP_AREA               = LV_OPP_AREA,
               T.OPP_ORGAN_TYPE         = LV_OPP_ORGAN_TYPE,
               T.OPP_ORGANKEY           = LV_OPP_ORGANKEY,
               T.OPP_ORGANNAME          = LV_OPP_ORGANNAME,
               T.OPP_PARTY_ID           = LV_OPP_PARTY_ID,
               T.OPP_NAME               = LV_OPP_NAME,
               T.OPP_ACCT_NUM           = LV_OPP_ACCT_NUM,
               T.OPP_OFF_SHORE_IND      = LV_OPP_OFF_SHORE_IND,
               T.OPP_ACCT_TYPE_CD       = LV_OPP_ACCT_TYPE_CD,
               T.OPP_CARD_TYPE          = LV_OPP_CARD_TYPE,
               T.OPP_CARD_NO            = LV_OPP_CARD_NO,
               T.OPP_PBC_PARTY_CLASS_CD = LV_OPP_PBC_PARTY_CLASS_CD,
               T.OPP_PARTY_CLASS_CD     = LV_OPP_PARTY_CLASS_CD,
               T.TSCTKEY                = LV_TSCTKEY,
               T.TX_GO_COUNTRY          = LV_TX_GO_COUNTRY,
               T.TX_GO_AREA             = LV_TX_GO_AREA,
               T.TX_OCCUR_COUNTRY       = LV_TX_OCCUR_COUNTRY,
               T.TX_OCCUR_AREA          = LV_TX_OCCUR_AREA,
               T.RE_IND                 = '0',
               T.DISPOSE_TYPE           = LV_DISPOSE_TYPE,
               T.IS_DISPOSED            = LV_IS_DISPOSED,
               T.JYJE1                  = LV_JYJE1,
               T.JYJE2                  = LV_JYJE2
         WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;
        COMMIT;
      END IF;
    END LOOP;
  END;

    /**
  * TITLE      :�����Ǽǲ����ϱ��ҳ����׶�����Ϣ</P>
  * DESCRIPTION: �� [��������]+[��������]+[������ˮ��]+[�����ʺ�]+[������] ������Ʊ�ļ��͵Ǽǲ���
  *              �ҳ����׶�����Ϣ������
  *              IS_DISPOSED = '1'
  *              IS_DELETED = '0'
  *              DISPOSE_TYPE = '9'
  *              ��������Ϊ��
  *                          ���׵������
  *                          �����������
  *                          ��Ա��ˮ�����
  *                          IS_DISPOSED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-05-15
  */
  PROCEDURE P77_TRANS_TEMP_JOIN_REGISTER_5(DTINPUTDT IN VARCHAR2) AS
    LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');
    --�����α�
    CURSOR CURS_TRANS_TEMP_JOIN_REGISTER IS
      SELECT T1.TRANSACTIONKEY,
             T1.CPZXH,
             T2.OPP_COUNTRY,
             T2.OPP_AREA,
             T2.OPP_ORGAN_TYPE,
             T2.OPP_ORGANKEY,
             T2.OPP_ORGANNAME,
             T2.OPP_PARTY_ID,
             T2.OPP_NAME,
             T2.OPP_ACCT_NUM,
             T2.OPP_OFF_SHORE_IND,
             T2.OPP_ACCT_TYPE_CD,
             T2.OPP_CARD_TYPE,
             T2.OPP_CARD_NO,
             T2.OPP_PBC_PARTY_CLASS_CD,
             T2.OPP_PARTY_CLASS_CD,
             T2.TSCTKEY,
             T2.TX_GO_COUNTRY,
             T2.TX_GO_AREA,
             T2.TX_OCCUR_COUNTRY,
             T2.TX_OCCUR_AREA,
             T2.JYJE1,
             T2.JYJE2
        FROM T47_TRANS_TEMP T1, T47_TRANS_OPP_NATIVE T2
       WHERE T1.IS_DISPOSED = '0'
         AND T1.TX_DT = T2.TX_DT
         AND T1.JYDQDH = T2.DQDH
         AND T1.TX_NO = T2.TX_NO
         AND T1.ACCT_NUM = T2.ACCT_NUM
         AND T1.DEBIT_CREDIT = T2.DEBIT_CREDIT;

    --�����α��еĸ����ֶεı���
    LV_TRANSACTIONKEY         T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
    LV_CPZXH                  T47_TRANS_TEMP.CPZXH%TYPE;
    LV_OPP_COUNTRY            T47_TRANS_OPP_NATIVE.OPP_COUNTRY%TYPE;
    LV_OPP_AREA               T47_TRANS_OPP_NATIVE.OPP_AREA%TYPE;
    LV_OPP_ORGAN_TYPE         T47_TRANS_OPP_NATIVE.OPP_ORGAN_TYPE%TYPE;
    LV_OPP_ORGANKEY           T47_TRANS_OPP_NATIVE.OPP_ORGANKEY%TYPE;
    LV_OPP_ORGANNAME          T47_TRANS_OPP_NATIVE.OPP_ORGANNAME%TYPE;
    LV_OPP_PARTY_ID           T47_TRANS_OPP_NATIVE.OPP_PARTY_ID%TYPE;
    LV_OPP_NAME               T47_TRANS_OPP_NATIVE.OPP_NAME%TYPE;
    LV_OPP_ACCT_NUM           T47_TRANS_OPP_NATIVE.OPP_ACCT_NUM%TYPE;
    LV_OPP_OFF_SHORE_IND      T47_TRANS_OPP_NATIVE.OPP_OFF_SHORE_IND%TYPE;
    LV_OPP_ACCT_TYPE_CD       T47_TRANS_OPP_NATIVE.OPP_ACCT_TYPE_CD%TYPE;
    LV_OPP_CARD_TYPE          T47_TRANS_OPP_NATIVE.OPP_CARD_TYPE%TYPE;
    LV_OPP_CARD_NO            T47_TRANS_OPP_NATIVE.OPP_CARD_NO%TYPE;
    LV_OPP_PBC_PARTY_CLASS_CD T47_TRANS_OPP_NATIVE.OPP_PBC_PARTY_CLASS_CD%TYPE;
    LV_OPP_PARTY_CLASS_CD     T47_TRANS_OPP_NATIVE.OPP_PARTY_CLASS_CD%TYPE;
    LV_TSCTKEY                T47_TRANS_OPP_NATIVE.TSCTKEY%TYPE;
    LV_TX_GO_COUNTRY          T47_TRANS_OPP_NATIVE.TX_GO_COUNTRY%TYPE;
    LV_TX_GO_AREA             T47_TRANS_OPP_NATIVE.TX_GO_AREA%TYPE;
    LV_TX_OCCUR_COUNTRY       T47_TRANS_OPP_NATIVE.TX_OCCUR_COUNTRY%TYPE;
    LV_TX_OCCUR_AREA          T47_TRANS_OPP_NATIVE.TX_OCCUR_AREA%TYPE;
    LV_JYJE1                  T47_TRANS_OPP_NATIVE.JYJE1%TYPE;
    LV_JYJE2                  T47_TRANS_OPP_NATIVE.JYJE2%TYPE;
    LV_DISPOSE_TYPE           T47_TRANS_TEMP.DISPOSE_TYPE%TYPE;
    LV_IS_DISPOSED            T47_TRANS_TEMP.IS_DISPOSED%TYPE;

  BEGIN
    OPEN CURS_TRANS_TEMP_JOIN_REGISTER;
    LOOP
      FETCH CURS_TRANS_TEMP_JOIN_REGISTER
        INTO LV_TRANSACTIONKEY, LV_CPZXH, LV_OPP_COUNTRY, LV_OPP_AREA, LV_OPP_ORGAN_TYPE, LV_OPP_ORGANKEY, LV_OPP_ORGANNAME, LV_OPP_PARTY_ID, LV_OPP_NAME, LV_OPP_ACCT_NUM, LV_OPP_OFF_SHORE_IND, LV_OPP_ACCT_TYPE_CD, LV_OPP_CARD_TYPE, LV_OPP_CARD_NO, LV_OPP_PBC_PARTY_CLASS_CD, LV_OPP_PARTY_CLASS_CD, LV_TSCTKEY, LV_TX_GO_COUNTRY, LV_TX_GO_AREA, LV_TX_OCCUR_COUNTRY, LV_TX_OCCUR_AREA,LV_JYJE1,LV_JYJE2;
      EXIT WHEN CURS_TRANS_TEMP_JOIN_REGISTER%NOTFOUND;

      IF LV_TRANSACTIONKEY IS NOT NULL THEN
        LV_DISPOSE_TYPE := '9';
        LV_IS_DISPOSED  := '1';
        UPDATE T47_TRANS_TEMP T
           SET T.OPP_COUNTRY            = LV_OPP_COUNTRY,
               T.OPP_AREA               = LV_OPP_AREA,
               T.OPP_ORGAN_TYPE         = LV_OPP_ORGAN_TYPE,
               T.OPP_ORGANKEY           = LV_OPP_ORGANKEY,
               T.OPP_ORGANNAME          = LV_OPP_ORGANNAME,
               T.OPP_PARTY_ID           = LV_OPP_PARTY_ID,
               T.OPP_NAME               = LV_OPP_NAME,
               T.OPP_ACCT_NUM           = LV_OPP_ACCT_NUM,
               T.OPP_OFF_SHORE_IND      = LV_OPP_OFF_SHORE_IND,
               T.OPP_ACCT_TYPE_CD       = LV_OPP_ACCT_TYPE_CD,
               T.OPP_CARD_TYPE          = LV_OPP_CARD_TYPE,
               T.OPP_CARD_NO            = LV_OPP_CARD_NO,
               T.OPP_PBC_PARTY_CLASS_CD = LV_OPP_PBC_PARTY_CLASS_CD,
               T.OPP_PARTY_CLASS_CD     = LV_OPP_PARTY_CLASS_CD,
               T.TSCTKEY                = LV_TSCTKEY,
               T.TX_GO_COUNTRY          = LV_TX_GO_COUNTRY,
               T.TX_GO_AREA             = LV_TX_GO_AREA,
               T.TX_OCCUR_COUNTRY       = LV_TX_OCCUR_COUNTRY,
               T.TX_OCCUR_AREA          = LV_TX_OCCUR_AREA,
               T.RE_IND                 = '0',
               T.DISPOSE_TYPE           = LV_DISPOSE_TYPE,
               T.IS_DISPOSED            = LV_IS_DISPOSED,
               T.JYJE1                  = LV_JYJE1,
               T.JYJE2                  = LV_JYJE2
         WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;
        COMMIT;
      END IF;
    END LOOP;
  END;

  /**
  * TITLE      : �����Ƿ����пͻ��ֶ�</P>
  * DESCRIPTION: �жϽ��׶����Ƿ����пͻ�
  *              ��������Ϊ��
  *                          IS_DELETED = '0'
  * COPYRIGHT  : COPYRIGHT (C) 2008</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-02
  */
  PROCEDURE P78_TRANS_TEMP_ISPARTY(DTINPUTDT IN VARCHAR2) AS

  BEGIN
       UPDATE T47_TRANS_TEMP T
       SET T.OPP_ISPARTY = '1'
       WHERE EXISTS (SELECT 'X' FROM T47_AGREEMENT T1 WHERE T1.ACCT_NUM = T.OPP_ACCT_NUM ) AND
             T.IS_DELETED = '0' AND
             T.OPP_ACCT_NUM IS NOT NULL;

       COMMIT;

       UPDATE T47_TRANS_TEMP T
       SET T.OPP_ISPARTY = '0'
       WHERE T.IS_DELETED = '0' AND
             T.OPP_ISPARTY IS NULL;

       COMMIT;

  END;



  /*
  * TITLE      : ���½�����ˮ�м���жԹ�����ʣ���ֶ�
  * DESCRIPTION: ����ԭ����id����ԭҵ��ģ���,���½�����ˮ�м���жԹ�����ʣ�������ֶ�,���������Ϣ
  * PARAMETERS :
  *   IN: ��DTINPUTDT�� δ��
  *  OUT:
  * RETURN     : 0: �ɹ����£� -1�����¹��̳���
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��LIULB
  * VERSION    ��1.0
  * DATE       : 2007-09-3
  * MODIFY BY  :
  * MODIFY DATE:
  */
  PROCEDURE P79_T47_TRANS_UPD_PUBLIC(DTINPUTDT IN VARCHAR2) AS

  CURSOR CURS_T47_TRANS_MID IS
  SELECT  T.TRANSACTIONKEY,                --ҵ���ʶ
          T.ORGANKEY,                      --���׻���
          T.ACCT_NUM,                      --�˻�����
          T.PARTY_ID,                      --�ͻ�����
          T.PARTY_CLASS_CD,                --�ͻ�����
          T.TX_CD,                         --Aml���״���
          T.CB_TX_CD,                   --ԭ���״���
          T.BUS_TYPE_CD,                   --ҵ������
          T.DEBIT_CREDIT,                  --�����־
          T.CASH_TRANS_FLAG,               --��/ת��־
          T.CURRENCY_CD,                   --����
          T.CURR_CD,                       --����ұ�־
          T.REMIT_TYPE_CD,                 --����־
          T.OPP_ISPARTY,                   --�Է��Ƿ����пͻ�
          T.OPP_ACCT_NUM,                  --�Է��ʺ�
          T.OPP_ACCT_TYPE_CD,              --�Է��ʺ�����
          T.OPP_PARTY_ID,                  --�Է��ͻ���
          T.OPP_NAME,                      --�Է�����
          T.OPP_CARD_TYPE,                 --�Է�֤������
          T.OPP_CARD_NO,                   --�Է�֤������
          T.OPP_PARTY_CLASS_CD,            --�Է��ͻ�����
          T.OPP_PBC_PARTY_CLASS_CD,        --�Է����пͻ�����
          T.OPP_AREA,                      --�Է����ڵ���
          T.OPP_COUNTRY,                   --�Է����ڻ�������
          T.OPP_ORGAN_TYPE,                --�Է���������
          T.OPP_ORGANKEY,                  --�Է���������
          T.OPP_ORGANNAME,                 --�Է���������
          T.OPP_OFF_SHORE_IND,             --�Է��Ƿ��밶�˻�
          T.ORG_TRANS_RELA,                --���ڻ����ͽ��׹�ϵ
          T.TSCTKEY,                       --������֧���״���
          T.OVERAREA_IND,                  --�Ƿ�羳����
          T.SETTLE_TYPE_CD,                --���㷽ʽ
          T.TX_GO_COUNTRY,                 --����ȥ�����
          T.TX_GO_AREA,                    --����ȥ����������
          T.TX_OCCUR_COUNTRY,              --���׷����ع���
          T.TX_OCCUR_AREA,                 --���׷�������������
          T.AMT_CD,                        --������־
          T.RE_IND,                        --�Ƿ�¼
          T.CAL_IND,                       --�Ƿ����
          T.RULE_IND,                      --�Ƿ����
          T.CHANNEL,                       --��������
          T.CANCEL_IND,                    --Ĩ�˱�־
          T.AGENT_NAME,                    --����������
          T.AGENT_CARD_TYPE,               --���������֤��/֤���ļ�����
          T.AGENT_CARD_NO,                 --���������֤��/֤���ļ�����
          T.AGENT_COUNTRY,                  --�����˹���
          T.ZYDH, --ժҪ����
          T.TX_NO
      FROM T47_TRANS_TEMP T
      WHERE T.IS_DELETED ='0';

     -- ������������LV_���ӽ��ױ�ȡ����ȷ���ֶΣ�V_����Ҫ�޸ĵ��ֶ�
     --���䲿�ֱ���
     LV_TRANSACTIONKEY                           T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
     LV_ORGANKEY                                 T47_TRANS_TEMP.ORGANKEY%TYPE;
     LV_ACCT_NUM                                 T47_TRANS_TEMP.ACCT_NUM%TYPE;
     LV_PARTY_ID                                 T47_TRANS_TEMP.PARTY_ID%TYPE;
     LV_PARTY_CLASS_CD                           T47_TRANS_TEMP.PARTY_CLASS_CD%TYPE;
     LV_DEBIT_CREDIT                             T47_TRANS_TEMP.DEBIT_CREDIT%TYPE;
     LV_CASH_TRANS_FLAG                          T47_TRANS_TEMP.CASH_TRANS_FLAG%TYPE;
     LV_CURRENCY_CD                              T47_TRANS_TEMP.CURRENCY_CD%TYPE;
     LV_CURR_CD                                  T47_TRANS_TEMP.CURR_CD%TYPE;
     LV_OPP_ISPARTY                              T47_TRANS_TEMP.OPP_ISPARTY%TYPE;
     LV_CHANNEL                                  T47_TRANS_TEMP.CHANNEL%TYPE;
     LV_CANCEL_IND                               T47_TRANS_TEMP.CANCEL_IND%TYPE;
     LV_OPP_ACCT_NUM                             T47_TRANS_TEMP.OPP_ACCT_NUM%TYPE;
     LV_CB_TX_CD                                 T47_TRANS_TEMP.CB_TX_CD%TYPE;

     --�䶯���ֱ���
     V_TX_CD                                     T47_TRANS_TEMP.TX_CD%TYPE;
     V_BUS_TYPE_CD                               T47_TRANS_TEMP.BUS_TYPE_CD%TYPE;
     V_REMIT_TYPE_CD                             T47_TRANS_TEMP.REMIT_TYPE_CD%TYPE;
     V_OPP_ACCT_TYPE_CD                          T47_TRANS_TEMP.OPP_ACCT_TYPE_CD%TYPE;
     V_OPP_PARTY_ID                              T47_TRANS_TEMP.OPP_PARTY_ID%TYPE;
     V_OPP_NAME                                  T47_TRANS_TEMP.OPP_NAME%TYPE;
     V_OPP_CARD_TYPE                             T47_TRANS_TEMP.OPP_CARD_TYPE%TYPE;
     V_OPP_CARD_NO                               T47_TRANS_TEMP.OPP_CARD_NO%TYPE;
     V_OPP_PARTY_CLASS_CD                        T47_TRANS_TEMP.OPP_PARTY_CLASS_CD%TYPE;
     V_OPP_PBC_PARTY_CLASS_CD                    T47_TRANS_TEMP.OPP_PBC_PARTY_CLASS_CD%TYPE;
     V_OPP_AREA                                  T47_TRANS_TEMP.OPP_AREA%TYPE;
     V_OPP_COUNTRY                               T47_TRANS_TEMP.OPP_COUNTRY%TYPE;
     V_OPP_ORGAN_TYPE                            T47_TRANS_TEMP.OPP_ORGAN_TYPE%TYPE;
     V_OPP_ORGANKEY                              T47_TRANS_TEMP.OPP_ORGANKEY%TYPE;
     V_OPP_ORGANNAME                             T47_TRANS_TEMP.OPP_ORGANNAME%TYPE;
     V_OPP_OFF_SHORE_IND                         T47_TRANS_TEMP.OPP_OFF_SHORE_IND%TYPE;
     V_ORG_TRANS_RELA                            T47_TRANS_TEMP.ORG_TRANS_RELA%TYPE;
     V_TSCTKEY                                   T47_TRANS_TEMP.TSCTKEY%TYPE;
     V_OVERAREA_IND                              T47_TRANS_TEMP.OVERAREA_IND%TYPE;
     V_SETTLE_TYPE_CD                            T47_TRANS_TEMP.SETTLE_TYPE_CD%TYPE;
     V_TX_GO_COUNTRY                             T47_TRANS_TEMP.TX_GO_COUNTRY%TYPE;
     V_TX_GO_AREA                                T47_TRANS_TEMP.TX_GO_AREA%TYPE;
     V_TX_OCCUR_COUNTRY                          T47_TRANS_TEMP.TX_OCCUR_COUNTRY%TYPE;
     V_TX_OCCUR_AREA                             T47_TRANS_TEMP.TX_OCCUR_AREA%TYPE;
     V_AMT_CD                                    T47_TRANS_TEMP.AMT_CD%TYPE;
     V_RE_IND                                    T47_TRANS_TEMP.RE_IND%TYPE;
     V_CAL_IND                                   T47_TRANS_TEMP.CAL_IND%TYPE;
     V_RULE_IND                                  T47_TRANS_TEMP.RULE_IND%TYPE;
     V_AGENT_NAME                                T47_TRANS_TEMP.AGENT_NAME%TYPE;
     V_AGENT_CARD_TYPE                           T47_TRANS_TEMP.AGENT_CARD_TYPE%TYPE;
     V_AGENT_CARD_NO                             T47_TRANS_TEMP.AGENT_CARD_NO%TYPE;
     V_AGENT_COUNTRY                             T47_TRANS_TEMP.AGENT_COUNTRY%TYPE;
     V_ADDTIONAL                                 T47_TRANS_TEMP.ADDTIONAL%TYPE;
     V_ZYDH                                      T47_TRANS_TEMP.ZYDH%TYPE;
     V_TX_NO                                     T47_TRANS_TEMP.TX_NO%TYPE;
     V_RULE_TYPE                                 T07_WHITELIST_INFO.RULE_TYPE%TYPE;

     LV_INPUTDT DATE := F03_STRINGTODATE(DTINPUTDT, 'YYYY-MM-DD');



  BEGIN
    OPEN CURS_T47_TRANS_MID;
    LOOP
        FETCH CURS_T47_TRANS_MID
        INTO  LV_TRANSACTIONKEY,             --ҵ���ʶ
              LV_ORGANKEY,                   --���׻���
              LV_ACCT_NUM,                   --�˻�����
              LV_PARTY_ID,                   --�ͻ�����
              LV_PARTY_CLASS_CD,             --�ͻ�����
              V_TX_CD,                       --Aml���״���
              LV_CB_TX_CD,                   --ԭ���״���
              V_BUS_TYPE_CD,                 --ҵ������
              LV_DEBIT_CREDIT,               --�����־
              LV_CASH_TRANS_FLAG,            --��/ת��־
              LV_CURRENCY_CD,                --����
              LV_CURR_CD,                    --����ұ�־
              V_REMIT_TYPE_CD,               --����־
              LV_OPP_ISPARTY,                --�Է��Ƿ����пͻ�
              LV_OPP_ACCT_NUM,                --�Է��ʺ�
              V_OPP_ACCT_TYPE_CD,            --�Է��ʺ�����
              V_OPP_PARTY_ID,                --�Է��ͻ���
              V_OPP_NAME,                    --�Է�����
              V_OPP_CARD_TYPE,               --�Է�֤������
              V_OPP_CARD_NO,                 --�Է�֤������
              V_OPP_PARTY_CLASS_CD,          --�Է��ͻ�����
              V_OPP_PBC_PARTY_CLASS_CD,      --�Է����пͻ�����
              V_OPP_AREA,                    --�Է����ڵ���
              V_OPP_COUNTRY,                 --�Է����ڻ�������
              V_OPP_ORGAN_TYPE,              --�Է���������
              V_OPP_ORGANKEY,                --�Է���������
              V_OPP_ORGANNAME,               --�Է���������
              V_OPP_OFF_SHORE_IND,           --�Է��Ƿ��밶�˻�
              V_ORG_TRANS_RELA,              --���ڻ����ͽ��׹�ϵ
              V_TSCTKEY,                     --������֧���״���
              V_OVERAREA_IND,                --�Ƿ�羳����
              V_SETTLE_TYPE_CD,              --���㷽ʽ
              V_TX_GO_COUNTRY,               --����ȥ�����
              V_TX_GO_AREA,                  --����ȥ����������
              V_TX_OCCUR_COUNTRY,            --���׷����ع���
              V_TX_OCCUR_AREA,               --���׷�������������
              V_AMT_CD,                      --������־
              V_RE_IND,                      --�Ƿ�¼
              V_CAL_IND,                     --�Ƿ����
              V_RULE_IND,                    --�Ƿ����
              LV_CHANNEL,                    --��������
              LV_CANCEL_IND,                 --Ĩ�˱�־
              V_AGENT_NAME,                  --����������
              V_AGENT_CARD_TYPE,             --���������֤��/֤���ļ�����
              V_AGENT_CARD_NO,               --���������֤��/֤���ļ�����
              V_AGENT_COUNTRY,               --�����˹���
              V_ZYDH,                        --ժҪ����
              V_TX_NO;
        EXIT WHEN CURS_T47_TRANS_MID%NOTFOUND;

        IF LV_TRANSACTIONKEY IS NOT NULL THEN
        BEGIN
        --������Ϣ����ת����Ľ��ײ���Ҫ������Ϣ
        IF LV_CASH_TRANS_FLAG = '2' THEN
            --���������пͻ��Ľ���
            IF LV_OPP_ISPARTY = '1' THEN
            BEGIN
                  --��Э���ȡ�����ֿͻ����š������˻����͡�������
                  BEGIN
                       SELECT CUSTOMER_ID, --�ͻ�����
                              AML_ACCT_TYPE_CD, --�����˻�����
                              OP_ORG_NUM
                       INTO V_OPP_PARTY_ID,
                            V_OPP_ACCT_TYPE_CD,
                            V_OPP_ORGANKEY
                       FROM T47_AGREEMENT
                       WHERE ACCT_NUM = LV_OPP_ACCT_NUM;
                       EXCEPTION
                       WHEN NO_DATA_FOUND THEN
                       BEGIN
                            V_OPP_PARTY_ID     := NULL;
                            V_OPP_ACCT_TYPE_CD := NULL;
                            V_OPP_ORGANKEY     := NULL;
                       END;
                  END;

                  --��ͻ�����ֵĿͻ������Ϣ
                  BEGIN
                       SELECT PARTY_CLASS_CD, --�ͻ����� ��C�Թ��ͻ� I��˽�ͻ�
                              AML2_TYPE_CD, --���пͻ����� 01:����;02:��Ȼ�ˣ�03:���幤�̻���04:������֯
                              PARTY_CHN_NAME, --�ͻ�����
                              CARD_TYPE, --֤������
                              CARD_NO --֤������
                       INTO V_OPP_PARTY_CLASS_CD,
                            V_OPP_PBC_PARTY_CLASS_CD,
                            V_OPP_NAME,
                            V_OPP_CARD_TYPE,
                            V_OPP_CARD_NO
                       FROM T47_PARTY
                       WHERE PARTY_ID = V_OPP_PARTY_ID;
                       EXCEPTION
                       WHEN NO_DATA_FOUND THEN
                       BEGIN
                            V_OPP_PARTY_CLASS_CD     := NULL;
                            V_OPP_PBC_PARTY_CLASS_CD := NULL;
                            V_OPP_NAME               := NULL;
                            V_OPP_CARD_TYPE          := NULL;
                            V_OPP_CARD_NO            := NULL;
                       END;
                  END;

                  --����Է�������Ϣ
                  IF V_OPP_ORGANKEY IS NOT NULL THEN
                  BEGIN
                       V_OPP_ORGAN_TYPE := '13';
                       SELECT O.ORGANNAME
                       INTO V_OPP_ORGANNAME
                       FROM T00_ORGAN O
                       WHERE O.ORGANKEY = V_OPP_ORGANKEY;
                       EXCEPTION
                       WHEN NO_DATA_FOUND THEN
                            V_OPP_ORGANNAME := NULL;
                  END;
                  ELSE
                       V_OPP_ORGAN_TYPE := NULL;
                       V_OPP_ORGANNAME  := NULL;
                  END IF;

                  --����������ڵ������������ ����ȥ����Ϣ
                  --һ�����������Ϊ��ͬ���� ���ֹ���ͽ���ȥ�����һ��
                  BEGIN
                       SELECT UO.ORG_AREA
                       INTO V_OPP_AREA
                       FROM T87_UNION_ORGAN UO
                       WHERE UO.ORGANKEY = V_OPP_ORGANKEY;
                       EXCEPTION
                       WHEN NO_DATA_FOUND THEN
                            V_OPP_AREA := NULL;
                  END;
                  IF V_OPP_AREA IS NOT NULL THEN
                  BEGIN
                       V_OPP_COUNTRY := 'CHN';
                       V_TX_GO_AREA := V_OPP_AREA;
                       V_TX_GO_COUNTRY := 'CHN';
                  END;
                  ELSE
                  BEGIN
                       V_OPP_COUNTRY := NULL;
                       V_TX_GO_AREA := NULL;
                       V_TX_GO_COUNTRY := NULL;
                  END;
                  END IF;   --IF V_OPP_AREA IS NOT NULL
            END;
            --���ַ����пͻ�����
            ELSE
            BEGIN
                 IF V_OPP_ORGANKEY IS NOT NULL THEN
                 BEGIN
                      SELECT U.CITY_CD,
                             U.UNION_TYPE,
                             U.UNION_NAME
                      INTO V_OPP_AREA,
                           V_OPP_ORGAN_TYPE,
                           V_OPP_ORGANNAME
                      FROM T87_UNION U
                      WHERE U.UNIONORGKEY = V_OPP_ORGANKEY;
                      V_OPP_COUNTRY := CASE WHEN V_OPP_AREA IS NULL THEN NULL
                                            ELSE 'CHN' END;
                      V_TX_GO_AREA := V_OPP_AREA;
                      V_TX_GO_COUNTRY := V_OPP_COUNTRY;
                      EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                      BEGIN
                           V_OPP_AREA := V_OPP_AREA;
                           V_OPP_ORGAN_TYPE := V_OPP_ORGAN_TYPE;
                           IF V_OPP_AREA IS NOT NULL THEN
                             BEGIN
                               SELECT O.ORGANNAME
                                 INTO V_OPP_ORGANNAME
                                 FROM T00_ORGAN O
                                WHERE O.ORGANKEY = V_OPP_ORGANKEY;
                             EXCEPTION
                               WHEN NO_DATA_FOUND THEN
                                 V_OPP_ORGANNAME := V_OPP_ORGANNAME;
                             END;
                           END IF;
                           V_OPP_COUNTRY := CASE WHEN V_OPP_AREA IS NULL THEN NULL
                                            ELSE 'CHN' END;
                           V_TX_GO_AREA := V_OPP_AREA;
                           V_TX_GO_COUNTRY := V_OPP_COUNTRY;
                      END;
                 END;
                 END IF;  --IF V_OPP_ORGANKEY IS NOT NULL
            END;
            END IF;  --IF LV_OPP_ISPARTY = '1'
        --�ֽ��ཻ�ײ���Ҫ������Ϣ
        ELSE
        BEGIN
             LV_OPP_ACCT_NUM := NULL;
             V_OPP_ACCT_TYPE_CD := NULL;
             V_OPP_NAME := NULL;
             V_OPP_PARTY_ID := NULL;
             V_OPP_PBC_PARTY_CLASS_CD := NULL;
             V_OPP_CARD_NO := NULL;
             V_OPP_CARD_TYPE := NULL;
             V_TX_GO_AREA := NULL;
             V_TX_GO_COUNTRY := NULL;
             V_OPP_OFF_SHORE_IND := NULL;
             LV_OPP_ISPARTY := NULL;
             V_OPP_ORGANKEY := NULL;
             V_OPP_ORGAN_TYPE := NULL;
             V_OPP_ORGANNAME := NULL;
             V_OPP_COUNTRY := NULL;
             V_OPP_AREA := NULL;
        END;
        END IF; --IF LV_CASH_TRANS_FLAG = '2'


        -- AMT_CD  ������־ ��� CANCEL_IND=2 -> 1:����  ���� -> 0:����
        IF LV_CANCEL_IND = '2' THEN
           V_AMT_CD := '1';
        ELSE
           V_AMT_CD := '0';
        END IF;

        --������㷽ʽ
        V_SETTLE_TYPE_CD := CASE WHEN LV_CURR_CD ='1' THEN
                                      CASE WHEN  LV_CASH_TRANS_FLAG='1' THEN '30'
                                      ELSE '51' END
                                 WHEN LV_CURR_CD ='2' THEN
                                      CASE WHEN  LV_CASH_TRANS_FLAG='1' THEN '0001'
                                      ELSE
                                           CASE WHEN F01_ETL_CODE_MAP('1009',LV_CB_TX_CD) IS NULL THEN '0107'
                                           ELSE F01_ETL_CODE_MAP('1009',LV_CB_TX_CD) END
                                      END
                            END;

      --�����׷�����
      BEGIN
           SELECT UO.ORG_AREA
           INTO V_TX_OCCUR_AREA
           FROM T87_UNION_ORGAN UO
           WHERE UO.ORGANKEY = LV_ORGANKEY;
           V_TX_OCCUR_COUNTRY := CASE WHEN V_TX_GO_AREA IS NULL THEN NULL
                                      ELSE 'CHN' END;
           EXCEPTION
           WHEN NO_DATA_FOUND THEN
                V_TX_OCCUR_AREA := NULL;
      END;

      -- ORG_TRANS_RELA  ���ڻ����ͽ��׹�ϵ  Ĭ�� 00
      IF LV_ACCT_NUM IS NULL AND LV_PARTY_ID IS NULL THEN  --
         V_ORG_TRANS_RELA := '02'; --02���ͻ���ͨ���˻��������п������Ĵ��ף�"���ڻ���"Ϊ����ҵ��Ļ���
      ELSE
         V_ORG_TRANS_RELA := '00';--00���ͻ�ͨ���ھ��ڽ��ڻ����������˻��������п��������Ĵ��ף�"���ڻ���"Ϊ�����˻��Ļ����򷢿�����
      END IF;

      --����֤��������֤�����͵Ĺ�����ϵ
      V_OPP_CARD_TYPE := CASE WHEN V_OPP_CARD_NO IS NULL THEN NULL
                              ELSE V_OPP_CARD_TYPE END;

      --�����׷����ع�����ϵ
      V_TX_OCCUR_AREA := CASE WHEN V_TX_OCCUR_AREA = '000000' AND V_TX_OCCUR_COUNTRY = 'CHN' THEN NULL
                              WHEN LENGTH(V_TX_OCCUR_AREA) <> 6 THEN NULL
                              ELSE V_TX_OCCUR_AREA END;
      V_TX_OCCUR_COUNTRY := CASE WHEN V_TX_OCCUR_AREA IS NULL THEN NULL
                                 ELSE CASE WHEN V_TX_OCCUR_COUNTRY IS NULL THEN 'CHN'
                                      ELSE V_TX_OCCUR_COUNTRY END
                            END;

      --������ֹ��ҵ���������ϵ
      V_OPP_AREA := CASE WHEN V_OPP_AREA = '000000' AND V_OPP_COUNTRY = 'CHN' THEN NULL
                              WHEN LENGTH(V_OPP_AREA) <> 6 THEN NULL
                              ELSE V_OPP_AREA END;
      V_OPP_COUNTRY := CASE WHEN V_OPP_AREA IS NULL THEN NULL
                                 ELSE CASE WHEN V_OPP_COUNTRY IS NULL THEN 'CHN'
                                      ELSE V_OPP_COUNTRY END
                            END;

      --������ȥ����ҵ���������ϵ
      V_TX_GO_AREA := CASE WHEN V_TX_GO_AREA = '000000' AND V_TX_GO_COUNTRY = 'CHN' THEN NULL
                              WHEN LENGTH(V_TX_GO_AREA) <> 6 THEN NULL
                              ELSE V_TX_GO_AREA END;
      V_TX_GO_COUNTRY := CASE WHEN V_TX_GO_AREA IS NULL THEN NULL
                                 ELSE CASE WHEN V_TX_GO_COUNTRY IS NULL THEN 'CHN'
                                      ELSE V_TX_GO_COUNTRY END
                            END;

      IF (V_TX_OCCUR_AREA IS NULL AND LV_CASH_TRANS_FLAG = '1') THEN
      BEGIN
           V_TX_OCCUR_AREA := '511801';
           V_TX_OCCUR_COUNTRY := 'CHN';
      END;
      END IF;

      --���������׻����Ҳ���ԭ���׵ķ�¼�����ˣ������㣬�ǹ���
      -- CAL_IND  �Ƿ���� 0:��1:��
      -- RULE_IND  �Ƿ���� 0:��1:��
      IF LV_CANCEL_IND <> '0' THEN
      BEGIN
         V_CAL_IND := '0';
         V_RULE_IND := '0';
      END;
      ELSE
      BEGIN
        V_CAL_IND := '1';
        V_RULE_IND := '3';
      END;
      END IF;

      --�������н��״���
      IF V_TX_CD IS NULL THEN

      SELECT nvl(F01_ETL_CODE_MAP('1012', V_ZYDH),'9999') INTO V_TX_CD FROM DUAL;

      ELSE V_TX_CD := V_TX_CD;
      END IF;

      --����ҵ������
      IF V_BUS_TYPE_CD IS NULL THEN V_BUS_TYPE_CD := '000000';
      ELSE V_BUS_TYPE_CD := V_BUS_TYPE_CD;
      END IF;

      --�������־
      IF LV_CASH_TRANS_FLAG = '1' THEN V_REMIT_TYPE_CD := '1';
      ELSE V_REMIT_TYPE_CD := '9';
      END IF;

      --�����Ƿ�羳����
      V_OVERAREA_IND := CASE  WHEN V_OVERAREA_IND IS NOT NULL THEN V_OVERAREA_IND
                              ELSE CASE WHEN V_OPP_COUNTRY IS NOT NULL AND V_OPP_COUNTRY <> 'CHN' THEN '1'
                                        ELSE '0' END
                        END;

      --�����Ƿ��밶�˻�
      V_OPP_OFF_SHORE_IND := CASE WHEN V_OPP_OFF_SHORE_IND IS NOT NULL THEN V_OPP_OFF_SHORE_IND
                                  ELSE CASE WHEN LV_CURRENCY_CD <> 'CNY' AND V_OPP_COUNTRY <> 'CHN' THEN '1'
                                            ELSE '0' END
                             END;

      --����������֧���״���
      V_TSCTKEY := CASE WHEN V_TSCTKEY IS NOT NULL AND LENGTH(V_TSCTKEY) = 6 THEN V_TSCTKEY
                        ELSE '000000' END;

      --���������
      --�����˻�������Ϊ�����㣬����¼
      BEGIN

        SELECT RULE_TYPE
          INTO V_RULE_TYPE
          FROM T07_WHITELIST_INFO A
         WHERE A.ISUSE = '0'
           AND A.ISCHECK = '1'
           AND A.PARTY_ID = LV_PARTY_ID;

      EXCEPTION
        WHEN OTHERS THEN
          V_RULE_TYPE := NULL;
      END;

      --�жϽ��׶���Ϊ���пͻ������ڰ�������
      IF V_RULE_TYPE IS NULL THEN
        SELECT RULE_TYPE
          INTO V_RULE_TYPE
          FROM T07_WHITELIST_INFO A
         WHERE A.ISUSE = '0'
           AND A.ISCHECK = '1'
           AND A.PARTY_ID = V_OPP_PARTY_ID;
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          V_RULE_TYPE := NULL;

      IF F19_IS_FILTER_ACCT_NUM(LV_ACCT_NUM,'07') OR V_RULE_TYPE ='3' THEN
           V_RE_IND := '0';
           V_CAL_IND := '0';
           V_RULE_IND := '0';
           V_ADDTIONAL := NULL;
      ELSIF V_RULE_TYPE ='2' THEN
         V_RULE_IND := '1';
      ELSIF V_RULE_TYPE ='1' THEN
         V_RULE_IND := '2';
      END IF;
      --�����������Ϣ
      BEGIN
        SELECT DLRXM, CASE WHEN F01_ETL_CODE_MAP('1023',ZJZL) IS NULL THEN '22' ELSE F01_ETL_CODE_MAP('1023',ZJZL) END AS CARD_TYPE, ZJHM, CASE WHEN F01_ETL_CODE_MAP('1024',V_AGENT_CARD_TYPE) IS NULL THEN 'CHN' ELSE F01_ETL_CODE_MAP('1024',V_AGENT_CARD_TYPE) END
          INTO V_AGENT_NAME,
               V_AGENT_CARD_TYPE,
               V_AGENT_CARD_NO,
               V_AGENT_COUNTRY
          FROM ODS.ODS_DLRXXB
         WHERE JYRQ = LV_INPUTDT
           AND GYLSH = V_TX_NO
           AND ZHDH = LV_ACCT_NUM;

        IF V_AGENT_CARD_NO IS NOT NULL AND V_TX_CD='0001' AND LV_PARTY_CLASS_CD ='C' THEN
           UPDATE T47_CP_DEPOSIT SET
             AGENT_NAME = V_AGENT_NAME,
             AGENT_CARD_TYPE = V_AGENT_CARD_TYPE,
             AGENT_CARD_NO = V_AGENT_CARD_NO,
             AGENT_COUNTRY = V_AGENT_COUNTRY
           WHERE ACCT_NUM = LV_ACCT_NUM;
        END IF;

        IF V_AGENT_CARD_NO IS NOT NULL AND V_TX_CD='0001' AND LV_PARTY_CLASS_CD ='I' THEN
           UPDATE T47_ID_DEPOSIT SET AGENT_NAME = V_AGENT_NAME WHERE ACCT_NUM = LV_ACCT_NUM;
        END IF;

      EXCEPTION
        WHEN OTHERS THEN
          V_AGENT_NAME      := NULL;
          V_AGENT_CARD_TYPE := NULL;
          V_AGENT_CARD_NO   := NULL;
          V_AGENT_COUNTRY   := NULL;
      END;

      UPDATE T47_TRANS_TEMP SET
             TX_CD                         = V_TX_CD,
             BUS_TYPE_CD                   = V_BUS_TYPE_CD,
             REMIT_TYPE_CD                 = V_REMIT_TYPE_CD,
             OPP_ACCT_TYPE_CD              = V_OPP_ACCT_TYPE_CD,
             OPP_PARTY_ID                  = V_OPP_PARTY_ID,
             OPP_NAME                      = V_OPP_NAME,
             OPP_CARD_TYPE                 = V_OPP_CARD_TYPE,
             OPP_CARD_NO                   = V_OPP_CARD_NO,
             OPP_PARTY_CLASS_CD            = V_OPP_PARTY_CLASS_CD,
             OPP_PBC_PARTY_CLASS_CD        = V_OPP_PBC_PARTY_CLASS_CD,
             OPP_AREA                      = V_OPP_AREA,
             OPP_COUNTRY                   = V_OPP_COUNTRY,
             OPP_ORGAN_TYPE                = V_OPP_ORGAN_TYPE,
             OPP_ORGANKEY                  = V_OPP_ORGANKEY,
             OPP_ORGANNAME                 = V_OPP_ORGANNAME,
             OPP_OFF_SHORE_IND             = V_OPP_OFF_SHORE_IND,
             ORG_TRANS_RELA                = V_ORG_TRANS_RELA,
             TSCTKEY                       = V_TSCTKEY,
             OVERAREA_IND                  = V_OVERAREA_IND,
             SETTLE_TYPE_CD                = V_SETTLE_TYPE_CD,
             TX_GO_COUNTRY                 = V_TX_GO_COUNTRY,
             TX_GO_AREA                    = V_TX_GO_AREA,
             TX_OCCUR_COUNTRY              = V_TX_OCCUR_COUNTRY,
             TX_OCCUR_AREA                 = V_TX_OCCUR_AREA,
             AMT_CD                        = V_AMT_CD,
             CAL_IND                       = V_CAL_IND,
             RULE_IND                      = V_RULE_IND,
             AGENT_NAME                    = V_AGENT_NAME,
             AGENT_CARD_TYPE               = V_AGENT_CARD_TYPE,
             AGENT_CARD_NO                 = V_AGENT_CARD_NO,
             AGENT_COUNTRY                 = V_AGENT_COUNTRY
      WHERE TRANSACTIONKEY=LV_TRANSACTIONKEY;

      COMMIT;
    END;
    END IF; -- IF LV_TRANSACTIONKE IS NOT NULL THEN

    END LOOP;
    CLOSE CURS_T47_TRANS_MID;

  END;

  /**
  * TITLE      : ����Է��ͻ����������пͻ�����</P>
  * DESCRIPTION: ���ݶԷ����ƴ���Է��ͻ����� OPP_PARTY_CLASS_CD
  *                              ��˽ I
  *                              �Թ� C
  *
  *               �Է����пͻ����� OPP_PBC_PARTY_CLASS_CD
  *                            --'1' ����
  *                            --'2' ��Ȼ��
  *                            --'3' ���幤�̻�
  *                            --'4' ������֯
  **
  * �Է������пͻ���opp_isparty = 1��
  *      ���ݿͻ������ڿͻ���Ϣ��T47_Party���в���ͻ����ͣ�C-�Թ������ˣ�I-��˽�����ˣ�
  * �Է��������пͻ���opp_isparty = 0��
  *      ���������ʻ��Թ�/��˽�����ж�
  *              ��������С�ڵ���5���Ҳ����������ַ���֧��,����,ũ��,����,����,�ַ�,����,����,���,����,
  *              ����,����,����,����,��˾,����,��ͨ,�ƶ�,��ͨ,����,������,����,ҽԺ,��ҵ,��λ,�糧,ˮ��,��ѧ������=��˽��
  *              ����Թ�
  *
  *      ���������ʻ��Թ�/��˽�����ж�
  *              ���������ַ��ģ�LIMITED��LTD��INTERNATIONAL��INC��CORP��CO.��COMPANY����˾������=�Թ�
  *              ����Թ�
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-06-04
  */
  PROCEDURE P80_TRANS_TEMP_OPP_PARTY_CLASS(DTINPUTDT IN VARCHAR2) AS

  CURSOR CURS_PARTY_CLASS IS
         SELECT T.TRANSACTIONKEY,
                 T.PARTY_CLASS_CD,
                 T.OPP_NAME
          FROM T47_TRANS_TEMP T
          WHERE T.IS_DELETED = '0' AND
                T.OPP_PARTY_CLASS_CD IS NULL ;

  LV_TRANSACTIONKEY  T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
  LV_PARTY_CLASS_CD  T47_TRANS_TEMP.PARTY_CLASS_CD%TYPE;
  LV_OPP_NAME        T47_TRANS_TEMP.OPP_NAME%TYPE;
  V_OPP_PARTY_CLASS_CD        T47_TRANS_TEMP.OPP_PARTY_CLASS_CD%TYPE;
  V_OPP_PBC_PARTY_CLASS_CD    T47_TRANS_TEMP.OPP_PBC_PARTY_CLASS_CD%TYPE;

  BEGIN
       OPEN CURS_PARTY_CLASS;
       LOOP
           FETCH CURS_PARTY_CLASS
           INTO  LV_TRANSACTIONKEY,
                 LV_PARTY_CLASS_CD,
                 LV_OPP_NAME;
           EXIT WHEN CURS_PARTY_CLASS%NOTFOUND;

           IF LV_OPP_NAME IS NULL THEN
           BEGIN
                V_OPP_PARTY_CLASS_CD := LV_PARTY_CLASS_CD;
                V_OPP_PBC_PARTY_CLASS_CD := NULL;
           END;
           ELSE
           BEGIN
                --�����������Ϊ����
                IF ASCII(SUBSTR(LV_OPP_NAME, 1, 1)) >= 128 THEN
                   IF F15_CONTAIN_CHAR(LV_OPP_NAME,'1') AND ( LENGTH(LV_OPP_NAME) > 4 ) THEN
                   BEGIN
                        LV_PARTY_CLASS_CD := 'C';
                        V_OPP_PBC_PARTY_CLASS_CD := '01';
                   END;
                   ELSE
                   BEGIN
                        LV_PARTY_CLASS_CD := 'I';
                        V_OPP_PBC_PARTY_CLASS_CD := '02';
                   END;
                   END IF;
                --�����������ΪӢ��
                ELSE
                   IF F15_CONTAIN_CHAR(LV_OPP_NAME,'2') AND ( LENGTH(LV_OPP_NAME) > 4 ) THEN
                   BEGIN
                        LV_PARTY_CLASS_CD := 'C';
                        V_OPP_PBC_PARTY_CLASS_CD := '01';
                   END;
                   ELSE
                   BEGIN
                        LV_PARTY_CLASS_CD := 'I';
                        V_OPP_PBC_PARTY_CLASS_CD := '02';
                   END;
                   END IF;
                END IF;
           END;

           END IF;

           UPDATE T47_TRANS_TEMP T SET T.OPP_PARTY_CLASS_CD = LV_PARTY_CLASS_CD,
                                       T.OPP_PBC_PARTY_CLASS_CD = V_OPP_PBC_PARTY_CLASS_CD
           WHERE T.TRANSACTIONKEY = LV_TRANSACTIONKEY;

           COMMIT;

      END LOOP;

      CLOSE CURS_PARTY_CLASS;

  END;

  /*
  * TITLE      : �����Ƿ�¼�ֶ� RE_IND
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST</P>
  * AUTHOR     ��FCQ
  * VERSION    ��1.0
  * DATE       : 2008-07-02
  */
  PROCEDURE P81_T47_TRANS_TEMP_RE_IND(DTINPUTDT IN VARCHAR2) AS

  CURSOR CURS_T47_TRANS_MID IS
  SELECT  T.TRANSACTIONKEY,                --ҵ���ʶ
          T.CB_TX_CD,                   --ԭ���״���
          T.CASH_TRANS_FLAG,               --��/ת��־
          T.OPP_ACCT_NUM,                  --�Է��ʺ�
          T.OPP_PARTY_ID,                  --�Է��ͻ���
          T.OPP_CARD_TYPE,                 --�Է�֤������
          T.OPP_CARD_NO,                   --�Է�֤������
          T.OPP_PARTY_CLASS_CD,            --�Է��ͻ�����
          T.TX_OCCUR_AREA,                 --���׷�������������
          T.RE_IND,                        --�Ƿ�¼
          T.CAL_IND,                       --�Ƿ����
          T.RULE_IND                      --�Ƿ����
      FROM T47_TRANS_TEMP T
      WHERE T.IS_DELETED ='0';

     -- ������������LV_���ӽ��ױ�ȡ����ȷ���ֶΣ�V_����Ҫ�޸ĵ��ֶ�
     --���䲿�ֱ���
     LV_TRANSACTIONKEY                           T47_TRANS_TEMP.TRANSACTIONKEY%TYPE;
     LV_CASH_TRANS_FLAG                          T47_TRANS_TEMP.CASH_TRANS_FLAG%TYPE;
     LV_CB_TX_CD                                 T47_TRANS_TEMP.CB_TX_CD%TYPE;
     LV_OPP_ACCT_NUM                             T47_TRANS_TEMP.OPP_ACCT_NUM%TYPE;
     LV_OPP_PARTY_ID                              T47_TRANS_TEMP.OPP_PARTY_ID%TYPE;
     LV_OPP_CARD_TYPE                             T47_TRANS_TEMP.OPP_CARD_TYPE%TYPE;
     LV_OPP_CARD_NO                               T47_TRANS_TEMP.OPP_CARD_NO%TYPE;
     LV_OPP_PARTY_CLASS_CD                        T47_TRANS_TEMP.OPP_PARTY_CLASS_CD%TYPE;
     LV_TX_OCCUR_AREA                             T47_TRANS_TEMP.TX_OCCUR_AREA%TYPE;
     LV_CAL_IND                                   T47_TRANS_TEMP.CAL_IND%TYPE;
     LV_RULE_IND                                  T47_TRANS_TEMP.RULE_IND%TYPE;

     --�䶯���ֱ���
     V_RE_IND                                    T47_TRANS_TEMP.RE_IND%TYPE;
     V_ADDTIONAL                                 T47_TRANS_TEMP.ADDTIONAL%TYPE;



  BEGIN
    OPEN CURS_T47_TRANS_MID;
    LOOP
        FETCH CURS_T47_TRANS_MID
        INTO  LV_TRANSACTIONKEY,                --ҵ���ʶ
              LV_CB_TX_CD,                   --ԭ���״���
              LV_CASH_TRANS_FLAG,               --��/ת��־
              LV_OPP_ACCT_NUM,                  --�Է��ʺ�
              LV_OPP_PARTY_ID,                  --�Է��ͻ���
              LV_OPP_CARD_TYPE,                 --�Է�֤������
              LV_OPP_CARD_NO,                   --�Է�֤������
              LV_OPP_PARTY_CLASS_CD,            --�Է��ͻ�����
              LV_TX_OCCUR_AREA,                 --���׷�������������
              V_RE_IND,                        --�Ƿ�¼
              LV_CAL_IND,                       --�Ƿ����
              LV_RULE_IND;                      --�Ƿ����
        EXIT WHEN CURS_T47_TRANS_MID%NOTFOUND;

        /* �����Ƿ�¼
         1. �����������ֶ�Ϊ�գ�Ҫ��¼
         2����ת��־��ת�ˣ�����ϵͳ����֮�󣬶Է��˺ţ��Է��ͻ�������Ϊ�յģ���¼
         3����ת��־���ֽ� ���׷�����Ϊ�գ���¼
         4����ת��־=�ֽ� �������������¼ */
          -- RE_IND  �Ƿ��貹¼ 0:��1:��
          IF V_RE_IND IS NULL THEN
          BEGIN
              IF LV_CASH_TRANS_FLAG = '2' THEN       --ת���ཻ�����ж��Ƿ�¼
                 IF LV_CAL_IND = '1' AND        --1�������
                    ( LV_OPP_ACCT_NUM IS NULL OR   --�Է��ʺ�Ϊ��
                      LV_OPP_PARTY_CLASS_CD IS NULL OR--�Է��ͻ�����
                      LV_OPP_PARTY_ID IS NULL OR --�Է��ͻ�����
                      LV_OPP_CARD_NO IS NULL OR  --�Է�֤������
                      LV_OPP_CARD_TYPE IS NULL )  --�Է�֤������
                 THEN
                 BEGIN
                      V_RE_IND := '1';
                      V_ADDTIONAL := '0';
                 END;
                 ELSE
                 BEGIN
                      V_RE_IND := '0';
                      V_ADDTIONAL := NULL;
                 END;
                 END IF;
              ELSE --�ֽ��ཻ�ײ���¼���׶�����Ϣ
                IF LV_TX_OCCUR_AREA IS NULL THEN  --�ֽ��ཻ�ױ����н��׷�����
                BEGIN
                     V_RE_IND := '1';
                     V_ADDTIONAL := '0';
                END;
                ELSE
                BEGIN
                     V_RE_IND := '0';
                     V_ADDTIONAL := NULL;
                END;
                END IF;
              END IF;
          END;
          ELSE
              V_ADDTIONAL := NULL;
          END IF;

          IF F16_IS_FILTER_TX_CD(LV_CB_TX_CD,'08') THEN
          BEGIN
               V_RE_IND := '0';
               V_ADDTIONAL := NULL;
          END;
          END IF;

          UPDATE T47_TRANS_TEMP SET
                 RE_IND                        = V_RE_IND,
                 ADDTIONAL                     = V_ADDTIONAL
          WHERE TRANSACTIONKEY = LV_TRANSACTIONKEY;

          COMMIT;

      END LOOP;

      CLOSE CURS_T47_TRANS_MID;

  END;

  /**
  * TITLE      : ������ˮ�м�������ݵ�������ˮ��</P>
  * DESCRIPTION: �ӽ�����ˮ�м����ǰ���ݵ�������ˮ��</P>
  *
  * COPYRIGHT  : COPYRIGHT (C) 2007</P>
  * COMPANY    : IST </P>
  * AUTHOR     ��LIZHY
  * VERSION    ��1.0
  * DATE       : 2007-07-25
  * MODIFY BY  :FCQ
  * MODIFY DATE:2008-06-03
  */
  PROCEDURE P90_T47_TRANSACTION(DTINPUTDT IN VARCHAR2, TASKKEY IN VARCHAR2) AS

  BEGIN
       MERGE INTO T47_TRANSACTION T
       USING ( SELECT T1.TRANSACTIONKEY,
                      T1.TX_NO,
                      T1.CPZXH,
                      T1.ORGANKEY,
                      T1.TX_DT,
                      T1.DT_TIME,
                      T1.ACCT_NUM,
                      T1.PARTY_ID,
                      T1.HOST_CUST_ID,
                      T1.PARTY_CHN_NAME,
                      T1.PARTY_CLASS_CD,
                      T1.TX_CD,
                      T1.CB_TX_CD,
                      T1.BUS_TYPE_CD,
                      T1.TX_TYPE_CD,
                      T1.DEBIT_CREDIT,
                      T1.RECEIVE_PAY_CD,
                      T1.SUBJECTNO,
                      T1.CURRENCY_CD,
                      T1.CURR_CD,
                      T1.AMT,
                      T1.CNY_AMT,
                      T1.USD_AMT,
                      T1.AMT_VAL,
                      T1.CASH_TRANS_FLAG,
                      T1.CASH_IND,
                      T1.REMIT_TYPE_CD,
                      T1.DES,
                      T1.OVERAREA_IND,
                      T1.SETTLE_TYPE_CD,
                      CASE WHEN T1.USE_DES IS NULL THEN T1.DES ELSE T1.USE_DES END AS USE_DES,
                      T1.CANCEL_IND,
                      T1.AMT_CD,
                      T1.BATCH_IND,
                      T1.TELLER,
                      T1.HANDLE_STATUS_CD,
                      T1.TX_DIRECT,
                      T1.TOKEN_NO,
                      T1.CHANNEL,
                      T1.OPP_SYS_ID,
                      T1.OPP_ISPARTY,
                      T1.OPP_AREA,
                      T1.OPP_ORGAN_TYPE,
                      T1.OPP_ORGANKEY,
                      T1.OPP_ORGANNAME,
                      T1.OPP_PARTY_ID,
                      T1.OPP_NAME,
                      T1.OPP_ACCT_NUM,
                      T1.OPP_TX_DT,
                      T1.OPP_ACCT_TYPE_CD,
                      T1.OPP_CARD_TYPE,
                      T1.OPP_CARD_NO,
                      T1.OPP_PARTY_CLASS_CD,
                      T1.OPP_PBC_PARTY_CLASS_CD,
                      T1.OPP_COUNTRY,
                      T1.TSCTKEY,
                      T1.OPP_OFF_SHORE_IND,
                      T1.ORG_TRANS_RELA,
                      CASE WHEN T1.CASH_TRANS_FLAG ='2' AND T1.OPP_ORGANKEY IS NULL THEN 'CHN'
                           ELSE T1.TX_GO_COUNTRY END AS TX_GO_COUNTRY ,
                      CASE WHEN T1.CASH_TRANS_FLAG ='2' AND T1.OPP_ORGANKEY IS NULL THEN TX_OCCUR_AREA
                           ELSE T1.TX_GO_AREA END AS TX_GO_AREA,
                      T1.TX_OCCUR_COUNTRY,
                      T1.TX_OCCUR_AREA,
                      T1.AGENT_NAME,
                      T1.AGENT_CARD_TYPE,
                      T1.AGENT_CARD_NO,
                      T1.AGENT_COUNTRY,
                      T1.RE_IND,
                      T1.ADDTIONAL,
                      T1.RE_DT,
                      T1.CAL_IND,
                      T1.RULE_IND,
                      T1.CHECK_TELLER,
                      T1.LAST_UPD_USR,
                      T1.BIZ_TYPE_CD,
                      T1.JYJE1,
                      T1.JYJE2
               FROM T47_TRANS_TEMP T1
               WHERE T1.IS_DELETED = '0' ) T2
       ON ( T.TRANSACTIONKEY = T2.TRANSACTIONKEY )
       WHEN MATCHED THEN
            UPDATE SET T.CB_PK                              = T2.TRANSACTIONKEY,
                       T.TX_NO                              = T2.TX_NO,
                       T.VOUCHER_NO                         = T2.CPZXH,
                       T.ORGANKEY                           = T2.ORGANKEY,
                       T.TX_DT                              = T2.TX_DT,
                       T.DT_TIME                            = T2.DT_TIME,
                       T.ACCT_NUM                           = T2.ACCT_NUM,
                       T.PARTY_ID                           = T2.PARTY_ID,
                       T.HOST_CUST_ID                       = T2.HOST_CUST_ID,
                       T.PARTY_CHN_NAME                     = T2.PARTY_CHN_NAME,
                       T.PARTY_CLASS_CD                     = T2.PARTY_CLASS_CD,
                       T.TX_CD                              = T2.TX_CD,
                       T.CB_TX_CD                           = T2.CB_TX_CD,
                       T.BUS_TYPE_CD                        = T2.BUS_TYPE_CD,
                       T.TX_TYPE_CD                         = T2.TX_TYPE_CD,
                       T.DEBIT_CREDIT                       = T2.DEBIT_CREDIT,
                       T.RECEIVE_PAY_CD                     = T2.RECEIVE_PAY_CD,
                       T.SUBJECTNO                          = T2.SUBJECTNO,
                       T.CURRENCY_CD                        = T2.CURRENCY_CD,
                       T.CURR_CD                            = T2.CURR_CD,
                       T.AMT                                = T2.AMT,
                       T.CNY_AMT                            = T2.CNY_AMT,
                       T.USD_AMT                            = T2.USD_AMT,
                       T.AMT_VAL                            = T2.AMT_VAL,
                       T.CASH_TRANS_FLAG                    = T2.CASH_TRANS_FLAG,
                       T.CASH_IND                           = T2.CASH_IND,
                       T.REMIT_TYPE_CD                      = T2.REMIT_TYPE_CD,
                       T.DES                                = T2.DES,
                       T.OVERAREA_IND                       = T2.OVERAREA_IND,
                       T.SETTLE_TYPE_CD                     = T2.SETTLE_TYPE_CD,
                       T.USE_DES                            = T2.USE_DES,
                       T.CANCEL_IND                         = T2.CANCEL_IND,
                       T.AMT_CD                             = T2.AMT_CD,
                       T.BATCH_IND                          = T2.BATCH_IND,
                       T.TELLER                             = T2.TELLER,
                       T.HANDLE_STATUS_CD                   = T2.HANDLE_STATUS_CD,
                       T.TX_DIRECT                          = T2.TX_DIRECT,
                       T.TOKEN_NO                           = T2.TOKEN_NO,
                       T.CHANNEL                            = T2.CHANNEL,
                       T.OPP_SYS_ID                         = T2.OPP_SYS_ID,
                       T.OPP_ISPARTY                        = T2.OPP_ISPARTY,
                       T.OPP_AREA                           = T2.OPP_AREA,
                       T.OPP_ORGAN_TYPE                     = T2.OPP_ORGAN_TYPE,
                       T.OPP_ORGANKEY                       = T2.OPP_ORGANKEY,
                       T.OPP_ORGANNAME                      = T2.OPP_ORGANNAME,
                       T.OPP_PARTY_ID                       = T2.OPP_PARTY_ID,
                       T.OPP_NAME                           = T2.OPP_NAME,
                       T.OPP_ACCT_NUM                       = T2.OPP_ACCT_NUM,
                       T.OPP_TX_DT                          = T2.OPP_TX_DT,
                       T.OPP_ACCT_TYPE_CD                   = T2.OPP_ACCT_TYPE_CD,
                       T.OPP_CARD_TYPE                      = T2.OPP_CARD_TYPE,
                       T.OPP_CARD_NO                        = T2.OPP_CARD_NO,
                       T.OPP_PARTY_CLASS_CD                 = T2.OPP_PARTY_CLASS_CD,
                       T.OPP_PBC_PARTY_CLASS_CD             = T2.OPP_PBC_PARTY_CLASS_CD,
                       T.OPP_COUNTRY                        = T2.OPP_COUNTRY,
                       T.TSCTKEY                            = T2.TSCTKEY,
                       T.OPP_OFF_SHORE_IND                  = T2.OPP_OFF_SHORE_IND,
                       T.ORG_TRANS_RELA                     = T2.ORG_TRANS_RELA,
                       T.TX_GO_COUNTRY                      = T2.TX_GO_COUNTRY,
                       T.TX_GO_AREA                         = T2.TX_GO_AREA,
                       T.TX_OCCUR_COUNTRY                   = T2.TX_OCCUR_COUNTRY,
                       T.TX_OCCUR_AREA                      = T2.TX_OCCUR_AREA,
                       T.AGENT_NAME                         = T2.AGENT_NAME,
                       T.AGENT_CARD_TYPE                    = T2.AGENT_CARD_TYPE,
                       T.AGENT_CARD_NO                      = T2.AGENT_CARD_NO,
                       T.AGENT_COUNTRY                      = T2.AGENT_COUNTRY,
                       T.RE_IND                             = T2.RE_IND,
                       T.ADDTIONAL                          = T2.ADDTIONAL,
                       T.RE_DT                              = T2.RE_DT,
                       T.CAL_IND                            = T2.CAL_IND,
                       T.RULE_IND                           = T2.RULE_IND,
                       T.CHECK_TELLER                       = T2.CHECK_TELLER,
                       T.LAST_UPD_USR                       = T2.LAST_UPD_USR,
                       T.BIZ_TYPE_CD                        = T2.BIZ_TYPE_CD,
                       T.JYJE1                              = T2.JYJE1,
                       T.JYJE2                              = T2.JYJE2
       WHEN NOT MATCHED THEN
            INSERT ( T.TRANSACTIONKEY,
                     T.CB_PK,
                     T.TX_NO,
                     T.VOUCHER_NO,
                     T.ORGANKEY,
                     T.TX_DT,
                     T.DT_TIME,
                     T.ACCT_NUM,
                     T.PARTY_ID,
                     T.HOST_CUST_ID,
                     T.PARTY_CHN_NAME,
                     T.PARTY_CLASS_CD,
                     T.TX_CD,
                     T.CB_TX_CD,
                     T.BUS_TYPE_CD,
                     T.TX_TYPE_CD,
                     T.DEBIT_CREDIT,
                     T.RECEIVE_PAY_CD,
                     T.SUBJECTNO,
                     T.CURRENCY_CD,
                     T.CURR_CD,
                     T.AMT,
                     T.CNY_AMT,
                     T.USD_AMT,
                     T.AMT_VAL,
                     T.CASH_TRANS_FLAG,
                     T.CASH_IND,
                     T.REMIT_TYPE_CD,
                     T.DES,
                     T.OVERAREA_IND,
                     T.SETTLE_TYPE_CD,
                     T.USE_DES,
                     T.CANCEL_IND,
                     T.AMT_CD,
                     T.BATCH_IND,
                     T.TELLER,
                     T.HANDLE_STATUS_CD,
                     T.TX_DIRECT,
                     T.TOKEN_NO,
                     T.CHANNEL,
                     T.OPP_SYS_ID,
                     T.OPP_ISPARTY,
                     T.OPP_AREA,
                     T.OPP_ORGAN_TYPE,
                     T.OPP_ORGANKEY,
                     T.OPP_ORGANNAME,
                     T.OPP_PARTY_ID,
                     T.OPP_NAME,
                     T.OPP_ACCT_NUM,
                     T.OPP_TX_DT,
                     T.OPP_ACCT_TYPE_CD,
                     T.OPP_CARD_TYPE,
                     T.OPP_CARD_NO,
                     T.OPP_PARTY_CLASS_CD,
                     T.OPP_PBC_PARTY_CLASS_CD,
                     T.OPP_COUNTRY,
                     T.TSCTKEY,
                     T.OPP_OFF_SHORE_IND,
                     T.ORG_TRANS_RELA,
                     T.TX_GO_COUNTRY,
                     T.TX_GO_AREA,
                     T.TX_OCCUR_COUNTRY,
                     T.TX_OCCUR_AREA,
                     T.AGENT_NAME,
                     T.AGENT_CARD_TYPE,
                     T.AGENT_CARD_NO,
                     T.AGENT_COUNTRY,
                     T.RE_IND,
                     T.ADDTIONAL,
                     T.RE_DT,
                     T.CAL_IND,
                     T.RULE_IND,
                     T.CHECK_TELLER,
                     T.LAST_UPD_USR,
                     T.BIZ_TYPE_CD,
                     T.OBJORGANKEY,
                     T.JYJE1,
                     T.JYJE2 )
            VALUES ( T2.TRANSACTIONKEY,
                     T2.TRANSACTIONKEY,
                     T2.TX_NO,
                     T2.CPZXH,
                     T2.ORGANKEY,
                     T2.TX_DT,
                     T2.DT_TIME,
                     T2.ACCT_NUM,
                     T2.PARTY_ID,
                     T2.HOST_CUST_ID,
                     T2.PARTY_CHN_NAME,
                     T2.PARTY_CLASS_CD,
                     T2.TX_CD,
                     T2.CB_TX_CD,
                     T2.BUS_TYPE_CD,
                     T2.TX_TYPE_CD,
                     T2.DEBIT_CREDIT,
                     T2.RECEIVE_PAY_CD,
                     T2.SUBJECTNO,
                     T2.CURRENCY_CD,
                     T2.CURR_CD,
                     T2.AMT,
                     T2.CNY_AMT,
                     T2.USD_AMT,
                     T2.AMT_VAL,
                     T2.CASH_TRANS_FLAG,
                     T2.CASH_IND,
                     T2.REMIT_TYPE_CD,
                     T2.DES,
                     T2.OVERAREA_IND,
                     T2.SETTLE_TYPE_CD,
                     T2.USE_DES,
                     T2.CANCEL_IND,
                     T2.AMT_CD,
                     T2.BATCH_IND,
                     T2.TELLER,
                     T2.HANDLE_STATUS_CD,
                     T2.TX_DIRECT,
                     T2.TOKEN_NO,
                     T2.CHANNEL,
                     T2.OPP_SYS_ID,
                     T2.OPP_ISPARTY,
                     T2.OPP_AREA,
                     T2.OPP_ORGAN_TYPE,
                     T2.OPP_ORGANKEY,
                     T2.OPP_ORGANNAME,
                     T2.OPP_PARTY_ID,
                     T2.OPP_NAME,
                     T2.OPP_ACCT_NUM,
                     T2.OPP_TX_DT,
                     T2.OPP_ACCT_TYPE_CD,
                     T2.OPP_CARD_TYPE,
                     T2.OPP_CARD_NO,
                     T2.OPP_PARTY_CLASS_CD,
                     T2.OPP_PBC_PARTY_CLASS_CD,
                     T2.OPP_COUNTRY,
                     T2.TSCTKEY,
                     T2.OPP_OFF_SHORE_IND,
                     T2.ORG_TRANS_RELA,
                     T2.TX_GO_COUNTRY,
                     T2.TX_GO_AREA,
                     T2.TX_OCCUR_COUNTRY,
                     T2.TX_OCCUR_AREA,
                     T2.AGENT_NAME,
                     T2.AGENT_CARD_TYPE,
                     T2.AGENT_CARD_NO,
                     T2.AGENT_COUNTRY,
                     T2.RE_IND,
                     T2.ADDTIONAL,
                     T2.RE_DT,
                     T2.CAL_IND,
                     T2.RULE_IND,
                     T2.CHECK_TELLER,
                     T2.LAST_UPD_USR,
                     T2.BIZ_TYPE_CD,
                     T2.ORGANKEY,
                     T2.JYJE1,
                     T2.JYJE2 );
--С������ˮ��
DELETE FROM T47_TRANSACTION_MINI
 WHERE TX_DT < ADD_MONTHS(to_date(DTINPUTDT, 'YYYY-MM-DD'), -1)
    OR TX_DT = to_date(DTINPUTDT, 'YYYY-MM-DD');
INSERT INTO T47_TRANSACTION_MINI
  (TRANSACTIONKEY,
   CB_PK,
   TX_NO,
   VOUCHER_NO,
   ORGANKEY,
   TX_DT,
   DT_TIME,
   ACCT_NUM,
   PARTY_ID,
   PARTY_CLASS_CD,
   TX_CD,
   CB_TX_CD,
   BUS_TYPE_CD,
   TX_TYPE_CD,
   DEBIT_CREDIT,
   RECEIVE_PAY_CD,
   SUBJECTNO,
   CURRENCY_CD,
   CURR_CD,
   AMT,
   CNY_AMT,
   USD_AMT,
   AMT_VAL,
   CASH_TRANS_FLAG,
   REMIT_TYPE_CD,
   DES,
   OVERAREA_IND,
   SETTLE_TYPE_CD,
   USE_DES,
   OPP_SYS_ID,
   OPP_ISPARTY,
   OPP_AREA,
   OPP_ORGAN_TYPE,
   OPP_ORGANKEY,
   OPP_ORGANNAME,
   OPP_PARTY_ID,
   OPP_NAME,
   OPP_ACCT_NUM,
   OPP_TX_DT,
   OPP_ACCT_TYPE_CD,
   OPP_CARD_TYPE,
   OPP_CARD_NO,
   OPP_PARTY_CLASS_CD,
   CANCEL_IND,
   AMT_CD,
   BATCH_IND,
   TELLER,
   RE_IND,
   HANDLE_STATUS_CD,
   PARTY_CHN_NAME,
   ADDTIONAL,
   RE_DT,
   TX_DIRECT,
   TOKEN_NO,
   HOST_CUST_ID,
   CHANNEL,
   CAL_IND,
   RULE_IND,
   TEMP1,
   OPP_COUNTRY,
   TSCTKEY,
   TX_GO_COUNTRY,
   TX_GO_AREA,
   TX_OCCUR_COUNTRY,
   TX_OCCUR_AREA,
   AGENT_NAME,
   AGENT_CARD_TYPE,
   AGENT_CARD_NO,
   AGENT_COUNTRY,
   ORG_TRANS_RELA,
   CASH_IND,
   OPP_PBC_PARTY_CLASS_CD,
   CHECK_TELLER,
   LAST_UPD_USR,
   OPP_OFF_SHORE_IND,
   BIZ_TYPE_CD,
   VALIDATE_IND,
   VALIDATE_IND2,
   MERCHANT_TYPE_CD,
   MERCHANT_ID,
   ACCT_STYLE,
   OPP_ACCT_STYLE,
   OBJORGANKEY)
  SELECT T.TRANSACTIONKEY,
         T.CB_PK,
         T.TX_NO,
         T.VOUCHER_NO,
         T.ORGANKEY,
         T.TX_DT,
         T.DT_TIME,
         T.ACCT_NUM,
         T.PARTY_ID,
         T.PARTY_CLASS_CD,
         T.TX_CD,
         T.CB_TX_CD,
         T.BUS_TYPE_CD,
         T.TX_TYPE_CD,
         T.DEBIT_CREDIT,
         T.RECEIVE_PAY_CD,
         T.SUBJECTNO,
         T.CURRENCY_CD,
         T.CURR_CD,
         T.AMT,
         T.CNY_AMT,
         T.USD_AMT,
         T.AMT_VAL,
         T.CASH_TRANS_FLAG,
         T.REMIT_TYPE_CD,
         T.DES,
         T.OVERAREA_IND,
         T.SETTLE_TYPE_CD,
         T.USE_DES,
         T.OPP_SYS_ID,
         T.OPP_ISPARTY,
         T.OPP_AREA,
         T.OPP_ORGAN_TYPE,
         T.OPP_ORGANKEY,
         T.OPP_ORGANNAME,
         T.OPP_PARTY_ID,
         T.OPP_NAME,
         T.OPP_ACCT_NUM,
         T.OPP_TX_DT,
         T.OPP_ACCT_TYPE_CD,
         T.OPP_CARD_TYPE,
         T.OPP_CARD_NO,
         T.OPP_PARTY_CLASS_CD,
         T.CANCEL_IND,
         T.AMT_CD,
         T.BATCH_IND,
         T.TELLER,
         T.RE_IND,
         T.HANDLE_STATUS_CD,
         T.PARTY_CHN_NAME,
         T.ADDTIONAL,
         T.RE_DT,
         T.TX_DIRECT,
         T.TOKEN_NO,
         T.HOST_CUST_ID,
         T.CHANNEL,
         T.CAL_IND,
         T.RULE_IND,
         T.TEMP1,
         T.OPP_COUNTRY,
         T.TSCTKEY,
         T.TX_GO_COUNTRY,
         T.TX_GO_AREA,
         T.TX_OCCUR_COUNTRY,
         T.TX_OCCUR_AREA,
         T.AGENT_NAME,
         T.AGENT_CARD_TYPE,
         T.AGENT_CARD_NO,
         T.AGENT_COUNTRY,
         T.ORG_TRANS_RELA,
         T.CASH_IND,
         T.OPP_PBC_PARTY_CLASS_CD,
         T.CHECK_TELLER,
         T.LAST_UPD_USR,
         T.OPP_OFF_SHORE_IND,
         T.BIZ_TYPE_CD,
         T.VALIDATE_IND,
         T.VALIDATE_IND2,
         T.MERCHANT_TYPE_CD,
         T.MERCHANT_ID,
         T.ACCT_STYLE,
         T.OPP_ACCT_STYLE,
         T.OBJORGANKEY
    FROM T47_TRANSACTION T
   WHERE T.AMT < 100
     AND T.TX_DT = to_date(DTINPUTDT, 'YYYY-MM-DD')
     AND T.CAL_IND = '1'
     AND T.RULE_IND IN ('2', '3');

COMMIT;

  END;

END PKG_ETL_ODS_TO_AML;
