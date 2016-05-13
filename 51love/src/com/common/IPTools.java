/**
 * 
 */
package com.common;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;


/**
 * @author lin
 *
 */
public class IPTools {
	
    public static String getIp(HttpServletRequest request) {
             String ip = request.getHeader("X-Forwarded-For");
              if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
                 //��η���������ж��ipֵ����һ��ip������ʵip
                  int index = ip.indexOf(",");
                  if(index != -1){
                      return ip.substring(0,index);
                  }else{
                      return ip;
                 }
            }
             ip = request.getHeader("X-Real-IP");
             if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
                 return ip;
             }
             return request.getRemoteAddr();
         }

}
