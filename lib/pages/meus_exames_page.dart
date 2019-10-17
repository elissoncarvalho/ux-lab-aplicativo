import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_card.dart';

class MeusExamesPage extends StatelessWidget {
  MeusExamesPage() : super();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Próximos Exames',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              UxCard(
                ordemPedido: OrdemPedido(
                    idOrdemPedido: 20190004,
                    status: 'aguardando_coleta',
                    dataColeta: DateTime.parse('2019-10-20'),
                    preparoExame: false),
              ),
              UxCard(
                ordemPedido: OrdemPedido(
                    idOrdemPedido: 20190004,
                    status: 'aguardando_coleta',
                    dataColeta: DateTime.parse('2019-10-20'),
                    preparoExame: false),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Meus Exames',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            UxCard(
              ordemPedido: OrdemPedido(
                idOrdemPedido: 0003,
                idPedidoExame: 20190620,
                status: 'aguardando_analise',
                dataColeta: DateTime.parse('2019-10-15'),
              ),
            ),
            UxCard(
              ordemPedido: OrdemPedido(
                idOrdemPedido: 0002,
                idPedidoExame: 20190513,
                status: 'concluido',
                dataColeta: DateTime.parse('2019-09-12'),
              ),
            ),
            UxCard(
              ordemPedido: OrdemPedido(
                idOrdemPedido: 0001,
                idPedidoExame: 20190501,
                status: 'pendente',
                dataColeta: DateTime.parse('2019-09-12'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
