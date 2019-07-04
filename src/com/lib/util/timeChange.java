package com.lib.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class timeChange implements JsonValueProcessor {
    
   
	private String format ="yyyy-MM-dd";  
	
	public timeChange() {
		// TODO Auto-generated constructor stub
	}
    
	public timeChange(String format){
		super();
		this.format=format;
	}
	
	public String getFormat() {
			return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}
	
	@Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		// TODO Auto-generated method stub
		return process(value);
	}

	@Override
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		// TODO Auto-generated method stub
		return process(value);
	}
    
	   private Object process(Object value) { 
	        try { 
	            if (value instanceof Date) { 
	                SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.CHINA); 
	                return sdf.format((Date) value); 
	            } 
	            return value == null ? "" : value.toString(); 
	        } catch (Exception e) { 
	            return ""; 
	        } 
	    } 
	
	 
}
