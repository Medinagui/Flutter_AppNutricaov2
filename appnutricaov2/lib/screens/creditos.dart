
import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CreditosScreen extends StatefulWidget {
  const CreditosScreen({super.key});

  @override
  State<CreditosScreen> createState() => _CreditosScreenState();
}

class _CreditosScreenState extends State<CreditosScreen> {
  int congratsState = -1;

  List<Image> gifsList = [
    Image.asset('lib/images/gifs/clap-gif-1.gif'),
    Image.asset('lib/images/gifs/clap-gif-2.gif'),
    Image.asset('lib/images/gifs/clap-gif-3.gif'),
    Image.asset('lib/images/gifs/clap-gif-4.gif'),
    Image.asset('lib/images/gifs/clap-gif-5.gif'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Créditos', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                elevation: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              elevation: 5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Guilherme Medina de Castro',
                                    style: myTextThemes.textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Karen Isabel de Sousa',
                                    style: myTextThemes.textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Luís Gustavo Gomes Lopes',
                                    style: myTextThemes.textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Luzia de Fatima dos Santos Tozetto',
                                    style: myTextThemes.textTheme.displaySmall,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Card(
                                elevation: 5,
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      'Tiago Figueira',
                                      style:
                                          myTextThemes.textTheme.displaySmall,
                                      textAlign: TextAlign.center,
                                    )))
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (congratsState == (gifsList.length - 1)) {
                            congratsState = -1;
                          }
                          congratsState += 1;
                        });

                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return gifsList[congratsState];
                          },
                        );
                      },
                      style: buttonsTheme.elevatedButtonTheme.style,
                      child: const Text('Parabenizar'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
