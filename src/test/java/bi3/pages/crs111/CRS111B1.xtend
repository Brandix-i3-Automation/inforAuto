package bi3.pages.crs111

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.Keys
import bi3.pages.ToolbarPage

class CRS111B1 extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "W1EMTP")
	WebElement txtTypeSearch
	
	@FindBy(id = "W1EMKY")
	WebElement txtEmailKeySearch
	
	@FindBy(css="div[id*='CRA111BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	/**
	 * @Description: Search for a particular email key for a user
	 * @param : type is the type of the email key
	 * @param : emailKey is the user ID
	 */
	def boolean searchForEmailKey(String type,String emailKey){
		txtTypeSearch.EnterText(type)
		txtEmailKeySearch.EnterText(emailKey)
		txtEmailKeySearch.sendKeys(Keys.ENTER)
		waitForLoadingComplete()
		var grid = new InforGrid(gridElement)
		var typeCol = grid.getColumnIndexByname("Tpe")
		var emailKeyCol = grid.getColumnIndexByname("E-mail key")
		if(grid.rowCount==0){
			return false;
		}else{
			var row = grid.getRow(0)
			row.waitToBeClickable()
			row.click()
			return true;
		}
	}
	
	/**
	 * @Description: Clicks the delete button from the Options menu
	 */
	def void clickDelete(){
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.ClickOption_Delete()
		waitForLoadingComplete()
	}
	
	/**
	 * @Description: Clicks the create button and redirects to CRS111E page
	 */
	def void clickCreate(String type,String emailKey){
		txtTypeSearch.EnterText(type)
		txtEmailKeySearch.EnterText(emailKey)
		txtEmailKeySearch.sendKeys(Keys.chord(Keys.CONTROL,"-","1"))
		waitForLoadingComplete()
	}
	
	def void refreshPage(){
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.ClickAction_Refresh()
		waitForLoadingComplete()
	}
}