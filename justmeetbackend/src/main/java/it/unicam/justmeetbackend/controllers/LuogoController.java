package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Comune;
import it.unicam.justmeetbackend.databasefake.Provincia;
import it.unicam.justmeetbackend.databasefake.Regione;
import it.unicam.justmeetbackend.services.LuogoService;

/**
 * LuogoController
 */
@RestController
public class LuogoController {

    @Autowired
    private LuogoService lougoService = new LuogoService();

    /**
     * Restituisce le regioni italiane
     * @return
     */
    @GetMapping("/regioni")
    public ArrayList<Regione> getRegioni()
    {
        return lougoService.getAllRegioni();
    }

    /**
     * Restituisce le province di una determinata regione
     * @param regione
     * @return
     */
    @GetMapping(value="/regioni/province/{regione}")
    public List<Provincia> getProvinceByRegione(@PathVariable String regione) {
        return lougoService.getProvinciaByRegione(regione);
    }

    /**
     * Restituisce i comuni, data una determinata provincia
     * @param param
     * @return
     */
    @GetMapping(value="/regioni/provincia/comuni/{provincia}")
    public List<Comune> getComuniByProvincia(@PathVariable String provincia) {
        return lougoService.getComuniByProvincia(provincia);
    }
    
    

    
}