package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Evento;
import it.unicam.justmeetbackend.databasefake.Luogo;

@Service
public class EventService {


   // Evento evento2 = new Evento("id", "t", "d", 4, "topic", "creatore", "luogo");
    Evento evento2 = new Evento();
    private List<Evento> listaEventi = new ArrayList<>(Arrays.asList(evento2));
    
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
     * Restituisce gli eventi di una determinata provincia
     * 
     * @param provincia
     * @return
     */
    public ArrayList<Evento> getEventsByProvincia(String provincia) {
        LuogoService ls = new LuogoService();
        ArrayList<Luogo> listaLuoghi = ls.getLuogoByProvincia(provincia);
        ArrayList<Evento> listaEventiappoggio = new ArrayList<>(Arrays.asList());
        for (Luogo l : listaLuoghi)
        {
            for(Evento e : listaEventi)
               {
                  if (e.getIdLuogo().equals(l.getIdLuogo()))
                  {
                        listaEventiappoggio.add(e);
                  }
                 }
        }
        return listaEventiappoggio;
}
    
}