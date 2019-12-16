package it.unicam.justmeetbackend.databasefake;

public class Luogo {

    private String idLuogo;
    private String regione;
    private String provincia;
    private String comune;
    
    public Luogo(){}

    public Luogo(String idLuogo, String regione, String provincia, String comune) {
        
        this.idLuogo = idLuogo;
        this.regione = regione;
        this.provincia = provincia;
        this.comune = comune;
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

    public String getIdLuogo() {
        return idLuogo;
    }

    public void setIdLuogo(String idLuogo) {
        this.idLuogo = idLuogo;
    };

    

}
