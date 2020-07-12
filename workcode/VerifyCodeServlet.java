package test;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;



public class VerifyCodeServlet{
	public void doGet() {
		int width = 45;
		int height = 20;
		
		BufferedImage image = new BufferedImage(45,20,BufferedImage.TYPE_INT_RGB);
		Graphics2D g = image.createGraphics();
		
		//���������ɫ�ȵ�
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		
		g.setColor(Color.BLACK);
		g.drawRect(0,0,width-1,height-1);

			
		//��������������Ķ���
		Random random = new Random();
		//ÿ���ַ�ռ�ݵĿ��
		int x = 10;
		int y = 16;
		    
		StringBuffer str_random = new StringBuffer();//����ɻ����ַ�������Ϊ�����Ч��
		    
		char[] codeSets = {
		    	'a','b','c','d','e','f','g','h','i','j','k','l','m',
		    	'n','o','p','q','r','s','t','u','v','w','x','y','z',
		    	'A','B','C','D','E','F','G','H','I','J','K','L','M',
		    	'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		    	'0','1','2','3','4','5','6','7','8','9'		
		};
		    
		//���������
		//����������ĸ���
		int length = 4;
		//���� �����洢������ֱ���

		for(int i=0;i<length;i++){
			String code = String.valueOf(codeSets[random.nextInt(codeSets.length)]);
		    int red = random.nextInt(255);
		    int green = random.nextInt(255);
		    int blue = random.nextInt(255);
		    g.setColor(new Color(red,green,blue));
		    	
		    int size = new Random().nextInt(11) + 10;
			Font font = new Font("Times New Roman",Font.PLAIN,18);
			g.setFont(font);
			
			g.drawString(code, i * x + 1, y);
			str_random.append(code);
		}
		    
		    		    
		//����������
		for(int i=0;i<50;i++){
		    //����40�����ŵ�
			int red = random.nextInt(255);
		    int green = random.nextInt(255);
		    int blue = random.nextInt(255);
		    g.setColor(new Color(red,green,blue));
		    g.drawOval(random.nextInt(45), random.nextInt(20), 1, 1);
		}
	    
		
		try {
			File file = new File("d:/test.jpg");
			ImageIO.write(image, "jpg", file);
			System.out.println("�ɹ����浽��"+file.getAbsolutePath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("����ʧ��");
			e.printStackTrace();
		}
		
		
	    image.flush();//ˢ����ͼ�񻺳��йص�����
	    g.dispose();//�ͷ���Graphice2D�йصĶ������Դ
	}


	public static void main(String[] args) {
		VerifyCodeServlet v = new VerifyCodeServlet();
		v.doGet();
	}
}