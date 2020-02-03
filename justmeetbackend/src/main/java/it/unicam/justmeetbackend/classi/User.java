package it.unicam.justmeetbackend.classi;

import java.util.ArrayList;

import org.springframework.data.annotation.Id;

public class User
    {
        @Id
        private String _id;
        
        private String nome;
        private String cognome;
        private String email;
        private Boolean isMod;
        private ArrayList<String> preferiti;

        public User(){}

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
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

    public Boolean getIsMod() {
        return isMod;
    }

    public void setIsMod(Boolean isMod) {
        this.isMod = isMod;
    }

    public ArrayList<String> getPreferiti() {
        return preferiti;
    }

    public void setPreferiti(ArrayList<String> preferiti) {
        this.preferiti = preferiti;
    }

    public void addPreferiti(String id){
        this.preferiti.add(id);
    }

    public User(String _id, String nome, String cognome, String email, Boolean isMod, ArrayList<String> preferiti) {
        this._id = _id;
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.isMod = isMod;
        this.preferiti = preferiti;
    }
  
    }