import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appnutricao/db/users_database.dart';
import '../../themes/theme.dart';
import 'imagepicker/image_picker.dart';

class CadastroUserForm extends StatefulWidget {
  const CadastroUserForm({super.key});

  @override
  State<CadastroUserForm> createState() => _CadastroUserFormState();
}

class _CadastroUserFormState extends State<CadastroUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime dataSelecionada = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> createUser(String name, String email, String password,
      String imagePath, int birthDateD, int birthDateM, int birthDateA) async {
    await SQLHelperUsers.createItem(
        name, email, password, imagePath, birthDateD, birthDateM, birthDateA);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const MyImagePicker(),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _nameController,
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
                    borderSide:
                        BorderSide(color: colorsTwo.colorScheme.secondary),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Insira o seu email';
                } else if (!value.contains('@')) {
                  return 'Insira um email valido';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorsTwo.colorScheme.secondary),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
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
                    borderSide:
                        BorderSide(color: colorsTwo.colorScheme.secondary),
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
                  onPressed: () {
                    final String dataString = DateFormat('dd/MM/yyyy').format(dataSelecionada).toString();
                    final int dia = int.parse(dataString.substring(0, 2));
                    final int mes = int.parse(dataString.substring(3, 5));
                    final int ano = int.parse(dataString.substring(6, 10));
                    if (selectedImage == null) {
                      _formKey.currentState!.validate();
                      String imageNull = 'Insira uma imagem\n';
                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(imageNull)));
                        return;
                      }
                    }
                    if (_formKey.currentState!.validate()) {
                      createUser(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          selectedImage!.path,
                          dia, mes, ano);
                      Navigator.pushReplacementNamed(
                          context, '/cadastroUpdated');
                      setState(() {
                        selectedImage = null;
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          colorsOne.colorScheme.secondary)),
                  child: const Text('Cadastrar'),
                ),
              ],
            )
          ],
        ));
  }
}
