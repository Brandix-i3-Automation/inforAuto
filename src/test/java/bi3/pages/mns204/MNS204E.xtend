package bi3.pages.mns204

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List

class MNS204E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WWUSID")
	WebElement txtUser
	
	@FindBy(id="WWSIID")
	WebElement txtServiceId
	
	@FindBy(id="WWFMTP-shdo")
	WebElement cmbLayout
	
	@FindBy(id="WWSAVE")
	WebElement chkSaveOutput
	
	@FindBy(id="WWRFPI-shdo")
	WebElement cmbDirectSel
	
	@FindBy(id="WWRFPB-shdo")
	WebElement cmbBackgroundSel
	
	@FindBy(xpath="//ul[@id='dropdown-list']/ li[text()='A4']")
	WebElement optionA4
	
	@FindBy(css="ul[class='dropdown-list'] >li")
	List <WebElement> listLayout;
	
	/**
	 * Add User
	 */
	def void addUser(){
		txtServiceId.click();
		txtServiceId.sendKeys("BASE_20102");
		selectFromDropdown(cmbLayout,listLayout,"A4")
		chkSaveOutput.click();
		selectFromDropdown(cmbDirectSel,listLayout,"1-Yes");
		selectFromDropdown(cmbBackgroundSel,listLayout,"1-Yes");
		clickOnNext();	
	}
}