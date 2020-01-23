package it.unicam.justmeetbackend.classi;
//import org.springframework.data.annotation.Id;
/**
 * Provincia
 */
public class Provincia {

    String nome;
    String sigla;
    String regione;

    public Provincia(){}
    /**
     * @param nome
     * @param sigla
     * @param regione
     */
    public Provincia(String nome, String sigla, String regione) {
        this.nome = nome;
        this.sigla = sigla;
        this.regione = regione;
    }
   

    /**
     * @return the sigla
     */
    public String getSigla() {
        return sigla;
    }

    /**
     * @param sigla the sigla to set
     */
    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    /**
     * @return the provincia
     */
    public String getProvincia() {
        return nome;
    }

    /**
     * @param provincia the provincia to set
     */
    public void setProvincia(String provincia) {
        this.nome = provincia;
    }

    /**
     * @return the regione
     */
    public String getRegione() {
        return regione;
    }

    /**
     * @param regione the regione to set
     */
    public void setRegione(String regione) {
        this.regione = regione;
    }


   

    

    
}