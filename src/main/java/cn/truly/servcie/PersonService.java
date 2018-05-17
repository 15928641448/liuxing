package cn.truly.servcie;

import java.util.List;

import cn.truly.entity.Person;

public interface PersonService {
    void savePerson();
    Person getByID(Long id);
    

    List<Person> findAll();



    void delete(Long id);

    void flush();
}