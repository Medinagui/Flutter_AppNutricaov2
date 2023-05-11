import 'dart:io';

import 'package:flutter/material.dart';
import '../components/classes/alimento.dart';
import 'dart:async';

import '../components/forms/cadastro_alimento_form.dart';
import '../db/alimentos_database.dart';
import '../themes/theme.dart';

class TestesScreen extends StatefulWidget {
  const TestesScreen({super.key});

  @override
  State<TestesScreen> createState() => _TestesScreenState();
}

class _TestesScreenState extends State<TestesScreen> {

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Cadastro', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: ConstrainedBox(
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
                  const CadastroAlimentoForm(),
                  Expanded(child: ListView.builder(
                  itemCount: listaTeste.length,
                  itemBuilder: (context, index) {
                  final Alimento exemplo = listaTeste[index];
                  Image foto = Image.file(File(exemplo.pathFoto!));

                  return ListTile(
                    subtitle: Text('${exemplo.tipo} - ${exemplo.categoria}'),
                    title: Text(exemplo.nome),
                    leading: CircleAvatar(backgroundImage: foto as ImageProvider,),
                  );
                }))
                ]),
          ),
        ),
      ),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
