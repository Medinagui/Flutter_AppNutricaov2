import 'package:appnutricao/components/alimentos_list.dart';
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
            margin: const EdgeInsets.fromLTRB(15, 15, 20, 15),
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
                  const AlimentosList()
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