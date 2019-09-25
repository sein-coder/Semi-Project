package com.umo.webCompiler.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static common.record.RecordFile.recordFile;

public class webCompilerService {

	public List<File> compile(String lang, File f) {
		switch (lang) {
		case "Java":
			return javaCompile(f);
		case "HTML":
			break;
		case "JavaScript":
			break;
		}
		return null;
	}
	
	public List<File> javaCompile(File f) {
		List<File> files = new ArrayList();
		String path = f.getParentFile().getParent()+"/outputCode/";
		String fileName = f.getName().substring(0, f.getName().lastIndexOf('.'));
		try {			
			Process compilepro = Runtime.getRuntime().exec("javac "+f.getPath());
			
			files.add(recordFile(compilepro,"compile_message",path,"$javac "+fileName+".java"));
			files.add(recordFile(compilepro,"compile_error_message",path));
			//execute시작
			
			f.delete();
			
			Thread.sleep(1000);
			File excutefile = new File(f.getParent()+"/"+fileName+".class");
			if(excutefile.exists()) {				
				Process executepro = Runtime.getRuntime().exec("java "+fileName, null, new File(f.getParent()));	
				files.add(recordFile(executepro,"execute_message",path,"$java "+fileName));
				files.add(recordFile(executepro,"execute_error_message",path));
				excutefile.delete();
			}
		}
		catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
		}

		return files;
	}
	
}
