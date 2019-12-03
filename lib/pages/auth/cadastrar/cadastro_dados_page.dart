import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_endereco_page.dart';
import 'package:uxlab/widgets/ux_input.dart';

class CadastroDadosPage extends StatefulWidget {
  final Cliente cliente;
  CadastroDadosPage({Key key, @required this.cliente}) : super(key: key);

  @override
  _CadastroFormState createState() => new _CadastroFormState();
}

class _CadastroFormState extends State<CadastroDadosPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Cliente _cliente = new Cliente();

  String _validateNome(String value) {
    if (value.isEmpty) {
      return 'O nome não pode ser vasio';
    }
    return null;
  }

  String _validateDataNascimento(String value) {
    if (value.isEmpty) {
      return 'A Data de Nascimento precisa ser valido';
    }
    return null;
  }

  String _validateSexo(String value) {
    if (value.isEmpty) {
      return 'O sexo precisa ser valido';
    }
    return null;
  }

  String _validateTelefone(String value) {
    if (value.isEmpty) {
      return 'A Telefone deve ter pelo menos 8 caracteres.';
    }
    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) => CadastroEnderecoPage(
                cliente: this._cliente,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    this._cliente = widget.cliente;
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
                  'Cadastro Dados Pessoais',
                  style: TextStyle(fontSize: 14),
                ),
                centerTitle: true,
                backgroundColor: Colors.black.withOpacity(0.25),
                leading: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () => Navigator.pop(context, false),
                ),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.done), onPressed: this.submit),
                ],
              ),
              body: ListView(
                children: [
                  Form(
                    key: this._formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 70, right: 30, left: 30),
                      child: Column(
                        children: [
                          UxInput(
                              textLabel: 'Nome Completo',
                              textColor: Colors.white,
                              labelColor: Colors.white,
                              padding: const EdgeInsets.only(bottom: 50),
                              keyboardType: TextInputType.text,
                              validator: this._validateNome,
                              onSaved: (value) {
                                setState(() {
                                  this._cliente.nome = value;
                                });
                              }),
                          UxInput(
                              // textMask: MaskedTextController(mask: '00/00/0000'),
                              keyboardType: TextInputType.number,
                              textLabel: 'Data Nascimento',
                              textColor: Colors.white,
                              labelColor: Colors.white,
                              padding: const EdgeInsets.only(bottom: 50),
                              validator: this._validateDataNascimento,
                              onSaved: (value) {
                                setState(() {
                                  this._cliente.dataNascimento =
                                      DateTime.parse(value);
                                });
                              }),
                          UxInput(
                              textLabel: 'Sexo',
                              textColor: Colors.white,
                              labelColor: Colors.white,
                              padding: const EdgeInsets.only(bottom: 50),
                              keyboardType: TextInputType.text,
                              validator: this._validateSexo,
                              onSaved: (value) {
                                setState(() {
                                  this._cliente.sexo = value;
                                });
                              }),
                          UxInput(
                              // textMask:
                              //     MaskedTextController(mask: '(00) 00000-0000'),
                              keyboardType: TextInputType.number,
                              textLabel: 'Telefone',
                              textColor: Colors.white,
                              labelColor: Colors.white,
                              padding: const EdgeInsets.only(bottom: 50),
                              validator: this._validateTelefone,
                              onSaved: (value) {
                                setState(() {
                                  this._cliente.telefone = value;
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
