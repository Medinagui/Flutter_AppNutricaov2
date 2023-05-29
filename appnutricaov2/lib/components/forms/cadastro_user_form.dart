import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes/theme.dart';
import 'imagepicker/image_picker.dart';

class CadastroUserForm extends StatefulWidget {
  const CadastroUserForm({super.key});

  @override
  State<CadastroUserForm> createState() => _CadastroUserFormState();
}

class _CadastroUserFormState extends State<CadastroUserForm> {
  DateTime dataSelecionada = DateTime.now();

  

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const MyImagePicker(),
        const SizedBox(height: 15,),
        TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira o seu nome';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: 'Nome',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorsTwo.colorScheme.secondary),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira o seu email';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorsTwo.colorScheme.secondary),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Insira a sua senha';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: 'Senha',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorsTwo.colorScheme.secondary),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Data Selecionada:\n\n${DateFormat('dd/MM/yyyy').format(dataSelecionada)}',
              textAlign: TextAlign.center,
            ),
            TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1930),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: colorsTwo.colorScheme,
                          ),
                          child: child!,
                        );
                      });
                      if (newDate == null) return;

                      setState(() => dataSelecionada = newDate);
                },
                child: Text('Selecione a data',
                    style: TextStyle(
                        color: colorsTwo.colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(colorsOne.colorScheme.secondary)),
              child: const Text('Cadastrar'),
            ),
          ],
        )
      ],
    ));
  }
}
