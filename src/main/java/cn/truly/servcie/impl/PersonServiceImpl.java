package cn.truly.servcie.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.truly.entity.Person;
import cn.truly.repository.PersonRepository;
import cn.truly.servcie.PersonService;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonRepository personRepository;

    public void savePerson() {
        Person person = new Person();
        person.setUsername("XRog");
        person.setPhone("18381005946");
        person.setAddress("chenDu");
        person.setRemark("this is XRog");
       personRepository.save(person);
    }

	@Override
	public Person getByID(Long id) {
		
		return personRepository.get(id);
	}

	@Override
	public List<Person> findAll() {
		List<Person> list =personRepository.findAll();
		return list;
	}

	@Override
	public void delete(Long id) {
		personRepository.delete(id);
		
	}

	@Override
	public void flush() {
		personRepository.flush();
		
	}
}