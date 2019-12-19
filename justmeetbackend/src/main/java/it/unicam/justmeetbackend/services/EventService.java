package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Comune;
import it.unicam.justmeetbackend.databasefake.Evento;

@Service
public class EventService {

    Evento evento1 = new Evento("1", "primo", "Descrizione 1", 10, "idTopic",
    "Ciao124", "idLuogo2","2019-12-19T11:15:58.916","2019-12-19T11:15:58.916", false);

    Evento evento2 = new Evento("2", "secondo", "Descrizione 2", 5 ,"idTopic",
    "idCreatore", "idLuogo","2019-12-19T11:15:58.916","2019-12-19T11:15:58.916", false);

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
     * Restituisce gli eventi in un determinato comune
     * @param comune
     * @return
     */

    public List<Evento> getEventsByComune(String comune){
        List<Evento> l = new ArrayList<>();
        for (Evento evento : listaEventi) {
            evento.getNomeComune().equalsIgnoreCase(comune);
            l.add(evento);
        }
        return l;
    }

}