package com.example.springmvc;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController 
{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	Map<String,Homepage> mapPage = new HashMap<String,Homepage>();
	
	/**
	 * Test method to see if the mapping is fine
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) 
	{
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	/*
	 * Method which retrieves the jsp page to create the homepage for user
	 */
	@RequestMapping(value ="/homepage",method=RequestMethod.GET)
	public String getHomepageCreation(Homepage homepage,Model model)
	{
		model.addAttribute("delete",false);
		return "homepage";
	}
	
	
	/*
	 * When user clciks on create /update button all the values are received
	 * and redirected to url to create the homepage along with request parameters
	 * homepage object contains all the values
	 * model attribute
	 */
	@RequestMapping(value ="/homepage/create",method=RequestMethod.POST)/*{RequestMethod.GET,*/
	public String createapi(Homepage homepage,Model model)
	{
		model.addAttribute("userId", homepage.getId());
		String userIdVal = homepage.getId();
		return createHomepage(homepage.getFirstname(), homepage.getLastname(), homepage.getEmail(), homepage.getAddress(),
				homepage.getOrganization(), homepage.getAboutMyself(),model,userIdVal);
	}
	
	/*
	 * Method to create or update the home page
	 * gets all the values of homepage objetc as request parameter
	 * updates the values if already exists in map
	 * else creates a new one and adds entry to hashmap
	 * returns the html page with created values
	 */
	@RequestMapping(value ="/homepage/userId",method=RequestMethod.POST)
    public String createHomepage( @RequestParam(value="firstname") String firstname,
    		 @RequestParam(value="lastname") String lastname, @RequestParam(value="email") String email,
    		 @RequestParam(value="address") String address, @RequestParam(value="organization") String organization,
    		 @RequestParam(value="aboutMyself") String aboutMyself, Model model,String userId)
    {
		// check if user already exists and updates the map
    	if(mapPage.containsKey(userId))
    	{
    		logger.info("User id already exists.So updating the hasmap with userId::"+userId);
    		Homepage home = new Homepage(userId,firstname,lastname,email,address,organization,aboutMyself);
        	mapPage.put(userId,home);
        	model.addAttribute("userValue", home);
        	model.addAttribute("create",false);
        	model.addAttribute("update",true);
        	return "getHomepageAsHtml";
    	}
    	//create the user and add entries to map
    	else
    	{
	    	logger.info("Creationg the user and adding entry to hashmap");
	    	Date date = new Date();
	    	SimpleDateFormat format = new SimpleDateFormat("mmddHHmmss");
	    	String id = format.format(date).toString();
	    	System.out.println("ID is :"+id);
	    	Homepage home = new Homepage(id,firstname,lastname,email,address,organization,aboutMyself);
	    	mapPage.put(id,home);
	    	model.addAttribute("userValue", home);
	    	model.addAttribute("create", true);
	    	model.addAttribute("update",false);
	    	return "getHomepageAsHtml";
    	}
		
    }
	
	/*
	 * Method which fecthes the html based on user ID
	 * Returns html page which has options to update and delete
	 * path variable id and model attribute
	 * returns errorpage nosuchuser.jsp if userid is not in map
	 * else retuns the gethomeashtml page which contains all values
	 */
	@RequestMapping(value ="/homepage/userId/{id}",method=RequestMethod.GET)
	public String getHomepageAsHtml(@PathVariable("id") String id,Model model)
	{
		Homepage home;
		String returnPage;
		if(!mapPage.containsKey(id))
		{
			logger.debug("User doesnot exists.Nvigating to custom eroor page");
			returnPage="noSuchUser";
			model.addAttribute("userId", id);
		}
		else
		{
			logger.info("User exists.So fetching the user information");
			 home = mapPage.get(id);
			 model.addAttribute("userValue",home);
			 model.addAttribute("update",false);
			 model.addAttribute("create",false);
			 returnPage="getHomepageAsHtml";
		}
		return returnPage;
	}
	
	
	/*
	 * Method to view homepage content as JSON
	 * if userid is not present throws exception
	 * else returns getHomepageAsJson page with json vaues
	 */
	@RequestMapping(value="/homepage/userId/{id}",params="brief=true",method=RequestMethod.GET)
	public String getHomepageAsJson(@PathVariable("id") String id,Model model)
	{
		Homepage home;
		String returnPage;
		if(!mapPage.containsKey(id))
		{
			logger.info("in brief method.User does nto exist.Navigating to custom error");
			returnPage="noSuchUser";
			model.addAttribute("userId", id);
		}
		else
		{
			 home = mapPage.get(id);
			 model.addAttribute("getHomePageJSON",home);
			 JSONObject userJson = populateJSONObject(home);	
			 model.addAttribute("userjson",userJson);
			 returnPage="getHomepageAsJson";
		}
		return returnPage;
	}
	
	/*
	 * Method which populates the json object with bean values
	 * userobject contains bean to be populated
	 * return json object
	 */
	private JSONObject populateJSONObject(Homepage userObject) {
		JSONObject userObj =  new JSONObject();
		userObj.put("id",userObject.getId());
		userObj.put("firstname",userObject.getFirstname());
		userObj.put("lastname",userObject.getLastname());
		userObj.put("email",userObject.getEmail());
		userObj.put("address",userObject.getAddress());
		userObj.put("organization",userObject.getOrganization());
		userObj.put("aboutmyself",userObject.getAboutMyself());
		return userObj;
	}

	/*
	 * Method to delete a user based on userid
	 * id and model as arguments
	 * returns the home page if deleted else returns error page
	 */
	@RequestMapping(value ="/homepage/userId/{id}",method=RequestMethod.POST)
	public String deleteHomepage(@PathVariable("id") String id, Model model)
	{
		String returnPage;
		if(!mapPage.containsKey(id))
		{
			returnPage="noSuchUser";
			model.addAttribute("userId", id);
		}
		else
		{
			mapPage.remove(id);
			model.addAttribute("delete",true);
			returnPage="homepage";
		}
		return returnPage;
	}
}
	

