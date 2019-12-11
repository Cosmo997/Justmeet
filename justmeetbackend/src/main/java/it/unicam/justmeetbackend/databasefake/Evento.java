package it.unicam.justmeetbackend.databasefake;

//import java.time.*;

public class Evento
{
    private String id;
    private String titolo;
    private String desc;

    public Evento(){};
        //Luogo luogoEvento;
        User creatore;
        //ArrayList<User> partecipanti;
        //ArrayList<Topic> topicEvento;
    public Evento(String id, String t, String d){
        this.id = id;
        this.titolo = t;
        this.desc = d;

    } 

    public String getId()
    {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
        
}