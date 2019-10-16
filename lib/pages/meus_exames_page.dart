import 'package:flutter/material.dart';
import 'package:uxlab/models/exame.dart';
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
                  ambiente: 'teste',
                  exame: Exame(
                    idExame: 12,
                    codExame: 2019,
                    status: 'aguardando_analise',
                    dataColeta: DateTime.parse('2019-10-15'),
                  ),
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
                ambiente: 'teste',
                exame: Exame(
                  idExame: 12,
                  codExame: 2019,
                  status: 'aguardando_analise',
                  dataColeta: DateTime.parse('2019-10-15'),
                ),
              ),
              UxCard(
                ambiente: 'teste',
                exame: Exame(
                  idExame: 11,
                  codExame: 3892,
                  status: 'concluido',
                  dataColeta: DateTime.parse('2019-09-12'),
                ),
              ),
              UxCard(
                ambiente: 'teste',
                exame: Exame(
                  idExame: 11,
                  codExame: 3892,
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