package it.unicam.justmeetbackend.databasefake;

import java.util.List;

public class Preferiti {

    private List<String> idEventiPreferiti;
    
    Preferiti(){};

    public Preferiti(List<String> eventi) {
        this.idEventiPreferiti = eventi;
    }

    public List<String> getEventiPreferiti() {
        return idEventiPreferiti;
    }

    public void setEventiPreferiti(final List<String> eventiPreferiti) {
        this.idEventiPreferiti = eventiPreferiti;
    }

}
