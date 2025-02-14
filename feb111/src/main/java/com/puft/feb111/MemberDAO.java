


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//servlet-context.xml에 등록한 효과
@Service
public class MemberDAO {

	
	//Spring - MyBatis - Maven
	// 유지보수에 용이
	
	// 연/월/일 의 형태 ...
	//    => 연-월-일 시:분:초
	


	
	@Autowired
	private SimpleDateFormat sdf;
	
	public void test() {
		Date now = new Date();
		System.out.println(sdf.format(now));
		
	}
	
	
	
}
