package bi3.pages.startMenu

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List

class StartMenuPage extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(linkText="Add Page...")
	WebElement linkAddPage;
	
	@FindBy(linkText="My Pages...")
	WebElement linkMyPages;
	
	@FindBy(css="#h5TabHome")
	WebElement lblStart;
	
	@FindBy(xpath="//*[contains(text(),'Start Page')]")
	WebElement lblStartPage;
	
	@FindBy(xpath="//*[@id='gvMenuSettings']/li")
	List<WebElement> listMenu;
	
	@FindBy(xpath="//*[@id='gvMenuSettings']/li/a")
	WebElement lblNewPage;
	
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
	
		/**
	 * Take Start Label Value
	 */
	def getStartLblValue() {
		waitToBeDisplayed(lblStart)
		return lblStart.text;

	}
	
		/**
	 * Take Start Page Label
	 */
	def getStartPageLblValue() {
		waitToBeDisplayed(lblStartPage)
		return lblStartPage.text;

	}
	
		
	/**
	 * Get List of values from start menu
	 */
	def List<String> getTextList() {
		waitForLoadingComplete
		listMenu.textList

	}
		/**
	 * Verify page name after dragging the page
	 */
	def String getAddedPageName() {
		waitToBeDisplayed(lblNewPage)
		return lblNewPage.text;

	}
	
}
