package bi3.pages.mns205

import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.pages.BasePage
import java.util.List
import org.openqa.selenium.WebDriver

class MNS205F extends BasePage {

	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WPTOMA-shdo")
	WebElement cmbToEmail;

	@FindBy(css="ul#dropdown-list li")
	List<WebElement> listToEmail;

	@FindBy(id="WWTOMA")
	WebElement txtToEmail;

	@FindBy(id="WPFRMA-shdo")
	WebElement cmbFromEmail;

	@FindBy(css="ul#dropdown-list li")
	List<WebElement> listFromEmail;

	@FindBy(id="WWFRMA")
	WebElement txtFromEmail;

	@FindBy(id="WPSUBJ-shdo")
	WebElement cmbSubject;

	@FindBy(css="ul#dropdown-list li")
	List<WebElement> listSubject;

	@FindBy(id="WWSUBJ")
	WebElement txtSubject;

	def void setToEmail(String drpDownVal, String value) {
		waitForLoadingComplete();
		selectFromDropdown(cmbToEmail, listToEmail, drpDownVal);
		txtToEmail.sendKeys(value);
	}

	def void setFromEmail(String drpDownVal, String value) {
		waitForLoadingComplete();
		selectFromDropdown(cmbFromEmail, listFromEmail, drpDownVal);
		txtFromEmail.sendKeys(value);
	}

	def void setSubject(String drpDownVal, String value) {
		waitForLoadingComplete();
		selectFromDropdown(cmbSubject, listSubject, drpDownVal);
		txtSubject.sendKeys(value);
	}
}