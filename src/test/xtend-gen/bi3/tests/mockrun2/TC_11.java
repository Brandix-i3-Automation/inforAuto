package bi3.tests.mockrun2;

import bi3.pages.HomePage;
import bi3.pages.LoginPage;
import bi3.pages.startMenu.AddPage;
import bi3.pages.startMenu.DeletePage;
import bi3.tests.BaseTest;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

/**
 * Author : Mathuja Ketheeswaran
 */
@SuppressWarnings("all")
public class TC_11 extends BaseTest {
  private LoginPage loginPage;
  
  private HomePage homePage;
  
  private AddPage addPage;
  
  private DeletePage deletePage;
  
  @BeforeMethod
  public void Initialize() {
    LoginPage _loginPage = new LoginPage(BaseTest.driver);
    this.loginPage = _loginPage;
    HomePage _homePage = new HomePage(BaseTest.driver);
    this.homePage = _homePage;
    AddPage _addPage = new AddPage(BaseTest.driver);
    this.addPage = _addPage;
    DeletePage _deletePage = new DeletePage(BaseTest.driver);
    this.deletePage = _deletePage;
  }
  
  /**
   * Validate all the items listed in start Page
   * 
   * To do that : LoginPage--> Click StartPage
   * Check each list names
   */
  @Test(priority = 1, enabled = true)
  public void CheckStartMenuList() {
    this.loginPage.GoTo();
    this.homePage.gotoStart();
    Assert.assertEquals(this.homePage.getStartPageName(), "Start Page");
    Assert.assertEquals(this.homePage.getAddWidgetName(), "Add Widget...");
    Assert.assertEquals(this.homePage.getAddPageName(), "Add Page...");
    Assert.assertEquals(this.homePage.getAddPageFromLibraryName(), "Add Page from Library...");
    Assert.assertEquals(this.homePage.getDeletePageName(), "Delete Page...");
    Assert.assertEquals(this.homePage.getRemoveFavouritePageName(), "Remove Favorite Page ...");
    Assert.assertEquals(this.homePage.getRefreshName(), "Refresh");
    Assert.assertEquals(this.homePage.getMyPagesName(), "My Pages...");
    Assert.assertEquals(this.homePage.getPageSettingsName(), "Page Settings...");
    Assert.assertEquals(this.homePage.getUserSettingsName(), "User Settings...");
    Assert.assertEquals(this.homePage.getAdvancedName(), "Advanced");
    Assert.assertEquals(this.homePage.getAdministrationName(), "Administration");
  }
  
  /**
   * Validate AddPage Pop is visible and Validate whether created page is visible
   * 
   * To do that : LoginPage--> Click StartPage-->Click addPage
   * Check the popup
   * --->enterPageName
   * Validate whether addedPage is visible after added the new page
   * Validate whether addedPage is visible is submenuList
   */
  @Test(priority = 2, enabled = true)
  public void AddPage() {
    String pageTitle = "myPage";
    this.loginPage.GoTo();
    this.homePage.gotoStart();
    this.homePage.clickAddPage();
    Assert.assertEquals(this.addPage.pagePopUp(), "Add Page");
    this.addPage.enterNewPageTitle(pageTitle);
    this.addPage.clickOkay();
    Assert.assertEquals(this.addPage.addPage(), true);
    this.homePage.gotoStart();
    Assert.assertEquals(this.addPage.findCreatedPage(pageTitle).getText(), "myPage");
  }
  
  /**
   * Delete created Page
   * 
   * To do that : LoginPage--> Click StartPage-->Click on added page
   * -->Click Delete-->Click ok on confirmation delete
   */
  @Test(priority = 3, enabled = true)
  public void DeletePage() {
    String pageTitle = "myPage";
    this.loginPage.GoTo();
    this.homePage.gotoStart();
    this.addPage.findCreatedPage(pageTitle).click();
    this.homePage.gotoStart();
    this.deletePage.deletePage();
    this.deletePage.clickOkayConfirmation();
    Assert.assertEquals(this.deletePage.navigateToHomePage(), true);
  }
  
  /**
   * Validate whether deleted page is visible in menu
   * 
   * To do that : LoginPage--> Click StartPage-->Check the list
   */
  @Test(priority = 4, enabled = true)
  public void CheckDeletePageVisible() {
    String pageTitle = "myPage";
    this.loginPage.GoTo();
    this.homePage.gotoStart();
    try {
      Assert.assertEquals(this.addPage.findCreatedPage(pageTitle).isDisplayed(), false);
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception e = (Exception)_t;
        System.out.println("Page is successfully Deleted");
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
}
