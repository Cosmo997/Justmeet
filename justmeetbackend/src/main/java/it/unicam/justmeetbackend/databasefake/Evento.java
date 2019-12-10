package it.unicam.justmeetbackend.databasefake;

import java.util.ArrayList;
//import java.time.*;

public class Evento
    {
        String titolo;
        String descrizione;
        Luogo luogoEvento;
        int ID;
        User creatore;
        ArrayList<User> partecipanti;
        ArrayList<Topic> topicEvento;
        
    }