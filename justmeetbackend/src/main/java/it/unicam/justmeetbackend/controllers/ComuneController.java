package it.unicam.justmeetbackend.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import it.unicam.justmeetbackend.classi.Comune;
import it.unicam.justmeetbackend.repository.ComuneRepository;

/**
 * ComuneController
 */
@RestController
public class ComuneController {

    @Autowired
    private ComuneRepository repository;

    
    @RequestMapping(value = "/comuni", method = RequestMethod.GET)
    public List<Comune> getAllComuni() {
        return repository.findAll();
    }
    @RequestMapping(value = "/comune/nome/{nome}", method = RequestMethod.GET)
    public List<Comune> getComuneByName(@PathVariable String nome){
        return repository.findByNome(nome);
    }

    @RequestMapping(value = "/comune/provincia/{siglaProvincia}", method = RequestMethod.GET)
    public List<Comune> getComuneBySiglaProvincia(@PathVariable String siglaProvincia){
        return repository.findBySiglaProvincia(siglaProvincia);
    }

}