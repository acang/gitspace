function update_province( CatID1, subTypeForm ){
	subTypeForm.length=0;
	switch(CatID1){
	case "-1":
		subTypeForm.options[0]=new Option("--------","-1");
		subTypeForm.options[0].selected=true;break;
	case "�й�"://�й�
		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("���","���");
		subTypeForm.options[2]=new Option("�ӱ�","�ӱ�");
		subTypeForm.options[3]=new Option("ɽ��","ɽ��");
		subTypeForm.options[4]=new Option("���ɹ�","���ɹ�");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("������","������");
		subTypeForm.options[8]=new Option("�Ϻ�","�Ϻ�");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[10]=new Option("�㽭","�㽭");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("ɽ��","ɽ��");
		subTypeForm.options[15]=new Option("����","����");
		subTypeForm.options[16]=new Option("����","����");
		subTypeForm.options[17]=new Option("����","����");
		subTypeForm.options[18]=new Option("�㶫","�㶫");
		subTypeForm.options[19]=new Option("����","����");
		subTypeForm.options[20]=new Option("����","����");
		subTypeForm.options[21]=new Option("����","����");
		subTypeForm.options[22]=new Option("�Ĵ�","�Ĵ�");
		subTypeForm.options[23]=new Option("����","����");
		subTypeForm.options[24]=new Option("����","����");
		subTypeForm.options[25]=new Option("����","����");
		subTypeForm.options[26]=new Option("����","����");
		subTypeForm.options[27]=new Option("����","����");
		subTypeForm.options[28]=new Option("�ຣ","�ຣ");
		subTypeForm.options[29]=new Option("����","����");
		subTypeForm.options[30]=new Option("�½�","�½�");
		subTypeForm.options[31]=new Option("���","���");
		subTypeForm.options[32]=new Option("����","����");
		subTypeForm.options[33]=new Option("̨��","̨��");
		subTypeForm.options[0].selected=true;
	break;
	}
return -1;
}
function update_city( CatID1, CatID2, subTypeForm ){
subTypeForm.length=0;
switch(CatID1){
case "-1":
	subTypeForm.options[0]=new Option("--------","-1");
	subTypeForm.options[0].selected=true;break;
case "�й�"://�й�
	switch ( CatID2 ){
	case "�㶫"://�㶫

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("�麣","�麣");
		subTypeForm.options[3]=new Option("��ͷ","��ͷ");
		subTypeForm.options[4]=new Option("�ع�","�ع�");
		subTypeForm.options[5]=new Option("��Դ","��Դ");
		subTypeForm.options[6]=new Option("÷��","÷��");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("��β","��β");
		subTypeForm.options[9]=new Option("��ݸ","��ݸ");
		subTypeForm.options[10]=new Option("��ɽ","��ɽ");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("��ɽ","��ɽ");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("տ��","տ��");
		subTypeForm.options[15]=new Option("ï��","ï��");
		subTypeForm.options[16]=new Option("����","����");
		subTypeForm.options[17]=new Option("��Զ","��Զ");
		subTypeForm.options[18]=new Option("����","����");
		subTypeForm.options[19]=new Option("����","����");
		subTypeForm.options[20]=new Option("�Ƹ�","�Ƹ�");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("���Ǹ�","���Ǹ�");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("���","���");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("��ɫ","��ɫ");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("�ӳ�","�ӳ�");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����
		subTypeForm.options[0]=new Option("������","������");
		subTypeForm.options[1]=new Option("������","������");
		subTypeForm.options[2]=new Option("������","������");
		subTypeForm.options[3]=new Option("������","������");
		subTypeForm.options[4]=new Option("������","������");
		subTypeForm.options[5]=new Option("��̨��","��̨��");
		subTypeForm.options[6]=new Option("ʯ��ɽ��","ʯ��ɽ��");
		subTypeForm.options[7]=new Option("������","������");
		subTypeForm.options[8]=new Option("��ͷ����","��ͷ����");
		subTypeForm.options[9]=new Option("��ɽ��","��ɽ��");
		subTypeForm.options[10]=new Option("ͨ����","ͨ����");
		subTypeForm.options[11]=new Option("˳����","˳����");
		subTypeForm.options[12]=new Option("��ƽ��","��ƽ��");
		subTypeForm.options[13]=new Option("������","������");
		subTypeForm.options[14]=new Option("������","������");
		subTypeForm.options[15]=new Option("ƽ����","ƽ����");
		subTypeForm.options[16]=new Option("������","������");
		subTypeForm.options[17]=new Option("������","������");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("Ȫ��","Ȫ��");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("��ƽ","��ƽ");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "���"://���
		subTypeForm.options[0]=new Option("��ƽ��","��ƽ��");
		subTypeForm.options[1]=new Option("�Ӷ���","�Ӷ���");
		subTypeForm.options[2]=new Option("������","������");
		subTypeForm.options[3]=new Option("�Ͽ���","�Ͽ���");
		subTypeForm.options[4]=new Option("�ӱ���","�ӱ���");
		subTypeForm.options[5]=new Option("������","������");
		subTypeForm.options[6]=new Option("������","������");
		subTypeForm.options[7]=new Option("������","������");
		subTypeForm.options[8]=new Option("�����","�����");
		subTypeForm.options[9]=new Option("������","������");
		subTypeForm.options[10]=new Option("������","������");
		subTypeForm.options[11]=new Option("������","������");
		subTypeForm.options[12]=new Option("������","������");
		subTypeForm.options[13]=new Option("������","������");
		subTypeForm.options[14]=new Option("������","������");
		subTypeForm.options[15]=new Option("������","������");
		subTypeForm.options[16]=new Option("������","������");
		subTypeForm.options[17]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("��ɳ","��ɳ");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("��̶","��̶");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("�żҽ�","�żҽ�");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("¦��","¦��");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("�人","�人");
		subTypeForm.options[1]=new Option("��ʯ","��ʯ");
		subTypeForm.options[2]=new Option("�差","�差");
		subTypeForm.options[3]=new Option("ʮ��","ʮ��");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("�˲�","�˲�");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("Т��","Т��");
		subTypeForm.options[9]=new Option("�Ƹ�","�Ƹ�");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("��ʩ","��ʩ");
		//subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("֣��","֣��");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("ƽ��ɽ","ƽ��ɽ");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("�ױ�","�ױ�");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("���","���");
		subTypeForm.options[9]=new Option("���","���");
		subTypeForm.options[10]=new Option("���","���");
		subTypeForm.options[11]=new Option("����Ͽ","����Ͽ");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("����","����");
		subTypeForm.options[15]=new Option("�ܿ�","�ܿ�");
		subTypeForm.options[16]=new Option("פ���","פ���");
                subTypeForm.options[17]=new Option("��Դ","��Դ");
		subTypeForm.options[18]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "�ӱ�"://�ӱ�

		subTypeForm.options[0]=new Option("ʯ��ׯ","ʯ��ׯ");
		subTypeForm.options[1]=new Option("��ɽ","��ɽ");
		subTypeForm.options[2]=new Option("�ػʵ�","�ػʵ�");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("��̨","��̨");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("�żҿ�","�żҿ�");
		subTypeForm.options[7]=new Option("�е�","�е�");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("�ȷ�","�ȷ�");
		subTypeForm.options[10]=new Option("��ˮ","��ˮ");
		subTypeForm.options[0].selected=true;
		break;
	case "ɽ��"://ɽ��

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("�ൺ","�ൺ");
		subTypeForm.options[2]=new Option("�Ͳ�","�Ͳ�");
		subTypeForm.options[3]=new Option("��ׯ","��ׯ");
		subTypeForm.options[4]=new Option("��Ӫ","��Ӫ");
		subTypeForm.options[5]=new Option("Ϋ��","Ϋ��");
		subTypeForm.options[6]=new Option("��̨","��̨");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("̩��","̩��");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("�ĳ�","�ĳ�");
		subTypeForm.options[15]=new Option("����","����");
		subTypeForm.options[16]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "ɽ��"://ɽ��

		subTypeForm.options[0]=new Option("̫ԭ","̫ԭ");
		subTypeForm.options[1]=new Option("��ͬ","��ͬ");
		subTypeForm.options[2]=new Option("��Ȫ","��Ȫ");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("˷��","˷��");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("�˳�","�˳�");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("�ٷ�","�ٷ�");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "������"://������

		subTypeForm.options[0]=new Option("������","������");
		subTypeForm.options[1]=new Option("�������","�������");
		subTypeForm.options[2]=new Option("�׸�","�׸�");
		subTypeForm.options[3]=new Option("˫Ѽɽ","˫Ѽɽ");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("ĵ����","ĵ����");
		subTypeForm.options[8]=new Option("��ľ˹","��ľ˹");
		subTypeForm.options[9]=new Option("��̨��","��̨��");
		subTypeForm.options[10]=new Option("�ں�","�ں�");
		subTypeForm.options[11]=new Option("�绯","�绯");
		subTypeForm.options[12]=new Option("���˰���","���˰���");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("��ɽ","��ɽ");
		subTypeForm.options[3]=new Option("��˳","��˳");
		subTypeForm.options[4]=new Option("��Ϫ","��Ϫ");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("��«��","��«��");
		subTypeForm.options[8]=new Option("Ӫ��","Ӫ��");
		subTypeForm.options[9]=new Option("�̽�","�̽�");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "�Ϻ�"://�Ϻ�
		subTypeForm.options[0]=new Option("������","������");
		subTypeForm.options[1]=new Option("¬����","¬����");
		subTypeForm.options[2]=new Option("�����","�����");
		subTypeForm.options[3]=new Option("������","������");
		subTypeForm.options[4]=new Option("������","������");
		subTypeForm.options[5]=new Option("������","������");
		subTypeForm.options[6]=new Option("բ����","բ����");
		subTypeForm.options[7]=new Option("�����","�����");
		subTypeForm.options[8]=new Option("������","������");
		subTypeForm.options[9]=new Option("��ɽ��","��ɽ��");
		subTypeForm.options[10]=new Option("������","������");
		subTypeForm.options[11]=new Option("�ζ���","�ζ���");
		subTypeForm.options[12]=new Option("�ֶ�����","�ֶ�����");
		subTypeForm.options[13]=new Option("��ɽ��","��ɽ��");
		subTypeForm.options[14]=new Option("�ɽ���","�ɽ���");
		subTypeForm.options[15]=new Option("������","������");
		subTypeForm.options[16]=new Option("�ϻ���","�ϻ���");
		subTypeForm.options[17]=new Option("������","������");
		subTypeForm.options[18]=new Option("������","������");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("���","���");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("��ˮ","��ˮ");
		subTypeForm.options[4]=new Option("������","������");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("��Ҵ","��Ҵ");
		subTypeForm.options[7]=new Option("ƽ��","ƽ��");
		subTypeForm.options[8]=new Option("��Ȫ","��Ȫ");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("¤��","¤��");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "�ຣ"://�ຣ

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "�½�"://�½�

		subTypeForm.options[0]=new Option("��³ľ��","��³ľ��");
		subTypeForm.options[1]=new Option("��������","��������");
		subTypeForm.options[2]=new Option("ʯ����","ʯ����");
		subTypeForm.options[3]=new Option("��³��","��³��");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("������","������");
		subTypeForm.options[7]=new Option("��ʲ","��ʲ");
		subTypeForm.options[8]=new Option("��������","��������");
		subTypeForm.options[9]=new Option("��������","��������");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("��������","��������");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("����̩","����̩");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("ɽ��","ɽ��");
		subTypeForm.options[4]=new Option("�տ���","�տ���");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("��֥","��֥");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("ʯ��ɽ","ʯ��ɽ");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("��ԭ","��ԭ");
		subTypeForm.options[0].selected=true;
		break;
	case "�Ĵ�"://�Ĵ�

		subTypeForm.options[0]=new Option("�ɶ�","�ɶ�");
		subTypeForm.options[1]=new Option("�Թ�","�Թ�");
		subTypeForm.options[2]=new Option("��֦��","��֦��");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("��Ԫ","��Ԫ");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("�ڽ�","�ڽ�");
		subTypeForm.options[9]=new Option("��ɽ","��ɽ");
		subTypeForm.options[10]=new Option("�ϳ�","�ϳ�");
		subTypeForm.options[11]=new Option("�˱�","�˱�");
		subTypeForm.options[12]=new Option("�㰲","�㰲");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("üɽ","üɽ");
		subTypeForm.options[15]=new Option("�Ű�","�Ű�");
		subTypeForm.options[16]=new Option("����","����");
		subTypeForm.options[17]=new Option("����","����");
		subTypeForm.options[18]=new Option("����","����");
		subTypeForm.options[19]=new Option("����","����");
		subTypeForm.options[20]=new Option("��ɽ","��ɽ");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("��Ϫ","��Ϫ");
		subTypeForm.options[3]=new Option("��ɽ","��ɽ");
		subTypeForm.options[4]=new Option("��ͨ","��ͨ");
		subTypeForm.options[5]=new Option("˼é","˼é");
		subTypeForm.options[6]=new Option("�ٲ�","�ٲ�");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("��ɽ","��ɽ");
		subTypeForm.options[9]=new Option("���","���");
		subTypeForm.options[10]=new Option("��˫����","��˫����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("�º�","�º�");
		subTypeForm.options[14]=new Option("ŭ��","ŭ��");
		subTypeForm.options[15]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("��ƽ","��ƽ");
		subTypeForm.options[3]=new Option("��Դ","��Դ");
		subTypeForm.options[4]=new Option("ͨ��","ͨ��");
		subTypeForm.options[5]=new Option("��ɽ","��ɽ");
		subTypeForm.options[6]=new Option("��ԭ","��ԭ");
		subTypeForm.options[7]=new Option("�׳�","�׳�");
		subTypeForm.options[8]=new Option("�ӱ�","�ӱ�");
		subTypeForm.options[0].selected=true;
		break;
	case "���ɹ�"://���ɹ�

		subTypeForm.options[0]=new Option("���ͺ���","���ͺ���");
		subTypeForm.options[1]=new Option("��ͷ","��ͷ");
		subTypeForm.options[2]=new Option("�ں�","�ں�");
		subTypeForm.options[3]=new Option("���","���");
		subTypeForm.options[4]=new Option("ͨ��","ͨ��");
		subTypeForm.options[5]=new Option("������˹","������˹");
		subTypeForm.options[6]=new Option("���ױ���","���ױ���");
		subTypeForm.options[7]=new Option("�����첼","�����첼");
		subTypeForm.options[8]=new Option("���ֹ���","���ֹ���");
		subTypeForm.options[9]=new Option("�����׶�","�����׶�");
		subTypeForm.options[10]=new Option("������","������");
		subTypeForm.options[11]=new Option("�˰�","�˰�");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("ͭ��","ͭ��");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("μ��","μ��");
		subTypeForm.options[5]=new Option("�Ӱ�","�Ӱ�");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("����","����");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("�Ϸ�","�Ϸ�");
		subTypeForm.options[1]=new Option("�ߺ�","�ߺ�");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("��ɽ","��ɽ");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("ͭ��","ͭ��");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("��ɽ","��ɽ");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[13]=new Option("����","����");
		subTypeForm.options[14]=new Option("����","����");
		subTypeForm.options[15]=new Option("����","����");
		subTypeForm.options[16]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����ˮ","����ˮ");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("��˳","��˳");
		subTypeForm.options[4]=new Option("ͭ��","ͭ��");
		subTypeForm.options[5]=new Option("�Ͻ�","�Ͻ�");
		subTypeForm.options[6]=new Option("ǭ����","ǭ����");
		subTypeForm.options[7]=new Option("ǭ����","ǭ����");
		subTypeForm.options[8]=new Option("ǭ��","ǭ��");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("�Ͼ�","�Ͼ�");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("���Ƹ�","���Ƹ�");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("��Ǩ","��Ǩ");
		subTypeForm.options[5]=new Option("�γ�","�γ�");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("̩��","̩��");
		subTypeForm.options[8]=new Option("��ͨ","��ͨ");
		subTypeForm.options[9]=new Option("��","��");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[11]=new Option("����","����");
		subTypeForm.options[12]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����
		subTypeForm.options[0]=new Option("������","������");
		subTypeForm.options[1]=new Option("��ɿ�","��ɿ�");
		subTypeForm.options[2]=new Option("������","������");
		subTypeForm.options[3]=new Option("ɳƺ��","ɳƺ��");
		subTypeForm.options[4]=new Option("������","������");
		subTypeForm.options[5]=new Option("�ϰ���","�ϰ���");
		subTypeForm.options[6]=new Option("������","������");
		subTypeForm.options[7]=new Option("��ʢ��","��ʢ��");
		subTypeForm.options[8]=new Option("˫����","˫����");
		subTypeForm.options[9]=new Option("�山��","�山��");
		subTypeForm.options[10]=new Option("������","������");
		subTypeForm.options[11]=new Option("������","������");
		subTypeForm.options[12]=new Option("������","������");
		subTypeForm.options[13]=new Option("ǭ����","ǭ����");
		subTypeForm.options[14]=new Option("������","������");
		subTypeForm.options[15]=new Option("������","������");
		subTypeForm.options[16]=new Option("�ϴ���","�ϴ���");
		subTypeForm.options[17]=new Option("������","������");
		subTypeForm.options[18]=new Option("�ϴ���","�ϴ���");
		subTypeForm.options[19]=new Option("�뽭��","�뽭��");
		subTypeForm.options[20]=new Option("������","������");
		subTypeForm.options[21]=new Option("ͭ����","ͭ����");
		subTypeForm.options[22]=new Option("������","������");
		subTypeForm.options[23]=new Option("�ٲ���","�ٲ���");
		subTypeForm.options[24]=new Option("��ɽ��","��ɽ��");
		subTypeForm.options[25]=new Option("�潭��","�潭��");
		subTypeForm.options[26]=new Option("��¡��","��¡��");
		subTypeForm.options[27]=new Option("�ᶼ��","�ᶼ��");
		subTypeForm.options[28]=new Option("�ǿ���","�ǿ���");
		subTypeForm.options[29]=new Option("��ƽ��","��ƽ��");
		subTypeForm.options[30]=new Option("����","����");
		subTypeForm.options[31]=new Option("��Ϫ��","��Ϫ��");
		subTypeForm.options[32]=new Option("��ɽ��","��ɽ��");
		subTypeForm.options[33]=new Option("�����","�����");
		subTypeForm.options[34]=new Option("������","������");
		subTypeForm.options[35]=new Option("����","����");
		subTypeForm.options[36]=new Option("ʯ��","ʯ��");
		subTypeForm.options[37]=new Option("��ˮ","��ˮ");
		subTypeForm.options[38]=new Option("����","����");
		subTypeForm.options[39]=new Option("��ɽ","��ɽ");
                subTypeForm.options[0].selected=true;
		break;
	case "�㽭"://�㽭

		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("����","����");
		subTypeForm.options[3]=new Option("����","����");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[6]=new Option("��","��");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("��ɽ","��ɽ");
		subTypeForm.options[9]=new Option("̨��","̨��");
		subTypeForm.options[10]=new Option("��ˮ","��ˮ");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����

		subTypeForm.options[0]=new Option("�ϲ�","�ϲ�");
		subTypeForm.options[1]=new Option("������","������");
		subTypeForm.options[2]=new Option("Ƽ��","Ƽ��");
		subTypeForm.options[3]=new Option("�Ž�","�Ž�");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("ӥ̶","ӥ̶");
		subTypeForm.options[6]=new Option("����","����");
		subTypeForm.options[7]=new Option("����","����");
		subTypeForm.options[8]=new Option("�˴�","�˴�");
		subTypeForm.options[9]=new Option("����","����");
		subTypeForm.options[10]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "̨��"://̨��

		subTypeForm.options[0]=new Option("̨��","̨��");
		subTypeForm.options[1]=new Option("����","����");
		subTypeForm.options[2]=new Option("̨��","̨��");
		subTypeForm.options[3]=new Option("̨��","̨��");
		subTypeForm.options[4]=new Option("��¡","��¡");
		subTypeForm.options[5]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "���"://���
		subTypeForm.options[0]=new Option("���","���");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����
		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[0].selected=true;
		break;
	case "����"://����
		subTypeForm.options[0]=new Option("����","����");
		subTypeForm.options[1]=new Option("ŷ��","ŷ��");
		subTypeForm.options[2]=new Option("������","������");
		subTypeForm.options[3]=new Option("������","������");
		subTypeForm.options[4]=new Option("����","����");
		subTypeForm.options[5]=new Option("������","������");
		subTypeForm.options[0].selected=true;
		break;
	}
	break;}
return -1;
}


function SetCity(){
	p = document.personal.s1;
	c = document.personal.s2;
	update_city("�й�",p.options[p.options.selectedIndex].value, c);
	return ;

}


