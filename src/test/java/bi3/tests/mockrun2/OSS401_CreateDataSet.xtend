package bi3.tests.mockrun2

import bi3.tests.BaseTest
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test
import bi3.pages.LoginPage
import bi3.pages.HomePage
import bi3.pages.oss401.*
import bi3.configuration.settings.OSS401SettingsTest
import org.testng.Assert
import bi3.pages.oss402.OSS402B1
import bi3.pages.oss402.OSS402E
import bi3.pages.oss406.OSS406B1
import bi3.pages.oss406.OSS406E

class OSS401_CreateDataSet extends BaseTest{
	
	LoginPage loginPage
	HomePage homePage
	OSS401SettingsTest oss401SettingsTest
	OSS401B1 oss401b1
	OSS401D oss401d
	OSS401E oss401e
	OSS402B1 oss402b1
	OSS402E oss402e
	OSS406B1 oss406b1
	OSS406E oss406e
	
	@BeforeMethod
	def void Initialize() {
		loginPage = new LoginPage(driver)
		homePage = new HomePage(driver)
		oss401SettingsTest = new OSS401SettingsTest(driver)
		oss401b1 = new OSS401B1(driver)
		oss401d = new OSS401D(driver)
		oss401e = new OSS401E(driver)
		oss402b1 = new OSS402B1(driver)
		oss402e = new OSS402E(driver)
		oss406b1 = new OSS406B1(driver)
		oss406e = new OSS406E(driver)
	}
	
	/**
	 * @TestCaseID: TC3
	 * @CloudSuite: F&B
	 * @Description: This test case includes the process of creating a data set with program OSS401
	 * @author: dasunik
	 */
	@Test
	def void OSS401_CreateDataSet(){
		
		var panelSeq = "E123"
		var dataset = "D001"
		var desc = "Cloud Suite Automation Testing"
		var name = "Testing Dataset"
		var periodType = "1-Period type 1"
		var key1 = "UCWHLO"
		var key2 = "UCITNO"
		var seq = "1"
		var field = "UCDEMA"
		var seq2 = "2"
		var field2 = "UCIVQT"
		var seq3 = "3"
		var field3 = "UCORQT"
		var ttp1 = "31"
		var ttp2 = "32"
		var ttp3 = "33"
		var ttp4 = "34"
		
		loginPage.GoTo()
		oss401SettingsTest.SetPanelSequence(panelSeq)
		homePage.goToProgram("OSS401")
		
		var datasetExists = oss401b1.searchDataSet(dataset)
		if(datasetExists){
			oss401b1.deactivateDataset(dataset)
			oss401b1.deleteDataset(dataset)
			oss401d.clickNext()
			oss401b1.refreshPage()
			datasetExists = oss401b1.searchDataSet(dataset)
		}
		Assert.assertFalse(datasetExists)
		
		oss401b1.createNewDataset(dataset)
		Assert.assertTrue(oss401e.getPageId().contains("OSS401/E"))
		oss401e.enterDescription(desc)
		Thread.sleep(5000)
		oss401e.enterName(name)
		oss401e.enterPeriodType(periodType)
		oss401e.enterValueForKey("1",key1)
		oss401e.enterValueForKey("2",key2)
		oss401e.clickOnNext()
		
		Assert.assertTrue(oss402b1.getPageId().contains("OSS402/B1"))
		oss402b1.enterSeq(seq)
		oss402b1.enterField(field)
		oss402b1.create()
		Assert.assertTrue(oss402b1.getPageId().contains("OSS402/E"))
		oss402e.selectFCMtdFrWhs()
		oss402e.clickOnNext()
		
		oss402b1.enterSeq(seq2)
		oss402b1.enterField(field2)
		oss402b1.create()
		Assert.assertTrue(oss402b1.getPageId().contains("OSS402/E"))
		//oss402e.selectFCMtdFrWhs()
		oss402e.clickOnNext()
		
		oss402b1.enterSeq(seq3)
		oss402b1.enterField(field3)
		oss402b1.create()
		Assert.assertTrue(oss402b1.getPageId().contains("OSS402/E"))
		//oss402e.selectFCMtdFrWhs()
		oss402e.clickOnNext()
		
		oss402b1.CloseActiveTab()
		Thread.sleep(2000)
		oss402b1.CloseActiveTab()
		
		Assert.assertTrue(oss406b1.getPageId().contains("OSS406/B1"))
		
		oss406b1.enterTtp(ttp1)
		oss406b1.create()
		oss406e.clickOnNext()
		Assert.assertTrue(oss406b1.searchTransaction(ttp1))
		
		oss406b1.enterTtp(ttp2)
		oss406b1.create()
		oss406e.clickOnNext()
		Assert.assertTrue(oss406b1.searchTransaction(ttp2))
		
		oss406b1.enterTtp(ttp3)
		oss406b1.create()
		oss406e.clickOnNext()
		Assert.assertTrue(oss406b1.searchTransaction(ttp3))
		
		oss406b1.enterTtp(ttp4)
		oss406b1.create()
		oss406e.clickOnNext()
		Assert.assertTrue(oss406b1.searchTransaction(ttp3))
		
		oss406b1.CloseActiveTab()
		Assert.assertTrue(oss401b1.getPageId().contains("OSS401/B1"))
		
		oss401b1.searchDataSet(dataset)
		oss401b1.activateDataset(dataset)
		Assert.assertEquals(oss401b1.getStsOfDataset(dataset),"20")
		
	}
	
}