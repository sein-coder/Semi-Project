package common.record;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class RecordFile {
	
	public static File recordFile(Process pro,String type,String path) {
		
		String message=""; //message를 저장할 String변수
		File f = null; //반환용 파일객체

		try {
			f = new File(path+"/"+type+".txt");
			InputStream is = null;
			if(!(type.contains("error"))) { //error타입인지 output타입인지 검사
				is = pro.getInputStream();
			}else {
				is = pro.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(is,"MS949");
			BufferedReader bs = new BufferedReader(isr);
			
			if(!(f.exists())) { //파일 미존재시 새로 생성
				f.createNewFile();
			}
			
			String line;
			while((line=bs.readLine())!=null) {
					message+=line+"\n";
			}
		
		//파일에 메세지 쓰기
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f),"MS949"));
		writer.write(message);
		writer.close();
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
}
