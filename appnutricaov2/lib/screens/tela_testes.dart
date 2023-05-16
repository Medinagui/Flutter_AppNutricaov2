import 'package:appnutricao/screens/tela_testes2.dart';
import 'package:flutter/material.dart';
import '../components/forms/cadastro_alimento_form.dart';
import '../themes/theme.dart';
import 'package:appnutricao/db/alimentos_database.dart';

class TestesScreen extends StatefulWidget {
  const TestesScreen({super.key});

  @override
  State<TestesScreen> createState() => _TestesScreenState();
}

class _TestesScreenState extends State<TestesScreen> {
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TestesScreen2(),
                          ),
                        );
                      },
                      child: const Text('Lista')),
                  // ElevatedButton(
                  //     onPressed: () => SQLHelperAlimentos.dropDB(),
                  //     child: const Text('DROP DB'))
                ]),
          ),
        ),
      ),
      backgroundColor: colorsOne.colorScheme.primary,
    );
  }
}
