import 'package:uxlab/Models/Endereco.dart';

class Usuario {
  final String nome;
  final String email;
  final String cpf;
  final String sexo;
  final String telefone;
  final String senha;
  final DateTime dataNascimento;
  final Endereco endereco;

  Usuario({
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