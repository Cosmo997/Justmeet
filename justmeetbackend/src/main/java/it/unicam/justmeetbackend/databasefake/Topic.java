package it.unicam.justmeetbackend.databasefake;

public class Topic {

    private String id;
    private String argomento;

    public Topic(){};

    public Topic(String id, String a){
        this.id = id;
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
