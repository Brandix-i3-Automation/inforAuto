package bi3.pages.pps200

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.By

class PPS200B extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="W1OBKV")
	WebElement txtPONo
	
	@FindBy(css="div[id*='PPA200BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	@FindBy(xpath = "//a/span[text()='Copy']")
	WebElement linkCopy
	
	@FindBy(xpath = "//a[text()='Related']")
	WebElement linkRelated
	
	@FindBy(xpath = "//a/span[text()='Lines']")
	WebElement linkLines
	
	@FindBy(xpath = "//button[@class='inforIconButton new']")
	WebElement btnCreate
	
	@FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
	
	
	def boolean SearchPONo(String po){
		waitForLoadingComplete();
		txtPONo.waitToBeClickable()
		txtPONo.click()
		txtPONo.clearRobustly()
		txtPONo.sendKeys(po)
		txtPONo.sendKeys(Keys.ENTER)
		waitForLoadingComplete()
		
		var grid = new InforGrid(gridElement)
		var row = grid.getCellsFromRow(0)
		
		if(row.get(0).text.equals(po)){
			return true;
		}else{
			return false;
		}
		
	}
	
	def void copyPO(String po){
		waitForLoadingComplete();
		var grid = new InforGrid(gridElement)
		var row = grid.getRowContainingTextInColumn(1,po)
		row.waitToBeClickable()
		row.rightClick()
		linkCopy.waitToBeClickable()
		linkCopy.click()
		waitForLoadingComplete()
	}
	
	def String GetLstOfRecordWithPO(String po){
		waitForLoadingComplete();
		var grid = new InforGrid(gridElement)
		var rowData = grid.getDataOfRowContainingTextInColumn(1,po)
		return rowData.get(1)
	}
	
	def void GoToLinesOfRecordWithPO(String po){
		waitForLoadingComplete();
		var grid = new InforGrid(gridElement)
		var row = grid.getRowContainingTextInColumn(1,po)
		row.waitToBeClickable()
		row.rightClick()
		linkRelated.waitToBeClickable()
		linkRelated.click()
		linkLines.waitToBeClickable()
		linkLines.click()
	}
	
	/**
	 * methods types PO No in the Grid
	 */
	def void CreatePO(String PONo){
		txtPONo.click();
		clearRobustly(txtPONo);
		txtPONo.sendKeys(PONo);
	}
	
	/**
	 * Opens PO
	 * @param: PO number
	 */
	 def void openPO(String PONo){
	 	if(SearchPONo(PONo)){
	 		driver.findElement(By.xpath("//a[text()='"+PONo+"']")).click();	
	 	}
	 }
	 
	 def String verifyLowerStatus(String PONo){
	 	CreatePO(PONo);
	 	txtPONo.sendKeys(Keys.ENTER)
	 	waitForLoadingComplete();
	 	var grid = new InforGrid(gridElement);
	 	return grid.getColumnValByColumnHeader("Lst", 0);
	 	
	}
	
	def String verifyHighestStatus(String PONo){
	 	CreatePO(PONo);
	 	txtPONo.sendKeys(Keys.ENTER)
	 	waitForLoadingComplete();
	 	var grid = new InforGrid(gridElement);
	 	return grid.getColumnValByColumnHeader("Hst", 0);
	 	
	}
	
	/**
	 * methods types to create PO
	 */
	def void CreatePOno(){
		txtPONo.click();
		clearRobustly(txtPONo);
		btnCreate.click();
		waitForLoadingComplete();
	}
	
	/**
	 * Opens PO
	 * @param: PO number
	 */
	 def String verifyLowerStatusatLines(String itemNo){
	 	
	 		return driver.findElement(By.xpath("//a[text()='"+itemNo+"']//preceding::div[2]")).text;
	 	
	 }
	 
	 /**
	 * Close Panal
	 */
	 def void closePanal(){
 		btnAction.click();
 		waitForLoadingComplete();
 		linkClose.click();
 		waitForLoadingComplete();
 	}
}