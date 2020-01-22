package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.classi.User;

@Service
public class UserService{

    ArrayList<String> idPreferit = new ArrayList<>(Arrays.asList("id1", "id2"));

    User utente1 = new User("Michele", "Benedetti", "email", "psw", true);
    User utente2 = new User("Daniel", "Moschi", "username", "email", true);
    User utente3 = new User("Pluto", "Pippo", "username", "email", true);
    User utente4 = new User("1","1","1","1",true);

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