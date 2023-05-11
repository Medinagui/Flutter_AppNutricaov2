import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class CadastroCardapioForm extends StatefulWidget {
  const CadastroCardapioForm({super.key});

  @override
  State<CadastroCardapioForm> createState() => _CadastroCardapioFormState();
}

class _CadastroCardapioFormState extends State<CadastroCardapioForm> {
  String? categoriaRefeicao;
  String? tipoAlimento;

  List<DropdownMenuItem> usersList = const [
    DropdownMenuItem(value: 'Usuário 1', child: Text('Usuário 1')),
    DropdownMenuItem(value: 'Usuário 2', child: Text('Usuário 2')),
    DropdownMenuItem(value: 'Usuário 3', child: Text('Usuário 3')),
    DropdownMenuItem(value: 'Usuário 4', child: Text('Usuário 4')),
    DropdownMenuItem(value: 'Usuário 5', child: Text('Usuário 5')),
  ];

  List<String> alimentosCafe = [
    "Café\n",
    "Pão\n",
    "Leite\n",
  ];

  List<String> alimentosAlmoco = [
    "Arroz\n",
    "Feijão\n",
    "Carne\n",
    "Salada\n",
    "Legumes\n",
  ];

  List<String> alimentosJanta = [
    "Macarrão\n",
    "Molho\n",
    "Carne Moída\n",
    "Queijo\n",
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  iconSize: 30,
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  hint: const Text('Usuário'),
                  value: categoriaRefeicao,
                  items: usersList,
                  onChanged: (val) {
                    setState(() {
                      categoriaRefeicao = val.toString();
                    });
                  }),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
            color: colorsOne.colorScheme.primary,
            elevation: 5,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Café da Manhã',
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Alimentos Cadastrados:\n'),
                      (alimentosCafe.isEmpty)
                          ? const Text('Sem alimentos cadastrados')
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${alimentosCafe[0]}\n${alimentosCafe[1]}\n${alimentosCafe[2]}',
                                textAlign: TextAlign.center,
                              ),
                            )
                    ]),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('Buscar\nAlimentos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorsTwo.colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Card(
            color: colorsOne.colorScheme.primary,
            elevation: 5,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Almoço',
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Alimentos Cadastrados:\n'),
                      (alimentosAlmoco.isEmpty)
                          ? const Text('Sem alimentos cadastrados')
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${alimentosAlmoco[0]}\n${alimentosAlmoco[1]}\n${alimentosAlmoco[2]}\n${alimentosAlmoco[3]}\n${alimentosAlmoco[4]}',
                                textAlign: TextAlign.center,
                              ),
                            )
                    ]),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('Buscar\nAlimentos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorsTwo.colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Card(
            color: colorsOne.colorScheme.primary,
            elevation: 5,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Jantar',
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Alimentos Cadastrados:\n'),
                      (alimentosAlmoco.isEmpty)
                          ? const Text('Sem alimentos cadastrados')
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${alimentosAlmoco[0]}\n${alimentosAlmoco[1]}\n${alimentosAlmoco[2]}\n${alimentosAlmoco[3]}',
                                textAlign: TextAlign.center,
                              ),
                            )
                    ]),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text('Buscar\nAlimentos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: colorsTwo.colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(colorsOne.colorScheme.secondary)),
              child: const Text('Cadastrar'),
            ),
          ],
        )
      ],
    ));
  }
}
