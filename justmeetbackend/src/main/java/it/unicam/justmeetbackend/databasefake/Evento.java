package it.unicam.justmeetbackend.databasefake;

import org.joda.time.DateTime;

public class Evento {
    
    private String id;
    private String titolo;
    private String desc;
    private int partecipanti;
    private String idTopic;
    private String idCreator;
    private String nomeComune;
    private boolean isApproved;
    private DateTime inizioEvento;
    private DateTime fineEvento;
   

    public Evento() {
    };

    public Evento(final String id, final String t, final String d, final int partecipanti, final String topic,
            final String creatore, final String luogo, String inizioEvento, String fineEvento, boolean isApp) {
        this.id = id;
        this.titolo = t;
        this.desc = d;
        this.partecipanti = partecipanti;
        this.idTopic = topic;
        this.idCreator = creatore;
        this.inizioEvento = new DateTime(inizioEvento);
        this.fineEvento = new DateTime(fineEvento);
        this.nomeComune = luogo;
        this.isApproved = isApp;
    }

    public String getId() {
        return id;
    }

    public void setId(final String id) {
        this.id = id;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(final String titolo) {
        this.titolo = titolo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(final String desc) {
        this.desc = desc;
    }

    public String getUser() {
        return idCreator;
    }

    public void setUser(final String user) {
        this.idCreator = user;
    }

    public int getPartecipanti() {
        return partecipanti;
    }

    public void setPartecipanti(final int partecipanti) {
        this.partecipanti = partecipanti;
    }

    public String getIdTopic() {
        return idTopic;
    }

    public void setIdTopic(final String idTopic) {
        this.idTopic = idTopic;
    }

    public String getIdCreator() {
        return idCreator;
    }

    public void setIdCreator(final String idCreator) {
        this.idCreator = idCreator;
    }

    /**
     * @return the inizioEvento
     */
    public String getInizioEvento() {
        return inizioEvento.toString();
    }

    /**
     * @param inizioEvento the inizioEvento to set
     */
    public void setInizioEvento(String inizioEvento) {
        this.inizioEvento = new DateTime(inizioEvento);
    }

    /**
     * @return the fineEvento
     */
    public String getFineEvento() {
        return fineEvento.toString();
    }

    /**
     * @param fineEvento the fineEvento to set
     */
    public void setFineEvento(String fineEvento) {
        this.fineEvento = new DateTime(fineEvento);
    }
    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public String getNomeComune() {
        return nomeComune;
    }

    public void setNomeComune(String nomeComune) {
        this.nomeComune = nomeComune;
    }
     
}