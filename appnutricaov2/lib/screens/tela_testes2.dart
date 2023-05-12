
import 'package:flutter/material.dart';
import '../components/alimentos_list.dart';
import '../themes/theme.dart';

class TestesScreen2 extends StatefulWidget {
  const TestesScreen2({super.key});

  @override
  State<TestesScreen2> createState() => _TestesScreen2State();
}

class _TestesScreen2State extends State<TestesScreen2> {

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
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: TestList()
          ),
        ),
      ),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
