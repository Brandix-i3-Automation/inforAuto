package bi3.pages

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys
import org.openqa.selenium.ElementNotVisibleException
import org.openqa.selenium.NoSuchElementException
import com.gargoylesoftware.htmlunit.ElementNotFoundException
import org.openqa.selenium.By
import org.testng.Assert
import java.util.List

class HomePage extends BasePage {

	new(WebDriver driver) { // Constructor
		super(driver)
	}

	@FindBy(linkText="SLS - Sales Management")
	WebElement linkServiceManagement;

	@FindBy(xpath="//div[@class='gvWidgetHeader']/span[contains(text(),'Menu')]")
	WebElement headerMenu;

	@FindBy(css="input.inforSearchField ")
	WebElement txtSearch;

	@FindBy(xpath="//div[@class='gvWidgetHeader']/span[contains(text(),'Menu')]/../..//div[@class='gvFillAbsolute']//li")
	WebElement MenuWidgetOptions;

	@FindBy(css="li[data-gv-link='PDS001']")
	WebElement linkProductStructure

	@FindBy(css="button.inforIconButton.new")
	WebElement btnCreate;

	@FindBy(css="li[data-gv-link='MMS077']")
	WebElement linkCreateItem;

	@FindBy(css="li[data-gv-link='PMS170']")
	WebElement linkPlannedMo;

	@FindBy(css="li[data-gv-link='PMS230']")
	WebElement linkReportMo;
	
	@FindBy(xpath="//li[text()='Customer Order. Open']")
	WebElement linkCustomerOrder;
	
	@FindBy(xpath="//li[text()='Customer Order. Open Toolbox']")
	WebElement linkCustomerOrderOIS300;

	@FindBy(css="li[data-gv-link='PMS001']")
	WebElement linkManufactOrder;

	@FindBy(css="li[data-gv-link='PMS100']")
	WebElement linkManufacturingOrder;

	@FindBy(css="li[data-gv-link='PMS050']")
	WebElement linkManufactOrderReportReceipt;

	@FindBy(css="li[data-gv-link='PPS310']")
	WebElement linkInspectItems;

	@FindBy(css="li[data-gv-link='PPS320']")
	WebElement linkPutAwayGoods;

	@FindBy(css="li[data-gv-link='PPS300']")
	WebElement linkPORecieveGoods;

	@FindBy(css="li[data-gv-link='MMS100']")
	WebElement linkReqDistrOrder;

	@FindBy(css="li[data-gv-link='PPS200']")
	WebElement linkPurchaseOrder;

	@FindBy(css="li[data-gv-link='PPS390']")
	WebElement linkReturnToSupplier;
	
	  @FindBy(css="li[data-gv-link='OIS275']")
    WebElement linkBatchCoOrderOpen;

    @FindBy(css="li[data-gv-link='MMS080']")
    WebElement linkMaterialPlan;
    
    @FindBy(css="li[data-gv-link='PPS600']")
    WebElement linkPrintDocument;
    
    @FindBy(css="li[data-gv-link='PPS250']")
    WebElement linkPurchaseOrderConfirm;
    
    @FindBy(css="li[data-gv-link='PPS270']")
    WebElement linkNotifyTranspotation;
    
    @FindBy(css="li[data-gv-link='PPS330']")
    WebElement linkPurchaseOrderDispLine;
    
    
    @FindBy(css="li[data-gv-link='MWS060']")
    WebElement linkOpenToolBox
    
     @FindBy(css="li[data-gv-link='CAS310']")
    WebElement linkOrderCostingDisplay
    
    @FindBy(css="li[data-gv-link='OIS150']")
    WebElement linkCoOpen;
    
    /**Search and Start pop up Header */
    @FindBy(css="div.inforDialogTitleBar .caption")
    WebElement lblSearchAndStart
    
    /**Search and Start text box */
    @FindBy(id="cmdText")
    WebElement txtSearchAndStart
    
    /**Search and Start OK button */
    @FindBy(id="runTaskButton")
    WebElement btnOk

 	@FindBy(xpath="//button[@class='inforIconButton gvPageMenu gvButtonPageMenu']")
    WebElement btnSubMenu;
    
    @FindBy(xpath="//ul[@id='gvMenuSettings']")
    WebElement listPageMenu;
    
    @FindBy(xpath="//a[text()='Start Page']")
    WebElement listStartPage;
    
    @FindBy(xpath="//a[text()='Add Widget...']")
    WebElement listAddWidget;
    
    @FindBy(xpath="//a[text()='Add Page...']")
    WebElement listAddPage;
    
    @FindBy(xpath="//a[text()='Add Page from Library...']")
    WebElement listAddPageFromLibrary;
    
    @FindBy(xpath="//a[text()='Delete Page...']")
    WebElement listDeletePage;
    
    @FindBy(xpath="//a[text()='Remove Favorite Page ...']")
    WebElement listRemoveFavouritePage;
    
    @FindBy(xpath="//ul[@id='gvMenuSettings']//a[text()='Refresh']")
    WebElement listRefresh;
    
    @FindBy(xpath="//a[text()='My Pages...']")
    WebElement listMyPages;
    
    @FindBy(xpath="//a[text()='Page Settings...']")
    WebElement listPageSetting;
    
    @FindBy(xpath="//ul[@id='gvMenuSettings']//a[text()='User Settings...']")
    WebElement listUserSetting;
    
    @FindBy(xpath="//a[text()='Advanced']")
    WebElement listAdvanced;
    
    @FindBy(xpath="//a[text()='Administration']")
    WebElement listAdministration;
    
    @FindBy(id="startDiv")
    WebElement linkStart;
    
    @FindBy(css="div[class='gvPage'] div[class='gvWidget ui-droppable']")
    List<WebElement> listAddWidgetIcons;
	
    @FindBy(css="span.gvWidgetLibraryTitle")
    List<WebElement> listAddWidgetTypes;
	
	@FindBy(css="div[class='gvPage'] div[class='gvWidget ui-draggable ui-droppable ui-resizable ui-resizable-autohide']")
    List<WebElement> listWidgets;
    
	def void GoToMMS001() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.waitToBeClickable();
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.waitToBeClickable();
		txtSearch.click();
		txtSearch.sendKeys("MMS001");
		txtSearch.sendKeys(Keys.ENTER);

	}
	
		def void GoToMMS002() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS002
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.waitToBeClickable();
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.waitToBeClickable();
		txtSearch.click();
		txtSearch.sendKeys("MMS002");
		txtSearch.sendKeys(Keys.ENTER);

	}

	def void GoToPDS001() {

		waitToBeDisplayed(MenuWidgetOptions, 120);
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		waitForLoadingComplete();
		txtSearch.clickWhenReady();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PDS001");
		Thread.sleep(1000);
		txtSearch.sendKeys(Keys.ENTER);
		linkProductStructure.waitToBeClickable();
		linkProductStructure.click();




	}

	def void GoToMMS077() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.click();
		txtSearch.sendKeys("MMS077");
		waitToBeDisplayed(linkCreateItem);
		linkCreateItem.click();

	}

	def void GoToPMS170() {
		waitForLoadingComplete();
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for PMS170
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("PMS170");
		Thread.sleep(2000)
		txtSearch.sendKeys(Keys.ENTER)
		/*waitToBeDisplayed(linkPlannedMo);
		 linkPlannedMo.click()*/
		waitForLoadingComplete()

	}

	def void GoToOIS300() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		Thread.sleep(1000);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.click();
		txtSearch.sendKeys("OIS300");
		Thread.sleep(500);
		waitToBeDisplayed(linkCustomerOrderOIS300);
		linkCustomerOrderOIS300.click();

	}

	def void GoToOIS100() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for OIS100
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		waitForLoadingComplete()
		txtSearch.clickWhenReady();
		txtSearch.clearRobustly();
		//txtSearch.click();
		txtSearch.sendKeys("OIS100");
		Thread.sleep(1000);
		linkCustomerOrder.waitToBeClickable();
		//txtSearch.sendKeys(Keys.ENTER);
		linkCustomerOrder.click();

	}

	def void GoToPMS001() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		clearRobustly(txtSearch);
		txtSearch.click();
		txtSearch.sendKeys("PMS001");
		waitToBeDisplayed(linkManufactOrder);
		linkManufactOrder.click()
		waitForLoadingComplete()

	}

	def void GoToPMS100() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		clearRobustly(txtSearch);
		txtSearch.sendKeys("PMS100");
		txtSearch.sendKeys(Keys.ENTER);
		/*waitToBeDisplayed(linkManufacturingOrder);
		 linkManufacturingOrder.click()*/
		waitForLoadingComplete()

	}

	def void GoToPPS310() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for PPS310
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		clearRobustly(txtSearch);
		txtSearch.click();
		txtSearch.sendKeys("PPS310");
		waitToBeDisplayed(linkInspectItems);
		linkInspectItems.click()
		waitForLoadingComplete()
	}

	def void GoToPMS230() {
		waitForLoadingComplete();
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for PMS230
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("PMS230");
		waitToBeDisplayed(linkReportMo);
		linkReportMo.click()
		waitForLoadingComplete()

	}

	def void GoToPMS050() {
		waitForLoadingComplete();
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for PMS230
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("PMS050");
		waitToBeDisplayed(linkManufactOrderReportReceipt);
		linkManufactOrderReportReceipt.click()
		waitForLoadingComplete()

	}

	def void GoToPPS320() {
		waitForLoadingComplete();
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for PPS320
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("PPS320");
		waitToBeDisplayed(linkPutAwayGoods);
		try{
			linkPutAwayGoods.click();
		}
		catch(NoSuchElementException e){
			txtSearch.clearRobustly();
			txtSearch.sendKeys("PPS320");
		}
		waitForLoadingComplete();
	}

	def void GoToPPS220() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.waitToBeClickable()
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PPS220");
		txtSearch.sendKeys(Keys.ENTER);
	}

	def void GoToPPS300() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PPS300");
		
		try{
			waitToBeDisplayed(linkPORecieveGoods)
			linkPORecieveGoods.click()
			waitForLoadingComplete()
		}catch(NoSuchElementException e){
			txtSearch.click();
			txtSearch.clearRobustly();
			txtSearch.sendKeys("PPS300");
			linkPORecieveGoods.click()
			waitForLoadingComplete()
		}
		
		

	}

	def void GoToPPS330() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("PPS330");
		linkPurchaseOrderDispLine.waitToBeClickable()
		linkPurchaseOrderDispLine.click()
		waitForLoadingComplete()
		
		
	}

	def void GoToPMS070() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for MMS0012
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		// txtSearch.click();
		txtSearch.sendKeys("PMS070");
		Thread.sleep(2000)
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToMWS060() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for MMS0012
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("MWS060");
		waitToBeDisplayed(linkOpenToolBox);
		linkOpenToolBox.click();
		//txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToMWS460() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for MMS0012
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("MWS460");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToPCS230() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PCS230
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("PCS230");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToCAS950() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PCS230
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("CAS950");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToMMS100() {
		//Fake Lookup
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS100
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("ABC");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete()
		
		//Real one starts here-----
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS100
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("MMS100");
		waitToBeDisplayed(linkReqDistrOrder)
		linkReqDistrOrder.click()
		waitForLoadingComplete()
	}

	def void GoToFCS350() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		waitForLoadingComplete()
		// Search for FCS350
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("FCS350");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def void GoToPSS310() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PSS310
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("PSS310");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}

	def GoToMMS080() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		// Search for MMS080
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("MMS080");		
		try{
			waitToBeDisplayed(linkMaterialPlan)
			linkMaterialPlan.click()
		}catch(NoSuchElementException e){
			txtSearch.sendKeys(Keys.ENTER)
			waitForLoadingComplete()
		}
	}

	def void GoToPPS200() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS100
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys(" ");
		txtSearch.sendKeys(Keys.ENTER);
		Thread.sleep(2000)		
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PPS200");
		Thread.sleep(1000)
		try {
			waitToBeDisplayed(linkPurchaseOrder)
			linkPurchaseOrder.click()
		} catch (NoSuchElementException e) {
			txtSearch.sendKeys(Keys.ENTER)
			waitForLoadingComplete()			
		}
		waitForLoadingComplete()	
	}
	
	def void GoToDPS170() {
		waitForLoadingComplete();
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for DPS170
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.click();
		txtSearch.sendKeys("DPS170");
		Thread.sleep(2000)
		txtSearch.sendKeys(Keys.ENTER)
		/*waitToBeDisplayed(linkPlannedMo);
		linkPlannedMo.click()*/
		waitForLoadingComplete()
	}
	
	
	def void GoToPPS390(){
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS100
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PPS390");
		waitForLoadingComplete()
		try {
			waitToBeDisplayed(linkReturnToSupplier)
			linkReturnToSupplier.click()
		} catch (NoSuchElementException e) {
			txtSearch.sendKeys(Keys.ENTER)
			waitForLoadingComplete()
		}
	}

	def void GoToOIS390() {
			waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		// Search for MMS080
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("OIS390");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
		
	}

def void GoToOIS275(){
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PCS230
		headerMenu.click();
		//waitToBeDisplayed();
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("ois275");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}
	
	def void GoToPPS170(){
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PCS230
		headerMenu.click();
		//waitToBeDisplayed();
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("PPS170");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}
	
	def void GoToPPS600()
	{
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys("PPS600");
		waitToBeDisplayed(linkPrintDocument)
		linkPrintDocument.click()
		waitForLoadingComplete()
	}
	def void GoToPPS250()
	{
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		Thread.sleep(1000);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.click();
		txtSearch.sendKeys("PPS250");
		Thread.sleep(500);
		waitToBeDisplayed(linkPurchaseOrderConfirm);
		linkPurchaseOrderConfirm.click();
	}
		def void GoToPPS270()
	{
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		Thread.sleep(1000);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.clear();
		txtSearch.click();
		txtSearch.sendKeys("PPS270");
		Thread.sleep(500);
		waitToBeDisplayed(linkNotifyTranspotation);
		linkNotifyTranspotation.click();
	}
	
	def void GoToCAS310() {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for MMS0012
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("CAS310");
		waitToBeDisplayed(linkOrderCostingDisplay);
		linkOrderCostingDisplay.click();
		//txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}
	
	def void GoToOIS150() {
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);

		// Search for MMS001
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		clearRobustly(txtSearch);
		txtSearch.click();
		txtSearch.sendKeys("OIS150");
		waitToBeDisplayed(linkCoOpen);
		linkCoOpen.click()
		waitForLoadingComplete()

	}
	
	/**
	 * Navigate to program required
	 * @param : Method ID
	 */
	def void goToProgram(String program) {
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 120);
		headerMenu.click();
		waitToBeDisplayed(txtSearch);
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys(" ");
		txtSearch.sendKeys(Keys.ENTER);
		Thread.sleep(2000)		
		txtSearch.click();
		txtSearch.clearRobustly();
		txtSearch.sendKeys(program);
		Thread.sleep(1000)
		try {
			waitToBeDisplayed(driver.findElement(By.cssSelector("li[data-gv-link='"+program+"']")))
			driver.findElement(By.cssSelector("li[data-gv-link='"+program+"']")).click()
		} catch (NoSuchElementException e) {
			txtSearch.sendKeys(Keys.ENTER)
			waitForLoadingComplete()			
		}
		waitForLoadingComplete()	
	}
	
	/** 
	 * Navigate to program
	 * @param: program name
	 */
	def void goToProgramUsingShrt(String program){
		pressShortcutKeys("r");
		waitForLoadingComplete();
		try{
			Assert.assertEquals(verifySearchAndStartPopup(),"Search and Start");			
			driver.findElement(By.id("ui-id-2"));
			txtSearchAndStart.click();
			txtSearchAndStart.sendKeys(program)
			Assert.assertEquals(GetTextBoxvalue(txtSearchAndStart),program);
			btnOk.click();
		}catch(java.util.NoSuchElementException e){
			e.printStackTrace();
		}
	}

	def void GoToOIS301(){
		waitForLoadingComplete();
		// Wait for Home page loaded
		waitToBeDisplayed(MenuWidgetOptions, 60);
		// Search for PCS230
		headerMenu.click();
		//waitToBeDisplayed();
		txtSearch.click();
		txtSearch.clearRobustly()
		txtSearch.sendKeys("OIS301");
		txtSearch.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
	}
	
	def void gotoStart(){
		waitForLoadingComplete();
		btnSubMenu.click();
		waitToBeDisplayed(listPageMenu, 120);	
	}
	
	def String getStartPageName(){
		waitForLoadingComplete();
		return 	listStartPage.text;
	}
	
	def String getAddWidgetName(){
		waitForLoadingComplete();
		return 	listAddWidget.text;
	}
	
	def String getAddPageName(){
		waitForLoadingComplete();
		return 	listAddPage.text;
	}
	
	def String getAddPageFromLibraryName(){
		waitForLoadingComplete();
		return 	listAddPageFromLibrary.text;
	}
	
	def String getDeletePageName(){
		waitForLoadingComplete();
		return 	listDeletePage.text;
	}
	
	def String getRemoveFavouritePageName(){
		waitForLoadingComplete();
		return 	listRemoveFavouritePage.text;
	}
	
	def String getRefreshName(){
		waitForLoadingComplete();
		return 	listRefresh.text;
	}
	
	def String getMyPagesName(){
		waitForLoadingComplete();
		return 	listMyPages.text;
	}
	
	def String getPageSettingsName(){
		waitForLoadingComplete();
		return 	listPageSetting.text;
	}
	
	def String getUserSettingsName(){
		waitForLoadingComplete();
		return 	listUserSetting.text;
	}
	
	def String getAdvancedName(){
		waitForLoadingComplete();
		return 	listAdvanced.text;
	}
	
	def String getAdministrationName(){
		waitForLoadingComplete();
		return 	listAdministration.text;
	}
	
	def void clickAddPage(){
		waitForLoadingComplete();
		listAddPage.click();
		waitForLoadingComplete();
	}

	//verify the search and start text in pop up is displayed
	def String verifySearchAndStartPopup(){
		waitForLoadingComplete();
		waitToBeDisplayed(lblSearchAndStart);
		return lblSearchAndStart.text;		
	}
	
	/**
	 * Creates a widget in the given widget box
	 */
	def addWidget(int widgetBoxNumber, String widgetName) {
		listAddWidgetIcons.get(widgetBoxNumber).waitToBeClickable();
		listAddWidgetIcons.get(widgetBoxNumber).click();
		waitForLoadingComplete();
		var WebElement widget = listAddWidgetTypes.getElementByPartialText(widgetName);
		widget.clickWhenReady();
		widget.waitToBeHidden();
	}
	
	/**
	 * Checks whether the given shortcut name is found inside the Shortcut widget
	 */
	def boolean isShortcutFoundInShortcutWidget(String shortcutName) {
		var boolean found = false;
		var WebElement shortcutWidget;
		
		// 1.Find the Shortcut Widget		 
		for (var int i = 0; i < listWidgets.length; i++) {
			var String widgetName = listWidgets.get(i).findElement(By.cssSelector("span.gvWidgetHeaderTitle")).text;
			if(widgetName.contains("Shortcuts")){
				shortcutWidget = listWidgets.get(i);
			}
		}	
					
		// 2.Find whether the shortcut is found inside the widget
		var List<WebElement> shortcutLinks = shortcutWidget.findElements(By.cssSelector(".gvShortcutsHeaderText"));
		var List<String> shortcutLinkText = shortcutLinks.getTextList();
		
		if(shortcutLinkText.contains(shortcutName)){
			found = true;
		}
		return found;
	}
	/**
	 * Click on Start to load the Start menu items.
	 */
	def void clickStart(){
		waitForLoadingComplete();
		Thread.sleep(2000)
		linkStart.click();
		waitForLoadingComplete();
	}
	
	/**
	 * Verify startPage is displayed.
	 */
	def String verifyStartPageExist() {
		waitToBeDisplayed(linkStart)
		return linkStart.text;
	}
	
	/**
	 * Start menu List
	 */
	def WebElement getList(String listMenu){
	var element = "//ul[@id='gvMenuSettings']/descendant::a[text()='"+listMenu+"']"
	 	driver.findElement(By.xpath(element))
	}
}























