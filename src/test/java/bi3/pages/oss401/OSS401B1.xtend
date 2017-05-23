package bi3.pages.oss401

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import bi3.framework.elements.inforelements.InforGrid
import bi3.pages.ToolbarPage

class OSS401B1 extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "W1SBDS")
	WebElement txtDatasetSearch
	
	@FindBy(css="div[id*='OSA401BS'][class*='inforDataGrid']")
	WebElement grid
		
	def boolean searchDataSet(String dataset){
		txtDatasetSearch.EnterText(dataset)
		txtDatasetSearch.sendKeys(Keys.ENTER)
		waitForLoadingComplete()
		var InforGrid grid = new InforGrid(grid)
		var rowData = grid.getDataOfRow(0)
		if(rowData.get(0).equals(dataset)){
			return true
		}else{
			return false;
		}
	}
	
	def void deactivateDataset(String dataset){
		var InforGrid grid = new InforGrid(grid)
		var colId = grid.getColumnIndexByname("Dtaset")
		var row = grid.getRowContainingTextInColumn(colId+1,dataset)
		row.waitToBeClickable()
		row.click()
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.clickRelated("Deactivate")
		waitForLoadingComplete()
	}
	
	def void activateDataset(String dataset){
		var InforGrid grid = new InforGrid(grid)
		var colId = grid.getColumnIndexByname("Dtaset")
		var row = grid.getRowContainingTextInColumn(colId+1,dataset)
		row.waitToBeClickable()
		row.click()
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.clickRelated("Activate")
		waitForLoadingComplete()
	}
	
	def String getStsOfDataset(String dataset){
		var InforGrid grid = new InforGrid(grid)
		var stsId = grid.getColumnIndexByname("Sts")
		var dtsId = grid.getColumnIndexByname("Dtaset")
		var data = grid.getDataOfRowContainingTextInColumn(dtsId+1,dataset)
		return data.get(stsId)
	}
	
	def void deleteDataset(String dataset){
		var InforGrid grid = new InforGrid(grid)
		var colId = grid.getColumnIndexByname("Dtaset")
		var row = grid.getRowContainingTextInColumn(colId+1,dataset)
		row.waitToBeClickable()
		row.click()
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.ClickOption_Delete()
		waitForLoadingComplete()
	}
	
	def void createNewDataset(String dataset){
		txtDatasetSearch.EnterText(dataset)
		txtDatasetSearch.sendKeys(Keys.chord(Keys.CONTROL,"-","1"))
	}
	
	def void refreshPage(){
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.ClickAction_Refresh()
	}
	
}