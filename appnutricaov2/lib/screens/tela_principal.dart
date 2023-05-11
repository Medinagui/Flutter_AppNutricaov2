import 'package:flutter/material.dart';

import '../components/buttons/principal_button.dart';
import '../components/classes/screens_list.dart';
import '../themes/theme.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Tela Principal', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.fromLTRB(25, 20, 25, 20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                       PrincipalScreenButton(
                      icon: Icons.app_registration,
                      label: 'Cadastro',
                      screen: screenList[4],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrincipalScreenButton(
                      icon: Icons.search,
                      label: 'Consulta',
                      screen: screenList[3],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrincipalScreenButton(
                      icon: Icons.share,
                      label: 'Compartilhar',
                      screen: screenList[3],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrincipalScreenButton(
                      icon: Icons.emoji_events,
                      label: 'Créditos',
                      screen: screenList[3],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrincipalScreenButton(
                      icon: Icons.logout,
                      label: 'Logout',
                      screen: screenList[0],
                    ),
                  ]),
            ),
          ),
        ),
      ]),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
