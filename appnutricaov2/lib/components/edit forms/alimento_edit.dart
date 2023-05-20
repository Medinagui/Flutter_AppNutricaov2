import 'package:flutter/material.dart';
import 'package:appnutricao/db/alimentos_database.dart' as db;

class AlimentoRecordEdit extends StatefulWidget {
  AlimentoRecordEdit({super.key, required this.idRecord});
  int idRecord;

  @override
  State<AlimentoRecordEdit> createState() => _AlimentoRecordEditState();
}

class _AlimentoRecordEditState extends State<AlimentoRecordEdit> {

  @override
    void initState() {
    super.initState();
    getItem();
  }
  List<dynamic>? item;
  getItem() async {
    final data = await db.SQLHelperAlimentos.getItemByID(widget.idRecord);
    setState(()  {
    item = data;
    });
  }
  @override
  Widget build(BuildContext context) {  
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(item![0]['nome']),
          Text(item![0]['tipo']),
          Text(item![0]['categoria']),
          ]);
  }
}
