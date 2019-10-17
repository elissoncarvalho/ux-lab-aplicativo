import 'package:uxlab/models/endereco.dart';

class Cliente {
  final String nome;
  final String email;
  final String cpf;
  final String sexo;
  final String telefone;
  final String senha;
  final DateTime dataNascimento;
  final Endereco endereco;

  Cliente({
    this.nome,
    this.email,
    this.cpf,
    this.sexo,
    this.telefone,
    this.senha,
    this.dataNascimento,
    this.endereco,
  });
}
