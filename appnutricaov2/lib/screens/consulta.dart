import 'package:appnutricao/components/alimentos_list.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';

class ConsultaScreen extends StatefulWidget {
  const ConsultaScreen({super.key});

  @override
  State<ConsultaScreen> createState() => _ConsultaScreenState();
}

int _buttonPressed = 0;

MaterialStateProperty<Color> buttonSelected(int buttonPressed, int buttonID) {
  if (buttonPressed == buttonID) {
    return MaterialStateProperty.all(colorsOne.colorScheme.secondary);
  }

  return MaterialStateProperty.all(colorsTwo.colorScheme.secondary);
}

List<Widget> listasDisponiveis = const [
  Text('Lista Usuários'),
  AlimentosList(),
  Text('Lista Cardápios'),
];

List<String> listaOptionsSearch = [
  'Nome do Usuário',
  'Nome do Alimento',
  'Cardápio',
];

class _ConsultaScreenState extends State<ConsultaScreen> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _buttonPressed = 0;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: buttonSelected(_buttonPressed, 0),
                          ),
                          child: const Text('Usuário'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _buttonPressed = 1;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    buttonSelected(_buttonPressed, 1)),
                            child: const Text('Alimento')),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _buttonPressed = 2;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    buttonSelected(_buttonPressed, 2)),
                            child: const Text('Cardápio')),
                      ],
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       prefixIcon: const Icon(Icons.search),
                    //       hintText: 'Insira o nome que deseja procurar',
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(15),
                    //           borderSide: BorderSide(
                    //               color: colorsOne.colorScheme.secondary))),
                    // ),
                    if (!isKeyboard) listasDisponiveis[_buttonPressed]
                  ],
                )),
          ),
        ),
      ]),
      backgroundColor: colorsOne.colorScheme.primary,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: ClipOval(
          child: Container(
            color: colorsTwo.colorScheme.secondary,
            child: IconButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((context) {
                        return const ModalSearcher();
                      }));
                },
                icon: const Icon(
                  Icons.search,
                  size: 40,
                )),
          ),
        ),
      ),
    );
  }
}

class ModalSearcher extends StatelessWidget {
  const ModalSearcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: listaOptionsSearch[_buttonPressed],
              border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: colorsOne.colorScheme.secondary))),
        ),
      ),
    );
  }
}
