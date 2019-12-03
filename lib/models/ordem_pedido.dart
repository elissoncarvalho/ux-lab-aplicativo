import 'package:date_format/date_format.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/convenio.dart';
import 'package:uxlab/models/empresa.dart';
import 'package:uxlab/models/exame.dart';
import 'package:uxlab/models/status.dart';

class OrdemPedido {
  int idOrdemPedido;
  int idPedidoExame;
  bool preparoExame;
  Status status;
  DateTime dataOrdemPedido;
  DateTime dataExame;
  DateTime dataColeta;
  Cliente cliente;
  Empresa empresa;
  Convenio convenio;
  Exame exame;
  List<Exame> exames;

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
    this.exame,
    this.exames,
  });

  factory OrdemPedido.fromJson(Map<String, dynamic> json) {
    return OrdemPedido(
      idOrdemPedido: json['id'],
      idPedidoExame: json['id_ordem_pedido'],
      cliente: Cliente.fromJson(json['cliente']),
      empresa: Empresa.fromJson(json['empresa']),
      status: Status.fromJson(json['status']) ?? null,
      convenio: Convenio.fromJson(json['convenio']) ?? null,
      exame: Exame.fromJson(json['exames']) ?? null,
      preparoExame: json['preparo_exame'],
      dataOrdemPedido: DateTime.parse(json['created_at']),
      dataExame: DateTime.parse(json['data_exame']),
      dataColeta: DateTime.parse(json['data_coleta']),
      // exames: json['exames'],
    );
  }

  String getNomeExames() {
    String listaNomeExame;
    // for (var exame in this.exames) {
    //   listaNomeExame = '${listaNomeExame ?? ''} ${exame.descricao};';
    // }
    listaNomeExame = '${listaNomeExame ?? ''} ${exame.descricao};';
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
