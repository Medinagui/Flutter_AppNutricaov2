import 'package:flutter/material.dart';

import '../screens/cadastro_user_login.dart';
import '../screens/tela_principal.dart';
import '../themes/theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
            fit: FlexFit.tight,
            flex: 20,
            child: SizedBox(
              height: 5,
              child: Center(
                  child: ClipOval(child: Image.asset('lib/images/Nature - logo.jpg',))),
            )
            ),
            const SizedBox(height: 20,),
        // FORMULÁRIO
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              strokeAlign: BorderSide.strokeAlignOutside),
                        )),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira o seu email';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Senha',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              strokeAlign: BorderSide.strokeAlignOutside),
                        )),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Insira sua senha';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                                            TextButton(
                          style: buttonsTheme.textButtonTheme.style,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroUserLogin(),
                              ),
                            );
                          },
                          child: const Text('Cadastrar')),
                      ElevatedButton(
                          style: buttonsTheme.elevatedButtonTheme.style,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) =>
                                    const TelaPrincipal(),
                              ));
                            }
                          },
                          child: const Text('Entrar')),
                    ],
                  )
                ],
              ),
            )),
        const Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: SizedBox(
              height: 5,
            )),
      ],
    );
  }
}
