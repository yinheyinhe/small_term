package mvc.spring.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.commons.io.*;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

public class SocketClient {
	private Socket socket;
	private PrintWriter pw;	
	private InputStream is;
	private BufferedReader in;
	private String name;
	private	String Password;
	public SocketClient(){
		setName("www");
		setPassword("hhh");
		try {
			socket = new Socket("localhost",8001);
			OutputStream os=socket.getOutputStream();
			pw=new PrintWriter(os);//将输出流包装为打印流
			is=socket.getInputStream();
	        in = new BufferedReader(new InputStreamReader(is));//将输入流打包为输入流
	        
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean Registe(String name,String Password) throws IOException{
		this.name=name;
		this.Password=Password;
		pw.write("register_"+name+"_"+Password);
		pw.flush();
		
		String registe_flag=in.readLine();
		if(registe_flag.equalsIgnoreCase("yes")){
			return true;
		}
		else{
			return false;
		}
				
	}
	
	public boolean Sign(String name,String Password) throws IOException{
		this.name=name;
		this.Password=Password;
		pw.write("sign"+"_"+name+"_"+Password);
		pw.flush();
		
		String Sign_flag=in.readLine();
		if(Sign_flag.equalsIgnoreCase("yes")){
			DataInputStream din=new DataInputStream(new BufferedInputStream(is));
            File f=new File("D:/test/data.json");
            RandomAccessFile fw=new RandomAccessFile(f,"rw");
            byte[] b=new byte[1024];
			int num=din.read(b);
			while(num!=-1){
            	fw.write(b,0,num);
            	fw.skipBytes(num);
            	num=din.read(b);
            	
            } 
			String t=in.readLine();
			System.out.println(t);
			din.close();
			
			return true;
		}
		else{
			return false;
		}
	}

	public boolean delete(String name,String Password) throws IOException{
		this.name=name;
		this.Password=Password;
		pw.write("delete_"+name+"_"+Password);
		pw.flush();
		
		String delete_flag=in.readLine();
		if(delete_flag.equalsIgnoreCase("yes")){
			return true;
		}
		else{
			return false;
		}
	}
	//close output and input stream
	public void closeall() throws IOException{
        is.close();
        in.close();
        socket.close();
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	
	public JSONObject readjson() throws IOException
	{
		/*String[] x=new String[5];
    	String[] y=new String[5];
		File file = new File("D:data.json");
        String content = FileUtils.readFileToString(file, "UTF-8");*/
        JSONObject jsonObject = {"data":[{"date":"2020-06-17","t_max":"37.072013","t_min":"28.946019","t_average":"32.573651"}
        ,{"date":"2020-06-18","t_max":"36.463330","t_min":"28.732085","t_average":"32.503298"},
        {"date":"2020-06-19","t_max":"36.613136","t_min":"28.363440","t_average":"32.546272"},
        {"date":"2020-06-20","t_max":"36.771237","t_min":"28.762855","t_average":"32.698092"},
        {"date":"2020-06-21","t_max":"36.942795","t_min":"28.724057","t_average":"32.738825"}]}//new JSONObject(content);
        //System.out.println( jsonObject.getJSONArray("data"));
        /*JSONArray jsonArray = (JSONArray) jsonObject.get("data");
        for(int i=0;i<5;i++){
        	JSONObject job = jsonArray.getJSONObject(i);
        	//System.out.println(job.get("date"));
        	x[i]=String.valueOf(job.get("date"));
        	//System.out.println(job.get("t_average"));
        	y[i]=String.valueOf(job.get("t_average"));
        }
        for(int i=0;i<5;i++){
        	System.out.println(x[i]);
        	System.out.println(y[i]);
        }*/
        return jsonObject;
    }
	

}
