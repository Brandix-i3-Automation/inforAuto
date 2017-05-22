package bi3.pages.mms130

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List

class MMS130A extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "Next")
	WebElement btnNext
	
	@FindBy(id = "WWITNO")
	WebElement txtItemNumber
	
	@FindBy(id = "WACALT-shdo")
	WebElement btnCalcMethod
	
	@FindBy(css = "#dropdown-list>li")
	List<WebElement> listOptions
	
	def void setItemNumber(String item){
		txtItemNumber.EnterText(item)
	}
	
	def void clickNext(){
		btnNext.waitToBeClickable()
		btnNext.click()
		waitForLoadingComplete()
	}
	
	def void setCalcMethod(String method){
		selectFromDropdown(btnCalcMethod,listOptions,method)
		waitForLoadingComplete()
	}
}