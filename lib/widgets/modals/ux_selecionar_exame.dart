import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/exame.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_chip.dart';

import 'package:http/http.dart' as http;

class UxSelecionarExame extends StatelessWidget {
  final OrdemPedido ordemPedido;

  UxSelecionarExame({
    Key key,
    @required this.ordemPedido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repository = new NewsApi();
    List<Exame> _exames = [
      Exame(prefixo: 'glicose', descricao: 'Glicose', isSelected: false),
      Exame(prefixo: 'hemograma', descricao: 'Hemograma', isSelected: false),
      Exame(prefixo: 'gama_gt', descricao: 'Gama GT', isSelected: false),
      Exame(
          prefixo: 'urina_rotina',
          descricao: 'Urina Rotina',
          isSelected: false),
      Exame(
          prefixo: 'acido_urico', descricao: 'Ácido úrico', isSelected: false),
      Exame(
          prefixo: 'colesterol_total',
          descricao: 'Colesterol Total',
          isSelected: false),
      Exame(
          prefixo: 'bilirrubina', descricao: 'Bilirrubina', isSelected: false),
      Exame(prefixo: 'epf', descricao: 'EPF', isSelected: false),
      Exame(prefixo: 'ureia', descricao: 'Ureia', isSelected: false),
      Exame(
          prefixo: 'colesterol_fracoes',
          descricao: 'Colesterol Frações',
          isSelected: false),
      Exame(prefixo: 'tgo_tgp', descricao: 'TGO/TGP', isSelected: false),
      Exame(
          prefixo: 'sangue_oculto',
          descricao: 'Sangue Oculto',
          isSelected: false),
      Exame(prefixo: 'creatina', descricao: 'Creatina', isSelected: false),
      Exame(
          prefixo: 'triglicerides',
          descricao: 'Triglicerides',
          isSelected: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecionar exames',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.blueGrey,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.blueGrey,
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 60, bottom: 30, left: 30, right: 30),
                      child: Wrap(
                        runAlignment: WrapAlignment.spaceEvenly,
                        spacing: 64,
                        runSpacing: 30,
                        children: _exames
                            .map((exame) => UxChip(
                                  textLabel: exame.descricao,
                                  isSelected: exame.isSelected,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    // loadNo
  }
}

class NewsApi {
  String url = "http://localhost:8000/api/exame";

  Future<List> loadNews() async {
    try {
      http.Response response = await http.get(url);

      const JsonDecoder decoder = const JsonDecoder();

      return decoder.convert(response.body);
    } on Exception catch (_) {
      return null;
    }
  }
}
