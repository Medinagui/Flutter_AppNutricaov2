import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class CadastroAlimentoButton extends StatelessWidget {  
  const CadastroAlimentoButton({super.key, required this.cadastro});

  final Future<dynamic> cadastro;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => cadastro,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(colorsOne.colorScheme.secondary)),
          child: const Text('Cadastrar'),
        ),
      ],
    );
  }
}
