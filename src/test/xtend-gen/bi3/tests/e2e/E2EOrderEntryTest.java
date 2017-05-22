package bi3.tests.e2e;

import bi3.framework.core.DefaultWebDriver;
import bi3.pages.HomePage;
import bi3.pages.LoginPage;
import bi3.pages.ProgramCommons;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

@SuppressWarnings("all")
public class E2EOrderEntryTest extends ProgramCommons {
  private LoginPage loginPage;
  
  private HomePage homePage;
  
  public E2EOrderEntryTest(final WebDriver driver) {
    super(driver);
  }
  
  @BeforeMethod
  public void Initialize() {
    LoginPage _loginPage = new LoginPage(DefaultWebDriver.driver);
    this.loginPage = _loginPage;
    HomePage _homePage = new HomePage(DefaultWebDriver.driver);
    this.homePage = _homePage;
  }
  
  /**
   * @TestCaseID: 005
   * @CloudSuite: F&B
   * @Description: Test the Order entry flow including integration to Search, IDM and Infor BI.
   * @author:
   */
  @Test
  public void E2EOrderEntryTest() {
    this.loginPage.GoTo();
  }
}
