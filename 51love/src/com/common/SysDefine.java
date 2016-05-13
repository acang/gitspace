package com.common;

public class SysDefine {



  /**
   * �ֵ�
   */
  /*//�Ա� Ѫ��  ���� ��� ���� ��ɫ ������� �Ļ��̶� ��н ס�� �Ը����� �������� ҵ�ల�� ʡ�� ����*/
  public static final String DIC_SEX = "00001";
  public static final String DIC_XX= "00002";
  public static final String DIC_XZ = "00003";
  public static final String DIC_SG = "00004";
  public static final String DIC_TZ = "00005";
  public static final String DIC_FS = "00006";
  public static final String DIC_HYZH = "00007";
  public static final String DIC_WHCD = "00008";
  public static final String DIC_YX = "00009";
  public static final String DIC_ZF = "00010";
  public static final String DIC_XGTZ = "00011";
  public static final String DIC_JYYX = "00012";
  public static final String DIC_YYAP = "00013";
  public static final String DIC_SF = "00014";
  public static final String DIC_DS = "00015";
  public static final String DIC_ZY = "00016";
  public static final String DIC_IP = "00017";
  public static final String DIC_ZZSJ= "00018";
  public static final String DIC_DLSJ= "00019";
  public static final String DIC_LFRS = "00020";




  public static String[] xgtzArray=new String[]{"������", "�����ֹ�","��Ȥ��Ĭ","ֱˬ�ɴ�","׷��̼�","����С��","��ʵ��ֱ","��������","��������","С�Ľ���","��������","����Ƹ�","ѭ�浸��","���Թ���","��������"};
  public static String[] yyapArray=new String[]{"�� �� ��","�� �� ��","������","�ϡ���","�� ��OK","�� �� ��","�Ȳ�����" ,"�����˶�","��׬Ǯ","�������" ,"�ύ����"};
  //public static String[] jyyxArray=new String[]{"������","��������","ͬ������","�� ��","Eҹ��","���","����"};
  public static String[] jyyxArray=new String[]{"������","���ܹ�ϵ","�� ��","���","����"};



  /**
   * ���кŶ���
   */
  ///�ֵ����
   public static final String SEQ_DIC = "SEQ_DIC";
  ///��ԱID ���
   public static final String SEQ_HYID = "SEQ_HYID";
   //��Ա�ļ����к�
   public static final String SEQ_HY_ARTICLE="SEQ_HY_ARTICLE";
   //���ѹ���
   public static final String SEQ_HYGL="SEQ_HYGL";

   //���ı����кţ��ַ���
   //public static final String SEQ_BCS="SEQ_BCS";
   public static final String SEQ_BCB="SEQ_BCB";


   //��Ա�ﲨ
   public static final String SEQ_QIUBO="SEQ_QIUBO";

   //��Ա����
   public static final String SEQ_HYLY="SEQ_HYLY";

   ///��ͼ����������
   public static final String SEQ_FRIEND="SEQ_FRIEND";

   //SEQ_FRIEND_SITE
   public static final String SEQ_FRIEND_SITE="SEQ_FRIEND_SITE";

   public static final String SEQ_WTJD="SEQ_WTJD";
   public static final String SEQ_KFZX="SEQ_KFZX";
   public static final String SEQ_ADMININFO="SEQ_ADMININFO";
   public static final String SEQ_PRODUCT="SEQ_PRODUCT";
   public static final String SEQ_VIPRECORD = "SEQ_VIPRECORD";
   public static final String SEQ_CARTID = "SEQ_CARTID";
   public static final String SEQ_SHAREID = "SEQ_SHAREID";
   public static final String SEQ_CHECKID = "SEQ_CHECKID";
   public static final String SEQ_READID = "SEQ_READID";
   public static final String SEQ_BBSSORT = "SEQ_BBSSORT";
   public static final String SEQ_BBS     = "SEQ_BBS";
   public static final String SEQ_IPLOG   = "SEQ_IPLOG";
   
 //��Ϣ���ͼ�¼
   public static final String SEQ_USERINFOSENDREPLY="SEQ_USERINFOSENDREPLY";
   
   public static final String SEQ_USERVISIT="SEQ_USERVISIT";


/// sessionname ����
  public static final String DIC_TYPE_NAME = "dtype";
  public static final String DIC_ID_NAME   = "dicid";


  public static final String SESSION_LOGINNAME="LOGINUSER";
  public static final String SESSION_LOGINNAME_OTHER="LOGINUSEROTHER";
  public static final String SESSION_ADMIN_LOGIN_NAME = "ADMINLOGIN";


  ///ϵͳ��������
  //��Ա״̬
  public static final int SYSTEM_HYSET_HYZT_WAIT=3; //�ȴ���
  public static final int SYSTEM_HYSET_HYZT_NOT_WAIT=6; //�������


  //���Ͽ�������
  public static final int SYSTEM_HYSET_OPEN_ALL=3; //�����˿���
  public static final int SYSTEM_HYSET_OPEN_REG=6; //ע���Ա
  public static final int SYSTEM_HYSET_OPEN_VIP=9; //VIP��Ա
  public static final int SYSTEM_HYSET_OPEN_FRIEND=12; //���ѿ���

  ///���ѹ���״̬����
  public static final int SYSTEM_HYGL_SQ=4; //����
  public static final int SYSTEM_HYGL_FRIEND=8; //����
  public static final int SYSTEM_HYGL_BLACK=12; //����

  //�û�����
  public static final int SYSTEM_HY_TYPE_NOR=5;
  public static final int SYSTEM_HY_TYPE_vip=30;
  public static final int SYSTEM_HY_TYPE_nvip=25;

  ///img 0 û����Ƭ  1 ����Ƭ  isdel 0 ���� 1 ��ɾ��

  //���Ѹ��շѵ������շѱ�׼
  public static final String[] tsdqArray=new String[]{"����","�Ϻ�","�㶫","ɽ��","����","�㽭","���","����","̨��","����"};
  public static final double tsdqzk=0.7;
  public static final double ybdqzk=0.5;


  //������������
  public static final String ENV_WEB_PATH="webPath";
  public static final String ENV_ANNEXPATH_PATH="annexpath";
  
  public SysDefine() {
  }

}
