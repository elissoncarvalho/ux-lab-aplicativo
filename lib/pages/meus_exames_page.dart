import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/empresa.dart';
import 'package:uxlab/models/endereco.dart';
import 'package:uxlab/models/exame.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_card.dart';
import 'package:uxlab/widgets/ux_modal.dart';

class MeusExamesPage extends StatelessWidget {
  MeusExamesPage() : super();
  @override
  Widget build(BuildContext context) {
    List<OrdemPedido> ordemPedidos = [
      OrdemPedido(
          idOrdemPedido: 20190004,
          status: 'aguardando_coleta',
          dataColeta: DateTime.parse('2019-10-20'),
          dataOrdemPedido: DateTime.parse('2019-10-10'),
          cliente: Cliente(
            nome: 'Luísa Braga Santos',
            cpf: '12312312332',
          ),
          empresa: Empresa(
              nome: 'BioLab Análises Clínica',
              telefone: '3732811234',
              endereco: Endereco(
                  bairro: 'Centro',
                  cidade: 'Bom Despacho',
                  numero: 1002,
                  endereco: 'Av.Tiradentes')),
          exames: [
            Exame(descricao: 'Hemograma'),
            Exame(descricao: 'Urina Rotina'),
            Exame(descricao: 'EPF'),
          ],
          preparoExame: true),
      OrdemPedido(
          idOrdemPedido: 20190004,
          status: 'aguardando_coleta',
          dataColeta: DateTime.parse('2019-10-15'),
          dataOrdemPedido: DateTime.parse('2019-10-10'),
          cliente: Cliente(
            nome: 'Luísa Braga Santos',
            cpf: '12312312332',
          ),
          empresa: Empresa(
              nome: 'BioLab Análises Clínica',
              telefone: '3732811234',
              endereco: Endereco(
                  bairro: 'Centro',
                  cidade: 'Bom Despacho',
                  numero: 1002,
                  endereco: 'Av.Tiradentes')),
          exames: [
            Exame(descricao: 'Urina Rotina'),
            Exame(descricao: 'EPF'),
          ],
          preparoExame: false),
    ];
    List<OrdemPedido> meusExames = [
      OrdemPedido(
          idOrdemPedido: 0002,
          idPedidoExame: 20190620,
          status: 'aguardando_analise',
          dataColeta: DateTime.parse('2019-10-15'),
          dataOrdemPedido: DateTime.parse('2019-10-10'),
          cliente: Cliente(
            nome: 'Luísa Braga Santos',
            cpf: '12312312332',
          ),
          empresa: Empresa(
              nome: 'BioLab Análises Clínica',
              telefone: '3732811234',
              endereco: Endereco(
                  bairro: 'Centro',
                  cidade: 'Bom Despacho',
                  numero: 1002,
                  endereco: 'Av.Tiradentes')),
          exames: [
            Exame(descricao: 'Hemograma'),
            Exame(descricao: 'Urina Rotina'),
            Exame(descricao: 'EPF'),
          ],
          preparoExame: true),
      OrdemPedido(
          idOrdemPedido: 0003,
          idPedidoExame: 20190620,
          status: 'pendente',
          dataColeta: DateTime.parse('2019-10-15'),
          dataOrdemPedido: DateTime.parse('2019-10-10'),
          cliente: Cliente(
            nome: 'Luísa Braga Santos',
            cpf: '12312312332',
          ),
          empresa: Empresa(
              nome: 'BioLab Análises Clínica',
              telefone: '3732811234',
              endereco: Endereco(
                  bairro: 'Centro',
                  cidade: 'Bom Despacho',
                  numero: 1002,
                  endereco: 'Av.Tiradentes')),
          exames: [
            Exame(descricao: 'Hemograma'),
            Exame(descricao: 'Urina Rotina'),
            Exame(descricao: 'EPF'),
          ],
          preparoExame: true),
      OrdemPedido(
          idOrdemPedido: 0003,
          idPedidoExame: 20190620,
          status: 'concluido',
          dataColeta: DateTime.parse('2019-10-15'),
          dataOrdemPedido: DateTime.parse('2019-10-10'),
          cliente: Cliente(
            nome: 'Luísa Braga Santos',
            cpf: '12312312332',
          ),
          empresa: Empresa(
              nome: 'BioLab Análises Clínica',
              telefone: '3732811234',
              endereco: Endereco(
                  bairro: 'Centro',
                  cidade: 'Bom Despacho',
                  numero: 1002,
                  endereco: 'Av.Tiradentes')),
          exames: [
            Exame(descricao: 'Hemograma'),
            Exame(descricao: 'Urina Rotina'),
            Exame(descricao: 'EPF'),
          ],
          preparoExame: true),
    ];
    return ListView(
      padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
      children: [
        ordemPedidos.length > 0
            ? _proximosExames(ordemPedidos, context)
            : Container(),
        meusExames.length > 0 ? _meusExames(meusExames, context) : Container(),
      ],
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
