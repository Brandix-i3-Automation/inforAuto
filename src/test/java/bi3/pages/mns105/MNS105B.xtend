package bi3.pages.mns105

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.framework.elements.inforelements.InforGrid
import java.util.List

class MNS105B extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(css="div[id*='MNA105BS'][class*='inforDataGrid']")
	WebElement gridMNS105;
	
	def boolean gridContainsSystemLanguages(){
		var boolean result = false;
		var InforGrid grid = new InforGrid(gridMNS105);
		var int rows = grid.getRowCount();
		if(rows > 0){
			result = true;
		}
		return result;
		
	}
	
	def List<String> getSystemLanguages(){
		var InforGrid grid = new InforGrid(gridMNS105);
		return grid.getDataOfColumn("Name");
	}
}