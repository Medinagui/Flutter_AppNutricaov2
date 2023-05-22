import 'dart:async';
import 'dart:io';

import 'package:appnutricao/themes/theme.dart';
import 'package:flutter/material.dart';

class CadastroUpdateScreen extends StatefulWidget {
  const CadastroUpdateScreen({super.key});

  @override
  State<CadastroUpdateScreen> createState() => _CadastroUpdateScreenState();
}

class _CadastroUpdateScreenState extends State<CadastroUpdateScreen> {
  @override
  void initState()
  {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
      var time = const Duration(seconds: 5);
    Timer(time, () {
    Navigator.popAndPushNamed(context, '/cadastro');  
    });
    return Container(
      color: colorsOne.colorScheme.primary,
      child: Card(
        margin: const EdgeInsets.fromLTRB(25, 200, 25, 200),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: colorsTwo.colorScheme.secondary,
                  child: const Icon(Icons.check, size: 70,)),
              ),
              Text('Cadastro Efetuado!', style: myTextThemes.textTheme.displayMedium, textAlign: TextAlign.center,),
              const Text('Retornando a página de cadastro...')
            ]),
          ),
        ),
      ),
    );
  }
}