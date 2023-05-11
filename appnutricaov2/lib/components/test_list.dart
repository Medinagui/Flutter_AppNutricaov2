import 'dart:io';
import 'package:flutter/material.dart';
import '../components/classes/alimento.dart';
import '../db/alimentos_database.dart';


class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {

  List<Alimento> listaTeste = [];
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    refreshAlimentos();
  }

  Future refreshAlimentos() async {
    setState(() => isLoading = true);

    listaTeste = await AlimentosDatabase.instance.readAllAlimentos();
    
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
                  itemCount: listaTeste.length,
                  itemBuilder: (context, index) {
                  final Alimento exemplo = listaTeste[index];
                  Image foto = Image.file(File(exemplo.pathFoto!));

                  return ListTile(
                    subtitle: Text('${exemplo.tipo} - ${exemplo.categoria}'),
                    title: Text(exemplo.nome),
                    leading: CircleAvatar(backgroundImage: foto as ImageProvider,),
                  );
                }));
  }
}