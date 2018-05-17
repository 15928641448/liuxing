package cn.truly.util;

import java.util.List;

import cn.truly.entity.Person;

public class CommonUtil {
	public static  String toJsonArray(List<Person> listPerson){  
        if(null == listPerson || listPerson.size() == 0)   
            throw new RuntimeException("数组列表为空!");  
        StringBuilder sb = new StringBuilder();  
        int size = listPerson.size();  
        sb.append("{");  
        sb.append("personArr:[");  
        for(int i = 0 ; i < size; i++){  
            sb.append(listPerson.get(i).toString());  
            if( size > 1 && i < (size-1)){  
                sb.append(",");  
            }  
        }  
        sb.append("]}");  
        return sb.toString();  
    }  
}
