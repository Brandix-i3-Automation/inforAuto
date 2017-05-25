package bi3.configuration.settings

import org.openqa.selenium.WebDriver
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import bi3.pages.pcs230.PCS230SettingsPage

class CRS530SettingTest {
	
	private WebDriver driver = null;
	
	private LoginPage loginPage;
	private HomePage homePage;
	private ToolbarPage toolbarPage;
	private PCS230SettingsPage pcs230SettingsPage;
	
	def init(){
		loginPage =new LoginPage(driver);
		homePage=new HomePage(driver);
		toolbarPage=new ToolbarPage(driver);
		pcs230SettingsPage=new PCS230SettingsPage(driver);
		
	}
	new(WebDriver driver) {
		this.driver = driver;
		this.init();
	}
	
	//@Test(groups="")
	def void SetPanelSqequence(){

		toolbarPage.ClickAction_Settings();
		pcs230SettingsPage.enterPanelSequence("E");
		pcs230SettingsPage.clickNext();
		
	//	pcs230SettingsPage.closeAllTabs();
		
		
		
	}
	
}