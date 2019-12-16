package it.unicam.justmeetbackend.databasefake;


//import java.time.*;

public class Evento {
    private String id;
    private String titolo;
    private String desc;
    private int partecipanti;
    private String idTopic;
    private String idCreator;
    private String idLuogo;

    public Evento(){};
    
    public Evento(String id, String t, String d, int partecipanti ,String topic, String creatore, String luogo){
        this.id = id;
        this.titolo = t;
        this.desc = d;
        this.partecipanti = partecipanti;
        this.idTopic = topic;
        this.idCreator = creatore;
        this.idLuogo = luogo;
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

    public String getUser() {
        return idCreator;
    }

    public void setUser(String user) {
        this.idCreator = user;
    }

    public int getPartecipanti() {
        return partecipanti;
    }

    public void setPartecipanti(int partecipanti) {
        this.partecipanti = partecipanti;
    }

    public String getIdTopic() {
        return idTopic;
    }

    public void setIdTopic(String idTopic) {
        this.idTopic = idTopic;
    }

    public String getIdCreator() {
        return idCreator;
    }

    public void setIdCreator(String idCreator) {
        this.idCreator = idCreator;
    }

    public String getIdLuogo() {
        return idLuogo;
    }

    public void setIdLuogo(String idLuogo) {
        this.idLuogo = idLuogo;
    }
        
}