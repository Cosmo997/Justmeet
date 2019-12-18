package it.unicam.justmeetbackend.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import it.unicam.justmeetbackend.databasefake.Comune;
import it.unicam.justmeetbackend.databasefake.Provincia;
//import java.util.List;
import it.unicam.justmeetbackend.databasefake.Regione;


@Service
public class LuogoService {

    ArrayList<Regione> regioni = new ArrayList<>(Arrays.asList(new Regione("Marche")));
    ArrayList<Provincia> provincie = new ArrayList<>(Arrays.asList(new Provincia("Ancona", "AN", "Marche")));
    ArrayList<Comune> comuni = new ArrayList<>(Arrays.asList(new Comune("Camerino", "AN")));


	public ArrayList<Regione> getAllRegioni() {
		return regioni;
	}

    public List<Provincia> getProvinciaByRegione(String regione){

        List<Provincia> app = new ArrayList<>();

		for (Provincia provincia : provincie) {
            if(provincia.getNomeRegione().equalsIgnoreCase(regione));
                app.add(provincia);
        }
        return app;
	}

	public List<Comune> getComuniByProvincia(String provincia) {
       
        List<Comune> app = new ArrayList<>();

		for (Comune comune : comuni) {
            if(comune.getProvincia().equals(provincia));
                app.add(comune);
        }
        return app;
    }




}
