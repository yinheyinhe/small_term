package mvc.spring.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;



public class VerifyCodeServlet{
	public BufferedImage image;
	public String code;
	public VerifyCodeServlet() {
		int width = 20;
		int height = 10;
		
		BufferedImage image = new BufferedImage(20,10,BufferedImage.TYPE_INT_RGB);
		Graphics2D g = image.createGraphics();
		
		//设置相关颜色等等
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		
		g.setColor(Color.BLACK);
		g.drawRect(0,0,width-1,height-1);

			
		//定义生成随机数的对象
		Random random = new Random();
		//每个字符占据的宽度
		int x = 10;
		int y = 16;
		    
		StringBuffer str_random = new StringBuffer();//定义成缓冲字符类型是为了提高效率
		    
		char[] codeSets = {
		    	'a','b','c','d','e','f','g','h','i','j','k','l','m',
		    	'n','o','p','q','r','s','t','u','v','w','x','y','z',
		    	'A','B','C','D','E','F','G','H','I','J','K','L','M',
		    	'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
		    	'0','1','2','3','4','5','6','7','8','9'		
		};
		    
		//产生随机数
		//定义随机数的个数
		int length = 4;
		//定义 变量存储随机数字变量

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
		    code = str_random.toString();
		//request.getSession().setAttribute("codess",str_random.toString());
		    		    
		//产生干扰线
		for(int i=0;i<50;i++){
		    //设置40条干扰点
			int red = random.nextInt(255);
		    int green = random.nextInt(255);
		    int blue = random.nextInt(255);
		    g.setColor(new Color(red,green,blue));
		    g.drawOval(random.nextInt(20), random.nextInt(10), 1, 1);
		}
		
		//response.setContentType("image/jpeg");
	    //response.setHeader("Pragam","no-cache");
	    //response.setHeader("Cache-Control","no-cache");
	    //response.setDateHeader("Expires",0);
	    
	    //ServletOutputStream outputstream = response.getOutputStream();
	    //ImageIO.write(image, "jpeg", outputstream);
		    
		    
	    image.flush();//刷新与图像缓冲有关的数据
	    g.dispose();//释放与Graphice2D有关的对象的资源
	    //out.flush();
	    //out.close();
		
	}
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public BufferedImage getBufferedImage() {
		return image;
	}

	public void setBufferedImage(BufferedImage image) {
		this.image = image;
	}


}