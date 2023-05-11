import 'package:flutter/material.dart';

import '../themes/theme.dart';
class ConsultaScreen extends StatefulWidget {
  const ConsultaScreen({super.key});

  @override
  State<ConsultaScreen> createState() => _ConsultaScreenState();
}

class _ConsultaScreenState extends State<ConsultaScreen> {

  List<String> listaExemplo = [
    "Exemplo 1",
    "Exemplo 2",
    "Exemplo 3",
    "Exemplo 4",
    "Exemplo 5",
    "Exemplo 6",
    "Exemplo 7",
    "Exemplo 8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Consulta', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
         Expanded(
          child: Card(
            margin: const EdgeInsets.fromLTRB(25, 20, 25, 20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Insira o nome que deseja procurar',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: colorsOne.colorScheme.secondary)
                      )
                    ),
                  ),
                  Expanded(child: ListView.builder(
                    itemCount: listaExemplo.length,
                    itemBuilder: (context, index) {
                    final String exemplo = listaExemplo[index];

                    return ListTile(
                      title: Text(exemplo),
                    );
                  }))
                ],
              )
            ),
          ),
        ),
      ]),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}