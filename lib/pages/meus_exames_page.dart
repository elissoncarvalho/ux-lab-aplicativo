import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_card.dart';
import 'package:uxlab/widgets/ux_circular_load.dart';
import 'package:uxlab/widgets/ux_modal.dart';

// Faz a requsição na API
Future<List<OrdemPedido>> fetchOrdemPedido(http.Client client) async {
final response =
      await client.get('http://192.168.1.3:8080/api/ordem_pedido/');
  return parseOrdemPedidos(response.body);
}

// Converte a resposta em Lista
List<OrdemPedido> parseOrdemPedidos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<OrdemPedido>((json) => OrdemPedido.fromJson(json)).toList();
}

class MeusExamesPage extends StatefulWidget {
  MeusExamesPage() : super();

  @override
  _MeusExamesPage createState() => _MeusExamesPage();
}

class _MeusExamesPage extends State<MeusExamesPage> {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrdemPedido>>(
      future: fetchOrdemPedido(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length > 0) {
          List<OrdemPedido> ordemPedidos = [];
          List<OrdemPedido> meusExames = [];
          for (var item in snapshot.data) {
            if (item.status.prefixo == 'aguardando_coleta') {
              ordemPedidos.add(item);
            } else {
              meusExames.add(item);
            }
          }
          return ListView(
            padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
            children: [
              ordemPedidos.length > 0
                  ? _proximosExames(ordemPedidos, context)
                  : Container(),
              meusExames.length > 0
                  ? _meusExames(meusExames, context)
                  : Container(),
            ],
          );
        } else if (snapshot.hasData && snapshot.data.length == 0) {
          return Text('Nenhum pedido Cadastrado');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return UxCircularLoad();
      },
    );
  }

  Widget _proximosExames(List<OrdemPedido> ordemPedidos, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Próximos Exames',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          Column(
              children: ordemPedidos
                  .map((ordemPedido) => UxCard(
                        ordemPedido: ordemPedido,
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  UxModal(
                                    ordemPedido: ordemPedido,
                                  )));
                        },
                      ))
                  .toList()),
        ],
      ),
    );
  }

  Widget _meusExames(List<OrdemPedido> ordemPedidos, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Text(
                'Meus Exames',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        Column(
            children: ordemPedidos
                .map((ordemPedido) => UxCard(
                      ordemPedido: ordemPedido,
                      onPressed: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                UxModal(
                                  ordemPedido: ordemPedido,
                                )));
                      },
                    ))
                .toList()),
      ],
    );
  }
}
