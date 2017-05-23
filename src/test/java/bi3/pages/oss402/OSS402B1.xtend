package bi3.pages.oss402

import bi3.pages.BasePage
import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.FindBy
import org.openqa.selenium.WebElement
import bi3.pages.ToolbarPage

class OSS402B1 extends BasePage{
	
	new(WebDriver driver) {
		super(driver)
	}
	
	@FindBy(id = "W1SBSQ")
	WebElement txtSeqSearch
	
	@FindBy(id = "W1OBJC")
	WebElement txtFieldSearch
	
	def void enterSeq(String seq){
		txtSeqSearch.EnterText(seq)
	}
	
	def void enterField(String field){
		txtFieldSearch.EnterText(field)
	}
	
	def void create(){
		var ToolbarPage toolbar = new ToolbarPage(driver)
		toolbar.clickCreateLogo()
		waitForLoadingComplete()
	}
}