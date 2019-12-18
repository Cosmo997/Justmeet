package it.unicam.justmeetbackend.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.databasefake.Luogo;
import it.unicam.justmeetbackend.services.LuogoService;

/**
 * LuogoController
 */
@RestController
public class LuogoController {

    @Autowired
    private LuogoService ls = new LuogoService();

    @GetMapping("/luoghi")
    public ArrayList<Luogo> getAllLuoghi()
    {
        return ls.getAllLuoghi();
    }

    
}