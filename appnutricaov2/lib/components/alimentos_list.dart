import 'dart:io';
import 'package:appnutricao/themes/theme.dart';
import 'package:flutter/material.dart';
import '../components/classes/alimento.dart';
import '../db/alimentos_database.dart';


class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {

  List<dynamic> listaAlimentos = [
    Alimento(nome: 'teste 1', categoria: 'Categoria 1', tipo: 'tipo 1', pathFoto: 'lib/images/Nature - logo.jpg'),
    Alimento(nome: 'teste 2', categoria: 'Categoria 2', tipo: 'tipo 2', pathFoto: 'lib/images/Nature - logo.jpg'),
    Alimento(nome: 'teste 3', categoria: 'Categoria 3', tipo: 'tipo 3', pathFoto: 'lib/images/Nature - logo.jpg'),
    Alimento(nome: 'teste 4', categoria: 'Categoria 4', tipo: 'tipo 4', pathFoto: 'lib/images/Nature - logo.jpg'),
    Alimento(nome: 'teste 5', categoria: 'Categoria 5', tipo: 'tipo 5', pathFoto: 'lib/images/Nature - logo.jpg'),
    Alimento(nome: 'teste 6', categoria: 'Categoria 6', tipo: 'tipo 6', pathFoto: 'lib/images/Nature - logo.jpg')
    ];
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    refreshAlimentos();
  }

  Future refreshAlimentos() async {
    setState(() => isLoading = true);

    // listaTeste = await AlimentosDatabase.instance.readAllAlimentos();
    
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
                  itemCount: listaAlimentos.length,
                  itemBuilder: (context, index) {
                  final Alimento exemplo = listaAlimentos[index];
                  Image foto = Image.asset(exemplo.pathFoto!);

                  return Card(
                    margin: const EdgeInsets.all(5),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 100,
                              maxWidth: 100,
                              minHeight: 100,
                              minWidth: 100
                            ),
                            child: ClipOval(child: foto)),
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(exemplo.nome, style: myTextThemes.textTheme.labelMedium,),
                            Text('${exemplo.tipo} - ${exemplo.categoria}', style: myTextThemes.textTheme.labelSmall)
                            ],),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                        ],
                      ),
                    ),
                  );
                }));
  }
}