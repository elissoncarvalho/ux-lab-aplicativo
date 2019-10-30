import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:uxlab/models/ordem_pedido.dart';

class UxCard extends StatelessWidget {
  final OrdemPedido ordemPedido;
  final VoidCallback onPressed;

  UxCard({Key key, @required this.ordemPedido, @required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 3,
      child: FlatButton(
        padding: const EdgeInsets.all(10.0),
        onPressed: this.onPressed,
        child: Row(
          children: [
            Expanded(
              flex: 90,
              child: _tipoCard(),
            ),
            Expanded(
              flex: 10,
              child: Icon(
                Icons.add,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _tipoCard() {
    var _status = {
      'concluido': {
        'txt': 'Concluído',
        'color': Colors.green,
      },
      'pendente': {
        'txt': 'Pendente',
        'color': Colors.red[300],
      },
      'aguardando_analise': {
        'txt': 'Aguardando Análise',
        'color': Colors.blue,
      },
      'aguardando_coleta': {
        'txt': 'Aguardando Coleta',
        'color': Colors.blue,
      },
    };

    if (this.ordemPedido.status == 'aguardando_coleta') {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: <Widget>[
                Text(
                  'Ordem: ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  ordemPedido.idOrdemPedido.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: <Widget>[
                Text(
                  'Data: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  _verificaData(ordemPedido.dataColeta),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Text(
                  'Preparo: ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  ordemPedido.preparoExame ? 'Sim' : 'Não',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: <Widget>[
                Text(
                  'Pedido de Exame: ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  ordemPedido.idPedidoExame.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
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
                  _status[ordemPedido.status]['txt'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _status[ordemPedido.status]['color'],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Text(
                  'Data da Coleta: ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  _verificaData(ordemPedido.dataColeta),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  String _verificaData(DateTime dataColeta) {
    try {
      return formatDate(dataColeta, [dd, '/', mm, '/', yyyy]);
    } catch (e) {
      return '';
    }
  }
}
