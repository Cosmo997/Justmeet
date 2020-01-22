package it.unicam.justmeetbackend.classi;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;

public class User
    {
        @Id
        private String id;
        
        private String nome;
        private String cognome;
        private String email;
        private String password;
        private Boolean isMod;
        private ArrayList<String> preferiti;

        public User(){}

        public User(String nome, String cognome, String email, String password, boolean isMod)
        {
            this.nome = nome;
            this.cognome = cognome;
            this.email = email;
            this.password = password;
            this.isMod = isMod;
        }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getIsLogged() {
        return isMod;
    }

    public void setIsLogged(Boolean isMod) {
        this.isMod = isMod;
    }

    public List<String> getPreferiti() {
        return preferiti;
    }

    public void setPreferiti(String preferiti) {
        this.preferiti.add(preferiti);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    }