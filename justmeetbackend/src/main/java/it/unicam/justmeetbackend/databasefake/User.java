package it.unicam.justmeetbackend.databasefake;

    public class User
    {
        private String nome;
        private String cognome;
        private String username;
        private String email;
        private String password;
        private Boolean isLogged;
        //Preferiti preferiti;
        //Luogo posizione;

        public User(){}

        public User(String n, String c, String u, String e, String p, Boolean i)
        {
            this.nome = n;
            this.cognome = c;
            this.username = u;
            this.email = e;
            this.password = p;
            this.isLogged = i;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    }