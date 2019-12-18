package it.unicam.justmeetbackend.databasefake;

/**
 * Comune
 */
public class Comune {

    String nome;
    String provincia;

    public Comune(String nome, String provincia) {
        this.nome = nome;
        this.provincia = provincia;
    }

    public Comune() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setSiglaProv(String siglaProv) {
        this.provincia = siglaProv;
    }

    
    
}