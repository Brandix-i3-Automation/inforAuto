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
		
		val path = ConfigKeys.DATA_HELPER_PATH;
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
		
		homePage.gotoStart();
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
		pps600f.clickNext();
			
//		Assert.assertEquals(pps200b.verifyLowerStatusatLines(itemNo), "15");
//		
//		pps201b.closePanal();
//		
//		homePage.gotoStart();
//		homePage.GoToPPS200();
//		Assert.assertEquals(pps200b.verifyLowerStatus(poNo), "15");
//		
//		pps201b.closePanal();
		
	}
	
	/**
	 * @TestCaseID: 12
	 * @CloudSuite: fnb
	 * @Description: This test case is to confirm Order
	 * @author:	mathujak
	 */
	 
	@Test(priority=5,enabled=true)
	def void confirmOrder() {
		
		var String lowestStaus = hashMap2.get("LowestStaus").toString();
		var String highestStatus = hashMap2.get("HighestStatus").toString()
		
		
		loginPage.GoTo();
		homePage.GoToPPS220();
		
		pps220b.confirmOrder(poNo);
		pps600e.FillLowestStatus(lowestStaus);
		pps600e.FillHighestStatus(highestStatus);
		
		pps600e.clickNext();
		pps600f.getReportText();
		pps600f.clickNext();
			
//		Assert.assertEquals(pps200b.verifyLowerStatusatLines(itemNo), "15");
//		
//		pps201b.closePanal();
//		
//		homePage.gotoStart();
//		homePage.GoToPPS200();
//		Assert.assertEquals(pps200b.verifyLowerStatus(poNo), "15");
//		
//		pps201b.closePanal();
		
	}
}