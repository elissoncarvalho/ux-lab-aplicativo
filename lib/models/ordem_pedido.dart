import 'package:date_format/date_format.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/convenio.dart';
import 'package:uxlab/models/empresa.dart';
import 'package:uxlab/models/exame.dart';

class OrdemPedido {
  int idOrdemPedido;
  int idPedidoExame;
  bool preparoExame;
  String status;
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
      idOrdemPedido: json['idOrdemPedido'],
      idPedidoExame: json['idPedidoExame'],
      preparoExame: json['preparoExame'],
      status: json['status'],
      dataOrdemPedido: json['dataOrdemPedido'],
      dataExame: json['dataExame'],
      dataColeta: json['dataColeta'],
      cliente: Cliente.fromJson(json),
      empresa: json['empresa'],
      convenio: json['convenio'],
      exame: Exame.fromJson(json),
      exames: json['exames'],
    );
  }

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
