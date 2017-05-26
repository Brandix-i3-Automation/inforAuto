package bi3.pages.mns205

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import bi3.pages.ToolbarPage
import org.openqa.selenium.Keys

class MNS205B1 extends ToolbarPage {

	new(WebDriver driver) {
		super(driver)
	}

	@FindBy(id="WWSTYN")
	WebElement txtStyle;

	@FindBy(css="div[id*='MNA205BS'][class*='inforDataGrid']")
	WebElement gridMNS205;

	/**
	 * Set values to header fields of the grid
	 * @param prntfile prntfile
	 * @param user user
	 * @param location location
	 * @param media media
	 */
	def setGridHeaderValues(String prntfile, String user, String location, String media) {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMNS205);

		if (prntfile != "") {
			// Not Implemented
		}
		if (user != "") {
			grid.setValueToColumnSearchField("User", user);
		}
		if (location != "") {
			// Not Implemented
		}
		if (media != "") {
			grid.setValueToColumnSearchField("Media", media);
		}
	}
	
	/**
	 * Program return true if user exist
	 * @param : user name
	 */
	def boolean checkUserAvailable(String user) {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMNS205);
		grid.setValueToColumnSearchField("User", user).sendKeys(Keys.ENTER);
		waitForLoadingComplete();
		var rowCount = grid.getRowCount();
		if (rowCount < 1) {
			return false;
		} 
		else {
			var row = grid.getRowsContainingTextInColumn(2, user).length;
			if (row != 0) {
				return true;
			}
			return false;
		}
	}
	
	/**
	 * Delete user
	 * @param: user name
	 */
	def void deleteUser(String user){
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMNS205);
		var rows = grid.getRowsContainingTextInColumn(2, user);
		if (rows.length != 0) {
			rows.get(0).click();			
		}		
		Thread.sleep(2000);
		pressShortcutKeys("4");
		waitForLoadingComplete();
		clickOnNext();
	}
}