import 'package:flutter/material.dart';
import 'package:appnutricao/db/cardapio_database.dart' as db_cardapio;
import 'package:appnutricao/db/alimentos_database.dart' as db_alimentos;
import '../../themes/theme.dart';

class CardapioInfo extends StatefulWidget {
  const CardapioInfo({super.key, required this.idRecord});
  final int idRecord;

  @override
  State<CardapioInfo> createState() => _CardapioInfoState();
}

bool isLoading = true;

class _CardapioInfoState extends State<CardapioInfo> {
  @override
  void initState() {
    super.initState();
    getItem();
    setState(() {
      isLoading = true;
    });
  }

  late Map<String, dynamic> cardapio;
  late List<Map<String, dynamic>> alimentos;
  getItem() async {
    var dataCardapio = await db_cardapio.SQLHelperCard.getItemByID(widget.idRecord);
    setState(() {
      cardapio = dataCardapio[0];
      isLoading = false;
    });
  }

  getAlimentos(){
    List<dynamic> list = cardapio.values.toList();
    list.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? const Center(
            child: Card(
                child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Carregando'),
          )))
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: colorsTwo.colorScheme.secondary,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Cardápio: ${cardapio['name']}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Card(
                color: colorsOne.colorScheme.primary,
                elevation: 5,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Café da Manhã',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Card(
                color: colorsOne.colorScheme.primary,
                elevation: 5,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Almoço',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Card(
                color: colorsOne.colorScheme.primary,
                elevation: 5,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Janta',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
  }
}
