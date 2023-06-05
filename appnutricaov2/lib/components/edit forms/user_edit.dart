import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({super.key, required this.idRecord});
  final int idRecord;

  @override
  State<UserEdit> createState() => _UserEditState();
}

bool isLoading = true;

class _UserEditState extends State<UserEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CARREGANDO...',
                  style: myTextThemes.textTheme.displayLarge,
                ),
              ],
            ),
          )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Fotos, email e data de nascimento não são editáveis.'),
              
            ],
          );
          }
}