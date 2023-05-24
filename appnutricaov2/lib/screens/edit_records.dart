import 'package:flutter/material.dart';
import 'package:appnutricao/themes/theme.dart';
import '../components/edit forms/alimento_edit.dart';
import 'package:appnutricao/db/alimentos_database.dart';

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
    
    // userDelete(){
    //   Navigator.pop(context);
    // }
    // alimentoDelete(){
    //   Navigator.pop(context);
    // }
    // cardapioDelete(){
    //   Navigator.pop(context);
    // }

    // List typeDelete = [
    //   userDelete(),
    //   alimentoDelete(),
    //   cardapioDelete(),
    // ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(  
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/consulta');
          },
        ),
        actions: [
          IconButton(onPressed: ()async{
            if(widget.buttonPressed == 1){
              await SQLHelperAlimentos.deleteItem(widget.idRecord);
            }
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/consulta');
          }, icon:const Icon(Icons.delete, color: Colors.red, size: 30,)),
          const SizedBox(width: 10)
        ],
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
