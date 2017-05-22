package bi3.pages.mms060

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class MMS060E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "WWPAQT")
	WebElement txtPendingPutAwayValue
	
	@FindBy(id = "Next")
	WebElement btnNext
	
	def String getPendingPutAwayValue(){
		txtPendingPutAwayValue.GetTextBoxvalue()
	}
	
	def void clickNext(){
		btnNext.waitToBeClickable()
		btnNext.click()
		waitForLoadingComplete()
	}
}