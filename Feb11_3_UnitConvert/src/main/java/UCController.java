import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.puft.feb113.uc.UCDAO;
import com.puft.feb113.uc.UCResult;

@Controller
public class UCController {
    
	@Autowired
	private UCDAO ucd;
	
	@RequestMapping(value = "/unit.convert", method = RequestMethod.GET)
	public String unitConvert(UCResult ur, HttpServletRequest req) {
		
		ucd.convert(ur, req);
		return "output";
		
	}
	
}
