package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.framework.util.ExcelUtil
import java.util.HashMap

class CRS530_CreateEmployee extends BaseTest{
	
	LoginPage loginPage;
	HomePage homePage;
		
	@BeforeMethod
	def void Initialize(){
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		
		
		
		
	}
	
	/**
	 * @TestCaseID: TC5
	 * @CloudSuite: F&B
	 * @Description: This test case includes the process of creating an employee with program CRS530
	 * @author: rashadr
	 */
	 
	 @Test
	def void createEmployee(){
		loginPage.GoTo();
		homePage.goToProgram("CRS530")
		
		
		}
	
	}