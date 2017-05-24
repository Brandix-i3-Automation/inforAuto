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

class TC10_PlanDemandAndSupply extends BaseTest{
	
	LoginPage loginPage
	HomePage homePage
	OSS420B oss420B
	OSS420E oss420E
	OSS421A oss421A
	MMS001 mms001
	MMS001C mms001C
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
		
		//oss401_CreatDataSet = new OSS401_CreateDataSet(driver);
	}
	
	/**
	 * @TestCaseID: TC10
	 * @CloudSuite: F&B
	 * @Description: Plan Demand & Supply full flow
	 * @author: mohamedi
	 */
	@Test
	def void TC10FullFlow() {
		//Create an item as a Prerequisite
		var item = itemCreation();
		//create Data set
		oss401_CreatDataSet.OSS401_CreateDataSet();
		createSalesBudget();
	}
	
	/**
	 * Copying item form MMS001
	 * return : Item Number
	 */
	def itemCreation(){
		homePage.goToProgramUsingShrt("MMS001");
		mms001.SearchByItemNumber("D10031");
		mms001.CopyItem("D10031");
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
		oss420B.setPanelSequence("E");
		oss420B.createSaleBud("D099","BUD");
		oss420E.fillInformation("Test Sales Budget","Test Sales Budget","0-Not in budget","1-Manual budget","USD","01","3","1-Subtotal - stan");
		oss420B.selectDataset("D099");
		oss420B.pressShortcutKeys("20")
		Assert.assertEquals(oss420B.getBudStatus("D099"),"20","Status Incorrect");		
	}
	
	/**
	 * Insert budget values
	 * @param: Item Number
	 */
	def insertBudgetValues(String item){
		oss420B.selectDataset("D099");
		oss420B.pressShortcutKeys("11");
		Assert.assertEquals(oss420B.getPageId,"OSS421/A","Page not found");
		oss421A.fillSaleValues("001",item);
		Assert.assertEquals(oss420B.getPageId,"OSS421/B1","Page not found");
		oss420B.pressShortcutKeys("1");
		Assert.assertEquals(oss420B.getPageId,"OSS421/E","Page not found");
	}

	

}