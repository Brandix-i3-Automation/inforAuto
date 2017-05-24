package bi3.tests.mockrun2

import bi3.tests.BaseTest
import bi3.pages.LoginPage
import bi3.pages.HomePage
import org.testng.annotations.BeforeMethod
import org.testng.annotations.Test

class ChangeSystemLanguage extends BaseTest {
	
	LoginPage loginPage;
	HomePage homePage;
	ToolbarPage toolbarPage;
	
	MNS150B mns150b;
	MNS150E mns150e;
	
	@BeforeMethod
	def void Initialize(){
		loginPage = new LoginPage(driver);
		homePage = new HomePage(driver);
		toolbarPage=new ToolbarPage(driver);
		
		mns150b=new MNS150B(driver);
		mns150e=new MNS150E(driver);
		
	}
	/**
	 * @TestCaseID:	16
	 * @CloudSuite:	F&B
	 * @Description: M3 BE Function: Change User Account's System Language
	 * @author: DeepikaG
	 **/
	@Test
	def void changeSystemLanguageTest(){
		
		loginPage.GoTo();
		var program="MNS150";
		//verify code is entered in the text box
		homePage.goToProgramUsingShrt(program);
		
		//Verify MNS150 is opened and displayed
		var tab="MNS150/B";
		Assert.assertEquals(mns150b.getPageId(),tab,"tab ID is not MNS150B");
		
		var user="*USER";
		var name="Default user";
		//Verify the user is displayed in the search field
		mns150b.searchUser(user);
		
		//Verify the user is positioned in the first row
		var UserDetails=mns150b.getFirstRowUserDetails();
		Assert.assertEquals(UserDetails.get(0),user,"user is not matching");
		Assert.assertEquals(UserDetails.get(1),name,"name is not matching");
		
		mns150b.rightClickTheFirstRow();
		
		//verify options list
		Assert.assertEquals(mns150b.getOptionsListFromPane(),mns150b.getActualOptionsList(),"options do not match");
		
		mns150b.clickChange();
		
		//verify user details are displayed
		Assert.assertEquals(mns150e.getNameOfTextBox(),name,"user details are wrong for name");
		
		//verify language and M3 Browse pop up window is displayed
		var language="GB";
		mns150e.searchAndSelectSystemLanguage(language);
		
		//verify M3 Browse pop up window is closed
		Assert.assertFalse(mns150e.isM3BrowseClosed(),"M3 Browse pop up is not closed");

		//verify selected language is selected
		Assert.assertEquals(mns150e.getLanguageOfTextBox(),language,"language is not selected");
		mns150e.clickOnNext();
		mns150e.clickOnNext();
		
		//verify changes are saved and MNS150 is displayed
		var UserDetailsSaved=mns150b.getFirstRowUserDetails();
		Assert.assertEquals(UserDetailsSaved.get(0),user,"user is not saved");
		Assert.assertEquals(UserDetailsSaved.get(1),name,"name is not saved");
		Assert.assertEquals(UserDetailsSaved.get(2),language,"language is not saved");
		
		Assert.assertEquals(mns150b.getPageId(),"MNS150/B","tab is not displayed");
		
		toolbarPage.ClickAction_Refresh();
		
				
		
	}	
}