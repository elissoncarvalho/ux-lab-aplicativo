import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/models/endereco.dart';
import 'package:uxlab/widgets/ux_input.dart';

class CadastroEnderecoPage extends StatefulWidget {
  final Cliente cliente;
  CadastroEnderecoPage({Key key, @required this.cliente}) : super(key: key);
  @override
  _CadastroFormState createState() => new _CadastroFormState();
}

class _CadastroFormState extends State<CadastroEnderecoPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Cliente _cliente = new Cliente();
  bool _ok = false;

  String _validateEndereco(String value) {
    if (value.isEmpty) {
      return 'O endereço não pode ser vazio';
    }
    return null;
  }

  String _validateNumero(String value) {
    if (value.isEmpty) {
      return 'A numero precisa ser valido';
    }
    return null;
  }

  String _validateBairro(String value) {
    if (value.isEmpty) {
      return 'O bairro precisa ser valido';
    }
    return null;
  }

  String _validateCep(String value) {
    if (value.isEmpty) {
      return 'A cep deve ter pelo menos 8 caracteres.';
    }
    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      _makePostRequest();
    }
  }

  @override
  Widget build(BuildContext context) {
    this._cliente = widget.cliente;
    this._cliente.endereco = new Endereco();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fundo.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.6),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Cadastrar Conta Endereço',
              style: TextStyle(fontSize: 14),
            ),
            centerTitle: true,
            backgroundColor: Colors.black.withOpacity(0.25),
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () => Navigator.pop(context, false),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.done),
                onPressed: this.submit,
              ),
            ],
          ),
          body: ListView(
            children: [
              Form(
                key: this._formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
                  child: Column(
                    children: [
                      UxInput(
                          textLabel: 'Endereço',
                          textColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 50),
                          validator: this._validateEndereco,
                          onSaved: (value) {
                            setState(() {
                              this._cliente.endereco.endereco = value;
                            });
                          }),
                      UxInput(
                          textLabel: 'Número',
                          textColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 50),
                          keyboardType: TextInputType.number,
                          validator: this._validateNumero,
                          onSaved: (value) {
                            setState(() {
                              this._cliente.endereco.numero = int.parse(value);
                            });
                          }),
                      UxInput(
                          textLabel: 'Bairro',
                          keyboardType: TextInputType.text,
                          textColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 50),
                          validator: this._validateBairro,
                          onSaved: (value) {
                            setState(() {
                              this._cliente.endereco.bairro = value;
                            });
                          }),
                      UxInput(
                          textLabel: 'CEP',
                          // textMask: MaskedTextController(mask: '00000000'),
                          keyboardType: TextInputType.number,
                          textColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 50),
                          validator: this._validateCep,
                          onSaved: (value) {
                            setState(() {
                              this._cliente.endereco.cep = int.parse(value);
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _makePostRequest() async {
    String url = 'http://192.168.1.3:8080/api/cliente';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(this._cliente);
    print(json);
    Response response = await post(url, headers: headers, body: json);
    if (response.statusCode > 200 || response.statusCode < 300) {
      Navigator.of(context).pushNamed('/home');
    } else {
      print(response.body);
    }
  }
}
