import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/convenio.dart';
import 'package:uxlab/models/exame.dart';

class OrdemPedido {
  final int idOrdemPedido;
  final int idPedidoExame;
  final bool preparoExame;
  final String status;
  final DateTime dataOrdemPedido;
  final DateTime dataExame;
  final DateTime dataColeta;
  final Cliente cliente;
  final Convenio convenio;
  final List<Exame> exames;

  OrdemPedido({
    this.idOrdemPedido,
    this.idPedidoExame,
    this.preparoExame,
    this.status,
    this.dataOrdemPedido,
    this.dataExame,
    this.dataColeta,
    this.cliente,
    this.convenio,
    this.exames,
  });
}
