package it.unicam.justmeetbackend.databasefake;

public class Topic {

    private String argomento;

    public Topic(){};

    public Topic(String a){
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

}
