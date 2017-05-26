package bi3.pages.oss402

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class OSS402E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "WEFTWH")
	WebElement chckbFCMtdFrWhs
	
	def void selectFCMtdFrWhs(){
		var checked = chckbFCMtdFrWhs.getAttribute("aria-checked")
		if(checked.equals("false")){
			//chckbFCMtdFrWhs.waitToBeClickable() // Commented due to unwanted delay			
			chckbFCMtdFrWhs.click()
		}
	}
}