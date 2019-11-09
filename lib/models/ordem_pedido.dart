import 'package:date_format/date_format.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/convenio.dart';
import 'package:uxlab/models/empresa.dart';
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
  final Empresa empresa;
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
    this.empresa,
    this.convenio,
    this.exames,
  });

  String getNomeExames() {
    String listaNomeExame;
    for (var exame in this.exames) {
      listaNomeExame = '${listaNomeExame ?? ''} ${exame.descricao};';
    }
    return listaNomeExame.trim();
  }

  String dataOrdemPedidoBr() {
    return formatDate(this.dataOrdemPedido, [dd, '/', mm, '/', yyyy]);
  }

  String dataExameBr() {
    return formatDate(this.dataExame, [dd, '/', mm, '/', yyyy]);
  }

  String dataColetaBr() {
    return formatDate(this.dataColeta, [dd, '/', mm, '/', yyyy]);
  }
}
