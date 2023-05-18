import 'package:appnutricao/components/alimentos_list.dart';
import 'package:flutter/material.dart';
import '../components/alimentos_list.dart' as alimentos_list;
import '../themes/theme.dart';
import 'package:appnutricao/db/alimentos_database.dart';

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

String searchName = '';

bool listReset = false;

class _ConsultaScreenState extends State<ConsultaScreen> {

    Future searchAlimentosName(String name) async {
    setState(() => alimentos_list.isLoading = true);
    final data = await SQLHelperAlimentos.getItemsByName(name);
    setState(() {
      alimentos_list.isLoading = false;
      alimentos_list.listaAlimentos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String action = ModalRoute.of(context)!.settings.arguments as String;

    if (action == "limpalista") {
      setState(() {
        alimentos_list.listaAlimentos = [];  
      });
    }
 
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                    if (!isKeyboard || listReset) listasDisponiveis[_buttonPressed]
                  ],
                )),
          ),
        ),
      ]),
      backgroundColor: colorsOne.colorScheme.primary,
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: ClipOval(
          child: Container(
            color: colorsTwo.colorScheme.secondary,
            child: IconButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15) 
                        )),
                      context: context,
                      builder: ((context) {
                        return const ModalSearcher();
                      })).then((value) {
                        searchAlimentosName(searchName).then((value) => listReset = false);

                      });
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }
}

class ModalSearcher extends StatefulWidget {
  const ModalSearcher({super.key});


  @override
  State<ModalSearcher> createState() => _ModalSearcherState();
}

class _ModalSearcherState extends State<ModalSearcher> {

  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorsOne.colorScheme.primary,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: SizedBox(
                height: 60,
                child: Center(
                  child: TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        hintText: listaOptionsSearch[_buttonPressed],
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {
                  setState((){
                    searchName = '';
                    listReset = true;
                    });
                  debugPrint(searchName);
                  // ignore: use_build_context_synchronously
                  
                  Navigator.pushNamed(context, '/consulta', arguments: "limpalista");
                  //Navigator.pop(context);
                },
                style: buttonsTheme.elevatedButtonTheme.style,
                child: const Text('Limpar Filtro')),
                ElevatedButton(onPressed: () {
                  setState(() => searchName = _nomeController.text);
                  debugPrint(searchName);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                style: buttonsTheme.elevatedButtonTheme.style,
                child: const Text('Pesquisar')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
