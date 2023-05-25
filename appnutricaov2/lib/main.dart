import 'package:appnutricao/screens/cadastro.dart';
import 'package:appnutricao/screens/cadastro_created.dart';
import 'package:appnutricao/screens/consulta.dart';
import 'package:appnutricao/screens/edit_records.dart';
import 'package:appnutricao/screens/tela_principal.dart';
import 'package:appnutricao/screens/tela_testes.dart';
import 'package:appnutricao/screens/tela_testes2.dart';
import 'package:flutter/material.dart';




void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized;  
  runApp(const NutricaoApp());
}

class NutricaoApp extends StatefulWidget {
  const NutricaoApp({super.key});

  @override
  State<NutricaoApp> createState() => _NutricaoAppState();
}

class _NutricaoAppState extends State<NutricaoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaPrincipal(),
      routes: {
        '/consulta' : (context) => const ConsultaScreen(),
        '/telaprincipal' : (context) => const TelaPrincipal(),
        '/cadastro' : (context) => const CadastroScreen(),
        '/cadastroUpdated' : (context) => const CadastroCreatedScreen()
      },
    );
  }
} 