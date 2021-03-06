package bi3.pages

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import java.util.concurrent.TimeUnit

class LoginPage extends BasePage {

	new(WebDriver driver) { // Constructor
		super(driver)
		
	}
	
	@FindBy(css = ".table.table-striped.table-bordered")
    WebElement txtUserName;
    
    @FindBy(css = ".table.table-striped.table-bordered")
    WebElement txtPassword;
    
    @FindBy(id="MenuTabLabel")
    WebElement lblMenu;
	
	@FindBy(xpath="//div[@class='gvWidgetHeader']/span[contains(text(),'Menu')]/../..//div[@class='gvFillAbsolute']//li")
	WebElement MenuWidgetOptions;
    
	def void GoTo() {	
		try {
			driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
			var labelName = lblMenu.getText();
			println(labelName);

		} catch (Exception e) {
			driver.get("http://t-deepikag:bi3@0330@bi3-m313-01.brandixlk.org:44056/mne/");
		} finally {
			driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
			waitForLoadingComplete();
			// Wait for Home page loaded
			waitToBeDisplayed(MenuWidgetOptions, 120);
		}
		
	}

}
