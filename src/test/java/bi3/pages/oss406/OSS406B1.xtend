package bi3.pages.oss406

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.pages.ToolbarPage
import org.openqa.selenium.Keys
import bi3.framework.elements.inforelements.InforGrid

class OSS406B1 extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "W1SSTT")
	WebElement txtTtpSearch
	
	@FindBy(css="div[id*='OSA406BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	def void enterTtp(String ttp){
		txtTtpSearch.EnterText(ttp)
	}
	
	def void create(){
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.clickCreateLogo()
		waitForLoadingComplete()
	}
	
	def boolean searchTransaction(String ttp){
		txtTtpSearch.EnterText(ttp)
		txtTtpSearch.sendKeys(Keys.ENTER)
		waitForLoadingComplete()
		var InforGrid grid = new InforGrid(gridElement)
		var colId = grid.getColumnIndexByname("Ttp")
		var rowData = grid.getDataOfRow(0)
		if(rowData.get(colId).equals(ttp)){
			return true
		}else{
			return false
		}
	}
}