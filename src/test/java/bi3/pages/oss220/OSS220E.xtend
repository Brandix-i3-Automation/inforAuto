package bi3.pages.oss220

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import java.util.List
import bi3.pages.ToolbarPage
import bi3.pages.ProgramCommons

class OSS220E extends ProgramCommons{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="W1SBDS")
	WebElement txtFrmDataset
	
	@FindBy(id="W1YEA4")
	WebElement txtFrmYear
	
	@FindBy(id="W1SSTT-shdo")
	WebElement cmbFrmTyp
	
	@FindBy(css="ul[class='dropdown-list'] >li")
	List <WebElement> list;
	
	def insertFromDetails(String dataset, String year, String transType){
		txtFrmDataset.click();
		txtFrmDataset.sendKeys(dataset);
		txtFrmYear.click();
		txtFrmYear.sendKeys(year);
		selectFromDropdown(cmbFrmTyp,list,transType);
	}
	
}