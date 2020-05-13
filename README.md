
<p align="center">
  <img src="https://github.com/Cosmo997/Justmeet/blob/master/justmeetfrontend/assets/images/logo_black.png">
</p>

---

<p align="center">
    Il progetto <b>JustMeet</b> è stato realizzato in <b>Flutter</b> per il corso di laurea <b>L-31</b> presso <b>Unicam</b>, <i>nell'anno accademico 2019/2020</i>, dagli studenti Benedetti Michele e Daniele Moschini, per l'esame di <b>Programmazione Web e Mobile</b> e <b>Ingegneria del Software</b>, utilizzando le tecnologie mostrate durante il corso.
</p>

# Indice  

- [Vision del Progetto](#vision)
- [Tecnologie Utilizzate](#tec)

# Vision del Progetto <a name = "vision"></a>

Si vuole realizzare un sistema software che permetta l’incontro tra persone al fine di svolgere **attività cooperative e di squadra**. L’obiettivo del sistema è dunque favorire la creazione di gruppi e di nuove amicizie e deve funzionare come una sorta di **bacheca avanzata di annunci** e di coordinamento.<br><br>
Gli utenti, qual'ora siano autenticati, possono utilizzare la piattaforma per inserire eventi e per richiedere la partecipazione di altri utenti. In particolare ogni evento sarà caratterizzato da un **topic**, che rispecchierà la tipologia di evento creato. 
Ad esempio il sistema potrebbe permettere di organizzare una partita di calcetto inserendo specifici dati quali **luogo orario e numero minimo di calciatori** necessario affinché l’evento abbia luogo. <br><br>
Gli utenti potreanno inoltre consultare nella propria **area riservata**, la lista di eventi ai quali sono **iscritti**, quelli salvati tra i **preferiti** e quelli da loro **creati**, rimuovendoli o inserendone altri a piacimendo dall'apposita pagina.
Una volta creato, al fine di evitare la pubblicazione di eventi non appropriati, l'evento verrà **approvato** o **rifiutato** da un moderatore, selezionato dagli sviluppatori.
Se le condizioni saranno soddisfatte, e l'evento verrà approvato, gli utenti registrati avranno la possibilità di sottoscriversi ad esso con conseguente messaggio di conferma.<br>
Mentre per coloro che **non** sono registrati, sarà comunque possibile usufruire dell'app per visualizzare la bacheca generale.

# Tecnologie Utilizzate durante lo Sviluppo <a name = "tec"></a>

Per questo progetto, abbiamo deciso di utillare un linguaggio lato Front-End, che ci permetta di sviluppare un'applicazione **Cross-Platform**, al fine di avere un software **Single-CodeBase** che sia fruibile su **iOS**, **Android** e [**Web**](https://michele-x98.github.io/web/#/)  .
Per fare ciò, abbiamo scelto il linguaggio di programmazione **Dart** e il relativo Framework di sviluppo **Flutter**.
<br>
<br>
Per quanto riguarda il lato Back-End, abbiamo utilizzato interamente il linguaggio **Java** ed il relativo Framework **Spring-Boot** per la creazione di **Api Rest**, utulizzare per far comunicare il lato FrontEnd con il Database NOSQL **MongoDB** per lo storage dei dati.
<br><br>

<p align="center">
<img src="https://i.imgur.com/CjTaubG.png" height="450">
<img src="https://i.imgur.com/7W7Pz6E.png" height="450">
<img src="https://i.imgur.com/cQP1cBg.png" height="450">
</p>

<br><br>

Per poter effettuare le chiamate REST ci siamo affidati al servizio messo a disposizione da [**Hekoku**](https://www.heroku.com/), che ci ha permesso di spostare in remoto gratuitamente il **Server Apache** messo a disposizione da SpringBoot. <br>
L'autentucazione dell'utente nell'applicazione viene effettuata grazie al servizio **Google Firebase**, che gestisce in modo autonomo dal sistema da noi implementato, le fasi di **SignIn** e **SignUp**.

<br><br>
# Prima Vision e Iterazioni per lo Sviluppo 

VISON:<BR>

Si vuole realizzare un sistema software che permetta l’incontro tra persone al fine di svolgere attività cooperative e di squadra. L’obiettivo del sistema è dunque favorire la creazione di gruppi e di nuove amicizie e deve funzionare come una sorta di bacheca avanzata di annunci e di coordinamento.
Gli utenti possono utilizzare la piattaforma per inserire eventi e per richiedere la partecipazione di altri utenti. In particolare la tipologia di evento richiederà di specificare diverse caratteristiche. Ad esempio il sistema potrebbe permettere di organizzare una partita di calcetto inserendo specifici dati quali luogo orario e numero minimo di calciatori necessario affinché l’evento abbia luogo. Se le condizioni saranno soddisfatte gli aderenti riceveranno poi un messaggio di conferma.
Altrimenti sarà possibile organizzare una sessione di studio su una specifica materia, o chiedere semplicemente aiuto ad uno studente più anziano in riferimento ad uno specifico corso.
In sostanza il sistema conterrà la specifica di eventi che saranno “annunciabili” tramite la piattaforma specificando anche i vincoli riguardo gli utenti che potranno rispondere ad una richiesta (e.g. laureati triennali).
Allo stesso tempo il sistema potrebbe prevedere di mantenere un profilo in relazione alle attività svolte dall’utente e per le quali potrà ricevere una valutazione dalla sua squadra.
Nello sviluppo dell’applicazione sarà necessario focalizzarsi e definire la lista degli eventi che la piattaforma supporta.



I Iterazione<BR>
Abbiamo deciso di svolgere una nuova fase di inception poiché il progetto è stato rielaborato e quindi i casi d'uso e la documentazione non sono compatibili, abbiamo dedicato circa 4 giorni a questa operazione e abbiamo dei dubbi riguardo alcuni casi d'uso come ad esempio tutte le azioni che riguardano gli eventi, nel libro vengono accorpati in un unico caso d'uso, ma poi non sappiamo come descriverlo.
Inizialmente abbiamo utilizzato un UML agile per i casi d'uso scritto su di una lavagna e quindi non è stato necessario utilizzare Visual Paradigm.
La progettazione e l'implementazione non ci sono state, abbiamo solamente creato la repository Git e creato il nuovo progetto in flutter.


II Iterazione<BR>
Oggi venerdì 20 dicembre concludiamo la seconda iterazione, abbiamo impiegato circa una settimana di lavoro extra per poter arrivare almeno alla metà della Milestone che ci eravamo imposti.
Tutto questo a causa della poca esperienza che abbiamo nello sviluppo di un backend e per la difficoltà del tool "Flutter". Abbiamo prolungato l'iterazione, ignorando la "best practice" suggerita dal libro, poiché avremmo comunque dovuto investire del tempo nello studio delle tecnologia utilizzate, che per noi sono completamente nuove, procedendo ad uno studio basato sull'applicazione delle conoscenze apprese.
L'errore da noi commesso è stato quello di voler implementare nel software i casi d'uso principali individuati nella fase di analisi dei requisiti, non considerando che, essendo principali, comprendono circa il 70% del codice totale.
Ci siamo trovati in difficoltà anche con i requisiti da noi individuati, in quanto poco precisi e molti errati, fortunatamente però non avendo ancora una conoscenza dettagliata della materia e del software Visual Paradigm, abbiamo preferito non eccedere con elaborati, rischiando poi di crearne di inutili o sbagliati, e fortunatamente con la fine della prima parte delle lezioni abbiamo più conoscenze ed esempi di elaborati da poter utilizzare nel progetto, questo comporta una prossima iterazione, basata molto sul miglioramento e l'implementazione dei requisiti basilari individuati in precedenza, con idee che sono nate nella fase di implementazione appena svolta.
Nella prossima iterazione verranno anche implementati i primi test poiché nell'applicazione sono già necessari per via della complessità, almeno per noi, riscontrata.

III Iterazione<BR>
In questa iterazione abbiamo dedicato molto lavoro nel perfezionamento della documentazione, migliorando di molto il diagramma delle classi e implementando i diagrammi di sequenza correttamente.
La milestone chi ci siamo posti all'inizio dell'iterazione era quella di implementare l'iterfaccia grafica dedicata all'area personale dell'utente, e quella di collegare il nostro backend spring boot con un database mongodb.
In questa iterazione abbiamo anche pensato ai primi Test, dato che il backend non era ancora collegato al database abbiamo preferito non effettuare test iniziali per poi doverli riscrivere completamente.
La parte frontend invece abbiamo pensato di aspettare prima di inziare la fase di testing per via delle poche informazioni che abbiamo ancora sul framework flutter e gli strumenti che mette a disposizione per il testing.
Nella fase di Progettazione abbiamo identificato anche gli elementi più difficili da comprendere nella documentazione, che nella prossima iterazione perfezioneremo con altri diagrammi.
  
IV Iterazione<BR>
In quest'ultima iterazione ci siamo dedicati inizialmente a completare la documentazione implementando i casi d'uso rimanenti e i sequence diagram rimanente, per poi passare ad implementare le ultime funzioni che ci siamo prefissati per il progetto.
Il progetto è finito per quanto riguarda la documentazione e l'implementazione. Nella fase finale ci siamo dedicati alla parte di testing, anche essa terminata con successo.
 Per quanto riguarda il testing dell'applicazione abbiamo utilizzato il programma postman, dato che lo abbiamo già utiizzato per testing di componente e testing di integrazione.
Per visualzzare i test è necessario importare in postman il seguente link:
https://www.getpostman.com/collections/612b73d4f5ea9e75c464
  
 Iterazione extra<BR>
Abbiamo deciso di inserire una successiva mini-iterazione per via di alcuni bug riscontrati nel codice, per un refactoring generale della documentazione (aggiornando alcune chiamate con i metodi specifici) e soprattutto per farla rientrare nelle specifiche richieste dal professore per svolgere l'esame.
Per fare ciò abbiamo riscaricato i commit principali da github che riguardavano la documentazione e abbiamo ripreso i class diagram e i casi d'uso di ogni iterazioni e li abbiamo aggiunti a quelli già presenti.
Invece per quanto riguarda i sequence diagram siamo passati da uno stile informale ad uno formale cambiando il linguaggio, ma non il contenuto.

