package it.unicam.justmeetbackend.databasefake;

import java.util.List;

public class Preferiti {

    private List<Evento> eventiPreferiti;
    
    public Preferiti(){};

    public Preferiti(List<Evento> eventi){
        this.eventiPreferiti = eventi;
    }

    public List<Evento> getEventiPreferiti() {
        return eventiPreferiti;
    }

    public void setEventiPreferiti(List<Evento> eventiPreferiti) {
        this.eventiPreferiti = eventiPreferiti;
    }

}
