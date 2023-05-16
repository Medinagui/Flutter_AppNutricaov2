import 'dart:convert';
import 'dart:io';

import 'package:appnutricao/screens/consulta.dart';
import 'package:appnutricao/themes/theme.dart';
import 'package:flutter/material.dart';
import '../components/classes/alimento.dart';
import '../db/alimentos_database.dart';

class AlimentosList extends StatefulWidget {
  const AlimentosList({super.key});
  @override
  State<AlimentosList> createState() => _AlimentosListState();
}


class _AlimentosListState extends State<AlimentosList> {
  List<dynamic> listaAlimentos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshAlimentos();
    debugPrint('..numero de items: ${listaAlimentos.length}');
  }

  Future refreshAlimentos() async {
    final data = await SQLHelperAlimentos.getItems();

    setState(() {
      isLoading = false;
      listaAlimentos = data;
    });
  }

  void _deleteItem(int id) async {
    await SQLHelperAlimentos.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item Deletado com sucesso!')));
    refreshAlimentos();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)? Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('CARREGANDO...', style: myTextThemes.textTheme.displayLarge,),
        ],
      ),
    )
    :Column(
      children: [
        //ElevatedButton(onPressed: refreshAlimentos, child: const Text('Atualizar Lista')),
        (listaAlimentos.isEmpty)
            ? const Center(
                child: Text(
                    'Lista vazia.\nVá para a tela de cadastros\ne cadastre novos alimentos.'),
              )
            : Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.69 - 2.2,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listaAlimentos.length,
                          itemBuilder: (context, index) {
                            final exemplo = listaAlimentos[index];

                            Image foto = Image.file(
                              File(exemplo['fotoBytes']),
                              fit: BoxFit.cover,
                            );

                            return Card(
                              margin: const EdgeInsets.all(5),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            maxHeight: 100,
                                            maxWidth: 100,
                                            minHeight: 100,
                                            minWidth: 100),
                                        child:
                                            //Text('fotoBytes: ${exemplo['fotoBytes']},\nID: ${exemplo['id']}}')),
                                            ClipOval(child: foto)),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exemplo['nome'],
                                            style: myTextThemes
                                                .textTheme.labelMedium,
                                          ),
                                          Text(
                                              '${exemplo['tipo']}\n${exemplo['categoria']}',
                                              style: myTextThemes
                                                  .textTheme.labelSmall)
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit)),
                                    //IconButton(onPressed: () => _deleteItem(exemplo['id']), icon: const Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
      ],
    );
  }
}
