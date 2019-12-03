import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/models/endereco.dart';

class Empresa {
  int codEmpresa;
  String nome;
  String email;
  String cnpj;
  String telefone;
  Endereco endereco;

  Empresa({
    this.codEmpresa,
    this.nome,
    this.email,
    this.cnpj,
    this.telefone,
    this.endereco,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      codEmpresa: json['id'],
      nome: json['nome_razao_social'],
      email: json['email'],
      cnpj: json['cnpj'],
      telefone: json['telefone'],
      endereco: Endereco.fromJson(json['endereco']),
    );
  }

  String maskTelefone() {
    MaskedTextController mask = MaskedTextController(
        text: this.telefone,
        mask: this.telefone.length > 10 ? '(00) 00000-0000' : '(00) 0000-0000');
    return mask.text;
  }
}
