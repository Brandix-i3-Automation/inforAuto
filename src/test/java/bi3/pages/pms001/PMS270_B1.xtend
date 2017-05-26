package bi3.pages.pms001

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.Keys
import bi3.framework.elements.inforelements.InforGrid
import java.util.List

class PMS270_B1 extends BasePage {

	new(WebDriver driver) {
		super(driver)
	}

	@FindBy(id="W1SCHN")
	WebElement txtScheduleNo;

	@FindBy(css="button.inforIconButton.new")
	WebElement btnCreate;

	@FindBy(id="Next")
	WebElement btnNext;

	@FindBy(id="WWSPIC-shdo")
	WebElement openningPannel;

	@FindBy(css='#ActionsBtn')
	WebElement btnActions;

	@FindBy(css="a[href='#F13']")
	WebElement btnSelect;

	@FindBy(css="#WFSCHN")
	WebElement txtScheduleNo1;

	@FindBy(css="#WTSCHN")
	WebElement txtScheduleNo2;

	@FindBy(id="WWPAVRContainer")
	WebElement txtView;

	@FindBy(xpath="//button[@class='inforTriggerButton inforBrowseIcon']/descendant::span[text()='Open']")
	WebElement btnView;

	@FindBy(xpath="//*[contains(text(),'F01')]")
	WebElement txtreportVersion;

	@FindBy(id="POS")
	WebElement txtReportVer;

	@FindBy(id="BTN_L52T24")
	WebElement btnM3browSelect;

	@FindBy(id="WFSTDT")
	WebElement txtFromDate;

	@FindBy(css="div[id*='PMA230BS'][class*='inforDataGrid']")
	WebElement gridElement;

	@FindBy(css="div[id*='PMA060BS'][class*='inforDataGrid']")
	WebElement reportIssuegridElement;
	
	@FindBy(css="div[id*='PMA070BS'][class*='inforDataGrid']")
	WebElement moOperationgridElement;
	
	

	@FindBy(xpath="//a[text()='Related']")
	WebElement linkRelated;

	@FindBy(xpath="//a//*[contains(text(), 'Report Issue')]")
	WebElement linkReportIssue;
	
	@FindBy(xpath="//a//*[contains(text(), 'Report Receipt')]")
	WebElement linkReportRecept;
	

	@FindBy(xpath="//a//*[contains(text(), 'Report Operations')]")
	WebElement linkReportOperation;

	@FindBy(css="#WMSPMT-shdo")
	WebElement cmdIssueMtd;

	@FindBy(css="#dropdown-list li")
	List<WebElement> listSortingOrder;

	@FindBy(xpath="//*[contains(text(),'Issue mtd')]")
	WebElement txtOpeningPanel;

	@FindBy(css=".inforIconButton.refresh")
	WebElement btnRefresh

	@FindBy(css=".slick-cell.l1.r1")
	WebElement firstGridCell;

	@FindBy(xpath="//*[contains(text(),'Confirmation')]/span/..")
	WebElement btnConfirmation;
	
	
	@FindBy(xpath="//*[contains(text(),'Close Operation')]/span/..")
	WebElement btnCloseOperation;

	@FindBy(id="RelatedBtn")
	WebElement btnRealted;

	@FindBy(xpath=".//*[@href='#tabhost_0']/div/div")
	WebElement lblWorkCent;

	@FindBy(id="showProgramShortName")
	WebElement lblProgramShortName;

	@FindBy(css="#Prev")
	WebElement btnPrev;
	
	@FindBy(css="#WWPLGR")
	WebElement txtWorkCenter;
	
	

	def void EnterScheduleNo(String ScheduleNo) {


        waitForLoadingComplete();
		txtScheduleNo.click();
		clearRobustly(txtScheduleNo);
		txtScheduleNo.sendKeys(ScheduleNo);
		txtScheduleNo.sendKeys(Keys.ENTER);
		waitForLoadingComplete();

	}

	def void enterView(String value) {
		waitForLoadingComplete();
		btnView.click();
		waitForLoadingComplete();
		txtReportVer.clearRobustly();
		txtReportVer.sendKeys(value);
		txtReportVer.sendKeys(Keys.ENTER);
		waitForLoadingComplete();
		txtreportVersion.click();
		waitForLoadingComplete();
		btnM3browSelect.click();
		waitForLoadingComplete();
		txtFromDate.click();
		txtFromDate.sendKeys(Keys.ENTER);
		waitForLoadingComplete();

	}
	
	def void enterWrkCenter(String value) {
		waitForLoadingComplete();
		txtWorkCenter.click();
		txtWorkCenter.clearRobustly();
		txtWorkCenter.sendKeys(value);
		waitForLoadingComplete();
		
		
	}

	def void ClickActions() {

		Thread.sleep(5000);
		btnActions.click();
		Thread.sleep(2000);
		System.out.println("Ended ClickActions");
		btnSelect.click();
	}

	def void enterScheduleNos(String ScheduleNo1, String ScheduleNo2) {
		waitForLoadingComplete();
		txtScheduleNo1.click();
		clearRobustly((txtScheduleNo1));
		txtScheduleNo1.sendKeys(ScheduleNo1);
		waitForLoadingComplete();

		txtScheduleNo2.click();
		clearRobustly((txtScheduleNo2));
		txtScheduleNo2.sendKeys(ScheduleNo2);
		waitForLoadingComplete();

	}

	def void ClickOnCreate() {
		waitToBeClickable(btnCreate);
		btnCreate.click();
		waitForLoadingComplete();

	}

	def void clickNext() {
		waitToBeClickable(btnNext)
		btnNext.click();
		waitForLoadingComplete();
	}

	def void EnterF12() {
		waitForLoadingComplete();
		txtScheduleNo.click();
		txtScheduleNo.sendKeys(Keys.F12);
		waitForLoadingComplete();

	}

	/**
	 * Report Issuing line
	 */
	def void reportIssue() {

		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridElement);

		var deliveryBoxCol = grid.getCellsFromColumn(1)
		var secoundCell = deliveryBoxCol.get(0)
		rightClick(secoundCell)
		waitForLoadingComplete()
		linkRelated.click();
		waitForLoadingComplete()
		linkReportIssue.click();
		waitForLoadingComplete()

	}
	
	
	/**
	 * Report Report Receipt
	 */
	def void reportReceipt() {

		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridElement);

		var deliveryBoxCol = grid.getCellsFromColumn(1)
		var secoundCell = deliveryBoxCol.get(0)
		rightClick(secoundCell)
		waitForLoadingComplete()
		linkRelated.click();
		waitForLoadingComplete()
		linkReportRecept.click();
		waitForLoadingComplete()

	}

	/**
	 * Get Status values
	 */
	def String getStatus() {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(reportIssuegridElement);

		var schedCol = grid.getCellsFromColumn(6)
		return schedCol.get(0).text;

	}
	
	/**
	 * Get MOSts Value
	 */
	def String getMosTsStatus() {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridElement);

		var mosTsColum = grid.getCellsFromColumn(8)
		return mosTsColum.get(0).text;


		}
	
		/**
	 * Get Status values
	 */
	def String getStatusInMoOpe() {
		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(moOperationgridElement);

		var schedCol = grid.getCellsFromColumn(7)
		return schedCol.get(0).text;

	}
	
	

	/**
	 * Change the Issue Methods
	 */
	def void selectIssueMtdl(String openingPanelValue) {
		waitForLoadingComplete();
		selectFromDropdown(cmdIssueMtd, listSortingOrder, openingPanelValue);
		waitForAnyText(txtOpeningPanel, 100);
	}

	/**
	 * Refresh the Page
	 */
	def void refreshPage() {
		waitToBeClickable(btnRefresh)
		btnRefresh.click()
		waitForLoadingComplete()
	}

	/**
	 * Select First Row in PMS060B1
	 */
	def selectFirstRows() {
		waitForLoadingComplete();
		firstGridCell.click();
		waitForLoadingComplete();

	}

	/**
	 * Select Confirmation button
	 */
	def confirmation() {
		waitForLoadingComplete()
		waitToBeClickable(btnRealted)
		btnRealted.click();
		waitToBeClickable(btnConfirmation)
		btnConfirmation.click();
		waitForLoadingComplete();
		Thread.sleep(1000);
	}
	/**
	 * Close Operation
	 */
	
		def closeOperation() {
		waitForLoadingComplete()
		waitToBeClickable(btnRealted)
		btnRealted.click();
		waitToBeClickable(btnCloseOperation)
		btnCloseOperation.click();
		waitForLoadingComplete();
		Thread.sleep(1000);
	}

	/**
	 * Get PMS 230 Header Value
	 */
	def String getPms230HeaderlblValue() {
		waitToBeDisplayed(lblWorkCent)
		return lblWorkCent.text;
	}

	/**
	 * Validate PMS 230 Header Value
	 */
	def String getPanellblValue() {
		waitToBeDisplayed(lblProgramShortName)
		return lblProgramShortName.text;
	}

	/**
	 * Get PMS 230 Header Value
	 */
	def String getPms060lblValue() {
		waitToBeDisplayed(lblProgramShortName)
		return lblProgramShortName.text;
	}

	/**
	 * Go to Previous
	 */
	def void ClickPrev() {
		waitForLoadingComplete()
		btnPrev.click();
		waitForLoadingComplete()

	}

	/**
	 * Report Issuing line
	 */
	def void reportOperation() {

		waitForLoadingComplete();
		var InforGrid grid = new InforGrid(gridElement);

		var deliveryBoxCol = grid.getCellsFromColumn(1)
		var secoundCell = deliveryBoxCol.get(0)
		rightClick(secoundCell)
		waitForLoadingComplete()
		linkRelated.click();
		waitForLoadingComplete()
		linkReportOperation.click();
		waitForLoadingComplete()

	}
	
	


}

























