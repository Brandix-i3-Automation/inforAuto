package bi3.pages.mms001

import bi3.framework.elements.inforelements.InforGrid
import bi3.pages.BasePage
import java.awt.Robot
import java.awt.event.KeyEvent
import org.openqa.selenium.By
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.testng.Assert
import bi3.pages.ToolbarPage
import java.util.List
import java.util.ArrayList
import java.lang.Thread.State

class MMS001B extends ToolbarPage {

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
	
	@FindBy(css="div[id*='MMA001BS'][class*='inforDataGrid']")
	WebElement gridMMS001;
	
	@FindBy(id="QuickExport_option1")
	WebElement btnRadioExportExcel;
	
	@FindBy(id="QuickExport_option3")
	WebElement btnRadioSourceFormat;
	
	@FindBy(css="div[id='ExportDlg']+div>button")
	WebElement btnExport;
	
	@FindBy(id = "QuickExport_option1")
	WebElement rbtnExportSelectedRows;
	
	@FindBy(id = "QuickExport_option3")
	WebElement rbtnSourceFormat;
	
	def String isCheckedExportSelectedRows(){
		return rbtnExportSelectedRows.getAttribute("aria-checked");
	}
	
	def String isCheckedSourceFormat(){
		return rbtnSourceFormat.getAttribute("aria-checked");
	}

	override WebElement findElementInTools(String DropDownElement) {
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
	
	/**
	 * Select the given number of rows.
	 * 
	 * @param row count
	 */
	def void selectRows(int count) {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridMMS001);
		var WebElement firstRow = grid.getRow(0);
		firstRow.click();
		
		Thread.sleep(1000);
		var Robot rb = new Robot();
		rb.keyPress(KeyEvent.VK_SHIFT);
		
		var int cnt = count - 1;
		for (var int i = cnt; i < count; i++) {
			rb.keyPress(KeyEvent.VK_DOWN);
			rb.keyRelease(KeyEvent.VK_DOWN);
		}
		rb.keyRelease(KeyEvent.VK_SHIFT);
	}
	
	/**
	 * Select the expected currently selected rows radio button
	 */
	def void clickSelectedRowsBtn() {
		waitForLoadingComplete();
		btnRadioExportExcel.click();
	}

	/**
	 * Select the keep source format radio Button
	 */
	def void clickSourceFormatBtn() {
		waitForLoadingComplete();
		btnRadioSourceFormat.click();
	}
	
	/**
	 * Click the export button
	 */
	def clickExportBtn() {
		waitForLoadingComplete();
		btnExport.click();
	}
	
	/**
	 * Get data form the given number of rows.
	 * 
	 * @param row count
	 */
	def List<List<String>> getRowsWithHeaders(int count) {
		waitForLoadingComplete();
		var List<List<String>> data = new ArrayList<List<String>>();
		var InforGrid grid = new InforGrid(gridMMS001);
		
		// Get the column headers
		var List<String> headerVals = grid.getColumnHeaders();
		var List<String> tblHeaders = new ArrayList<String>();
		for (String value : headerVals) {
			tblHeaders.add(value.trim());
		}
		data.add(tblHeaders);
		
		for(var int i = 0; i < count; i++){
			var List<String> rowVals = grid.getDataOfRow(i);
			data.add(rowVals);
		}
		
		return data;
	}
	
	/**
	 * Compare two String List.
	 * 
	 * @param List<String> expected
	 * @param List<String> actual
	 * @return return a boolean
	 */
	def boolean verifyList(List<String> expected, List<String> actual) {
		var boolean status = false;
		for (String value : expected) {
			status = actual.contains(value);
			if(!status){
				return false;
			}
		}
		return status;
	}
}
