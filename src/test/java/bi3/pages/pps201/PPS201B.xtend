package bi3.pages.pps201

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import org.testng.asserts.Assertion
import org.testng.Assert

class PPS201B extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(css="div[id*='PPA201BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
 	
 	@FindBy(id="WBITNO")
 	WebElement txtItemNo;
 	
 	@FindBy(id="WBORQA")
 	WebElement txtOrderQty;
 	
 	@FindBy(id="WBPUUN")
 	WebElement txtPOu;
 	
 	@FindBy(id="WBPUPR")
 	WebElement txtPurchPrice;
 	
 	@FindBy(id="XT_0106")
 	WebElement btnAdd
 	
 	@FindBy(id="dbtnent")
 	WebElement btnNextPopUp
	
	def boolean CheckIfDetailsGridEmpty(){
		var grid = new InforGrid(gridElement)
		if(grid.rowCount==0){
			return true;
		}else{
			return false;
		}
	}
	
	def verifyStatus(){
		if(CheckIfDetailsGridEmpty()==false){
			var grid = new InforGrid(gridElement);
			var col = grid.getRowsContainingTextInColumn(3,"15").length;
			var row = grid.rowCount;
			Assert.assertEquals(col,row,"PO is not in Status 15")
		}
	}
	
	def void fillLineEntry(String itemNo, String orderQty, String POu, String purPrice){
		txtItemNo.click();
		txtItemNo.sendKeys(itemNo);
		txtOrderQty.click();
		txtOrderQty.sendKeys(orderQty);
		txtPOu.click();
		txtPOu.sendKeys(POu);
		txtPurchPrice.click();
		txtPurchPrice.sendKeys(purPrice);
		btnAdd.click();
		clickOnNext();
		clickOnNext();
		clickOnNext();
		clickOnNext();
		btnNextPopUp.click();
	}
	
	
}