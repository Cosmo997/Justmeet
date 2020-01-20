package it.unicam.justmeetbackend.databasefake;

import org.springframework.data.annotation.Id;

public class Topic {

    @Id
    private int _id;
    
    private String argomento;

    public Topic(){};

    public Topic(int id, String a){
        this._id = id;
        this.argomento = a;
    }

    /**
     * @return the argomento
     */
    public String getArgomento() {
        return argomento;
    }

    /**
     * @param argomento the argomento to set
     */
    public void setArgomento(String argomento) {
        this.argomento = argomento;
    }

    public int get_id() { return _id; }

    public void setId(int id) {
        this._id = id;
    }

}
