import 'package:flutter/material.dart';
import 'package:appnutricao/themes/theme.dart';
import '../components/edit forms/alimento_edit.dart';
import '../components/edit forms/user_edit.dart';
import '../db/alimentos_database.dart';

// ignore: must_be_immutable
class EditRecordsScreen extends StatefulWidget {
  EditRecordsScreen(
      {super.key, required this.buttonPressed, this.alimentoEdit, required this.idRecord, this.userEdit});
  
  int buttonPressed;
  AlimentoRecordEdit? alimentoEdit;
  UserEdit? userEdit;
  int idRecord;

  @override
  State<EditRecordsScreen> createState() => _EditRecordsScreenState();
}

class _EditRecordsScreenState extends State<EditRecordsScreen> {
  @override
  Widget build(BuildContext context) {
  List<Widget?> editForms = [widget.userEdit, widget.alimentoEdit];

    deleteDialog(){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão de item'),
          content: const Text('Você tem certeza que deseja excluir este item?'),
          actions: [
            IconButton(icon: const Icon(Icons.check, color: Colors.green),onPressed: ()async{
                          //se for um alimento:
            if(widget.buttonPressed == 1){
              await SQLHelperAlimentos.deleteItem(widget.idRecord);
            }
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/consulta');
            },),
            IconButton(icon: const Icon(Icons.close, color: Colors.red),onPressed: (){
              Navigator.pop(context);
            },),
          ],
          );
      },);
    }

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
            deleteDialog();
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
                child: editForms[widget.buttonPressed]),
          ))
        ],
      ),
    );
  }
}
