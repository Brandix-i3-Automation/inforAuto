package bi3.pages.mms130

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class MMS130E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "WLALOC")
	WebElement chkbAllocatable
	
	@FindBy(id = "Next")
	WebElement btnNext
	
	def void checkAllocatable(){
		chkbAllocatable.waitToBeDisplayed()
		var checked = chkbAllocatable.getAttribute("aria-checked")
		if(checked.equals("false")){
			chkbAllocatable.waitToBeClickable()
			chkbAllocatable.click()
		}
	}
	
	def void clickNext(){
		btnNext.waitToBeClickable()
		btnNext.click()
		waitForLoadingComplete()
	}
}