import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/models/endereco.dart';

class Empresa {
  final String codEmpresa;
  final String nome;
  final String email;
  final String cnpj;
  final String telefone;
  final Endereco endereco;

  Empresa({
    this.codEmpresa,
    this.nome,
    this.email,
    this.cnpj,
    this.telefone,
    this.endereco,
  });

  String maskTelefone() {
    MaskedTextController mask = MaskedTextController(
        text: this.telefone,
        mask: this.telefone.length > 10 ? '(00) 00000-0000' : '(00) 0000-0000');
    return mask.text;
  }
}
