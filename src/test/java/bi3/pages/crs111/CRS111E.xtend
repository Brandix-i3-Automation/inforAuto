package bi3.pages.crs111

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class CRS111E extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "CBEMAL")
	WebElement txtEmailAddr
	
	/**
	 * @Description: Enters passed text value to the email textbox
	 * @param : email is the email address of the user
	 */
	def void enterEmailAddress(String email){
		txtEmailAddr.EnterText(email)
	}
}