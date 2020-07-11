import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.DataInputStream;
import java.io.RandomAccessFile;
import java.net.Socket;
import java.net.UnknownHostException;

import net.sf.json.JSONObject;



public class SocketClient {

    public static void main(String args[])throws Exception {

        try {
            Socket socket = new Socket("localhost",8001);

            //获取输出流，向服务器端发送信息
            OutputStream os=socket.getOutputStream();//字节输出流
            PrintWriter pw=new PrintWriter(os);//将输出流包装为打印流
            pw.write("我是Java服务器");
            pw.flush();

           
            InputStream is=socket.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is));
            
            String info=in.readLine();
            System.out.println("我是客户端，Python服务器说："+info);
            
            pw.write("没毛病老铁");
            pw.flush();
            
            DataInputStream din=new DataInputStream(new BufferedInputStream(is));
            File f=new File("D:/test/5.png");
            RandomAccessFile fw=new RandomAccessFile(f,"rw");
            byte[] b=new byte[1024];
			int num=din.read(b);
            
			
            while(num!=-1){
            	fw.write(b,0,num);
            	fw.skipBytes(num);
            	num=din.read(b);
            	System.out.println(num);
            }      
            
            		
            
            din.close();
            is.close();
            in.close();
            socket.close();
        } catch (UnknownHostException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}