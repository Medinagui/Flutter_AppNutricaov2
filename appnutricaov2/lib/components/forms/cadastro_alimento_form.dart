import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import '../../db/alimentos_database.dart';
import '../../themes/theme.dart';
import '../classes/alimento.dart';
import 'imagepicker/image_picker.dart';
import '../mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      categoriaRefeicao = null;
      tipoAlimento = null;
    });
  }

  Future<String> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('TESTE TESTE TESTE TESTE PDF PDF PDF PDF',
        PdfStandardFont(PdfFontFamily.helvetica, 30));
    page.graphics.drawImage(
        PdfBitmap(await _readImageData('images/Nature - logo.jpg')),
        const Rect.fromLTWH(0, 100, 440, 550));

    List<int> bytes = document.save();
    document.dispose();

    var caminho = saveFile(bytes, 'Alimento - ${DateTime.now()}');
    return caminho;
  }

  Future<Uint8List> _readImageData(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> createAlimento(String nome, String fotoBytes, String categoria,
      String tipo, String pdfPath) async {
    await SQLHelperAlimentos.createItem(Alimento(
        nome: nome,
        fotoBytes: fotoBytes,
        categoria: categoria,
        tipo: tipo,
        pdfPath: pdfPath));
    debugPrint('cadastrado!');
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
                    borderSide:
                        BorderSide(color: colorsTwo.colorScheme.secondary),
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
                            value: 'Café da Manhã',
                            child: Text('Café da Manhã')),
                        DropdownMenuItem(
                            value: 'Almoço', child: Text('Almoço')),
                        DropdownMenuItem(value: 'Janta', child: Text('Janta')),
                      ],
                      onChanged: (val) {
                        setState(() {
                          categoriaRefeicao = val.toString();
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
                        DropdownMenuItem(
                            value: 'Bebida', child: Text('Bebida')),
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
                        });
                      }),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (selectedImage == null ||
                        categoriaRefeicao == null ||
                        tipoAlimento == null) {
                      _formKey.currentState!.validate();
                      String imageNull = 'Insira uma imagem\n';
                      String categoriaNull =
                          'Selecione a Categoria da Refeição\n';
                      String tipoNull = 'Selecione o Tipo de Alimento\n';
                      String? mensagem = '';
                      if (selectedImage == null) {
                        setState(() {
                          mensagem = '$mensagem$imageNull';
                        });
                      }
                      if (categoriaRefeicao == null) {
                        setState(() {
                          mensagem = '$mensagem$categoriaNull';
                        });
                      }
                      if (tipoAlimento == null) {
                        setState(() {
                          mensagem = '$mensagem$tipoNull';
                        });
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(mensagem!)));
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      var caminhoPdf = _createPDF;
                      createAlimento(_nomeController.text, selectedImage!.path,
                          categoriaRefeicao!, tipoAlimento!, caminhoPdf.toString());
                      Navigator.pushReplacementNamed(
                          context, '/cadastroUpdated',
                          arguments: 'consulta');
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
            ),
          ],
        ));
  }
}
