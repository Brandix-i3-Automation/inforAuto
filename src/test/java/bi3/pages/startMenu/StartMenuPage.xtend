package bi3.pages.startMenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class StartMenuPage extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(linkText="Add Page...")
	WebElement linkAddPage;
	
	@FindBy(linkText="My Pages...")
	WebElement linkMyPages;
	
	/**Navigates to Add Page*/
	def void goToAddPage(){
		Thread.sleep(2000);
		waitToBeClickable(linkAddPage);
		linkAddPage.click(); 
		waitForLoadingComplete();
	}
	
	/**Navigates to My Pages*/
	def void goToMyPages(){
		waitToBeClickable(linkMyPages);
		linkMyPages.click();
		waitForLoadingComplete();
	}
	
}
