package bi3.tests
//_copy_productStructure_sku +> complete
import org.testng.annotations.BeforeTest
import org.testng.annotations.Test
import org.testng.Assert
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.mms001.*
import bi3.pages.pds001.*
import bi3.pages.mms077.MMS077
import bi3.pages.mms077.MMS077_SelectMedia
import org.testng.annotations.BeforeMethod

class CompleteItemCreation extends BaseTest{
	
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
	}
	
	@Test
	def void CompleteItemCreation() {
		loginPage.GoTo()
		
		//Copying an item
		homePage.GoToMMS001()
		mms001.SearchByItemNumber("Y3006")
		mms001.CopyItem("Y3006")

		mms001C.Next()

		mms001E.SelectInvAccounting("1-Inv accounting")
		mms001E.SelectLotCtrlMethod("3-In lot master")
		mms001E.SelectLotNumbMethod("5-Auto order no")
		var newItemNumber = mms001E.GetItemNumber()

		mms001E.Next()
		mms001F.Next()

		mms001G.SelectSalesItem("1-Sales item")
		mms001G.Next()
		mms001H.Next()
		mms001I.Next()
		mms001J.Next()
		mms001K.Next()
		mms001M.Next()

		mms001.SearchByItemNumber(newItemNumber);
		
		//Check if item is created.
		Assert.assertTrue(mms001.GetItemNumberList().contains(newItemNumber),"Item number" + newItemNumber + "is not found in the grid");		
				
		mms001.setItemWarehouse(newItemNumber);
		
		//Assert.assertEquals(mms001ConnectWarehouse.getpageTitle().contains("Item. Connect Warehouse"),"Did not reach the Connect Warehouse page.Actual value was "+mms001ConnectWarehouse.getpageTitle());		
		
		mms001ConnectWarehouse.changeWarehouse()
		
		Assert.assertTrue(connectWarehouseE.getPageSubTitle().contains("Planning Parameters"),"Did not reach the Main warehouse change page");
		
		
		connectWarehouseE.setMastrSchedule("0-Not mstr sch it")
		connectWarehouseE.setPlanningPolicy("A6")
		connectWarehouseE.setSupplyPolicy("A01")	
		connectWarehouseE.selectContNetChange()
		connectWarehouseE.clickNext()
		
		connectWarehouseF.clickNext()
		
		connectWarehouseG.untickCrossDock()
		connectWarehouseG.clickNext();
		
		connectWarehouseH.clickNext()
		connectWarehouseI.clickNext()
				
		System.out.println("Copied Item Number : "+ newItemNumber)
		mms001ConnectWarehouse.close()
		//mms001ConnectWarehouse.goToHome()
		
		//Create Raw Material
		mms001.SearchByItemNumber("Y7001");
		mms001.CopyItem("Y7001");
		
		mms001C.Next();

		mms001E.SelectInvAccounting("1-Inv accounting");
		mms001E.SelectLotCtrlMethod("3-In lot master");
		mms001E.SelectLotNumbMethod("5-Auto order no");
		var newRawMatNumber = mms001E.GetItemNumber();
		
		mms001E.Next();
		mms001F.Next();
		mms001G.Next();
		
		mms001H.setPurchasePrice("200")
		mms001H.Next();
		
		
		mms001I.Next();
		mms001J.Next();
		mms001K.Next();
		mms001L.Next();
		mms001M.Next();
		
		mms001.SearchByItemNumber(newRawMatNumber);
		//var aaa =mms001.GetItemNumberList();
		Assert.assertTrue(mms001.GetItemNumberList().contains(newRawMatNumber),"Item number" + newRawMatNumber + "is not found in the grid");
		System.out.println(newRawMatNumber)
		
		mms001.close()
		//mms001.goToHome()
		
		homePage.GoToPDS001()
		
		//Assert.assertEquals(pds001.getpageTitle().contains("Product Structure. Open"),"Did not reach the Product Structure page.Actual value was "+pds001.getpageTitle());
		
		pds001.FillItemNumber(newItemNumber,0)
		pds001.FillSerialNumber("001",0)
		pds001.FillFacility("A01",0)
		pds001.CreateProductStructure(0)
		
		pds001.clickNext()
		pds001.clickNext()
		
		pds001F.setM3Text("Creating product structure for item "+newItemNumber)
		
		connectMaterialOperation.setSno("10")
		connectMaterialOperation.setOperation("10")
		connectMaterialOperation.setComponent(newRawMatNumber)
		connectMaterialOperation. clickAddButton()
		
		pds002E.setQuantity("10")
		
		pds001.clickNext()
		pds001.clickNext()
		
		var lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId()
		Assert.assertEquals(lastAddedComponentId,newRawMatNumber,"Actual value :"+lastAddedComponentId+" value expected is "+newItemNumber)
		
		connectMaterialOperation.clearTextSno()
		connectMaterialOperation.selectOperationFromLookUp("YACUT01")		
		connectMaterialOperation. clickAddButton()	
		connectOperations.setRuntime("10")
		
		pds001.clickNext()
		pds001.clickNext()
		
		lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId()
		Assert.assertTrue(lastAddedComponentId.contains("YACUT01"),"Actual value :"+lastAddedComponentId+" value expected is YACUT01")
		
		//SKU starts
		//Goto Home
		mms001I.GoToHome();
		
		//Go To MMS077
		homePage.GoToMMS077();
		mms077.CreateItemsByMatrix(newItemNumber);
		mms077.navigateToselectMedia();
		mms077_SelectMedia.ConfirmOutput();
		          
		Assert.assertEquals(mms077.ConfirmMsg(),"Job MMS078CL has been submitted");		          		
	}
	
	@Test
	def void CompleteItemCreationForCO() {
		loginPage.GoTo()
		
		// Copying an Finished Good item--------------------------------------------
		homePage.GoToMMS001()
		mms001.SearchByItemNumber("Y3001")
		mms001.CopyItem("Y3001")

		mms001C.Next()
		mms001E.SelectInvAccounting("1-Inv accounting")
		mms001E.SelectLotCtrlMethod("3-In lot master")
		mms001E.SelectLotNumbMethod("5-Auto order no")
		var newItemNumber = mms001E.GetItemNumber()
		
		mms001E.Next()
		mms001F.Next()
		mms001G.SelectSalesItem("1-Sales item")
		mms001G.Next()
		mms001H.Next()
		mms001I.Next()
		mms001J.Next()
		mms001K.Next()
		mms001M.Next()
		mms001.SearchByItemNumber(newItemNumber);		
		Assert.assertTrue(mms001.GetItemNumberList().contains(newItemNumber),"Item number" + newItemNumber + "is not found in the grid"); //Check if item is created.		
				
		// Set Item Warehouse Information		
		mms001.setItemWarehouse(newItemNumber);		
		mms001ConnectWarehouse.changeWarehouse()		
		Assert.assertTrue(connectWarehouseE.getPageSubTitle().contains("Planning Parameters"),"Did not reach the Main warehouse change page");
				
		connectWarehouseE.setMastrSchedule("0-Not mstr sch it")
		connectWarehouseE.setPlanningPolicy("A6")
		connectWarehouseE.setSupplyPolicy("A01")	
		connectWarehouseE.selectContNetChange()
		connectWarehouseE.clickNext()		
		connectWarehouseF.clickNext()		
		connectWarehouseG.untickCrossDock()
		connectWarehouseG.clickNext();		
		connectWarehouseH.clickNext()
		connectWarehouseI.clickNext()				
		System.out.println("Copied Item Number : "+ newItemNumber)
		mms001ConnectWarehouse.close()
		
		// TODO: Set Item Facility
		mms001.setItemFacility(newItemNumber)		
		itemFacility.selectChnage();
		itemFacilityE.selectInvAccMethod("1-Standard cost")
		itemFacilityE.clickNext();
		itemFacilityF.clickNext();
		mms001.close;
		mms001.close;
		mms001.closeAllTabs();
		mms001.goToHome();

		// Create Raw Material-----------------------------------------------------
		homePage.GoToMMS001();
		mms001.SearchByItemNumber("Y7005");
		mms001.CopyItem("Y7005");
		
		mms001C.Next();
		mms001E.SelectInvAccounting("1-Inv accounting");
		mms001E.SelectLotCtrlMethod("3-In lot master");
		mms001E.SelectLotNumbMethod("3-Auto, seq no");
		var newRawMatNumber = mms001E.GetItemNumber();
		
		mms001E.Next();
		mms001F.Next();
		mms001G.Next();		
		mms001H.setPurchasePrice("200")
		mms001H.Next();	
		mms001I.Next();
		mms001J.Next();
		mms001K.Next();
		mms001L.Next();
		mms001M.Next();
		
		mms001.SearchByItemNumber(newRawMatNumber);
		Assert.assertTrue(mms001.GetItemNumberList().contains(newRawMatNumber),"Item number" + newRawMatNumber + "is not found in the grid");
		System.out.println(newRawMatNumber)		
		mms001.close()
				
		// Creating SKUs using MMS077 ----------------------------------------------
		mms001.goToHome();
		homePage.GoToMMS077();
		mms077.CreateItemsByMatrix(newItemNumber);
		mms077.navigateToselectMedia();
		mms077_SelectMedia.ConfirmOutput();		          
		Assert.assertEquals(mms077.ConfirmMsg(),"Job MMS078CL has been submitted");	
		
		// Create SKU for Raw Material(Fabric)
		mms077.CreateItemsByMatrix(newRawMatNumber);
		mms077.navigateToselectMedia();
		mms077_SelectMedia.ConfirmOutput();		          
		Assert.assertEquals(mms077.ConfirmMsg(),"Job MMS078CL has been submitted");			
		
		// Go to MMS001 and make sure All SKUs have the status 20. If not update the status to 20 manually.
		mms077.closeAllTabs();
		mms077.goToHome();
		homePage.GoToMMS001();
		mms001.SearchByItemNumber(newItemNumber);		
		var itemData = mms001.getDataOfItem(newItemNumber);
		Assert.assertEquals(itemData.get(3),"20-Released", "Finished Good item status is not 20-Released");	
		
		mms001.SearchByItemNumber(newRawMatNumber);		
		var rawItemData = mms001.getDataOfItem(newRawMatNumber);
		Assert.assertEquals(rawItemData.get(3),"20-Released", "Raw Material item status is not 20-Released");
		
		mms001.EditItem(newRawMatNumber);
		mms001E.setStatus("20-Released");
		mms001E.Next();
		mms001E.closeAllTabs();
		mms001E.goToHome();
		homePage.GoToMMS001();
		
		mms001.SearchByItemNumber(newRawMatNumber);
		var rawItemData_sku1 = mms001.getDataOfItem(newRawMatNumber + "-Y01");
		Assert.assertEquals(rawItemData_sku1.get(3), "20-Released", "Raw Material item status is not 20-Released");
				
		// Create Product Structure----------------------------------------------
		mms001E.closeAllTabs();
		mms001E.goToHome();	
		homePage.GoToPDS001();	
		//Assert.assertEquals(pds001.getpageTitle().contains("Product Structure. Open"),"Did not reach the Product Structure page.Actual value was "+pds001.getpageTitle());
		
		pds001.SearchByItemNumber(newItemNumber);
		//pds001.FillItemNumber(newItemNumber,0);
		//pds001.FillSerialNumber("001",0);
		//pds001.FillFacility("A01",0);
		//pds001.clickApply();
		pds001.goToMaterialAndOperations(newItemNumber);					
		//pds001.CreateProductStructure(0);		
		//pds001.clickNext();
		//pds001.clickNext();				
		//pds001F.setM3Text("Creating product structure for item " + newItemNumber);
		
		connectMaterialOperation.setSno("10");
		connectMaterialOperation.setOperation("10");
		connectMaterialOperation.setComponent(newRawMatNumber);
		connectMaterialOperation.clickAddButton();		
		pds002E.setQuantity("10"); // This should be PDS002E
		
		pds001.clickNext();
		pds001.clickNext();
		
		var lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId();
		Assert.assertEquals(lastAddedComponentId,newRawMatNumber,"Actual value :"+ lastAddedComponentId +" value expected is " + newItemNumber);
		
		connectMaterialOperation.clearTextSno();
		connectMaterialOperation.selectOperationFromLookUp("YACUT01");
		connectMaterialOperation. clickAddButton();	
		connectOperations.setRuntime("10");
		
		pds001.clickNext();
		pds001.clickNext();
		
		lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId();
		Assert.assertTrue(lastAddedComponentId.contains("YACUT01"),"Actual value :" + lastAddedComponentId +" value expected is YACUT01");
		
		println("-----Item Number: " + newItemNumber);
		println("-----Raw Material Number: " + newRawMatNumber);	          		
		        		
		// Release the Raw Matirial Item (Fabric) to Status 20-Released
		connectMaterialOperation.close();
		pds001.SearchByItemNumber(newRawMatNumber);
		pds001.EditItem(newRawMatNumber);
		pds001E.setStatus("20-Released");
		pds001E.Next();
		pds001E.closeAllTabs();
		pds001E.goToHome();
		homePage.GoToPDS001()
		
		pds001.SearchByItemNumber(newRawMatNumber);
		var psData_sku1 = pds001.getDataOfItem(newRawMatNumber + "-Y01");
		Assert.assertEquals(psData_sku1.get(7), "20-Released", "Product Structure SKU item status is not 20-Released");
		
		
	}
		
	@Test
	def void CreateItemForCo_Nipuni()
	{
		loginPage.GoTo();
		homePage.GoToMMS001();
		mms001.SearchByItemNumber("Y3001");
		mms001.CopyItem("Y3001");

		mms001C.Next();

		mms001E.SelectInvAccounting("1-Inv accounting");
		mms001E.SelectLotCtrlMethod("3-In lot master");
		mms001E.SelectLotNumbMethod("5-Auto order no");
		var newItemNumber = mms001E.GetItemNumber();

		mms001E.Next();
		mms001F.Next();

		mms001G.SelectSalesItem("1-Sales item");
		mms001G.SelectConfigCode("0-Not configurbl")
		mms001G.Next();
		mms001H.Next();
		mms001I.Next();
		mms001J.Next();
		mms001K.Next();
		mms001M.Next();

		mms001.SearchByItemNumber(newItemNumber);
		//var aaa =mms001.GetItemNumberList();
		Assert.assertTrue(mms001.GetItemNumberList().contains(newItemNumber),
			"Item number" + newItemNumber + "is not found in the grid");
		//warehouse
		mms001.setItemWarehouse(newItemNumber);
		
		//Assert.assertEquals(mms001ConnectWarehouse.getpageTitle().contains("Item. Connect Warehouse"),"Did not reach the Connect Warehouse page.Actual value was "+mms001ConnectWarehouse.getpageTitle());		
		
		mms001ConnectWarehouse.changeWarehouse()
		
		Assert.assertTrue(connectWarehouseE.getPageSubTitle().contains("Planning Parameters"),"Did not reach the Main warehouse change page");
		
		connectWarehouseE.setMastrScheduleCO();
		connectWarehouseE.setPlanningPolicy("A6")
		connectWarehouseE.setSupplyPolicy("A01")	
		connectWarehouseE.selectContNetChange()
		connectWarehouseE.clickNext()
		
		connectWarehouseF.clickNext()
		
		connectWarehouseG.untickCrossDock()
		connectWarehouseG.clickNext();
		
		connectWarehouseH.clickNext()
		connectWarehouseI.clickNext()
				
		System.out.println("Copied Item Number : "+newItemNumber)
		mms001ConnectWarehouse.close() 
		
		//Go to Item Facility
		mms001.setItemFacility(newItemNumber)
		
		itemFacility.selectChnage();
		itemFacilityE.selectInvAccMethod("1-Standard cost")
		itemFacilityE.clickNext();
		itemFacilityF.clickNext();
		
		mms001.close;
		//Goto Home
		mms001I.GoToHome();
		
		//GoTo MMS001
		homePage.GoToMMS001();
		
		mms001.close();
		
		//Create Raw Material
		mms001.SearchByItemNumber("Y7001");
		mms001.CopyItem("Y7001");
		
		mms001C.Next();

		mms001E.SelectInvAccounting("1-Inv accounting");
		mms001E.SelectLotCtrlMethod("3-In lot master");
		mms001E.SelectLotNumbMethod("5-Auto order no");
		var newRawMatNumber = mms001E.GetItemNumber();
		
		mms001E.Next();
		mms001F.Next();
		mms001G.Next();
		
		mms001H.setPurchasePrice("200")
		mms001H.Next();
		
		
		mms001I.Next();
		mms001J.Next();
		mms001K.Next();
		mms001L.Next();
		mms001M.Next();
		
		mms001.SearchByItemNumber(newRawMatNumber);
		//var aaa =mms001.GetItemNumberList();
		Assert.assertTrue(mms001.GetItemNumberList().contains(newRawMatNumber),"Item number" + newRawMatNumber + "is not found in the grid");
		System.out.println(newRawMatNumber)
		
		mms001.close()
		//mms001.goToHome()
		
		homePage.GoToPDS001()
		
		//Assert.assertEquals(pds001.getpageTitle().contains("Product Structure. Open"),"Did not reach the Product Structure page.Actual value was "+pds001.getpageTitle());
		
		pds001.FillItemNumber(newItemNumber,0)
		pds001.FillSerialNumber("001",0)
		pds001.FillFacility("A01",0)
		pds001.CreateProductStructure(0)
		
		pds001.clickNext()
		pds001.clickNext()
		
		pds001F.setM3Text("Creating product structure for item "+newItemNumber)
		
		connectMaterialOperation.setSno("10")
		connectMaterialOperation.setOperation("10")
		connectMaterialOperation.setComponent(newRawMatNumber)
		connectMaterialOperation. clickAddButton()
		
		pds002E.setQuantity("10")
		
		pds001.clickNext()
		pds001.clickNext()
		
		var lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId()
		Assert.assertEquals(lastAddedComponentId,newRawMatNumber,"Actual value :"+lastAddedComponentId+" value expected is "+newItemNumber)
		
		connectMaterialOperation.clearTextSno()
		connectMaterialOperation.selectOperationFromLookUp("YACUT01")		
		connectMaterialOperation. clickAddButton()	
		connectOperations.setRuntime("10")
		
		pds001.clickNext()
		pds001.clickNext()
		
		lastAddedComponentId = connectMaterialOperation.getLastAddedComponentId()
		Assert.assertTrue(lastAddedComponentId.contains("YACUT01"),"Actual value :"+lastAddedComponentId+" value expected is YACUT01")
		
	
	}
	
	
	
}