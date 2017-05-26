package bi3.pages.cas310
import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List

class CAS310 extends BasePage {

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
	
	@FindBy(css="#WWQTTP-shdo")
	WebElement cmdSortingOrder;

	@FindBy(xpath=".//*[@href='#tabhost_1']/div/div")
	WebElement txtheaderVal;
	
//	@FindBy(css="#dropdown-list li")
//	
	@FindBy(css="Next#WGFACIContainer>input") 
	WebElement textFaciulity;
	
	List<WebElement> listSortingOrder;
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
	
	def void SelectSortingOrder(String value) {
		
		waitForLoadingComplete();
		selectFromDropdown(cmdSortingOrder, listSortingOrder, value);
		waitForLoadingComplete();
	}
	
	def void addFacilityDetails( String facility) {
				
		textFaciulity.click();
		textFaciulity.sendKeys(facility)	
		
	}
	
	def String validateHeader() {
				
			txtheaderVal.text;	
	}
}























