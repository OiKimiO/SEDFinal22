package com.pkfinal.eng.service.impl;

import java.io.File;

public class CheckFileName {
	public String getCheckFileName(String filePath, String orgFileName, String fileExt) {
		boolean isCheck		   = true;
		String  returnFileName = null;
		
		String  fullFilePath   = null;
		File  	file		   = null;
		
		int i = 0;
		while(isCheck) {
			fullFilePath = filePath +"\\" + orgFileName + fileExt;	// 전체 파일 경로를 설정한 후
			System.out.println(fullFilePath);
			file	= new File( fullFilePath); // 전체 파일 경로에 해당되는 파일의 File 객체를 생성한다
			if( file.exists()) {// 파일 객체가 이미 존재할 경우 
				System.out.println("투루");
				i++; 			// i의 값을 더하여 
				orgFileName = orgFileName + String.valueOf(i); // 더한 i의 값으로 원본파일에 문자를 더하고
			} else {	// 그렇지 않을 경우 
				System.out.println("포스");
				isCheck = false;	// isCheck를 false로 바꾸어 if문을 빠져나온다.
			}
		}
		
		returnFileName = orgFileName + fileExt; // 위의 작업을 거친 파일이름 + 확장자를 returnFile로 잡아서 return한다. 
		
		return returnFileName;
	}
}
