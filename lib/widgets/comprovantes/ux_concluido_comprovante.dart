import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class UxConcluidoComprovante extends StatelessWidget {
  final OrdemPedido ordemPedido;
  UxConcluidoComprovante({
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
                'Concluído',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
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
                  'Pedido de Exame',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  this.ordemPedido.idPedidoExame.toString(),
                  style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1.5, color: Colors.blue),
                image: DecorationImage(
                    image: AssetImage('assets/images/relatorio.png'),
                    fit: BoxFit.cover)),
            child: FlatButton(
              color: Colors.blue[50].withOpacity(0.5),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.picture_as_pdf,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'VISUALIZAR',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Rodapé
          Container(
            child: UxButtonItem(
              onPressed: () {},
              icon: Icon(Icons.mail),
              text: 'ENVIAR POR E-MAIL',
            ),
          ),
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
