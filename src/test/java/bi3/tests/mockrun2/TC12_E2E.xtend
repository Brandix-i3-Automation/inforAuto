package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.pps200.PPS200A
import bi3.pages.pps200.PPS200B
import bi3.framework.util.ExcelUtil
import java.util.HashMap
import bi3.framework.config.ConfigKeys
import org.testng.Assert
import bi3.pages.pps200.PPS200E
import bi3.pages.pps200.PPS200F
import bi3.pages.pps200.PPS200G
import bi3.pages.pps201.PPS201B
import bi3.pages.pps215.PPS215B
import bi3.pages.pps600.PPS600E
import bi3.pages.pps600.PPS600F
import bi3.pages.pps220.PPS220B
import bi3.pages.pps220.PPS220G1
import bi3.pages.pps250.PPS250B1
import bi3.pages.pps300.PPS300A
import bi3.pages.pps300.PPS300B
import bi3.pages.pps300.PPS300E
import bi3.pages.pps201.PPS201E
import bi3.pages.pps320.PPS320A
import bi3.pages.pps330.PPS330B
import bi3.pages.pps320.PPS320E
import bi3.pages.mns212.MNS212B1
import bi3.pages.pps310.PPS310E

class TC12_E2E extends BaseTest {
	
	LoginPage loginPage
	HomePage homePage
	PPS200A  pps200a
	PPS200B  pps200b
	PPS200E  pps200e
	PPS200F  pps200f
	PPS200G  pps200g
	PPS201B  pps201b
	PPS215B  pps215b
	PPS600E  pps600e
	PPS600F  pps600f
	PPS220B  pps220b
	PPS220G1  pps220g1
	PPS250B1  pps250b1
	PPS300A  pps300a
	PPS300B  pps300b
	PPS300E  pps300e
	PPS201E pps201e
	PPS320A pps320a
	PPS330B pps330b
	PPS320E pps320e
	MNS212B1 mns212b1
	PPS310E pps310e
	
	ExcelUtil pps200Adata;
	HashMap<String, String> hashMap;
	ExcelUtil pps201Bdata;
	HashMap<String, String> hashMap1;
	ExcelUtil pps600Edata;
	HashMap<String, String> hashMap2;
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		pps200a = new PPS200A(driver);
		pps200b = new PPS200B(driver);
		pps200e = new PPS200E(driver);
		pps200f = new PPS200F(driver);
		pps200g = new PPS200G(driver);
		pps201b = new PPS201B(driver);
		pps215b = new PPS215B(driver);
		pps600e = new PPS600E(driver);
		pps600f = new PPS600F(driver);
		pps220b = new PPS220B(driver);
		pps220g1 = new PPS220G1(driver);
		pps250b1 = new PPS250B1(driver);
		pps300a = new PPS300A(driver);
		pps300b = new PPS300B(driver);
		pps300e = new PPS300E(driver);
		pps201e = new PPS201E(driver);
		pps320a = new PPS320A(driver);
		pps330b = new PPS330B(driver);
		pps320e = new PPS320E(driver);
		mns212b1 = new MNS212B1(driver);
		pps310e = new PPS310E(driver);
		
		val path = ConfigKeys.MOCKRUN2_TEST_DATA_PATH;
		val sheetPPS200A = "PPS200A";
		val sheetPPS201B = "PPS201B";
		val sheetPPS600E = "PPS600E";

		pps200Adata = new ExcelUtil(path, sheetPPS200A);
		hashMap = pps200Adata.getExcelActiveSheetFirstTwoColumnData;
		pps201Bdata = new ExcelUtil(path, sheetPPS201B);
		hashMap1 = pps201Bdata.getExcelActiveSheetFirstTwoColumnData;
		pps600Edata = new ExcelUtil(path, sheetPPS600E);
		hashMap2 = pps600Edata.getExcelActiveSheetFirstTwoColumnData;
	}
	var String poNo;
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is implies PO creation
	 * @author:	mathujak
	 */
	 
	@Test(priority=1,enabled=true)
	def void POCreation() {
		
		// TestData PPS200A
		var String pageLabel = hashMap.get("PageLabel").toString();
		var String supplier = hashMap.get("Supplier").toString();
		var String delDate = hashMap.get("DelDate").toString();
		var String orderType = hashMap.get("OrderType").toString();
		
		// TestData PPS201B
		var String itemNo = hashMap1.get("ItemNo").toString();
		var String orderQty = hashMap1.get("OrderQty").toString();
		var String POu = hashMap1.get("POu").toString();
		var String purPrice = hashMap1.get("PurPrice").toString();
		
		
		loginPage.GoTo();
		homePage.GoToPPS200();
		
		pps200b.CreatePOno();
		
		//Validate whether it redirected to correct page called "PPS200/A"
		Assert.assertEquals(pps200a.pageLabel(), pageLabel);
		pps200a.fillPOData(supplier,delDate,orderType);
		
		pps200a.clickNext();
		pps200e.ClickNext();
		pps200f.ClickNext();
		pps200g.ClickNext();
		
		//Validate whether grid is empty or not-->Should be empty
		Assert.assertEquals(pps201b.CheckIfDetailsGridEmpty(), true);
		
		poNo = pps201b.getPOno();
		pps201b.fillLineEntry(itemNo,orderQty,POu,purPrice);
		pps215b.closePanal();
		
		//Validate whether grid is empty or not-->Should not empty
		Assert.assertEquals(pps201b.CheckIfDetailsGridEmpty(), false);	
		pps215b.closePanal();
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is verify PO created or not
	 * @author:	mathujak
	 */
	 
	@Test(priority=2,enabled=true)
	def void VerifyPOcreated() {
		
		loginPage.GoTo();
		homePage.GoToPPS200();
		
		//Verify whether PO has created or not
		Assert.assertEquals(pps200b.SearchPONo(poNo), true);
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is create PO lines
	 * @author:	mathujak
	 */
	 
	@Test(priority=3,enabled=true)
	def void CreatePOLines() {
		var String itemNo = hashMap1.get("ItemNo").toString();
		
		loginPage.GoTo();
		homePage.GoToPPS200();
		
		Assert.assertEquals(pps200b.SearchPONo(poNo), true);
		pps200b.GoToLinesOfRecordWithPO(poNo);
		
		//Verify whether LowerStatus on Lines display 15
		Assert.assertEquals(pps200b.verifyLowerStatusatLines(itemNo), "15");
		
		pps201b.closePanal();
		
		homePage.getStartPageName();
		homePage.GoToPPS200();
		
		//Verify whether LowerStatus on Lines display 15 on PPS200B page
		Assert.assertEquals(pps200b.verifyLowerStatus(poNo), "15");
		
		pps201b.closePanal();
		
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to print Order
	 * @author:	mathujak
	 */
	 
	@Test(priority=4,enabled=true)
	def void printOrder() {
		
		var String lowestStaus = hashMap2.get("LowestStaus").toString();
		var String highestStatus = hashMap2.get("HighestStatus").toString()
		
		loginPage.GoTo();
		homePage.GoToPPS600();
		
		pps600e.FillPONumbers(poNo);
		pps600e.FillLowestStatus(lowestStaus);
		pps600e.FillHighestStatus(highestStatus);
		
		pps600e.clickNext();
		pps600f.getReportText();
		pps600e.clickNext();
		mns212b1.ConfirmOutput();
		mns212b1.ConfirmOutput();
		mns212b1.ConfirmOutput();
		mns212b1.ConfirmOutput();
		
		//Verify whether it display a message as "Job PPS601CL has been submitted"
		Assert.assertEquals(pps600e.findMessage(), "Job PPS601CL has been submitted");	
		pps600f.clickNext();
		pps600e.closePanal();
		
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is verify status after Print POjob
	 * @author:	mathujak
	 */
	 
	@Test(priority=5,enabled=true)
	def void verifyPrintPOjob() {
		
		var String afterPrintOrderLowestStaus = hashMap2.get("APOLowestStaus").toString();
		var String afterPrintOrderHighestStatus = hashMap2.get("APOHighestStatus").toString()
		
		loginPage.GoTo();
		homePage.GoToPPS600();
		
		//Verify whether lowest status display as "20"
		Assert.assertEquals(pps200b.verifyLowerStatus(afterPrintOrderLowestStaus), "20");
		
		//Verify whether highest status display as "20"
		Assert.assertEquals(pps200b.verifyHighestStatus(afterPrintOrderHighestStatus), "20");
		
		pps200b.closePanal();
		
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to confirm Order
	 * @author:	mathujak
	 */
	 
	@Test(priority=6,enabled=true)
	def void confirmOrder() {
		
		var String panalName = "PPS250/B1 ";
		var String rawMaterialName = hashMap1.get("ItemNo").toString();
		var String confirmedQTY = hashMap1.get("OrderQty").toString();
		
		
		loginPage.GoTo();
		homePage.GoToPPS220();
		
		pps220b.confirmOrder(poNo);
		pps220g1.confirmUpdate();
		
		//Verify whether it redirected to correct panal
		Assert.assertEquals(pps250b1.validatePanal(panalName).text, panalName);
		
		pps250b1.enterPoNumber(poNo);
		Assert.assertEquals(pps250b1.getConfirmedQTY(rawMaterialName), confirmedQTY);
		
		pps250b1.getConfirmedQTY(rawMaterialName);
		pps250b1.clickEnter();
		pps250b1.closePanal();
		
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to good receipt
	 * @author:	mathujak
	 */
	 
	@Test(priority=7,enabled=true)
	def void goodReceipt() {
		
		var String sortingOrder = hashMap2.get("SortingOrder").toString();//1-Open lines
		var String afterGoodReceiptLowestStatus = hashMap2.get("AGRLowestStaus").toString();
		var String afterGoodReceiptHighstStatus = hashMap2.get("AGRHighestStatus").toString()
		
		
		loginPage.GoTo();
		homePage.GoToPPS300();
		
		pps300a.setPONum(poNo);
		pps300a.ClickNext();
		
		pps300b.setSortingOrder(sortingOrder);
		pps300b.goToChange();
		
		pps300e.SetRecieveQtyAsConfirmedQty();
		pps300e.ClickNext();
		pps300b.closePanal();
		
		homePage.GoToPPS200();
		
		//Verify whether lowest status display as "50"
		Assert.assertEquals(pps200b.verifyLowerStatus(afterGoodReceiptLowestStatus), "50");
		
		//Verify whether highest status display as "50"
		Assert.assertEquals(pps200b.verifyHighestStatus(afterGoodReceiptHighstStatus), "50");
		
			
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to putaway
	 * @author:	mathujak
	 */
	 var String receivingNo;
	@Test(priority=8,enabled=true)
	def void putAway() {
		
		var String afterPutAwayLowestStatus = hashMap2.get("APWLowestStaus").toString();
		var String afterPutAwayHighstStatus = hashMap2.get("APWighestStatus").toString();
		
		
		loginPage.GoTo();
		homePage.GoToPPS330();
		receivingNo = pps330b.getRecievingNoOf(poNo);
		pps201e.closePanal();
		
		homePage.GoToPPS220();
		
		pps220b.gotoChange();
		var String POorderline = pps201e.getPOline();
		
		pps201e.closePanal();
		pps220b.closePanal();
		
		homePage.GoToPPS320();
		
		pps320a.setOpeningPanalAsAentry();
		pps320a.ClickNext();
		pps320a.setReceivingNo(receivingNo);
		pps320a.setPoNo(poNo);
		pps320a.setLineNo(POorderline);
		pps320a.ClickNext();
		pps320e.EnterStoredQtyAsRecieved();
		pps320e.ClickNext();
		pps320a.closePanal();
		
		mns212b1.ConfirmOutput();
		
		homePage.GoToPPS200();
		
		//Verify whether lowest status display as "51"
		Assert.assertEquals(pps200b.verifyLowerStatus(afterPutAwayLowestStatus), "51");
		
		//Verify whether highest status display as "51"
		Assert.assertEquals(pps200b.verifyHighestStatus(afterPutAwayHighstStatus), "51");
			
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to inception
	 * @author:	mathujak
	 */
	 
	@Test(priority=9,enabled=true)
	def void inception() {
		
		var String afterInspectionLowestStatus = hashMap2.get("AILowestStaus").toString();
		var String afterInspectionHighstStatus = hashMap2.get("AIWighestStatus").toString()
		
		loginPage.GoTo();
		homePage.GoToPPS220();
		
		pps220b.gotoChange();
		var String POorderline = pps201e.getPOline();
		
		pps201e.closePanal();
		pps220b.closePanal();
		pps201e.closePanal();
		pps220b.closePanal();
		
		homePage.GoToPPS320();
		
		pps320a.setOpeningPanalAsAentry();
		pps320a.ClickNext();
		pps320a.setReceivingNo(receivingNo);
		pps320a.setPoNo(poNo);
		pps320a.setLineNo(POorderline);
		pps320a.ClickNext();
		pps310e.enterApprovedQty();
		pps310e.ClickNext();
		
		pps320a.closePanal();
		
		mns212b1.ConfirmOutput();
		
		homePage.GoToPPS200();
		
		//Verify whether lowest status display as "75"
		Assert.assertEquals(pps200b.verifyLowerStatus(afterInspectionLowestStatus), "75");
		
		//Verify whether highest status display as "75"
		Assert.assertEquals(pps200b.verifyHighestStatus(afterInspectionHighstStatus), "75");
	}
}