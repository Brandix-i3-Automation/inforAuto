/**
 * @TestCaseID : 6
 * @CloudSuite : f&b
 * @Description : Creation of a new view
 * @Author : NipuniP
 * 
 */

package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.crs020.CRS020B
import bi3.pages.ToolbarPage
import bi3.pages.crs020.CRS020P
import bi3.pages.crs016.CRS016B
import org.testng.Assert
import bi3.pages.mms001.MMS001

class CreationOfANewView extends BaseTest {
	LoginPage loginPage
	HomePage homePage
	CRS020B crs020B
	ToolbarPage toolBarPage
	CRS020P crs020P
	CRS016B crs016B
	MMS001 mms001	
	@BeforeMethod
	def void Initialize()
	{
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		crs020B = new CRS020B(driver)
		toolBarPage = new ToolbarPage(driver)
		crs020P = new CRS020P(driver)
		crs016B = new CRS016B(driver)
		mms001 = new MMS001(driver)
		
	}
	 @Test
	 def void creationOfANewViewTest()
	 {
	 	//Navigate to CRS020
	 	loginPage.GoTo();
	 	homePage.goToProgram("CRS020");
	 	
	 	//Set Panel Sequence
	 	toolBarPage.ClickAction_Settings();
	 	crs020P.setPanelSequenceE();
	 	
	 	crs020P.clickOnNext();
	 	
	 	//Insert the Program MMS001
	 	crs020B.insertProgram("MMS001");
	 	
	 	//Set sorting order to o
	 	crs020B.setSortingOrder("0-All")
	 	
	 	//Insert View as TST01-01
	 	crs020B.insertView("TST01-01")
	 	
	 	//Delete data if exist
	 	crs020B.deleteData("TST01-01");
	 	
	 	toolBarPage.clickCreateLogo();
	 	
	 	//Verify the panel ID
	 	Assert.assertEquals(crs016B.pageId,"CRS016/B")
	 	
	 	//Enter the description
	 	crs016B.fillDescription("Test View");
	 	
	 	//Enter the name
	 	crs016B.fillName("Test View");
	 	
	 	//Fill the fields according to seq no
	 	crs016B.fillSeq10Feild("MMITNO","MMITTY", "MMITGR", "MMITDS", "MMFUDS", "MMSTAT");
	 	
	 	//Navigate to CRS020 to Check whether the record is exist
	 	crs016B.closeAllTabs();
	 	homePage.goToProgram("CRS020");
	 	
	 	//Insert the Program MMS001
	 	crs020B.insertProgram("MMS001");
	 	
	 	//Insert View as TST01-01
	 	crs020B.insertView("TST01-01")
	 	
	 	//Verify whether the record is exist
	 	Assert.assertEquals(crs020B.checkRecord("Description"), "Test View")
		
		//Navigate to MMS001
		crs020B.closeAllTabs();
		homePage.goToProgram("MMS001");
		
		//Check whether the entered view is displayed
		Assert.assertTrue(mms001.checkTheview("TST01-01-Test View"));
		
		//Close MMS001
		mms001.closeAllTabs();
	 }
	 
	
}