package bi3.pages.pps250

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.openqa.selenium.By
import org.openqa.selenium.Keys

class PPS250B1 extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WWPUNO")
	WebElement txtPoNumber;
	
	@FindBy(css="button[id*='XT']")
	WebElement btnApply;
	
	@FindBy(xpath="//a[text()='Related']")
 	WebElement linkRelated
 	
 	@FindBy(xpath="//span[text()='Change']/ancestor::a")
 	WebElement linkChange
	
	@FindBy(xpath="//a/span[text()='Confirmation']")
	WebElement linkConfirmation;
	
	@FindBy(css="div[id*='PPA250BS'][class*='inforDataGrid']")
	WebElement inforGrid;
	
	@FindBy(xpath="//input[@id='WBCFQA']")
	WebElement txtConfirmedQty;
	
	@FindBy(xpath="//input[@id='WBCODT']")
	WebElement txtConfDelDate;
	
	@FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
	
	
	def void enterPoNumber(String PoNumber)
	{
		waitForLoadingComplete();
		txtPoNumber.clearRobustly();
		txtPoNumber.sendKeys(PoNumber);
		btnApply.click();
	}
	
	def void clickConfirmation(String newRawMaterialNumber)
	{
		waitForLoadingComplete();
		var InforGrid inforGridPPS250 = new InforGrid(inforGrid);
		var matchingElement = inforGridPPS250.getRowContainingTextInColumn(3, newRawMaterialNumber);
		println("WEbELement "+matchingElement)
		matchingElement.rightClick();
		linkRelated.clickWhenReady();
		linkConfirmation.waitToBeClickable();
		linkConfirmation.click();
		
	}
	
	def String checkStatus(String newRawMaterialNumber)
	{
		waitForLoadingComplete();
		var InforGrid inforGridPPS250 = new InforGrid(inforGrid);
		var row = inforGridPPS250.getRowContainingTextInColumn(3,newRawMaterialNumber)
		println("WebElement of Row "+row);
		var cells = inforGridPPS250.getCellsFromRow(row);
		println("Cell List  "+cells);
		var status = cells.get(10).text;
		println("Status is " +status);
		
		return status;
		
	}
	
	def WebElement validatePanal(String panalName){
	 	var element = "//span[text()='"+panalName+" ']"
	 	driver.findElement(By.xpath(element))
	 }
	 
	 def String getConfirmedQTY(String newRawMaterialNumber)
	{
		waitForLoadingComplete();
		var InforGrid inforGridPPS250 = new InforGrid(inforGrid);
		var matchingElement = inforGridPPS250.getRowContainingTextInColumn(3, newRawMaterialNumber);
		println("WEbELement "+matchingElement)
		matchingElement.rightClick();
		linkChange.clickWhenReady();
		return txtConfirmedQty.text
			
	}
	
	def void clickEnter()
	{
		waitForLoadingComplete();
		txtConfirmedQty.click();
		txtConfirmedQty.sendKeys(Keys.ENTER);
		txtConfDelDate.click();
		txtConfDelDate.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
		
			
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