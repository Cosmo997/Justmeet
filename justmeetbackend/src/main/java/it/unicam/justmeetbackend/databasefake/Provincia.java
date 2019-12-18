package it.unicam.justmeetbackend.databasefake;

/**
 * Provincia
 */
public class Provincia {

    String nome;
    String sigla;
    String nomeRegione;

    public Provincia(){};

    public Provincia(String nome, String sigla, String nomeRegione) {
        this.nome = nome;
        this.sigla = sigla;
        this.nomeRegione = nomeRegione;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getNomeRegione() {
        return nomeRegione;
    }

    public void setNomeRegione(String nomeRegione) {
        this.nomeRegione = nomeRegione;
    }

    
}