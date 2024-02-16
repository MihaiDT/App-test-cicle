import 'package:flutter/material.dart';
import 'package:lines/data/models/walkthrough_data.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/walkthrough/walkthrough.dart';

class PrizesOnboardingPage extends StatelessWidget {
  const PrizesOnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: Walkthrough(
        onTapLetsStart: () => Navigator.pop(context),
        pagesData: [
          WalkthroughData(
            title: "Benvenuta nell’area Premi",
            description:
                "Grazie ai prodotti che acquisti puoi tentare la fortuna e vincere  incredibili premi!",
            image: const Placeholder(),
          ),
          WalkthroughData(
            title: "Partecipa alle missioni",
            description:
                "Scopri le missioni del mese e completale:\nvinci immediatamente i fantastici premi in palio.",
            image: const Placeholder(),
          ),
          WalkthroughData(
            title: "Guadagna Coins e tenta la fortuna",
            description:
                "Carica i codici prodotto che trovi all'interno delle confezioni Lines e guadagni subito Coins con cui puoi accedere agli esclusivi concorsi Lucky Lines!",
            image: const Placeholder(),
          ),
        ],
      ),
    );
  }
}
