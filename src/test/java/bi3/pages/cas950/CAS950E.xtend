package bi3.pages.cas950

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement

class CAS950E extends BasePage {

	new(WebDriver driver) {
		super(driver)
	}

	@FindBy(xpath=".//*[@id='WFTRDT']")
	WebElement txtFromDate

	@FindBy(xpath=".//*[@id='WTTRDT']")
	WebElement txtToDate

	@FindBy(xpath=".//*[@id='WWMITT']")
	WebElement chBoxStockTrans;

	@FindBy(xpath=".//*[@id='WWMWOP']")
	WebElement chBoxOpTransMo;

	@FindBy(xpath=".//*[@id='WWCRAC']")
	WebElement chBoxOtherTrans;

	@FindBy(xpath=".//*[@id='WWMMOP']")
	WebElement chBoxOpTransWo;

	@FindBy(xpath=".//*[@id='WWCPOC']")
	WebElement chBoxOrderCosting;

	@FindBy(id="Next")
	WebElement btnNext
	
	@FindBy(css="#messageBarContent>span") 
	WebElement lblMessageBarContent;

	@FindBy(id="//div[@id='messageBarContent']/descendant::span[text()='Transfer to FIM for division AAA in progress']") 
	WebElement lblMessageBarContent1;
	
	@FindBy(css="#tabsList > li.ui-tabs-selected.ui-state-active > button")
	WebElement btnClose
	
	@FindBy(id="WWDIVI")
    WebElement txtDivision
	
	
	def void selectFromDate(String fromDate) {
		waitForLoadingComplete();
		txtFromDate.click();
		clearRobustly(txtFromDate)
		txtFromDate.sendKeys(fromDate);
	}

	def void selectToDate(String toDate) {
		waitForLoadingComplete();
		txtToDate.click();
		clearRobustly(txtToDate)
		txtToDate.sendKeys(toDate);
	}

	def checkStockTrance() {
		waitForLoadingComplete();
		chBoxStockTrans.click();

	}

	def checkOpTranceMo() {
		waitForLoadingComplete();
		chBoxOpTransMo.click();

	}

	def checkOtherTrance() {
		waitForLoadingComplete();
		chBoxOtherTrans.click();

	}

	def checkOpTranceWo() {
		waitForLoadingComplete();
		chBoxOpTransWo.click();

	}

	def void clickNext(){
		waitToBeClickable(btnNext)
		btnNext.click();
		waitForLoadingComplete();
	}
	
	def checkOrderCosting() {
		waitForLoadingComplete();
		chBoxOrderCosting.click();

	}

	def void Next() {
		waitToBeClickable(btnNext)
		btnNext.click()
		waitForLoadingComplete()
	}
	
	def String getLblMessageBarContent() {
		
		waitForLoadingComplete();
	    lblMessageBarContent.text;	
				
	}
	
	def close() {
		btnClose.click()
		System.out.println("MMS001 tab closed")
	}
	
	def void FillDivision(String Division) {
				
		txtDivision.sendKeys(Division);
				 
	}
	
}























