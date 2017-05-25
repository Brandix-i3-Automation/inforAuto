package bi3.pages.crs530

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys

class CRS530B1 extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="ActionsBtn") 
	WebElement btnAction;
	
	@FindBy(xpath="//a[@href='#F13']") 
	WebElement linkSettings;
	
	@FindBy(id="W1EMNO") 
	WebElement txtEmpNo;
	
	@FindBy(css=".slick-cell.l0.r0")
	WebElement firstGridCell;
	
	/**
	 * Select All the rows
	 */
	
	def selectAllRows() {
		waitForLoadingComplete();
		firstGridCell.click();
		firstGridCell.SelectAllGridRows();
		waitForLoadingComplete();

	}
	
	def void ClickNext() {
        waitForLoadingComplete()
		btnNext.click()
		waitForLoadingComplete()
	}
	
	def void enterEmplNo(String employNo){
		waitForLoadingComplete();
		txtEmpNo.clearRobustly()
		txtEmpNo.sendKeys(employNo);
		txtEmpNo.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
		
	}
	def  String getEmploNoLblValue() {
		 var status =  "NotFound"
		 
		try
		{
			
		waitToBeDisplayed(firstGridCell)
		status = firstGridCell.text;
		return status;
		
		}
		catch(Exception e)
		{
			return  status
		}
		

	}
	
}