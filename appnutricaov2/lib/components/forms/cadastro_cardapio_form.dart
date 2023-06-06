import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appnutricao/db/alimentos_database.dart' as db_alimentos;
import '../../themes/theme.dart';

class CadastroCardapioForm extends StatefulWidget {
  const CadastroCardapioForm({super.key});

  @override
  State<CadastroCardapioForm> createState() => _CadastroCardapioFormState();
}

class _CadastroCardapioFormState extends State<CadastroCardapioForm> {
  String? categoriaRefeicao;
  String? tipoAlimento;

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
        const Card(
          elevation: 5,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Você está cadastrando um cardápio \npara o usuário Usuário X.\nCaso queira cadastrar para outro usuário, \nfaça o login com o usuário que deseja cadastrar.',
                textAlign: TextAlign.center,
              )),
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
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ModalAlimentoSelector(categoriaRefeicao: 1);
                      });
                },
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
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ModalAlimentoSelector(categoriaRefeicao: 2);
                      });
                },
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
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ModalAlimentoSelector(categoriaRefeicao: 3);
                      });
                },
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
                  backgroundColor: MaterialStateProperty.all(
                      colorsOne.colorScheme.secondary)),
              child: const Text('Cadastrar'),
            ),
          ],
        )
      ],
    ));
  }
}

// ignore: must_be_immutable
class ModalAlimentoSelector extends StatefulWidget {
  ModalAlimentoSelector({super.key, required this.categoriaRefeicao});
  int categoriaRefeicao;
  @override
  State<ModalAlimentoSelector> createState() => _ModalAlimentoSelectorState();
}

bool? isLoading;
List<Map<String, dynamic>> listaAlimentos = [];
List<Map<String, dynamic>> listaAlimentosSelected = [];
List<Map<String, dynamic>> listaAlimentosCreate = [];

class _ModalAlimentoSelectorState extends State<ModalAlimentoSelector> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    verifyAlimentos(widget.categoriaRefeicao);
  }

  Future<void> verifyAlimentos(id) async {
    listaAlimentos.clear();
    listaAlimentosSelected.clear();
    List<Map<String, dynamic>> alimentos =
        await db_alimentos.SQLHelperAlimentos.getItems();
    if (id == 1) {
      for (var alimento in alimentos) {
        debugPrint(alimento['categoria'].toString());
        if (alimento['categoria'].toString() == 'Café da Manhã') {
          Map<String, dynamic> alimentoAdd = {
            'id': alimento['id'],
            'nome': alimento['nome'].toString(),
            'imagePath': alimento['fotoBytes'],
            'categoria': alimento['categoria'],
            'tipo': alimento['tipo'],
          };
          listaAlimentos.add(alimentoAdd);
          debugPrint(alimentoAdd.toString());
        }
      }
    }
    if (id == 2) {
      for (var alimento in alimentos) {
        debugPrint(alimento['categoria'].toString());
        if (alimento['categoria'].toString() == 'Almoço') {
          Map<String, dynamic> alimentoAdd = {
            'id': alimento['id'],
            'nome': alimento['nome'].toString(),
            'imagePath': alimento['fotoBytes'],
            'categoria': alimento['categoria'],
            'tipo': alimento['tipo'],
          };
          listaAlimentos.add(alimentoAdd);
          debugPrint(alimentoAdd.toString());
        }
      }
    }
    if (id == 3) {
      for (var alimento in alimentos) {
        debugPrint(alimento['categoria'].toString());
        if (alimento['categoria'].toString() == 'Janta') {
          listaAlimentos.add({
            'id': alimento['id'],
            'nome': alimento['nome'].toString(),
            'imagePath': alimento['fotoBytes'],
            'categoria': alimento['categoria'],
            'tipo': alimento['tipo'],
          });
        }
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: colorsOne.colorScheme.primary,
      child: (isLoading!)
          ? const Text('Carregando')
          : Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                (widget.categoriaRefeicao == 1)
                    ? const Text(
                        'Selecione 3 alimentos para o Café da Manhã',
                        style: TextStyle(color: Colors.white),
                      )
                    : (widget.categoriaRefeicao == 2)
                        ? const Text(
                            'Selecione 5 alimentos para o Almoço',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'Selecione 4 alimentos para a Janta',
                            style: TextStyle(color: Colors.white),
                          ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                      itemCount: listaAlimentos.length,
                      itemBuilder: (context, index) {
                        var exemplo = listaAlimentos[index];
                        Image foto = Image.file(
                          File(exemplo['imagePath']),
                          fit: BoxFit.cover,
                        );
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          maxHeight: 90,
                                          maxWidth: 90,
                                          minHeight: 90,
                                          minWidth: 90),
                                      child: ClipOval(child: foto)),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exemplo['nome'],
                                          style:
                                              myTextThemes.textTheme.labelLarge,
                                        ),
                                        Text(
                                            '${exemplo['tipo']}\n${exemplo['categoria']}',
                                            style: myTextThemes
                                                .textTheme.labelSmall)
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        // listaAlimentosSelected.add({
                                        //   'id': exemplo['id'],
                                        //   'nome': exemplo['nome'].toString(),
                                        //   'imagePath': exemplo['fotoBytes'],
                                        //   'categoria': exemplo['categoria'],
                                        //   'tipo': exemplo['tipo'],
                                        // });

                                      },
                                      child: const Text('Adicionar'))
                                ]),
                          ),
                        );
                      }),
                )
              ]),
            ),
    );
  }
}
