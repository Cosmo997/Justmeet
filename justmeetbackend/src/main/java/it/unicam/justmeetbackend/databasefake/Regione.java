package it.unicam.justmeetbackend.databasefake;

/**
 * Regione
 */
public class Regione {
    String nome;

    public Regione(String nome)
    {
        this.nome = nome;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    
}