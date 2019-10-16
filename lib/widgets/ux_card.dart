import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:uxlab/models/exame.dart';

class UxCard extends StatelessWidget {
  final Exame exame;
  final String ambiente;

  UxCard({
    Key key,
    @required this.exame,
    @required this.ambiente
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var status = {
      'concluido': {
        'txt': 'Concluído',
        'color': Colors.green,
      },
      'aguardando_analise': {
        'txt': 'Aguardando Análise',
        'color': Colors.blue,
      },
      'pendente': {
        'txt': 'Pendente',
        'color': Colors.red[300],
      },
    };
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 90,
              child: Column(
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
                          exame.codExame.toString(),
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
                        Text(status[exame.status]['txt'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: status[exame.status]['color'],
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
                          formatDate(exame.dataColeta, [dd,'/',mm,'/',yyyy]),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            
            ),
            Expanded(
              flex: 10,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}