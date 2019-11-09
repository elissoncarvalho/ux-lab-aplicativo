import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/models/endereco.dart';

class Cliente {
  final String codCliente;
  final String nome;
  final String email;
  final String cpf;
  final String sexo;
  final String urlImagePerfil;
  final String telefone;
  final String senha;
  final DateTime dataNascimento;
  final Endereco endereco;

  Cliente({
    this.codCliente,
    this.nome,
    this.email,
    this.cpf,
    this.sexo,
    this.urlImagePerfil,
    this.telefone,
    this.senha,
    this.dataNascimento,
    this.endereco,
  });

  String maskCpf() {
    MaskedTextController mask =
        MaskedTextController(text: this.cpf, mask: '000.000.000-00');
    return mask.text;
  }

  String maskTelefone() {
    MaskedTextController mask = MaskedTextController(
        text: this.telefone,
        mask: this.telefone.length > 10 ? '(00) 00000-0000' : '(00) 0000-0000');
    return mask.text;
  }
}
