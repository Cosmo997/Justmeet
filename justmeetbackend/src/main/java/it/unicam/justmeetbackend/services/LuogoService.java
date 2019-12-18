package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Service;

//import java.util.List;
import it.unicam.justmeetbackend.databasefake.Luogo;


@Service
public class LuogoService {

    Luogo luogo1 = new Luogo("idLuogo", "regione", "provincia", "comune");
    Luogo luogo2 = new Luogo("idLuogo2", "regione2", "provincia2", "comune2");
    Luogo luogo6 = new Luogo("idLuogsdfdfsdfo6", "regionfsd", "provincia2", "comune1");
    Luogo luogox = new Luogo("idLuogosddsfsdf6", "regionedfsfs3", "provincia2", "comune1fdsdsf");
    Luogo luogo3 = new Luogo("idLuogo3", "regione3", "provincia3", "comune3");
    ArrayList<Luogo> luoghi = new ArrayList<>(Arrays.asList(luogo1,luogo2,luogo3,luogo6,luogox));



    /**
    * 
    * @param provincia
    * @return Tutti i luoghi che hanno come provincia l'input. 
    */
    public ArrayList<Luogo> getLuogoByProvincia(String provincia)
    {
    ArrayList<Luogo> app = new ArrayList<>();
    for(Luogo l : luoghi)
    {
     if(l.getProvincia().equals(provincia))
        {
         app.add(l);
        }
    }
    return app;
    }

    /**
     * 
     * @return Tutti i luoghi presenti nel service.
     */
    public ArrayList<Luogo> getAllLuoghi()
    {
        return luoghi;
    }



}
