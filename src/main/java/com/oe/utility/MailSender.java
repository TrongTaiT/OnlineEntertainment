package com.oe.utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

public class MailSender {

	public MailSender() {
		super();
	}

	public static String sendEmail(String toEmail, String mailSubject, String mailBody, HttpServletRequest request) {
		try {
			Properties p = new Properties();
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "587");

			Session session = Session.getInstance(p, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					String username = "aesaurom@gmail.com";
					String password = "aesaurompro";
					request.setAttribute("fromEmail", username);
					return new PasswordAuthentication(username, password);
				}
			});

			String from = "aesaurom@gmail.com";
			String to = toEmail;
			String subject = mailSubject;
			String body = mailBody;

			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			msg.setSubject(subject);
			msg.setText(body);

			Transport.send(msg);
			return "Gửi email thành công!";
		} catch (Exception e) {
			e.printStackTrace();
			return "Gửi email thất bại!";
		}
	}

}
