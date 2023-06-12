import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:appnutricao/components/classes/cardapio.dart';
import 'package:appnutricao/db/cardapio_database.dart';
import 'package:share/share.dart';
import 'package:appnutricao/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../db/alimentos_database.dart';
import '../mobile.dart';

class ShareCardapioList extends StatefulWidget {
  const ShareCardapioList({super.key});
  @override
  State<ShareCardapioList> createState() => _ShareCardapioListState();
}

List<dynamic> listaCardapio = [];
bool isLoading = true;

class _ShareCardapioListState extends State<ShareCardapioList> {
  @override
  void initState() {
    super.initState();
    refreshCardapio();

    debugPrint('..numero de items: ${listaCardapio.length}');
  }

  Future refreshCardapio() async {
    final data = await SQLHelperAlimentos.getItems();

    setState(() {
      isLoading = false;
      listaCardapio = data;
    });
  }

  Future<void> _createPDF(int id) async {
    List<String> alimentosDesc = [];
    var dataCardapio = await SQLHelperCard.getItemByID(id);
    var cardapioAnalise = Cardapio.fromJson(dataCardapio[0]);
    var idsCardapio = dataCardapio[0].values.toList();
    idsCardapio.removeAt(0);
    idsCardapio.removeAt(0);

    for (var index in idsCardapio) {
      List<Map<String, dynamic>> dataAlimentos =
          await SQLHelperAlimentos.getItemByID(index);
      Map<String, dynamic> alimentoAnalise = dataAlimentos[0];
      String descAlimento = '''
      Nome do Alimento: ${alimentoAnalise['nome']}
      Tipo: ${alimentoAnalise['tipo']}
      ''';
      alimentosDesc.add(descAlimento);
    }

    PdfDocument document = PdfDocument();
    var page = document.pages.add();
    // Título - Nome do Cardápio
    page.graphics.drawString('Nome do Cardápio: ${cardapioAnalise.name},\n',
        PdfStandardFont(PdfFontFamily.helvetica, 40));
    // Café da manhã
    page.graphics.drawString(
        'Café da Manhã\n', PdfStandardFont(PdfFontFamily.helvetica, 30));
    page.graphics.drawString('''
    ${alimentosDesc[0]}\n
    ${alimentosDesc[1]}\n
    ${alimentosDesc[2]}\n
    ''', PdfStandardFont(PdfFontFamily.helvetica, 20));
    page.graphics.drawString(
        'Almoço\n', PdfStandardFont(PdfFontFamily.helvetica, 30));
    page.graphics.drawString('''
    ${alimentosDesc[3]}\n
    ${alimentosDesc[4]}\n
    ${alimentosDesc[5]}\n
    ${alimentosDesc[6]}\n
    ${alimentosDesc[7]}\n
    ''', PdfStandardFont(PdfFontFamily.helvetica, 20));
    page.graphics.drawString(
        'Janta\n', PdfStandardFont(PdfFontFamily.helvetica, 30));
    page.graphics.drawString('''
    ${alimentosDesc[8]}\n
    ${alimentosDesc[9]}\n
    ${alimentosDesc[10]}\n
    ${alimentosDesc[11]}\n
    ''', PdfStandardFont(PdfFontFamily.helvetica, 20));

    List<int> bytes = document.save();
    document.dispose();

    String pathString = 'Cardápio - ${DateTime.now().hashCode}.pdf';
    var caminho = await saveFile(bytes, pathString);

    Share.shareFiles([caminho], text: 'Veja esse Cardápio!');
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
            children: [
              (listaCardapio.isEmpty)
                  ? Center(
                      child: Column(
                        children: const [
                          SizedBox(height: 80),
                          Text(
                            'Lista vazia.\nVá para a tela de cadastros\ne cadastre novos alimentos.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.70),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: listaCardapio.length,
                                itemBuilder: (context, index) {
                                  final exemplo = listaCardapio[index];

                                  Image foto = Image.file(
                                    File(exemplo['fotoBytes']),
                                    fit: BoxFit.cover,
                                  );

                                  return Card(
                                    margin: const EdgeInsets.all(5),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 100,
                                                  maxWidth: 100,
                                                  minHeight: 100,
                                                  minWidth: 100),
                                              child: ClipOval(child: foto)),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  exemplo['nome'],
                                                  style: myTextThemes
                                                      .textTheme.labelLarge,
                                                ),
                                                Text(
                                                    '${exemplo['tipo']}\n${exemplo['categoria']}',
                                                    style: myTextThemes
                                                        .textTheme.labelSmall)
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Share.shareFiles([
                                                  exemplo['pdfPath']
                                                ], text: 'Veja esse Alimento!');
                                              },
                                              icon: const Icon(Icons.share)),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                      ],
                    ),
            ],
          );
  }
}
