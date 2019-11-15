import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/models/endereco.dart';

class Cliente {
  String codCliente;
  String nome;
  String email;
  String cpf;
  String sexo;
  String urlImagePerfil;
  String telefone;
  String senha;
  DateTime dataNascimento;
  Endereco endereco;

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
