package it.unicam.justmeetbackend.databasefake;

import java.util.ArrayList;
import java.util.List;

public class User
    {
        private String id;
        private String nome;
        private String cognome;
        private String email;
        private String password;
        private Boolean isLogged;
        private String idLuogo;
        private ArrayList<String> preferiti;

        public User(){}

        public User(String id, String n, String c, String e, String p, String l, boolean b, ArrayList<String> idPreferit)
        {
            this.id = id;
            this.nome = n;
            this.cognome = c;
            this.email = e;
            this.password = p;
            this.isLogged = b;
            this.preferiti = idPreferit;
            this.idLuogo = l;
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
        return isLogged;
    }

    public void setIsLogged(Boolean isLogged) {
        this.isLogged = isLogged;
    }

    public List<String> getPreferiti() {
        return preferiti;
    }

    public void setPreferiti(ArrayList<String> preferiti) {
        this.preferiti = preferiti;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdLuogo() {
        return idLuogo;
    }

    public void setIdLuogo(String idLuogo) {
        this.idLuogo = idLuogo;
    }

    }