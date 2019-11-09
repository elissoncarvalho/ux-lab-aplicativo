import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class UxPendenteComprovante extends StatelessWidget {
  final OrdemPedido ordemPedido;
  UxPendenteComprovante({
    Key key,
    @required this.ordemPedido,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cabeçalho
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 85,
                  child: Text(
                    'Detalhes do Pedido',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    flex: 20,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'Status: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'Pendente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 12),
            child: Text(
              'Ordem ${this.ordemPedido.idOrdemPedido} | ${this.ordemPedido.dataOrdemPedidoBr()}',
              style: TextStyle(color: Colors.blueGrey, fontSize: 12),
            ),
          ),
          // Corpo
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendência',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Aguardando liberação do financeiro.',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              ],
            ),
          ),

          // Rodapé
          Container(
            child: UxButtonItem(
              onPressed: () {},
              icon: Icon(Icons.share),
              text: 'COMPARTILHAR',
            ),
          ),
        ],
      ),
    );
  }
}
