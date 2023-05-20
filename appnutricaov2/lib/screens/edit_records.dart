import 'package:flutter/material.dart';
import 'package:appnutricao/themes/theme.dart';

import '../components/edit forms/alimento_edit.dart';

class EditRecordsScreen extends StatefulWidget {
  EditRecordsScreen(
      {super.key, required this.buttonPressed, required this.alimentoEdit});
  int buttonPressed;
  AlimentoRecordEdit alimentoEdit;

  @override
  State<EditRecordsScreen> createState() => _EditRecordsScreenState(widgetAlimento: alimentoEdit);
}

class _EditRecordsScreenState extends State<EditRecordsScreen> {
  Widget widgetAlimento;
  _EditRecordsScreenState({required this.widgetAlimento});
  @override
  Widget build(BuildContext context) {
  List<Widget?> editForms = [const Text('Teste'), widgetAlimento];

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                child: editForms[widget.buttonPressed]),
          ))
        ],
      ),
    );
  }
}
