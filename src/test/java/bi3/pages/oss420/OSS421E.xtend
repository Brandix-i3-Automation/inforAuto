package bi3.pages.oss420

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys
import org.openqa.selenium.By
import bi3.framework.elements.inforelements.InforGrid
import java.util.List

class OSS421E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WHCOL1")
	WebElement txtInvoicedQty
	
	
	@FindBy(css="div[id*='OSA421ES'][class*='inforDataGrid']") 
 	WebElement gridElement;
	
	def void setDemandValues(String field,String demand){
		txtInvoicedQty.click();
		txtInvoicedQty.sendKeys(Keys.F4);
		waitForLoadingComplete();
		driver.findElement(By.xpath("//div[contains(text(),'"+field+"')]")).click();
		pressEnterKey(driver.findElement(By.xpath("//div[contains(text(),'"+field+"')]")));
		
		waitForLoadingComplete();
		var grid = new InforGrid(gridElement);
		var List<WebElement> cells = grid.getCellsFromColumn(3);
		for(var i = 0;i<12;i++){
			cells.get(i).click();
			Thread.sleep(2000);
			//driver.findElement(By.xpath("input[@id='R"+(i+1)+"C4']")).sendKeys(demand);
			cells.get(i).findElement(By.cssSelector("input.inforTextbox")).sendKeys(demand);
		}
	}
	  
}