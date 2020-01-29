package it.unicam.justmeetbackend.controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class ControllerRest {

    @GetMapping("/")
    public String getMethodName()
    {
        return legenda;
    }

    String legenda = 
    "apiRest di Benedetti Michele & Moschini Daniele\n\n"+

    "GetMethod di Eventi\n\n"+

     "/eventi = Restituisce tutti gli eventi \n\n "+
     "/eventi/{titolo} = Eventi con quel preciso titolo come parametro\n\n"+
     "/eventi/like/{titolo} = Eventi che contengono nel titolo il parametro\n\n"+
     "/eventi/comune/{idComune} = Eventi di un determinato comune\n\n"+
     "/eventi/approvati/{isApproved} = Eventi con $isApproved true/false\n\n"+
     "/eventi/partecipanti/{partecipanti} = Eventi con numPartecipanti uguale al parametro\n\n"+
     "/eventi/sopra/{partecipanti} = Eventi con numPartecipanti > del parametro\n\n"+
     "/eventi/sotto/{partecipanti} = Eventi con numPartecipanti < del parametro\n\n"+

     "PostMethod di Eventi \n\n"+
     
     "/evento = Crea Evento, con isApproved settato a False \n\n"+
     
     "DeleteMethod di Eventi \n\n"+
     
     "/evento/{id} = Cancella l'evento con il determinato id \n\n"+
     
     "UpdateMethod di Eventi \n\n"+
     
     "/evento/{id} = Modifica l'evento con il determinato id";
}
