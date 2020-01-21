package it.unicam.justmeetbackend.databasefake;

/**
 * Provincia
 */
public class Provincia {

    String sigla;
    String provincia;
    double superficie;
    int residenti;
    int num_comuni;
    int id_regione;

    public Provincia(){}

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public double getSuperficie() {
        return superficie;
    }

    public void setSuperficie(double superficie) {
        this.superficie = superficie;
    }

    public int getResidenti() {
        return residenti;
    }

    public void setResidenti(int residenti) {
        this.residenti = residenti;
    }

    public int getNum_comuni() {
        return num_comuni;
    }

    public void setNum_comuni(int num_comuni) {
        this.num_comuni = num_comuni;
    }

    public int getId_regione() {
        return id_regione;
    }

    public void setId_regione(int id_regione) {
        this.id_regione = id_regione;
    }

    public Provincia(String sigla, String provincia, double superficie, int residenti, int num_comuni, int id_regione) {
        this.sigla = sigla;
        this.provincia = provincia;
        this.superficie = superficie;
        this.residenti = residenti;
        this.num_comuni = num_comuni;
        this.id_regione = id_regione;
    };

    

    
}