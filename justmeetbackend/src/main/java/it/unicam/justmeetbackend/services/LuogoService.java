package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import it.unicam.justmeetbackend.databasefake.Luogo;

class LuogoService {

    Luogo luogo1 = new Luogo("idLuogo", "regione", "provincia", "comune");
    Luogo luogo2 = new Luogo("idLuogo2", "regione2", "provincia2", "comune2");
    Luogo luogo6 = new Luogo("idLuogsdfdfsdfo6", "regionfsd", "provincia2", "comune1");
    Luogo luogox = new Luogo("idLuogosddsfsdf6", "regionedfsfs3", "provincia2", "comune1fdsdsf");
    Luogo luogo3 = new Luogo("idLuogo3", "regione3", "provincia3", "comune3");
    ArrayList<Luogo> userList = new ArrayList<>(Arrays.asList(luogo1,luogo2,luogo3));

    public ArrayList<Luogo> getLuogoByProvincia(String provincia)
    {
    ArrayList<Luogo> userListappoggio = new ArrayList<>();
    for(Luogo l : userList)
    {
     if(l.getProvincia().equals(provincia))
        {
         userListappoggio.add(l);
        }
    }
    return userListappoggio;
    }

}
