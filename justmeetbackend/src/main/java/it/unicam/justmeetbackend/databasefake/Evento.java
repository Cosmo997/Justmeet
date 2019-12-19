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

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the titolo
     */
    public String getTitolo() {
        return titolo;
    }

    /**
     * @param titolo the titolo to set
     */
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the partecipanti
     */
    public int getPartecipanti() {
        return partecipanti;
    }

    /**
     * @param partecipanti the partecipanti to set
     */
    public void setPartecipanti(int partecipanti) {
        this.partecipanti = partecipanti;
    }

    /**
     * @return the idTopic
     */
    public String getIdTopic() {
        return idTopic;
    }

    /**
     * @param idTopic the idTopic to set
     */
    public void setIdTopic(String idTopic) {
        this.idTopic = idTopic;
    }

    /**
     * @return the idCreator
     */
    public String getIdCreator() {
        return idCreator;
    }

    /**
     * @param idCreator the idCreator to set
     */
    public void setIdCreator(String idCreator) {
        this.idCreator = idCreator;
    }

    /**
     * @return the nomeComune
     */
    public String getNomeComune() {
        return nomeComune;
    }

    /**
     * @param nomeComune the nomeComune to set
     */
    public void setNomeComune(String nomeComune) {
        this.nomeComune = nomeComune;
    }

    /**
     * @return the isApproved
     */
    public boolean isApproved() {
        return isApproved;
    }

    /**
     * @param isApproved the isApproved to set
     */
    public void setApproved(boolean isApproved) {
        this.isApproved = isApproved;
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

}