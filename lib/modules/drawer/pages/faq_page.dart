import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/expandable/expandable.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({
    super.key,
  });

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "ASSISTENZA",
          color: ThemeColor.primary,
        ),
        backButtonColor: ThemeColor.darkBlue,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: PrimaryButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse(
                    appController.settings.value?.helpdeskUrl ??
                        'https://lines.it/contatti-servizio-consumatori?from=app',
                  ),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const TitleLarge(
                "CONTATTACI",
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ThemeSizedBox.height8,

              /// FAQ
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: const DisplayMedium(
                  "Domande più frequenti",
                ).applyShaders(context),
              ),
              ThemeSizedBox.height16,

              _expandableFaq(
                question: "Quali sono le funzionalità dell’app My Lines?",
                answer:
                    "My Lines è molto più di un calendario mestruale per seguire e tenere sotto controllo il tuo ciclo mestruale! Caricando i codici che si trovano all’interno delle confezioni dei prodotti Lines puoi partecipare alle missioni e scoprire i tanti premi che ti aspettano. Tanti sconti e premi ti aspettano! All’interno dell’app puoi anche esplorare un mondo di contenuti gratuiti divisi per aree tematiche che riguardano a 360° il mondo femminile.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Cosa sono i Coins?",
                answer:
                    "I Coins sono la moneta virtuale dell'app My Lines. Puoi accumularli caricando i codici che trovi all'interno dei prodotti Lines (assorbenti o salvaslip), rispondendo ai sondaggi o invitando altre amiche a scaricare l'app. Non perderti le novità che arriveranno! Potrai utilizzare i Coins per partecipare ai concorsi Lucky Lines e provare a vincere fantastici premi.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come funzionano le missioni?",
                answer: "•	Missioni: cosa sono?\n\n"
                    "Le missioni sono delle operazioni a premio collegate all’acquisto dei prodotti Lines (assorbenti o salvaslip): acquista i prodotti Lines richiesti, carica i codici che trovi all’interno delle confezioni e scopri tutti i premi che ti aspettano! Ricorda che ogni missione delle scadenze di caricamento codici e di utilizzo del ..codice sconto: leggi bene il regolamento di ciascuna missione e portala a termine nei tempi stabiliti.\n\n\n"
                    "• Come si accede alle missioni?\n\n"
                    "Acquista i prodotti Lines (assorbenti o salvaslip) e carica i codici stampati all’interno delle confezioni o dentro la missione o nella sezione “Carica codice” (ti verranno proposte le missioni alle quali puoi partecipare  con il codice appena caricato). Se è richiesto il caricamento di più codici puoi inserirli anche in momenti diversi entro la scadenza della missione. Quando avrai caricato tutti i codici richiesti avrai accesso al tuo premio. Riceverai subito un’ e-mail al tuo indirizzo e-mail di registrazione con tutte le informazioni relative alla disponibilità e all’utilizzo del tuo premio. Mi raccomando, controlla anche la posta indesiderata e segui le indicazioni per utilizzare il codice sconto tenendo conto della data di scadenza della missione e del termine ultimo per utilizzare il codice. Per maggiori informazioni consulta il regolamento della missione. Se il premio non fosse disponibile ti avviseremo e dovrai pazientare qualche giorno: ti invieremo il codice sconto per e-mail appena tornerà disponibile.",
              ),

              ThemeSizedBox.height8,
              _expandableFaq(
                question:
                    "Come viene realizzata la previsione delle prossime mestruazioni?",
                answer:
                    "Se in fase di registrazione o dal profilo hai inserito la durata media del ciclo e delle mestruazioni, per i primi mesi quei dati vengono utilizzati per prevedere le future mestruazioni. Per renderlo ancora più preciso, dal 6° mese di utilizzo dell’app la previsione viene realizzata considerando la durata media del ciclo e delle mestruazioni dei 6 mesi precedenti, escludendo i due estremi. Se in fase di registrazione non ci hai fornito questi dati sarà utilizzata la durata media del ciclo di 28 giorni e delle mestruazioni di 5 giorni.",
              ),

              ThemeSizedBox.height8,
              _expandableFaq(
                question: "Chi è Cherry?",
                answer:
                    "Cherry è una simpatica goccina che rappresenta le tue mestruazioni. Sarà personalizzabile con tante espressioni e accessori e potrai prenderti cura di lei proprio come dovrebbe fare ogni donna con sè stessa. Finite le mestruazioni Cherry cambierà forma e aspetto, evolvendosi insieme alle fasi del tuo ciclo mestruale.",
              ),

              ThemeSizedBox.height48,

              /// Scopri di più
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: const DisplayMedium(
                  "Scopri di più su",
                ).applyShaders(context),
              ),
              ThemeSizedBox.height16,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "HOMEPAGE E CALENDARIO",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Quali sono le funzionalità dell’app My Lines?",
                answer:
                    "My Lines è molto più di un calendario mestruale per seguire e tenere sotto controllo il tuo ciclo mestruale! Caricando i codici che si trovano all’interno delle confezioni dei prodotti Lines puoi partecipare alle missioni e scoprire i tanti premi che ti aspettano. Tanti sconti e premi ti aspettano! All’interno dell’app puoi anche esplorare un mondo di contenuti gratuiti divisi per aree tematiche che riguardano a 360° il mondo femminile.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Perché non vedo Cherry nella Home page?",
                answer:
                    "Per visualizzare la tua Cherry e utilizzare il calendario devi darci il consenso al trattamento dei dati del tuo ciclo. Puoi modificare le tue preferenze in ogni momento dalle impostazioni dell’app nella pagina di “Gestione consensi”.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Posso recuperare i dati del ciclo conservati in altre app?",
                answer:
                    "Certo e My Lines ti aiuta! Inserendo la durata del tuo ciclo e delle tue mestruazioni in fase di registrazione, My Lines proverà a prevedere i tuoi cicli mestruali degli ultimi mesi. Dal calendario puoi visualizzare i mesi passati per confermare o modificare le previsioni. Questa operazione aiuterà la previsione delle stime future ed arricchirà da subito la tua sezione report.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Perché non visualizzo la sezione “Diario” se clicco su un giorno qualsiasi del calendario?",
                answer:
                    "Data la particolare sensibilità delle informazioni contenute, il servizio Diario è riservato alle sole utenti maggiorenni. Non preoccuparti! Potrai iniziare ad utilizzare il servizio Diario e ad inserire sintomi e attività al compimento della maggiore età.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Ho sbagliato ad inserire le mestruazioni, posso modificarle?",
                answer:
                    "Certo, entra nell’area “calendario” e clicca sul tasto “Modifica mestruazioni”.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Perché le informazioni inserite nel mio Diario non sono state salvate?",
                answer:
                    "Quando utilizzi per la prima volta il Diario, inserisci dei dati e clicchi su “Procedi” ti verrà richiesto un consenso, devi fornirlo per poter utilizzare il servizio Diario e salvare i dati inseriti.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Che succede se tolgo il consenso al servizio Calendario Mestruale?",
                answer:
                    "Per garantire l’esercizio dei tuoi diritti, se togli il consenso per il servizio Calendario Mestruale dovremo cancellare tutti i dati del ciclo che ci hai fornito. Ricorda che potrai fornire nuovamente il consenso nella pagina di gestione consensi ma non ritroverai i dati inseriti in precedenza, dovrai inserirli di nuovo.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Che succede se tolgo il consenso al servizio Diario?",
                answer:
                    "Per garantire l’esercizio dei tuoi diritti, se togli il consenso per il servizio Diario dovremo cancellare tutti i dati di sintomi e attività che ci hai fornito. Ricorda che potrai fornire nuovamente il consenso nella pagina di gestione consensi ma non ritroverai i dati inseriti in precedenza, dovrai inserirli di nuovo.",
              ),

              ThemeSizedBox.height32,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "PREMI",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Cosa sono i Coins?",
                answer:
                    "I Coins sono la moneta virtuale dell'app My Lines. Puoi accumularli caricando i codici che trovi all'interno dei prodotti Lines (assorbenti o salvaslip), rispondendo ai sondaggi o invitando altre amiche a scaricare l'app. Non perderti le novità che arriveranno! Potrai utilizzare i Coins per partecipare ai concorsi Lucky Lines e provare a vincere fantastici premi.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Dove trovo il codice?",
                answer:
                    "Apri la confezione dei tuoi Lines: al suo interno troverai stampato il codice univoco da inserire per ottenere i Coins!\n"
                    "Se hai acquistato una confezione multipla, puoi trovare i codici validi per l’app My Lines stampati all’interno  delle singole confezioni contenute nella confezione multipla. È possibile che sia presente un codice anche all'interno della confezione esterna: puoi ignorarlo in quanto non è valido per l'inserimento nell'app My Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come funzionano le missioni?",
                answer: "•	Missioni: cosa sono?\n\n"
                    "Le missioni sono delle operazioni a premio collegate all’acquisto dei prodotti Lines (assorbenti o salvaslip): acquista i prodotti Lines richiesti, carica i codici che trovi all’interno delle confezioni e scopri tutti i premi che ti aspettano! Ricorda che ogni missione delle scadenze di caricamento codici e di utilizzo del ..codice sconto: leggi bene il regolamento di ciascuna missione e portala a termine nei tempi stabiliti.\n\n\n"
                    "• Come si accede alle missioni?\n\n"
                    "Acquista i prodotti Lines (assorbenti o salvaslip) e carica i codici stampati all’interno delle confezioni o dentro la  missione o nella sezione “Carica codice” (ti verranno proposte le missioni alle quali puoi partecipare  con il codice appena caricato). Se è richiesto il caricamento di più codici puoi inserirli  anche in momenti diversi entro la scadenza della missione. Quando avrai caricato tutti i codici richiesti avrai accesso al tuo premio. Riceverai subito un’ e-mail al tuo indirizzo e-mail di registrazione con tutte le informazioni relative alla disponibilità e all’utilizzo del tuo premio. Mi raccomando, controlla anche la posta indesiderata e segui le indicazioni per utilizzare il codice sconto tenendo conto della  data di scadenza della missione e del termine ultimo per utilizzare il codice. Per maggiori informazioni consulta il regolamento della missione. Se il premio non fosse disponibile ti avviseremo e dovrai pazientare qualche giorno: ti invieremo il codice sconto per e-mail appena tornerà disponibile.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come funzioneranno i Lucky Lines?",
                answer:
                    "Non perderti la novità in arrivo! Presto potrai utilizzare i tuoi coins per accedere ai concorsi Lucky Lines. Basterà scegliere il premio che vuoi tentare di vincere: ti saranno scalati i coins ad esso collegati e scoprirai se sei stata fortunata. Altrimenti, potrai ritentare la sorte. Per tutti i dettagli su modalità di partecipazione e tempistiche potrai consultare il regolamento del concorso che troverai in app nella sezione Lucky Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "E se carico un codice prodotto di una missione?",
                answer:
                    "Se carichi il codice di un prodotto Lines all’interno di una missione la completerai (se è richiesto un solo codice di quel prodotto) oppure avrai fatto uno step verso il suo completamento.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Il codice sulla confezione è illeggibile",
                answer:
                    "Se il codice all’interno del pacco è illeggibile o riscontri problemi nell’inserimento contatta il Servizio Consumatori cliccando sul menù in alto a sinistra e poi “Assistenza”. Ti risponderemo il prima possibile!",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Posso caricare il codice nell’app My Lines e partecipare anche al concorso presente sul sito Lines?",
                answer:
                    "Si! Puoi caricare il codice sia all’interno dell’app My Lines (soltanto una volta) sia utilizzarlo per partecipare ad eventuali attività presenti sul sito Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Quanti amici posso invitare?",
                answer:
                    "Puoi invitare tutti gli amici che vuoi, ma soltanto per i primi 5 riceverai 50 coins per ogni amico che completa la registrazione all’app My Lines inserendo il tuo codice amico.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Ho invitato un amico ma non ho ottenuto i Coins, come mai?",
                answer:
                    "Per ricevere i Coins è necessario che l’amico invitato si registri ed inserisca il codice amico ricevuto durante il flusso di registrazione. Se non lo inserisce durante il flusso di registrazione non può più inserirlo. Puoi ricevere coins per un massimo di 5 amici che si registrano in app utilizzando il tuo codice amico.",
              ),

              ThemeSizedBox.height32,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "CODICI",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,


              /// This is a different Expandable widget that has a Markdown widget as a child and not simply a text
              Expandable(
                title: "Che prodotti posso inserire nell’app My Lines?",
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Markdown(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    data:
                        "[Qui trovi la lista di prodotti]()\n\nI pacchi doppi o tripli che contengono un unico codice hanno un valore pari ai coins del pacco singolo di riferimento moltiplicato per il numero di pacchi corrispondenti (2 o 3). Se hai acquistato una confezione multipla i codici validi per l'app My Lines sono stampati all'interno delle singole confezioni contenute nella confezione multipla. Se presente puoi quindi ignorare il codice stampato nella confezione esterna",
                    styleSheet: MarkdownStyleSheet(
                      a: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.blue),
                      p: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ThemeColor.darkBlue),
                    ),
                    onTapLink: (_, __, ___) {
                      Get.toNamed(Routes.infoDropdownResultsPage);
                    },
                  ),
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Dove trovo il codice?",
                answer:
                    "Apri la confezione dei tuoi Lines: al suo interno troverai stampato il codice univoco da inserire per ottenere i Coins!\n"
                    "Se hai acquistato una confezione multipla, puoi trovare i codici validi per l’app My Lines sono stampati all’interno delle singole confezioni contenute nella confezione multipla. È possibile che sia presente un codice anche all'interno della confezione esterna: puoi ignorarlo in quanto non è valido per l'inserimento nell'app My Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Dove posso caricare il codice di un prodotto?",
                answer:
                    "Puoi caricare il codice di un prodotto Lines entrando nella pagina premi e poi in alto sul “Carica codice” oppure all’interno di una missione. Dopo la descrizione della missione e delle modalità di partecipazione verrà richiesto di caricare il codice per partecipare alla missione.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Quante volte posso caricare un codice prodotto?",
                answer:
                    "Puoi caricare ogni codice Lines soltanto una volta all’interno dell’app My Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Cosa ottengo se carico un codice prodotto?",
                answer:
                    "Caricando i codici Lines otterrai i Coins relativi al prodotto che hai caricato. In più, nel caso in cui il prodotto caricato partecipi ad una missione, parteciperai automaticamente ad essa. Se il prodotto caricato è valido per più missioni ti sarà proposto di scegliere quella a cui preferisci partecipare.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Valgono anche i codici sulle confezioni dei pacchi multipli o pacco scorta?",
                answer:
                    "No, se c’è un codice sul pacco esterno della confezione multipla puoi ignorarlo in quanto non è valido per l'inserimento nell'app My Lines. Se hai acquistato una confezione multipla o un pacco formato scorta, i codici da inserire in app si trovano all’interno delle singole confezioni contenute nel pacco.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Perché il codice Lines risulta non valido?",
                answer: "Le cause possono essere molteplici:\n"
                    "-	Stai caricando un codice che in realtà non esiste, forse perché il codice è scritto male o si è rovinato durante l’apertura;\n"
                    "-	Stai caricando il codice di un prodotto non presente nella lista di quelli caricabili in app;\n"
                    "-	Stai caricando il codice presente su una confezione multipla: puoi ignorare quel codice, i codici validi per l’app My Lines si trovano all’interno delle singole confezioni contenute nel pacco;\n"
                    "-	Stai caricando un codice già caricato in precedenza.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Posso caricare il codice nell’app My Lines e partecipare anche al concorso presente sul sito Lines?",
                answer:
                    "Si! Puoi caricare il codice sia all’interno dell’app My Lines (soltanto una volta) sia utilizzarlo per partecipare ad eventuali attività presenti sul sito Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Posso usare lo stesso codice per partecipare a più missioni?",
                answer:
                    "Ogni codice può essere caricato in app solo una volta ed eventualmente partecipare a massimo una missione.",
              ),

              ThemeSizedBox.height32,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "PROFILO",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Come viene realizzata la previsione delle prossime mestruazioni?",
                answer:
                    "Se in fase di registrazione o dal profilo hai inserito la durata media del ciclo e delle mestruazioni, per i primi mesi quei dati vengono utilizzati per prevedere le future mestruazioni. Per renderlo ancora più preciso, dal 6° mese di utilizzo dell’app la previsione viene realizzata considerando la durata media del ciclo e delle mestruazioni dei 6 mesi precedenti, escludendo i due estremi. Se in fase di registrazione non ci hai fornito questi dati sarà utilizzata la durata media del ciclo di 28 giorni e delle mestruazioni di 5 giorni.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come funzionano i Badge?",
                answer:
                    "I Badge sono dei traguardi virtuali che puoi raggiungere compiendo una o più azioni in app, ad esempio completando il quiz di benvenuto o consultando i contenuti dell’app. Alcuni Badge hanno più livelli e devi completarli tutti per ottenere completare il Badge. Nella sezione Badge all’interno del profilo troverai la descrizione di tutti quelli disponibili.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Perché la funzione dei Badge è oscurata?",
                answer:
                    "Per ottenere i Badge dobbiamo conoscere il tuo comportamento all’interno dell’app, per questo abbiamo bisogno del tuo consenso ai fingerprinting di profilazione. Fornisci questo consenso direttamente dalla sezione badge che vedi oscurata.",
              ),

              ThemeSizedBox.height32,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "CHERRY",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Chi è Cherry?",
                answer:
                    "Cherry è una simpatica goccina che rappresenta le tue mestruazioni. Sarà personalizzabile con tante espressioni e accessori e potrai prenderti cura di lei proprio come dovrebbe fare ogni donna con sè stessa. Finite le mestruazioni Cherry cambierà forma e aspetto, evolvendosi insieme alle fasi del tuo ciclo mestruale.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Perché cambia?",
                answer:
                    "Cherry è la mascotte dell’app My Lines che cambia per seguire il tuo ciclo mestruale! La goccia di sangue rappresenta la fase delle mestruazioni. Finite le mestruazioni Cherry cambierà forma e aspetto, evolvendosi insieme alle fasi del tuo ciclo mestruale: follicolare, ovulatoria e luteale.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Posso personalizzare tutte le varie fasi del ciclo mestruale?",
                answer:
                    "Le personalizzazioni che scegli si adatteranno a Cherry in tutte le fasi del ciclo mestruale.",
              ),

              ThemeSizedBox.height32,

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: HeadlineSmall(
                  "INFO TECNICHE",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.start,
                ),
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "È possibile modificare l’email di registrazione all’app My Lines?",
                answer:
                    "No, non è possibile modificare l’email di registrazione all’app My Lines.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Posso cambiare la password?",
                answer:
                    "Si, puoi modificare la password cliccando sul menù in alto a sinistra e poi su “Account”",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Non mi funziona l’app, che faccio?",
                answer:
                    "Non preoccuparti! Prova a seguire questi step, se non funziona il primo passa al secondo e così via:\n"
                    "-	Chiudi tutte le app aperte e poi utilizza l’app My Lines;\n"
                    "-	Controlla dalle impostazioni del telefono (o da Google Play/App Store) se l’applicazione deve essere aggiornata e avvia l’aggiornamento;\n"
                    "-	Controlla di avere una connessione di rete stabile. Se possibile cambia rete (da rete mobile a Wi-fi o viceversa);\n"
                    "-	Attendi e riprova in un secondo momento: potrebbe esserci della manutenzione in corso.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Perché devo fare l’aggiornamento che l’app mi propone?",
                answer:
                    "Gli aggiornamenti ci servono per aggiungere o migliorare le funzionalità dell’app o per risolvere qualche bug tecnico. Aggiornare quindi significa avere la versione di My Lines migliore possibile ed in cui tutto funziona correttamente.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come posso cambiare i consensi forniti?",
                answer:
                    "Puoi modificare sempre le tue preferenze accedendo dal menù in alto a sinistra alle impostazioni e alla pagina di gestione consensi.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Come posso cancellare l’account?",
                answer:
                    "Puoi cancellare il tuo account accedendo, tramite il menù in alto a sinistra, alle impostazioni e alla pagina di gestione consensi tramite il Privacy Portal Fater. Se hai fatto accesso all’app utilizzando i social e quindi non conosci la tua password puoi comunque accedere al Privacy Portal utilizzando la sezione in basso a destra in cui è richiesta soltanto l’email.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Che succede se tolgo il consenso al servizio Calendario Mestruale?",
                answer:
                    "Per garantire l’esercizio dei tuoi diritti, se togli il consenso per il servizio Calendario Mestruale dovremo cancellare tutti i dati del ciclo che ci hai fornito. Ricorda che potrai fornire nuovamente il consenso nella pagina di gestione consensi ma non ritroverai i dati inseriti in precedenza, dovrai inserirli di nuovo.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question:
                    "Che succede se tolgo il consenso al servizio Diario?",
                answer:
                    "Per garantire l’esercizio dei tuoi diritti, se togli il consenso per il servizio Diario dovremo cancellare tutti i dati di sintomi e attività che ci hai fornito. Ricorda che potrai fornire nuovamente il consenso nella pagina di gestione consensi ma non ritroverai i dati inseriti in precedenza, dovrai inserirli di nuovo.",
              ),
              ThemeSizedBox.height8,

              _expandableFaq(
                question: "Dove posso attivare o disattivare le notifiche?",
                answer:
                    "Puoi farlo accedendo tramite il menù in alto a sinistra alle impostazioni e alla pagina di gestione consensi.",
              ),
              ThemeSizedBox.height8,

              ThemeSizedBox.height48,
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandableFaq({
    required String question,
    required String answer,
  }) {
    return Expandable(
      title: question,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BodyMedium(
          answer,
          color: ThemeColor.darkBlue,
        ),
      ),
    );
  }
}
