import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uxlab/models/endereco.dart';

@JsonSerializable()

class Cliente {
  int idCliente;
  int codCliente;
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
    this.idCliente,
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

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      idCliente: json['id_cliente'],
      codCliente: json['cod_cliente'],
      nome: json['nome'],
      email: json['email'],
      cpf: json['cpf'],
      sexo: json['sexo'],
      urlImagePerfil: json['url_image_perfil'] ?? 'assets/images/avatar_girl.jpg',
      telefone: json['telefone'],
      senha: json['senha'],
      dataNascimento: DateTime.parse(json['data_nascimento']),
      endereco: Endereco.fromJson(json['endereco']),
    );
  }

  // Map<String, dynamic> toJson() => _$ClienteToJson(this);
  // Map<String, dynamic> toJson() => {
  //       'id_cliente': this.idCliente,
  //       'cod_cliente': this.codCliente,
  //       'nome': this.nome,
  //       'email': this.email,
  //       'cpf': this.cpf,
  //       'sexo': this.sexo,
  //       'url_image_perfil': this.urlImagePerfil,
  //       'telefone': this.telefone,
  //       'senha': this.senha,
  //       'data_nascimento': this.dataNascimento,
  //       'endereco': this.endereco.toJson()
  //     };

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["id_cliente"] = this.idCliente;
    map["cod_cliente"] = this.codCliente;
    map["nome"] = this.nome;
    map["email"] = this.email;
    map["cpf"] = this.cpf;
    map["sexo"] = this.sexo;
    map["url_image_perfil"] = this.urlImagePerfil;
    map["telefone"] = this.telefone;
    map["senha"] = this.senha;
    map["data_nascimento"] = this.dataNascimento;
    map["endereco"] = this.endereco.toMap();

    return map;
  }

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
