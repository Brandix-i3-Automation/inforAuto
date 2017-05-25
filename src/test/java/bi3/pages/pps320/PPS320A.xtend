package bi3.pages.pps320

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys

class PPS320A extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "WWREPN")
	WebElement txtRecvngNo
	
	@FindBy(id = "WWWHLO")
	WebElement txtWarehouse
	
	@FindBy(id = "Next")
	WebElement btnNext
	
	@FindBy(id="MyCanvasLbl")
 	WebElement linkStart
 	
 	@FindBy(id="WWRESP")
 	WebElement txtResponsile
 	
 	@FindBy(xpath="//button[@id='ActionsBtn']") 
 	WebElement btnAction;
 	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F13']/ancestor::a") 
 	WebElement linkSetting;
 	
 	@FindBy(xpath="//input[@id='WWSPIC-shdo']") 
 	WebElement listOpeningPanal;
 	
 	@FindBy(xpath="//li[text()='A-Entry']") 
 	WebElement listAentry;
 	
 	@FindBy(xpath="//input[@id='WWPNLI']") 
 	WebElement txtLineNo;
 	
 	@FindBy(xpath="//input[@id='WWPUNO']") 
 	WebElement txtPono;
	
 	@FindBy(xpath="//span[@id='menuBar']/descendant::button[4]/following-sibling::div[1]//ul//span[text()='F3']/ancestor::a") 
 	WebElement linkClose;
 	
	def void setReceivingNo(String rcvngNo){
		waitForLoadingComplete()
		txtRecvngNo.waitToBeClickable()
		txtRecvngNo.click()
		txtRecvngNo.clearRobustly()
		txtRecvngNo.sendKeys(rcvngNo)
	}
	
	def void setLineNo(String lineNo){
		waitForLoadingComplete()
		txtLineNo.waitToBeClickable()
		txtLineNo.click()
		txtLineNo.clearRobustly()
		txtLineNo.sendKeys(lineNo)
	}
	
	def void setPoNo(String poNo){
		waitForLoadingComplete()
		txtPono.waitToBeClickable()
		txtPono.click()
		txtPono.clearRobustly()
		txtPono.sendKeys(poNo)
	}
	
	def void setWarehouse(String warehouse){
		waitForLoadingComplete()
		txtWarehouse.waitToBeClickable()
		txtWarehouse.click()
		txtWarehouse.clearRobustly()
		txtWarehouse.sendKeys(warehouse)
	}
	
	def void ClickNext(){
		btnNext.waitToBeClickable()
		btnNext.click()
		waitForLoadingComplete()
	}
	
	def void goToStartPage(){
		waitForLoadingComplete();
		waitToBeClickable(linkStart);
		linkStart.click();
		
	}
	
	def void GoToOutputSelectMedia(){
		waitForLoadingComplete()		
		waitToBeClickable(txtResponsile);
		txtResponsile.click();
		waitForLoadingComplete();
		txtResponsile.sendKeys(Keys.F3);
	}
	
	def void setOpeningPanalAsAentry(){
		waitForLoadingComplete()		
		btnAction.click();
		waitForLoadingComplete();
 		linkSetting.click();
 		waitForLoadingComplete();
 		listOpeningPanal.click();
 		waitForLoadingComplete();
 		listAentry.click();
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