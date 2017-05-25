package bi3.pages.pms001

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys

class PMS270_B1 extends BasePage {
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="W1SCHN") 
	WebElement txtScheduleNo;
	
	@FindBy(css="button.inforIconButton.new") 
	WebElement btnCreate;
	
	@FindBy(id="Next") 
	WebElement btnNext;

	@FindBy(css="WDPAVR") 
	WebElement txtView;
	
	@FindBy(id="WWSPIC-shdo") 
	WebElement openningPannel;
	
	@FindBy(css='#ActionsBtn')
	WebElement btnActions;
	
	@FindBy(css="a[href='#F13']")
	WebElement btnSelect;
	
	@FindBy(css="WFSCHN") 
	WebElement txtScheduleNo1;
	
	@FindBy(css="WFSCHN") 
	WebElement txtScheduleNo2;
	
	def void EnterScheduleNo(String ScheduleNo){
				
		txtScheduleNo.click();
		clearRobustly(txtScheduleNo);
		txtScheduleNo.sendKeys(ScheduleNo);
		txtScheduleNo.sendKeys(Keys.ENTER);
		waitForLoadingComplete();	
				
	}
	
	def void enterView( String value) {		
		
		selectFromDropdown(openningPannel,"B-Browse");
		txtView.click();		
		clearRobustly(txtView);		
		txtView.sendKeys(value);		
		
	}
	
	def void ClickActions() {
		
		Thread.sleep(5000);
		btnActions.click();
		Thread.sleep(2000);
		System.out.println("Ended ClickActions");
		btnSelect.click();
	}
	
	def void enterScheduleNos(String ScheduleNo1 , String ScheduleNo2) {
				
			txtScheduleNo1.click();
			clearRobustly((txtScheduleNo1));
			txtScheduleNo1.sendKeys(ScheduleNo1);

			txtScheduleNo2.click();
			clearRobustly((txtScheduleNo2));
			txtScheduleNo1.sendKeys(ScheduleNo2);			
			 
	}
	
	def void ClickOnCreate() {
		waitToBeClickable(btnCreate);
		btnCreate.click();
		waitForLoadingComplete();
		
	}
	
	def void clickNext(){
		waitToBeClickable(btnNext)
		btnNext.click();
		waitForLoadingComplete();
	}
	
	def void EnterF12(){
		txtScheduleNo.click();
		txtScheduleNo.sendKeys(Keys.F12);
		waitForLoadingComplete();
		
	}
}