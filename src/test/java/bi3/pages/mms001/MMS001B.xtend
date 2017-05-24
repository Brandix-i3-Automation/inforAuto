package bi3.pages.mms001

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys
import bi3.pages.BasePage
import java.util.List
import bi3.framework.elements.inforelements.InforGrid
import org.testng.Assert
import org.openqa.selenium.By
import java.io.Console

class MMS001B extends BasePage {

	new(WebDriver driver) { // Constructor
		super(driver)
	}

	@FindBy(id="ToolsBtn")
	public WebElement btnToolsBtn;
	
	@FindBy(id="SPID")
	public WebElement chkBoxProgramId;
	
	@FindBy(id="saveBtn")
	public WebElement btnSave;
	
	
	//caption of pop-up <- Element
	@FindBy(xpath="//div//div//div[contains(text(),'User Settings')]")
	public WebElement popUpUserSettings;
	
	

	def WebElement findElementInTools(String DropDownElement) {
		var element = "//ul[@class='inforContextMenu ToolsMenu inforMenuOptions']//li/a[contains(text(),'" +
			DropDownElement + "')]"
		return driver.findElement(By.xpath(element))
	}

	def void clickTools() {
		waitToBeClickable(btnToolsBtn)
		btnToolsBtn.click()
		waitForLoadingComplete()


	}

	def void clickUserSettings() {
		var String DropDownElement="User Settings...";
		waitForLoadingComplete()
		findElementInTools(DropDownElement).click()
		waitForLoadingComplete()
	}

	// Common Function -> Can Be Used To Assert The Tool List
	// Asserting Element in Tool Tab
	def void assertToolListMMS001() {

		waitForLoadingComplete()
		Assert.assertEquals("Add to Start Page Shortcuts...",
			findElementInTools("Add to Start Page Shortcuts...").text);
		Assert.assertEquals("Personalize", findElementInTools("Personalize").text);
		Assert.assertEquals("User Settings...", findElementInTools("User Settings...").text);
		Assert.assertEquals("Export to Excel", findElementInTools("Export to Excel").text);
		Assert.assertEquals("Link Manager", findElementInTools("Link Manager").text);
		
		//Message to log
		System.out.println("Assertion of Elements In Tools Tab Done Successfully")

	}
	
	//Asserting the popUP
	def void assertPopUpWindowUserSettings(){
		Assert.assertEquals("User Settings",popUpUserSettings.text)
		System.out.println("Assertion Of PopUp -> PopUp UserSettings Appeared Successfully")
	}
	
	//Enabling checkBox 
	def void clickCheckBoxProgramId(){
		//waitForLoadingComplete();
		Thread.sleep(2000);
		//waitToBeDisplayed(chkBoxProgramId);
		chkBoxProgramId.click();
		waitForLoadingComplete();
		var String StatusOfCheckBox =chkBoxProgramId.getAttribute("aria-checked");
		
		if(StatusOfCheckBox.equals("false")){
			chkBoxProgramId.click()
			System.out.println("CheckBox Clicked Successfully")
		}
		waitForLoadingComplete()
	}
	
	//Asserting checkBox Tick
	def void assertCheckBoxEnabled(){
		waitForLoadingComplete()
		var String status = "true";
		Assert.assertEquals(status,chkBoxProgramId.getAttribute("aria-checked"));
		
	}
	
	def void clickSaveButton(){
		
		btnSave.click()
		waitForLoadingComplete()
		System.out.println("Saved Successfully")
	}
	
	def void assertTabWithProgramId(String ProgramId){
		//ProgramID Should Appear with PageName in Tab
		var titleElement = driver.findElement(By.cssSelector("li[class='ui-tabs-selected ui-state-active']>a>div>div"))
	 	var text = titleElement.text;
		Assert.assertTrue(text.contains(ProgramId),"Program Id is not displayed on the tab");
	}

}
