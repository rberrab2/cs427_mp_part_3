package edu.ncsu.csc.coffeemaker.http;

import junit.framework.TestCase;

import com.meterware.httpunit.WebConversation;
import com.meterware.httpunit.WebResponse;

public class AddInventoryHTTPTest extends TestCase{

	/** The URL for CoffeeMaker - change as needed */
	public static final String ADDRESS = "http://localhost:8080/CoffeeMaker_WebTest";
	
	protected void setUp() throws Exception {
		super.setUp();
		
	}

	protected void tearDown() throws Exception {
		super.tearDown();
	}
	
	
	public void testAddInventory1() throws Exception {
		//Go to add_recipe.jsp
		WebConversation webConversation = new WebConversation();
		WebResponse menuResponse = webConversation.getResponse(ADDRESS);
		WebResponse addRecipePage = menuResponse.getLinkWith("Add inventory").click();
		
		//Fill out form and submit
		addRecipePage.getForms()[0].setParameter("amtCoffee", "3");
		addRecipePage.getForms()[0].setParameter("amtMilk", "1");
		addRecipePage.getForms()[0].setParameter("amtSugar", "1");
		addRecipePage.getForms()[0].setParameter("amtChocolate", "0");
		addRecipePage = addRecipePage.getForms()[0].submit();
		
		//Test that Recipe added
		assertTrue(addRecipePage.getText().contains("Inventory successfully added."));
		
		//Go to main menu
		menuResponse = addRecipePage.getLinkWith("Back to CoffeeMaker Menu").click();
	}


}
