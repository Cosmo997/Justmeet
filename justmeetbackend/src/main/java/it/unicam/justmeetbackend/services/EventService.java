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

    /**
     * Restituisce tutti gli eventi
     * @return
     */
    public List<Evento> getAllEvents(){
        return listaEventi;
    }

    /**
     * Aggiungere evento
     * @param e
     */
    public void addEvent(Evento e)
    {
        listaEventi.add(e);
    }

    /**
     * Aggiornare l'evento by Id
     * @param id
     * @param e
     */
	public void updateEvento(int id, Evento e) {
        for(int i = 0; i < listaEventi.size(); i++)
        {
            Evento ev = listaEventi.get(i);
            if(ev.getId() == id)
            {
                listaEventi.set(id, e);
                return;
            }   
        }
	}

    /**
     * Rimuove l'evento by ID
     * @param id
     */
	public void deleteEvento(int id) {
        listaEventi.removeIf(e -> e.getId() == id);
	}
    
}