import 'package:flutter/material.dart';
import '../components/forms/cadastro_alimento_form.dart';
import '../components/forms/cadastro_cardapio_form.dart';
import '../components/forms/cadastro_user_form.dart';
import '../db/alimentos_database.dart';
import '../themes/theme.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

List<DropdownMenuItem> alimentosCafe = [];
List<DropdownMenuItem> alimentosAlmoco = [];
List<DropdownMenuItem> alimentosJanta = [];

List<Widget> cadastroForms = [
  const CadastroUserForm(
    argument: 'none',
  ),
  const CadastroAlimentoForm(),
  CadastroCardapioForm(
      alimentosAlmoco: alimentosAlmoco,
      alimentosCafe: alimentosCafe,
      alimentosJanta: alimentosJanta)
];

int _buttonPressed = 0;

MaterialStateProperty<Color> buttonSelected(int buttonPressed, int buttonID) {
  if (buttonPressed == buttonID) {
    return MaterialStateProperty.all(colorsOne.colorScheme.secondary);
  }

  return MaterialStateProperty.all(colorsTwo.colorScheme.secondary);
}

class _CadastroScreenState extends State<CadastroScreen> {
  @override
  void initState() {
    super.initState();
    getAlimentos();
  }

  Future getAlimentos() async {
    var data = await SQLHelperAlimentos.getItems();
    if (alimentosCafe.isEmpty &&
        alimentosAlmoco.isEmpty &&
        alimentosJanta.isEmpty) {
      for (var alimento in data) {
        DropdownMenuItem dropDown = DropdownMenuItem(
            value: alimento['id'], child: Text(alimento['nome']));
        if (alimento['categoria'].toString() == 'Café da Manhã') {
          alimentosCafe.add(dropDown);
        } else if (alimento['categoria'].toString() == 'Almoço') {
          alimentosAlmoco.add(dropDown);
        }
        if (alimento['categoria'].toString() == 'Janta') {
          alimentosJanta.add(dropDown);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Cadastro', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height * 0.872,
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'O que deseja cadastrar?',
                        textAlign: TextAlign.center,
                        style: myTextThemes.textTheme.headlineSmall,
                      ),
                    ),
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
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: cadastroForms.elementAt(_buttonPressed))
                  ]),
            ),
          ),
        ),
      ),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
