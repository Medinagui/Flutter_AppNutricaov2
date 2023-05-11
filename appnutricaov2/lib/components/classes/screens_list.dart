import 'package:flutter/material.dart';

import '../../screens/cadastro.dart';
import '../../screens/cadastro_user_login.dart';
import '../../screens/creditos.dart';
import '../../screens/login.dart';
import '../../screens/tela_principal.dart';

List<Widget> screenList = const[
  // 0
  LoginScreen(),
  // 1
  CadastroUserLogin(),
  // 2
  TelaPrincipal(),
  // 3
  CreditosScreen(),
  // 4 
  CadastroScreen()
];