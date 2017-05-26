package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.ToolbarPage
import bi3.pages.crs530.CRS530B1
import bi3.configuration.settings.CRS530SettingTest
import bi3.pages.crs530.CRS530_E
import org.testng.Assert

class CRS530_CreateEmployee extends BaseTest{
	
	LoginPage loginPage;
	HomePage homePage;
	ToolbarPage toolbarPage
	CRS530B1 crs530b1
	CRS530SettingTest crs530SettingTest
	CRS530_E crs530_e
		
	@BeforeMethod
	def void Initialize(){
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		toolbarPage = new ToolbarPage(driver);
		crs530b1 = new CRS530B1(driver);
		crs530SettingTest = new CRS530SettingTest(driver);
		crs530_e = new CRS530_E(driver);
		
	}
	
	/**
	 * @TestCaseID: TC5
	 * @CloudSuite: F&B
	 * @Description: This test case includes the process of creating an employee with program CRS530
	 * @author: rashadr
	 */
	 
	 @Test
	def void createEmployee(){
		
		var empNo= "0001";
		loginPage.GoTo();
		
		homePage.goToProgram("CRS530")
		crs530SettingTest.SetPanelSqequence()
		crs530b1.enterEmplNo("0001")
		//var String empNo = crs530b1.getEmploNoLblValue()
		//System.out.println(empNo)
		
		
		if (crs530b1.getEmploNoLblValue().equals(empNo)){
			System.out.print("Entered to the deletion part");
		crs530b1.selectAllRows()
		toolbarPage.ClickOption_Delete()
		crs530b1.ClickNext()
		crs530b1.ClickNext()
		toolbarPage.clickCreateLogo
		crs530_e.enterFullName("Dulan Jayasekara");
		crs530_e.enterUser("DULANJ")
		crs530_e.enterWorkSch(1);
		crs530_e.selectScheduleFrDt();
		crs530_e.ClickNext()
		Assert.assertEquals(crs530b1.getEmploNoLblValue(), empNo, " Employee number is successfully created ");
		}
		else{
		System.out.print("creation part");
			
		toolbarPage.clickCreateLogo
		crs530_e.enterFullName("Dulan Jayasekara");
		crs530_e.enterUser("DULANJ")
		crs530_e.enterWorkSch(1);
		crs530_e.selectScheduleFrDt();
		crs530_e.ClickNext()
		
		Assert.assertEquals(crs530b1.getEmploNoLblValue(), empNo, " Employee number is successfully created ");
		}

		}
	
	}