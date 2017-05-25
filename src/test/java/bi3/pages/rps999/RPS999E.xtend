package bi3.pages.rps999

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import org.openqa.selenium.Keys

class RPS999E extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id="WFFACI")
	WebElement txtFromFacility
	
	@FindBy(id="WTFACI")
	WebElement txtToFacility
	
	@FindBy(id="WFWHLO")
	WebElement txtFromWarehouse
	
	@FindBy(id="WTWHLO")
	WebElement txtToWarehouse
	
	@FindBy(id="WWDMOP")
	WebElement chkPlnMO
	
	@FindBy(id="WWDPOP")
	WebElement chkPlnPO
	
	@FindBy(id="WWDDOP")
	WebElement chkPlnDo
	
	@FindBy(id="WMOSTS")
	WebElement txtMOSts
	
	@FindBy(id="WPOSTS")
	WebElement txtPOSts
	
	@FindBy(id="WDOSTS")
	WebElement txtDOSts
	
	def fillData(String fac, String wh,String sts){
		waitForLoadingComplete();
		txtFromFacility.click();
		txtFromFacility.sendKeys(fac);
		txtToFacility.click();
		txtToFacility.sendKeys(fac);
		txtFromWarehouse.click();
		txtFromWarehouse.sendKeys(wh);
		txtToWarehouse.click();
		txtToWarehouse.sendKeys(wh);
		chkPlnMO.click();
		txtMOSts.click();
		txtMOSts.sendKeys(sts);
		chkPlnPO.click();
		txtPOSts.click();
		txtPOSts.sendKeys(sts);
		chkPlnDo.click();
		txtDOSts.click();
		txtDOSts.sendKeys(sts);
		txtDOSts.sendKeys(Keys.ENTER);
	}
	
	
}