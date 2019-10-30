import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_button_item.dart';
import 'package:uxlab/widgets/ux_card.dart';
import 'package:uxlab/widgets/ux_modal.dart';

class MeusExamesPage extends StatelessWidget {
  MeusExamesPage() : super();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      listaExames(context),
      // opemModal(context),
    ]);
  }

  ListView listaExames(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
      children: [
        Padding(
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
              UxCard(
                ordemPedido: OrdemPedido(
                    idOrdemPedido: 20190004,
                    status: 'aguardando_coleta',
                    dataColeta: DateTime.parse('2019-10-20'),
                    preparoExame: false),
                onPressed: () {},
              ),
              UxCard(
                ordemPedido: OrdemPedido(
                    idOrdemPedido: 20190004,
                    status: 'aguardando_coleta',
                    dataColeta: DateTime.parse('2019-10-20'),
                    preparoExame: true),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => UxModal()));
                },
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
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
            UxCard(
              ordemPedido: OrdemPedido(
                  idOrdemPedido: 0003,
                  idPedidoExame: 20190620,
                  status: 'aguardando_analise',
                  dataColeta: DateTime.parse('2019-10-15')),
              onPressed: () {},
            ),
            UxCard(
              ordemPedido: OrdemPedido(
                  idOrdemPedido: 0003,
                  idPedidoExame: 20190620,
                  status: 'pendente',
                  dataColeta: DateTime.parse('2019-10-15')),
              onPressed: () {},
            ),
            UxCard(
              ordemPedido: OrdemPedido(
                  idOrdemPedido: 0003,
                  idPedidoExame: 20190620,
                  status: 'concluido',
                  dataColeta: DateTime.parse('2019-10-15')),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
