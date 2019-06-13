package cn.xr.util;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


import com.sun.mail.util.MailSSLSocketFactory;

import cn.xr.bean.User;



/**
 * 邮件发送工具类
 * @author aibinxiao
 * @date 2017年11月9日 上午8:44:59
 */
public class MailUtil {
	public static final String HOST = "smtp.qq.com"; // QQ邮件服务器主机
    public static final String FROM = "1292189023@qq.com"; // QQ发件人的email  
    public static final String PWD = "zujlbryxihjpgjga"; // QQ发件人授权码
	// public static final String HOST = "smtp.163.com"; // 163邮件服务器主机
	// public static final String FROM = "xxx@163.com"; // 163发件人的email  
    // public static final String PWD = "xxx"; // 163发件人授权码
    
    /**
     * 获取Session
     * @return
     */
    public static Session getSession() {
    	Properties props = new Properties();
		props.put("mail.smtp.host", HOST); // 设置服务器地址  
        props.put("mail.smtp.auth" , true); 
        
        // QQ邮箱使用了SSL需要下面这段代码，163邮箱不需要
		MailSSLSocketFactory sf;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.socketFactory", sf);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
		
        
        Authenticator authenticator =  new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(FROM, PWD);
			}
		};
		Session session = Session.getInstance(props, authenticator);
		return session;
    }
    
    /**
     * 设置邮件内容
     * @param user
     * @return
     */
    public static String getContent(User user) {
    	///邮件的内容  
        StringBuffer sb = new StringBuffer("<h1>重置密码请点击以下链接：</h1><br><h3><a href='http://localhost:8080/ESMS/reset.jsp?code="+user.getCode()+"&username="+user.getUsername()+"'>重置密码</a></h3>");  
        return sb.toString();
    }
	
	/**
	 * 发送邮件
	 * @param user 激活邮件接收者
	 * @throws Exception
	 */
	public static void sendMail(User user) throws Exception {
		// 1.创建连接对象，连接到邮箱服务器
		Session session = getSession();
		// 打开调试，会打印与邮箱服务器回话的内容  
        session.setDebug(true);   
		// 2.创建邮件对象
		Message message = new MimeMessage(session);
		// 2.1设置发件人
		message.setFrom(new InternetAddress(FROM));
		// 2.2设置收件人
		InternetAddress[] address = {new InternetAddress(user.getEmail())};
		message.setRecipients(RecipientType.TO, address);
		// 2.3设置邮件的主题
		message.setSubject("来自ESMS网站的重置密码邮件");
		// 2.4设置邮件的正文
		String content = getContent(user);
		System.out.println("--send--" + content);
		message.setContent(content, "text/html;charset=UTF-8");
		// 2.5设置发送时间
		message.setSentDate(new Date());
		// 3.发送一封重置密码邮件
		Transport.send(message);
	}
	

}
