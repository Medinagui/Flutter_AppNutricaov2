import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appnutricao/db/alimentos_database.dart' as db_alimentos;
import '../../themes/theme.dart';

class CadastroCardapioForm extends StatefulWidget {
  CadastroCardapioForm(
      {super.key,
      required this.alimentosCafe,
      required this.alimentosAlmoco,
      required this.alimentosJanta});
  List<DropdownMenuItem> alimentosCafe;
  List<DropdownMenuItem> alimentosAlmoco;
  List<DropdownMenuItem> alimentosJanta;

  @override
  State<CadastroCardapioForm> createState() => _CadastroCardapioFormState();
}

// bool isLoading = true;
String? categoriaRefeicao;
String? cafe1;

class _CadastroCardapioFormState extends State<CadastroCardapioForm> {
  @override
  void initState() {
    super.initState();
    setState(() {
      // isLoading = true;
      categoriaRefeicao = null;
      cafe1 = null;
      //debugPrint(cafe1.toString());
    });
    // getAlimentos();
  }

  // Future getAlimentos() async {
  //   var data = await db_alimentos.SQLHelperAlimentos.getItems();
  //   if (widget.alimentosCafe.isEmpty &&
  //       widget.alimentosAlmoco.isEmpty &&
  //       widget.alimentosJanta.isEmpty) {
  //     for (var alimento in data) {
  //       DropdownMenuItem dropDown = DropdownMenuItem(
  //           value: alimento['id'], child: Text(alimento['nome']));
  //       if (alimento['categoria'].toString() == 'Café da Manhã') {
  //         widget.alimentosCafe.add(dropDown);
  //       } else if (alimento['categoria'].toString() == 'Almoço') {
  //         widget.alimentosAlmoco.add(dropDown);
  //       }
  //       if (alimento['categoria'].toString() == 'Janta') {
  //         widget.alimentosJanta.add(dropDown);
  //       }
  //     }
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return // (isLoading)
    //     ? const Text('Carregando...')
    //     : 
            Form(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Você está cadastrando um cardápio \npara o usuário seu usuário.\nCaso queira cadastrar para outro usuário, \nfaça o login com o usuário que deseja cadastrar.',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            hint: const Text('1º Alimento'),
                            value: cafe1,
                            items: widget.alimentosCafe,
                            onChanged: (val) {
                              setState(() {
                                cafe1 = val.toString();
                                debugPrint(cafe1.toString());
                              });
                            }),
                      ),
                    ),
                  )
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/cadastroUpdated',
                          arguments: 'consulta');
                    },
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
