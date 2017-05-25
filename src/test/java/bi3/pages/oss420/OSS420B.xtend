package bi3.pages.oss420

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import org.openqa.selenium.By
import bi3.framework.elements.inforelements.InforGrid
import bi3.pages.ProgramCommons

class OSS420B extends ProgramCommons{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="W1SBDS")
	WebElement txtDataset
	
	@FindBy(id="W1BVER")
	WebElement txtBvs
	
	@FindBy(css="div[id*='OSA420BS'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	/**
	 * Enter data set and BUD version
	 * @param: Dataset
	 * @param: Budget Version
	 */
	def void createSaleBud(String dataset, String BudVer){
		txtDataset.click();
		clearRobustly(txtDataset);
		txtDataset.sendKeys(dataset);
		txtBvs.click();
		clearRobustly(txtBvs);
		txtBvs.sendKeys(BudVer);
		pressShortcutKeys("1");
	}
	
	/**
	 * Active Sales Budget
	 * @param: Dataset
	 */
	def void selectDataset(String dataset){
		txtDataset.click();
		clearRobustly(txtDataset);
		txtDataset.sendKeys(dataset);
		txtDataset.sendKeys(Keys.ENTER);
		driver.findElement(By.xpath("//div[text()='"+dataset+"']/..")).click();
		waitForLoadingComplete();
	}
	
	/**
	 * Get the status of the Sales Budget
	 * @param: Dataset
	 * @return: Status Value
	 */
	def getBudStatus(String dataset){
		waitForLoadingComplete();
		var grid = new InforGrid(gridElement);
	 	return grid.getColumnValByColumnHeader("Sts", 0);
	}
	
}