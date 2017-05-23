package bi3.tests.mockrun2;

import bi3.pages.HomePage;
import bi3.pages.LoginPage;
import bi3.pages.ToolbarPage;
import bi3.pages.mns204.MNS204B;
import bi3.pages.mns204.MNS204E;
import bi3.tests.BaseTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

@SuppressWarnings("all")
public class TC1AddUser extends BaseTest {
  private LoginPage loginPage;
  
  private HomePage homePage;
  
  private ToolbarPage toolbarPage;
  
  private MNS204B mns204B;
  
  private MNS204E mns204E;
  
  @BeforeMethod
  public void Initialize() {
    LoginPage _loginPage = new LoginPage(BaseTest.driver);
    this.loginPage = _loginPage;
    HomePage _homePage = new HomePage(BaseTest.driver);
    this.homePage = _homePage;
    ToolbarPage _toolbarPage = new ToolbarPage(BaseTest.driver);
    this.toolbarPage = _toolbarPage;
    MNS204B _mNS204B = new MNS204B(BaseTest.driver);
    this.mns204B = _mNS204B;
    MNS204E _mNS204E = new MNS204E(BaseTest.driver);
    this.mns204E = _mNS204E;
  }
  
  /**
   * @TestCaseID: 001
   * @CloudSuite: F&B
   * @Description: Test whether user can be added.
   * @author:	Insaaf
   */
  @Test
  public void AddUser() {
    this.loginPage.GoTo();
    this.homePage.goToProgramUsingShrt("MNS204");
    boolean _checkUserAvailable = this.mns204B.checkUserAvailable("RASITHAE");
    if (_checkUserAvailable) {
      this.mns204B.deleteUser();
    }
  }
}
