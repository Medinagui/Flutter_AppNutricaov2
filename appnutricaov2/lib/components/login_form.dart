import 'package:flutter/material.dart';
import '../screens/cadastro_user_login.dart';
import '../screens/tela_principal.dart';
import '../themes/theme.dart';
import 'package:appnutricao/db/users_database.dart' as db;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<int> myHashList = [];

  @override
  void initState() {
    super.initState();
    getHashs();
  }

  Future<void> getHashs() async {
    List<Map<String, dynamic>> items = await db.SQLHelperUsers.getItems();
    for(var item in items){
      myHashList.add(item['hashCode']);
    }
  } 

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                    controller: emailController,
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
                    controller: passwordController,
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
                              String email = emailController.text;
                              String password= passwordController.text;
                              var loginHash = email.hashCode * password.hashCode;
                              if(myHashList.contains(loginHash)){
                                  Navigator.of(context)
                                  .push(MaterialPageRoute(
                                builder: (context) =>
                                    const TelaPrincipal(),
                              ));
                              } else
                              {
                                SnackBar snackbar = const SnackBar(content: Text('Usuário não encontrado. Tente Novamente.'),);
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                              
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


