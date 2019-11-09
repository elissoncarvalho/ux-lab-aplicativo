import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class UxAguardandoAnaliseComprovante extends StatelessWidget {
  final OrdemPedido ordemPedido;
  UxAguardandoAnaliseComprovante({
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
                  'Aguardando Análise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
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
          Container(
            height: MediaQuery.of(context).size.height - 290,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Paciente',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.cliente.nome,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CPF',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.cliente.maskCpf(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Local da Coleta',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Laboratório',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.empresa.nome,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Local',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.empresa.endereco.getDisplay(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telefone',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.empresa.maskTelefone(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Exame',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exames a fazer',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.getNomeExames(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Coleta',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.dataColetaBr(),
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preparo',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        this.ordemPedido.preparoExame ? 'Sim' : 'Não',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ],
                  ),
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
