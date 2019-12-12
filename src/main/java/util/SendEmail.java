package util;

import com.sun.mail.util.MailSSLSocketFactory;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

//    public static final String HOST = "smtp.163.com"; //163邮箱
    public static final String HOST = "smtp.qq.com"; //qq邮箱
    public static final String PROTOCOL = "smtp";
//    public static final int PORT = 25; //163邮箱的默认端口
    public static final int PORT = 465; //qq邮箱的默认端口465或587
    public static final String FROM = "1396737618@qq.com";//发件人的email
    public static final String PWD = "fcqemhjqsaaoghej";//发件人密码或授权码

    /**
     * 获取Session
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);//设置服务器地址
        props.put("mail.store.protocol" , PROTOCOL);//设置协议
        props.put("mail.smtp.port", PORT);//设置端口
        props.put("mail.smtp.auth" , true);
        //qq邮箱需要开启SSL，163邮箱不需要开启，以下SSL代码可以不需要
        //SSL start
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        //SSL end


        Authenticator authenticator = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }

        };

        //根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getDefaultInstance(props , authenticator);

        return session;
    }

    public static void send(String toEmail , String content) {
        Session session = getSession();
        try {
            System.out.println("--send--"+content);
            // Instantiate a message
            Message msg = new MimeMessage(session);

            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("账号激活邮件");
            msg.setSentDate(new Date());
            msg.setContent(content , "text/html;charset=utf-8");

            //Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
