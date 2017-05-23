package bi3.pages.oss401

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class OSS401D extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "Next")
	WebElement btnNext
	
	def void clickNext(){
		btnNext.waitToBeClickable()
		btnNext.click()
		waitForLoadingComplete()
	}
}