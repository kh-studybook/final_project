package kh.finalproject.studybook.task;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import kh.finalproject.studybook.domain.Mail;

@Component
public class SendMail {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	public void sendMail(Mail vo) {
		MimeMessagePreparator mp=new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception{
				//두번째 인자 true는 멀티파트메시지를 사용하겟다는 의미.
				MimeMessageHelper helper
					=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				
				
				helper.setText(vo.getContent(),true); //두번째 인자는 html을 사용하겟다는 의미
			
				
			}
		};
		
		mailSender.send(mp);
		System.out.println("메일 전송 했습니다.");
	}
	
	
	
	

}

