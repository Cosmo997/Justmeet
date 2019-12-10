package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Evento;

@Service
public class EventService {

    private List<Evento> listaEventi = new ArrayList<>(Arrays.asList(
        new Evento(1, "Primo Evento", "Desc"),
        new Evento(2, "Primo Evento", "Desc")
        ));

    public List<Evento> getAllEvents(){
        return listaEventi;
    }

    public void addEvent(Evento e)
    {
        listaEventi.add(e);
    }
    
}