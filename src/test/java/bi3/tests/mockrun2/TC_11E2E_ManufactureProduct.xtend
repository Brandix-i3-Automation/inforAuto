package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.mms001.MMS001
import bi3.pages.mms001.MMS001C
import bi3.pages.mms001.MMS001E
import bi3.pages.mms001.MMS001F
import bi3.pages.mms001.MMS001G
import bi3.pages.mms001.MMS001H
import bi3.pages.mms001.MMS001J
import bi3.pages.mms001.MMS001I
import bi3.pages.mms001.MMS001K
import bi3.pages.mms001.MMS001L
import bi3.pages.mms001.MMS001M
import bi3.pages.mms077.MMS077
import bi3.pages.mms077.MMS077_SelectMedia
import bi3.pages.mms001.MMS001ConnectWarehouseE
import bi3.pages.mms001.MMS001ConnectWarehouse
import bi3.pages.mms001.MMS001ConnectWarehouseG
import bi3.pages.mms001.MMS001ConnectWarehouseF
import bi3.pages.mms001.MMS001ConnectWarehouseH
import bi3.pages.mms001.MMS001ConnectWarehouseI
import bi3.pages.mms001.MMS001ItemFacility
import bi3.pages.mms001.MMS001ItemFacilityE
import bi3.pages.mms001.MMS001ItemFacilityF
import bi3.pages.pds001.PDS001
import bi3.pages.pds001.PDS001F
import bi3.pages.pds001.PDS001E
import bi3.pages.pds001.PDS001ConnectMaterialOperation
import bi3.pages.pds001.PDS001ConnectOperations
import bi3.pages.ois100.OIS100A
import bi3.pages.ois100.OIS100G
import bi3.pages.ois101.OIS101B1
import bi3.pages.pds001.PDS600E
import bi3.pages.ois101.OIS101E
import bi3.pages.crs207.CRS207_B
import org.testng.annotations.Test
import bi3.pages.ois300.OIS300
import bi3.pages.ois300.OIS300CutomerOrderOpenLines
import bi3.pages.ois300.OIS300Availability
import bi3.pages.ois300.OIS300MaterialPlan
import bi3.pages.ois300.OIS300PlannedPurchaseOrder
import bi3.pages.ois300.OIS300SimulateForMaterial

import bi3.pages.pcs200.PCS200E
import bi3.pages.pcs200.PCS200F
import bi3.pages.mms002.MMS002B
import bi3.pages.mms002.MMS002G
import bi3.pages.mms002.MMS002I
import bi3.pages.mms002.MMS002E
import bi3.pages.pps170.PPS170B
import bi3.pages.pms001.PMS001_B
import bi3.pages.pms001.PMS001_E
import bi3.pages.pms001.PMS001_F
import bi3.pages.pms001.PMS270_B1
import bi3.framework.util.DateUtil
import bi3.pages.pms001.PMS270_E
import bi3.pages.cas950.CAS950E
import bi3.pages.cas310.CAS310
import bi3.tests.fnb.EndToEndMadeToOrderTest
import bi3.pages.ois100.OIS100H
import bi3.pages.mws060.MWS060B
import org.testng.annotations.BeforeMethod
import bi3.pages.pms100.PMS100_B
import org.testng.Assert

class TC_11E2E_ManufactureProduct extends BaseTest {


	LoginPage loginPage
	HomePage homePage
	MMS001 mms001
	MMS001C mms001C
	MMS001E mms001E
	MMS001F mms001F
	MMS001G mms001G
	MMS001H mms001H
	MMS001I mms001I
	MMS001J mms001J
	MMS001K mms001K
	MMS001L mms001L
	MMS001M mms001M
	MMS077 mms077
	MMS077_SelectMedia mms077_SelectMedia
	MMS001ConnectWarehouse mms001ConnectWarehouse
	MMS001ConnectWarehouseE connectWarehouseE
	MMS001ConnectWarehouseF connectWarehouseF
	MMS001ConnectWarehouseG connectWarehouseG
	MMS001ConnectWarehouseH connectWarehouseH
	MMS001ConnectWarehouseI connectWarehouseI
	MMS001ItemFacility itemFacility
	MMS001ItemFacilityE itemFacilityE
	MMS001ItemFacilityF itemFacilityF

	PDS001 pds001
	PDS001F pds001F
	PDS001ConnectMaterialOperation connectMaterialOperation;
	PDS001E pds001E
	PDS001E pds002E
	PDS001ConnectOperations connectOperations

	OIS100A ois100A
	OIS100G ois100G
	OIS101B1 ois101B1
	PDS600E pds600E
	OIS101E ois101e
	CRS207_B crs207B
	OIS100H ois100H

	OIS300 ois300
	OIS300Availability ois300Availability
	OIS300CutomerOrderOpenLines ois300CustomerOrderOpenLines
	OIS300MaterialPlan ois300MaterialPlan
	OIS300PlannedPurchaseOrder ois300PlannedPurchaseOrder
	OIS300SimulateForMaterial ois300SimulateForMaterial

	PCS200E pcs200e
	PCS200F pcs200f

	MMS002B mms002b
	MMS002G mms002g
	MMS002I mms002i
	MMS002E mms002e
	PPS170B pps170b

	EndToEndMadeToOrderTest EndToEndMadeToOrderTest
	MWS060B MWS060B

	PMS001_B pms001_b
	PMS001_E pms001_e
	PMS001_F pms001_f
	PMS270_B1 pms270_b1
	PMS270_E pms270_e
	CRS207_B crs207_b

	CAS950E cas950_E
	CAS310 cas310
	
	PMS100_B pms100_b

	@BeforeMethod
	def void Initialize() {
		
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		mms001 = new MMS001(driver);
		mms001C = new MMS001C(driver);
		mms001E = new MMS001E(driver);
		mms001F = new MMS001F(driver);
		mms001G = new MMS001G(driver);
		mms001H = new MMS001H(driver);
		mms001I = new MMS001I(driver);
		mms001J = new MMS001J(driver);
		mms001K = new MMS001K(driver);
		mms001L = new MMS001L(driver);
		mms001M = new MMS001M(driver);
		mms077 = new MMS077(driver);
		pps170b = new PPS170B(driver);

		mms002b = new MMS002B(driver);
		mms002g = new MMS002G(driver);
		mms002i = new MMS002I(driver);
		mms002e = new MMS002E(driver);
		pms001_b = new PMS001_B(driver);
		pms001_e = new PMS001_E(driver);
		pms001_f = new PMS001_F(driver);
		pms270_b1 = new PMS270_B1(driver);
		pms270_e = new PMS270_E(driver);
		crs207_b = new CRS207_B(driver);

		mms077_SelectMedia = new MMS077_SelectMedia(driver);
		mms001ConnectWarehouse = new MMS001ConnectWarehouse(driver)
		connectWarehouseE = new MMS001ConnectWarehouseE(driver)
		connectWarehouseF = new MMS001ConnectWarehouseF(driver)
		connectWarehouseG = new MMS001ConnectWarehouseG(driver)
		connectWarehouseH = new MMS001ConnectWarehouseH(driver)
		connectWarehouseI = new MMS001ConnectWarehouseI(driver)
		itemFacility = new MMS001ItemFacility(driver);
		itemFacilityE = new MMS001ItemFacilityE(driver);
		itemFacilityF = new MMS001ItemFacilityF(driver);

		pds001 = new PDS001(driver)
		pds001F = new PDS001F(driver)
		connectMaterialOperation = new PDS001ConnectMaterialOperation(driver)
		pds001E = new PDS001E(driver)
		pds002E = new PDS001E(driver)
		connectOperations = new PDS001ConnectOperations(driver)

		ois100A = new OIS100A(driver);
		ois100G = new OIS100G(driver);
		ois101B1 = new OIS101B1(driver);
		pds600E = new PDS600E(driver);
		ois101e = new OIS101E(driver);
		crs207B = new CRS207_B(driver);
		ois100H = new OIS100H(driver);

		ois300Availability = new OIS300Availability(driver)
		ois300CustomerOrderOpenLines = new OIS300CutomerOrderOpenLines(driver)
		ois300MaterialPlan = new OIS300MaterialPlan(driver)
		ois300PlannedPurchaseOrder = new OIS300PlannedPurchaseOrder(driver)
		ois300SimulateForMaterial = new OIS300SimulateForMaterial(driver)
		ois300 = new OIS300(driver)


		pcs200e = new PCS200E(driver);
		pcs200f = new PCS200F(driver);
		EndToEndMadeToOrderTest = new EndToEndMadeToOrderTest(driver);
		MWS060B = new MWS060B(driver);

		cas950_E = new CAS950E(driver);
		cas310 = new CAS310(driver);
	}

	/**
	 * @TestCaseID: 11
	 * @CloudSuite: General
	 * @Description : 
	 * @author: 
	 */
	@Test
	def void ManufactureProductTest () {
		
		CreateMO();
	//	workCeneterSchedules();
	//	ValidateCostsAndVariances();
		
	}

	/**
	 * Crate MO 
	 */
	def void CreateMO() {

		var startDate = "170526"
	//	var 
		// 
		loginPage.GoTo();
		homePage.GoToPMS001();
		var prodNo = "D10929";
		pms001_b.EnterProductNumber(prodNo);
		pms001_b.ClickOnCreate();

		Thread.sleep(2000);
		// validate for the page navigation
				
	    Assert.assertEquals(pms001_b.ValidateInterfaceDetails()	, "PMS001/E");
	    
	    println("Assertion is done");

		pms001_e.EnterStartDate(startDate);
		pms001_e.EnterOrderQty("10");
		pms001_e.clickNext();

		// Assert.assertEquals(pms001_e.ValidateInterfaceDetails()	, "PMS001/F");
		pms001_f.ClickScheduleNoLookUp();
		pms001_f.EnterF4();

		var scheduleNo = DateUtil.GetTimestamp();
		pms270_b1.EnterScheduleNo(scheduleNo);
		pms270_b1.ClickOnCreate();

		println("before EnterDescription");
		pms270_e.EnterDescription(scheduleNo);
		pms270_e.clickNext();

		pms270_b1.EnterF12();

		println("EnterF12 clicked");

		pms001_f.EnterScheduleNo(scheduleNo);

		println("EnterScheduleNo clicked");
		pms001_f.clickNext();
		println("1");
//        crs207_b.EnterDescriptionGrid("200");
//        println("2")
//        crs207_b.clickNext();
//        println("3")
		mms001.close();
		println("closed pms001")
		homePage.GoToPMS100();
		pms100_b.SelectSortingOrder("91-SchNo/Product");

		pms100_b.SearchScheduleNo(scheduleNo);

		pms100_b.goTOMeterialOperations();

		var dataGridValue = pms100_b.getGridValue();

		print(" dataGridValue is " + dataGridValue);

		pms100_b.close();

		pms100_b.close();

	}

	/**
	 * work Ceneter Schedules
	 */
	def void workCeneterSchedules() {

		loginPage.GoTo();
		// Navigate to PMS230
		homePage.GoToPMS230();
		pms270_b1.enterView("F01");
		pms270_b1.clickNext();
		// change the drop down to -- no need
		// Enter new schedule Nos
		pms270_b1.enterScheduleNos("85", "85")
		pms270_b1.ClickActions();

	}

	/**
	 * Internal Accounting entry creation
	 */
	def void createInternalAccoutingEntry() {

		loginPage.GoTo();
		homePage.GoToCAS950();
		// Enter from and To dates
		cas950_E.selectFromDate("170508");
		cas950_E.selectToDate("170531");
		cas950_E.checkStockTrance();
		cas950_E.checkOpTranceMo();
		cas950_E.checkOtherTrance();
		cas950_E.checkOpTranceWo();
		cas950_E.checkOrderCosting();

		cas950_E.clickNext();

		if (cas950_E.getLblMessageBarContent.contains("progress")) {

			pms100_b.close();
		}

	}

	/**
	 * Validate costs and variances //Excel Last Process
	 */
	def void ValidateCostsAndVariances() {

		loginPage.GoTo();
		// navigate to CAS310
		homePage.GoToCAS310();
		// validate for the header value
		Assert.assertEquals(cas310.validateHeader(), "Order Costing. Display");
		// Set the Ascending order
		cas310.SelectSortingOrder("2-Per facility and order no");
		// In
		cas310.addFacilityDetails("D01");
	}

}

