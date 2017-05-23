package bi3.configuration.settings

import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.ToolbarPage
import bi3.pages.oss401.Settings
import org.openqa.selenium.WebDriver

class OSS401SettingsTest {
	private WebDriver driver = null;
	private LoginPage loginPage;
	private HomePage homePage;
	private ToolbarPage toolbarPage;
	private Settings settings;
	
	def init(){
		loginPage =new LoginPage(driver);
		homePage=new HomePage(driver);
		toolbarPage=new ToolbarPage(driver);
		settings = new Settings(driver);
		
	}
	
	new(WebDriver driver) {
		this.driver = driver;
		this.init();
	}
	
	def void SetPanelSequence(String seq){
		loginPage.GoTo();
		homePage.goToProgram("OSS401")
		
		toolbarPage.ClickAction_Settings();
		settings.enterPanelSequence(seq);
		settings.clickNext();
		
		settings.closeAllTabs();	
	}
	
}