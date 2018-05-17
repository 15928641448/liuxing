package cn.truly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.truly.entity.Person;
import cn.truly.servcie.PersonService;
import cn.truly.util.CommonUtil;
import net.sf.json.JSONArray;

@Controller
@RequestMapping
public class TestController {

	@Autowired(required = true)
	private PersonService personService;

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "info";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "test";
	}

	@RequestMapping(value = "/savePerson", method = RequestMethod.GET)
	@ResponseBody
	public String savePerson() {
		personService.savePerson();
		return "success!";
	}
	
	
	@RequestMapping(value = "/getByID", method = RequestMethod.GET)
	@ResponseBody
	public String getPerson(Long  id ) {
		
		return personService.getByID(1L).toString();
	}
	
	
	@RequestMapping(value = "/findAll")
	@ResponseBody
	public List<Person> findAllPerson() {
//		List<Person>  listPerson=personService.findAll();
//		return  JSONArray.fromObject(listPerson).toString();
		List<Person>  listPerson=personService.findAll();
		return  listPerson;
	}
	
	
	
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public void deletePerson(Long  id) {
		
		personService.delete(id);
	}
	@RequestMapping(value = "/flush", method = RequestMethod.GET)
	@ResponseBody
	public void flushPerson() {
		
		personService.flush();
	}
	
//	登录
	@RequestMapping(value = "/login")
	public String login() {
		return "crud";
	}
	
}