import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appnutricao/themes/theme.dart';

import '../components/edit forms/alimento_edit.dart';

class EditRecordsScreen extends StatefulWidget {
  EditRecordsScreen(
      {super.key, required this.buttonPressed, required this.idRecord});
  int buttonPressed;
  int idRecord;

  @override
  State<EditRecordsScreen> createState() => _EditRecordsScreenState();
}

bool isLoading = true;

class _EditRecordsScreenState extends State<EditRecordsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      const Text('Edit Usuario'),
      AlimentoRecordEdit(idRecord: widget.idRecord),
      const Text('Edit Cardápio'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(  
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: colorsTwo.colorScheme.secondary,
        title: const Text('Editar', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      backgroundColor: colorsOne.colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Card(
            margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: widgetList[widget.buttonPressed]),
          ))
        ],
      ),
    );
  }
}
