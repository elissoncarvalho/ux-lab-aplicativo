import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/models/exame.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_chip.dart';
import 'package:http/http.dart' as http;
import 'package:uxlab/widgets/ux_circular_load.dart';

// Faz a requsição na API
Future<List<Exame>> fetchExame(http.Client client) async {
  final response = await client.get('http://uxlab.eastus.cloudapp.azure.com/api/exame');

  return compute(parseExames, response.body);
}

// Converte a resposta em Lista
List<Exame> parseExames(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Exame>((json) => Exame.fromJson(json)).toList();
}

class UxSelecionarExame extends StatefulWidget {
  final OrdemPedido ordemPedido;

  UxSelecionarExame({
    Key key,
    @required this.ordemPedido,
  }) : super(key: key);

  @override
  _UxSelecionarExame createState() => _UxSelecionarExame();
}

class _UxSelecionarExame extends State<UxSelecionarExame> {
  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder<List<Exame>>(
            future: fetchExame(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _listExames(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return UxCircularLoad();
            },
          )),
    );
  }

  ListView _listExames(AsyncSnapshot<List<Exame>> snapshot) {
    return ListView(
      children: [
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
                    children: snapshot.data
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
    );
  }
}
