import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../db/alimentos_database.dart';
import '../../themes/theme.dart';
import '../classes/alimento.dart';
import 'imagepicker/image_picker.dart';

class CadastroAlimentoForm extends StatefulWidget {
  const CadastroAlimentoForm({super.key});

  @override
  State<CadastroAlimentoForm> createState() => _CadastroAlimentoFormState();
}

String? categoriaRefeicao;
String? tipoAlimento;
Alimento? alimentoCadastrado;

class _CadastroAlimentoFormState extends State<CadastroAlimentoForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _fotoController = TextEditingController();

    @override
  void initState(){
    super.initState();
  }

  Future<void> createAlimento(String nome,String fotoBytes, String categoria, String tipo) async {
    await SQLHelperAlimentos.createItem(nome, fotoBytes, categoria, tipo);
    debugPrint('cadastrado!');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const MyImagePicker(),
        // TextFormField(
        //   validator: (String? value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Insira o nome da foto';
        //     }
        //     return null;
        //   },
        //   textInputAction: TextInputAction.next,
        //   controller: _fotoController,
        //   decoration: InputDecoration(
        //       hintText: 'Nome da foto',
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(color: colorsTwo.colorScheme.secondary),
        //       )),
        // ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          controller: _nomeController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira o nome do alimento';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: 'Nome do Alimento',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorsTwo.colorScheme.secondary),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  iconSize: 30,
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  hint: const Text('Categoria da Refeição'),
                  value: categoriaRefeicao,
                  items: const [
                    DropdownMenuItem(
                        value: 'Café da Manhã', child: Text('Café da Manhã')),
                    DropdownMenuItem(value: 'Almoço', child: Text('Almoço')),
                    DropdownMenuItem(value: 'Janta', child: Text('Janta')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      categoriaRefeicao = val.toString();
                      // alimentoCadastrado!.categoria = val.toString();
                    });
                  }),
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  iconSize: 30,
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  hint: const Text('Tipo do Alimento'),
                  value: tipoAlimento,
                  items: const [
                    DropdownMenuItem(value: 'Bebida', child: Text('Bebida')),
                    DropdownMenuItem(
                        value: 'Proteína', child: Text('Proteína')),
                    DropdownMenuItem(
                        value: 'Carboidrato', child: Text('Carboidrato')),
                    DropdownMenuItem(value: 'Fruta', child: Text('Fruta')),
                    DropdownMenuItem(value: 'Grão', child: Text('Grão')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      tipoAlimento = val.toString();
                      //AlimentoCadastrado!.tipo = val.toString();
                    });
                  }),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: ()async {
                await createAlimento(_nomeController.text, selectedImage!.path, tipoAlimento!,categoriaRefeicao!);
                setState(() {  
                _nomeController.text = '';
                imageStateHelper = null;
                tipoAlimento = '';
                categoriaRefeicao = '';
                });
                },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      colorsOne.colorScheme.secondary)),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ],
    ));
  }
}
