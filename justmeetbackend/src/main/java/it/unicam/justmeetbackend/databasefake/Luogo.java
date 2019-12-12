package it.unicam.justmeetbackend.databasefake;

public class Luogo {

    private String regione;
    private String provincia;
    private String comune;
    private String indirizzo;
    //private String coordinate;
    private String via;

    public Luogo(){}

    public Luogo(String regione, String provincia, String comune, String indirizzo, String via) {
        this.regione = regione;
        this.provincia = provincia;
        this.comune = comune;
        this.indirizzo = indirizzo;
        this.via = via;
    }

    public String getRegione() {
        return regione;
    }

    public void setRegione(String regione) {
        this.regione = regione;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getComune() {
        return comune;
    }

    public void setComune(String comune) {
        this.comune = comune;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getVia() {
        return via;
    }

    public void setVia(String via) {
        this.via = via;
    };

    

}
