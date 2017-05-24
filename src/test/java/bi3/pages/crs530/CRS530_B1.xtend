package bi3.pages.crs530

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy

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
	
	
	
}