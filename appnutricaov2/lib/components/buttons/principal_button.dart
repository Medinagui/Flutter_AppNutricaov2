import 'package:flutter/material.dart';
import '../../themes/theme.dart';

class PrincipalScreenButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Widget screen;

  const PrincipalScreenButton({
    super.key,
    required this.label,
    required this.icon,
    required this.screen
  });

  @override
  Widget build(BuildContext context) {

      navCadastro(Widget toScreen) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => toScreen,
        ),
      );
    }

    return Flexible(
      fit: FlexFit.tight,
      flex: 10,
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        colorsOne.colorScheme.secondary)),
                onPressed: () => {
                  navCadastro(screen)
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: IconButton(
                icon: Icon(icon, size: 75,),
                onPressed: () => navCadastro(screen),
                color: Colors.white,
              ),
            )
          ],
        )
      ]),
    );
  }
}
