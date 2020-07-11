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

            //��ȡ���������������˷�����Ϣ
            OutputStream os=socket.getOutputStream();//�ֽ������
            PrintWriter pw=new PrintWriter(os);//���������װΪ��ӡ��
            pw.write("����Java������");
            pw.flush();

           
            InputStream is=socket.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is));
            
            String info=in.readLine();
            System.out.println("���ǿͻ��ˣ�Python������˵��"+info);
            
            pw.write("ûë������");
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