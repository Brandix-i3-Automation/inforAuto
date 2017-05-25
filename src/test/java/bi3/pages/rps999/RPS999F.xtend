package bi3.pages.rps999

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import bi3.pages.ProgramCommons

class RPS999F extends ProgramCommons{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WFITNO")
	WebElement txtFromItemNo
	
	/**
	 * enter item number and submit
	 * @param : Item Number
	 */
	def enterItemNo(String item){
		txtFromItemNo.click();
		clearRobustly(txtFromItemNo);
		txtFromItemNo.sendKeys(item);
		txtFromItemNo.sendKeys(Keys.ENTER);
	}
}