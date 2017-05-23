package bi3.pages.mns204

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.Keys

class MNS204B extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	/** */
	@FindBy(css="div[id*='MNA204BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	/**User search text box */
	@FindBy(id="W1USID")
	WebElement txtUser;
	
	/**First row */
	@FindBy(xpath="//div[@row='0']")
	WebElement rowFirst
	
	/**
	 * Program return true if user exist
	 * @param : user name
	 */
	def boolean checkUserAvailable(String user){
		waitForLoadingComplete();
		txtUser.click();
		clearRobustly(txtUser);
		txtUser.sendKeys(user);
		txtUser.sendKeys(Keys.ENTER);
		var grid = new InforGrid(gridElement);
			var row = grid.getRowsContainingTextInColumn(2,user).length;
			if(row!=0){
				return true;
			}
			return false;
	}
	
	/**
	 * Delete user
	 * @param: user name
	 */
	def void deleteUser(){
		waitForLoadingComplete();
		rowFirst.click();
		Thread.sleep(2000);
		pressShortcutKeys("4");
		waitForLoadingComplete();
		clickOnNext();
	}
}