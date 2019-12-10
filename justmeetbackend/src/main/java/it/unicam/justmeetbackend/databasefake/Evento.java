package it.unicam.justmeetbackend.databasefake;

//import java.time.*;

public class Evento
{
    private int id;
    private String titolo;
    private String desc;

    public Evento(){};
        //Luogo luogoEvento;
        //User creatore;
        //ArrayList<User> partecipanti;
        //ArrayList<Topic> topicEvento;
    public Evento(int id, String t, String d){
        this.id = id;
        this.titolo = t;
        this.desc = d;

    } 

    public int getId()
    {
        return id;
    }

    public void setId(int id) {
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