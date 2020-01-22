package it.unicam.justmeetbackend.classi;

public class Comune {
    
    String nome;
    String siglaProvincia;

    public Comune(String nome, String provincia) {
        this.nome = nome;
        this.siglaProvincia = provincia;
    }

    public Comune() {}

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

    /**
     * @return the provincia
     */
    public String getProvincia() {
        return siglaProvincia;
    }

    /**
     * @param provincia the provincia to set
     */
    public void setProvincia(String provincia) {
        this.siglaProvincia = provincia;
    }

    
}