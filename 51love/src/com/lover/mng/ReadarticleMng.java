package com.lover.mng;
import hibernate.db.HbmOperator;

import com.common.SysDefine;
import com.web.common.SysCommonFunc;
import com.web.obj.Readarticle;

public class ReadarticleMng {

  public ReadarticleMng() {
  }

  public static void addReadarticle(Readarticle readarticle)
  {
	  try
	    {
		  readarticle.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_READID));
	      HbmOperator.insert(readarticle);
	    }catch(Exception e)
	    {
	       System.out.println(e.getMessage());
	    }
  }

  public static void main(String args[])
  {

  }
}
