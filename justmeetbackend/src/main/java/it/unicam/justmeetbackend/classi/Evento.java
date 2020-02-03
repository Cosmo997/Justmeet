package it.unicam.justmeetbackend.classi;

import java.util.ArrayList;

import org.joda.time.DateTime;
import org.springframework.data.annotation.Id;

public class Evento {
    
    @Id
    private String id;
    
    private String titolo;
    private String descrizione;
    private int partecipanti;
    private String idTopic;
    private String idCreatore;
    private String idComune;
    private boolean isApproved;
    private DateTime inizioEvento;
    private DateTime fineEvento;
    private ArrayList<String> iscrizioni;

    public Evento() {}

    /**
     * @param id
     * @param titolo
     * @param descrizione
     * @param partecipanti
     * @param idTopic
     * @param idCreatore
     * @param idComune
     * @param isApproved
     * @param inizioEvento
     * @param fineEvento
     */
    public Evento(String titolo, String descrizione, int partecipanti, String idTopic, String idCreatore,
            String idComune, String inizioEvento, String fineEvento) {
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.partecipanti = partecipanti;
        this.idTopic = idTopic;
        this.idCreatore = idCreatore;
        this.idComune = idComune;
        this.inizioEvento = new DateTime(inizioEvento);
        this.fineEvento = new DateTime(fineEvento);
        this.iscrizioni = new ArrayList<String>();
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
     * @return the descrizione
     */
    public String getDescrizione() {
        return descrizione;
    }

    /**
     * @param descrizione the descrizione to set
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
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
     * @return the idCreatore
     */
    public String getIdCreatore() {
        return idCreatore;
    }

    /**
     * @param idCreatore the idCreatore to set
     */
    public void setIdCreatore(String idCreatore) {
        this.idCreatore = idCreatore;
    }

    /**
     * @return the idComune
     */
    public String getIdComune() {
        return idComune;
    }

    /**
     * @param idComune the idComune to set
     */
    public void setIdComune(String idComune) {
        this.idComune = idComune;
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

    public void setInizioEvento(DateTime inizioEvento) {
        this.inizioEvento = inizioEvento;
    }

    public void setFineEvento(DateTime fineEvento) {
        this.fineEvento = fineEvento;
    }

    public ArrayList<String> getIscrizioni() {
        return iscrizioni;
    }

    public void setIscrizioni(ArrayList<String> iscrizioni) {
        this.iscrizioni = iscrizioni;
    }

}