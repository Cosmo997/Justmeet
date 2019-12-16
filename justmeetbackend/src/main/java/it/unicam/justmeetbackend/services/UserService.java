package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.User;

@Service
public class UserService{

    ArrayList<String> idPreferit = new ArrayList<>(Arrays.asList("id1", "id2"));

    User utente1 = new User("1234","Michele", "Benedetti", "username", "email", "psw", true, idPreferit);
    User utente2 = new User("12","Daniel", "Moschi", "username", "email", "psw", true, idPreferit);
    User utente3 = new User("34","Pluto", "Pippo", "username", "email", "psw", true, idPreferit);
    User utente4 = new User("1","1","1","1","1","1",true, idPreferit);

    List<User> userList = new ArrayList<>(Arrays.asList(utente1,utente2,utente3));

    /**
     * Restituisce tutti gli eventi dato un certo nome
     * @param nome
     * @return
     */
	public User getUserById(String id) {
        for (User user : userList) {
            if(user.getId().equals(id))
            return user;
        }
        return null;
	}

}