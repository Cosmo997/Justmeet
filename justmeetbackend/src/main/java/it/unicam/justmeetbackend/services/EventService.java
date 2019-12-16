package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Evento;
import it.unicam.justmeetbackend.databasefake.Luogo;
import it.unicam.justmeetbackend.databasefake.Topic;

@Service
public class EventService {

    Evento evento1 = new Evento("1", "primo", "Descrizione 1", 10, new Topic("id del topic","partita"),
    "Ciao124",new Luogo("Marche", "Ancona", "Castello", "via dei paperini", "30"));

    Evento evento2 = new Evento("2", "secondo", "Descrizione 2", 5 , new Topic("id del topic","studio"),
    "idCreatore",new Luogo("Molise", "Boh", "Che ne so", "via dei mongoli", "4B"));

    private List<Evento> listaEventi = new ArrayList<>(Arrays.asList(evento1,evento2));
    
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
	public void updateEvento(String id, Evento e) {
        for(int i = 0; i < listaEventi.size(); i++)
        {
            Evento ev = listaEventi.get(i);
            if(ev.getId().equals(id))
            {
                listaEventi.set(i, e);
                return;
            }   
        }
	}

    /**
     * Rimuove l'evento by Id
     * @param id
     */
    public String deleteEvento(String id) 
    {     
        listaEventi.removeIf(e -> e.getId().equals(id));
        return "deleted";
    }

    /**
     * Restituisce tutti gli eventi dato un certo nome
     * @param nome
     * @return
     */
	public List<Evento> getEventsByName(String titolo) {
        List<Evento> l = new ArrayList<>();
        for (Evento evento : listaEventi) {
            if(evento.getTitolo().equalsIgnoreCase(titolo))
            l.add(evento);
        }
        return l;
	}

    /**
     * Restituisce tutti gli eventi in una regione
     * @param regione
     * @return
     */
	public List<Evento> getEventsByRegion(String regione) {
        List<Evento> l = new ArrayList<>();
        for (Evento evento : listaEventi) {
            if(evento.getLuogo().getRegione().equalsIgnoreCase(regione))
            l.add(evento);
        }
        return l;
	}

    /**
     * Restituisce gli eventi di una determinata provincia
     * @param provincia
     * @return
     */
	public List<Evento> getEventsByProvincia(String provincia) {
		List<Evento> l = new ArrayList<>();
        for (Evento evento : listaEventi) {
            if(evento.getLuogo().getProvincia().equalsIgnoreCase(provincia))
            l.add(evento);
        }
        return l;
	}
    
}