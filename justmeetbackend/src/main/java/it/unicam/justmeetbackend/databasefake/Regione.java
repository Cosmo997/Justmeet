package it.unicam.justmeetbackend.databasefake;

import org.springframework.data.annotation.Id;

/**
 * Regione
 */
public class Regione {

    @Id
    int id;
    
    String nome;

    public Regione(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Regione(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }
    
}