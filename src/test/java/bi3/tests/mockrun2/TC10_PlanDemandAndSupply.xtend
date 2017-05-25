package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.HomePage
import bi3.pages.LoginPage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.oss420.OSS420B
import bi3.pages.oss420.OSS420E
import org.testng.Assert
import bi3.pages.oss420.OSS421A
import bi3.pages.mms001.MMS001
import bi3.pages.mms001.MMS001C
import bi3.pages.oss420.OSS421E
import bi3.pages.oss220.OSS220E
import bi3.pages.fcs350.FCS350_B
import bi3.pages.mms080.MMS080B1
import java.util.List
import bi3.pages.rps999.RPS999E
import bi3.pages.rps999.RPS999F
import bi3.pages.pms170.PMS170B
import bi3.pages.pms270.PMS270E
import bi3.pages.pms100.PMS100_B

class TC10_E2E extends BaseTest{
	
	LoginPage loginPage
	HomePage homePage
	OSS420B oss420B
	OSS420E oss420E
	OSS421A oss421A
	MMS001 mms001
	MMS001C mms001C
	OSS421E oss421E
	OSS220E oss220E
	FCS350_B fcs350B
	MMS080B1 mms080B1
	RPS999E rps999E
	RPS999F rps999F
	PMS170B pms170B
	PMS270E pms270E
	PMS100_B pms100B
		
	OSS401_CreateDataSet oss401_CreatDataSet;
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		oss420B = new OSS420B(driver);
		oss420E = new OSS420E(driver);
		oss421A = new OSS421A(driver);
		mms001 = new MMS001(driver);
		mms001C = new MMS001C(driver);
		oss421E = new OSS421E(driver);
		oss220E = new OSS220E(driver);
		fcs350B = new FCS350_B(driver);
		mms080B1 = new MMS080B1(driver);
		rps999E = new RPS999E(driver);
		rps999F = new RPS999F(driver);
		pms170B = new PMS170B(driver);
		pms270E = new PMS270E(driver);
		pms100B = new PMS100_B(driver);
		
		oss401_CreatDataSet = new OSS401_CreateDataSet(driver);
	}
	
	var panelSeq = "E"
	var dataset = "D100"
	var budget = "BUD"
	var whs = "001"
	var demandFeild = "UCDEMA"
	var demand = "100"
	var year = "2017"
	var transType = "34"
	var itemNoCopy = "D10031"
	var periodFrame = "1"
	var periodType = "1-Period type 1"
	var period = "1706"
	var FCQty = "900"
	var facility = "A01"
	var status20 = "20"
	var sortingOrder = "1-Resp,Whs,Prod"
	var resp = "DULANJ"
	var sortingOrderPMS = "91-SchNo/Product"
	/**
	 * @TestCaseID: TC10
	 * @CloudSuite: F&B
	 * @Description: Plan Demand & Supply full flow
	 * @author: mohamedi
	 */
	@Test
	def void TC10FullFlow() {		
		//create Data set
		oss401_CreatDataSet.OSS401_CreateDataSet();
		println("Dataset Created")
		//Create an item as a Prerequisite
		var item = itemCreation();
		println("Prereq - Item Created")
		//create Sales budget
		createSalesBudget();
		println("Sales budget created")
		//Insert Budget Values
		insertBudgetValues(item);
		println("Inserted budget values")
		//Create Forecast
		createForecast(item);
		println("Created Forecast")
	}
	
	/**
	 * Copying item form MMS001
	 * return : Item Number
	 */
	def itemCreation(){
		homePage.goToProgramUsingShrt("MMS001");
		mms001.SearchByItemNumber(itemNoCopy);
		mms001.CopyItem(itemNoCopy);
		var itemNo = mms001C.getItemNumber();
		mms001C.clickNextTillReqPanel("MMS001/B");
		mms001.closeAllTabs();
		return itemNo;
	}
	
	/**
	 * create sales budget and verify status 20
	 */
	def void createSalesBudget(){
		homePage.goToProgramUsingShrt("OSS420");
		oss420B.ClickAction_Settings();
		oss420B.setPanelSequence(panelSeq);
		oss420B.clickOnNext();
		oss420B.createSaleBud(dataset,budget);
		oss420E.fillInformation("Test Sales Budget","Test Sales Budget","0-Not in budget","1-Manual budget","USD","01","3","1-Subtotal - stan");
		oss420B.selectDataset(dataset);
		oss420B.pressShortcutKeys("20")
		Assert.assertEquals(oss420B.getBudStatus(dataset),"20","Status Incorrect");		
	}
	
	/**
	 * Insert budget values
	 * @param: Item Number
	 */
	def insertBudgetValues(String item){
		oss420B.selectDataset(dataset);
		oss420B.pressShortcutKeys("11");
		Assert.assertEquals(oss420B.getPageId,"OSS421/A","Page not found");
		oss421A.fillSaleValues(whs,item);
		Assert.assertEquals(oss420B.getPageId,"OSS421/B1","Page not found");
		oss420B.pressShortcutKeys("1");
		Assert.assertEquals(oss420B.getPageId,"OSS421/E","Page not found");
		oss421E.setDemandValues(demandFeild,demand);
		oss421E.clickOnNext();
		oss421E.CloseActiveTab();
		oss420B.selectDataset(dataset);
		oss420B.pressShortcutKeys("21");
		oss220E.insertFromDetails(dataset,year,transType);
		oss220E.clickOnNext();
		Assert.assertEquals(oss220E.getMessageFromFooter(),"Job OSS221CL has been submitted","Confirmation message not found");
		oss220E.closeAllTabs();
	}

	/**
	 * create forecast via m3
	 */
	def void createForecast(String item){
		homePage.goToProgramUsingShrt("FCS350");
		fcs350B.setHeaderDetails(item,periodFrame,periodType);
		for(var i = 0 ; i<12; i++){
			fcs350B.setFCQtyForTheEmptyPeriod(period,FCQty)	
		}
		fcs350B.clickOnNext();
		fcs350B.closeAllTabs();
		
		homePage.goToProgramUsingShrt("MMS080");
		mms080B1.setHeaderDetails(item,whs);
		var List<String> ordCat = mms080B1.getFnbDetailsFromGrid(); 
		for(String s:ordCat){
			Assert.assertEquals(s,"010","Incorrect Order Category");
		}
		mms080B1.closeAllTabs();
		homePage.goToProgramUsingShrt("RPS999");
		rps999E.fillData(facility,whs,status20);
		rps999F.enterItemNo(item);
		Assert.assertEquals(rps999F.getMessageFromFooter(),"Job RPS999S1 has been submitted","Confirmation message not found");
		rps999E.closeAllTabs();
	}
	
	/**
	 * Release MOP
	 */
	def void releaseMOP(String item){
		homePage.goToProgramUsingShrt("PMS170");
		pms170B.SelectSortingOrder(sortingOrder);
		pms170B.clearResponsible();
		pms170B.enterRespSearchKey(resp);
		pms170B.EnterMainProduct(item);
		pms170B.JointSchedulling();
		var scheduleNo = pms270E.GetSchedNo();
		pms270E.clickOnNext();
		pms170B.ReleaseItem();
		pms170B.closeAllTabs();
		homePage.goToProgramUsingShrt("PMS100");
		pms100B.SelectSortingOrder(sortingOrderPMS);
		pms100B.EnterSchNo(scheduleNo);
	}
}