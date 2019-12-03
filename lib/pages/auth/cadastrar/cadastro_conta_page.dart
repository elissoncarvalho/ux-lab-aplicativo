import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_dados_page.dart';
import 'package:uxlab/widgets/ux_input.dart';
import 'package:validate/validate.dart';

class CadastroContaPage extends StatefulWidget {
  CadastroContaPage({Key key}) : super(key: key);

  @override
  _CadastroFormState createState() => new _CadastroFormState();
}

class _CadastroFormState extends State<CadastroContaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Cliente _cliente = new Cliente();
  String _confirmaSenha = '';
  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'O endereço de email deve ser um endereço de email válido.';
    }
    return null;
  }

  String _validateCpf(String value) {
    if (value.length < 11) {
      return 'O CPF precisa ser valido';
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.length < 4) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }
    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_confirmaSenha != _cliente.senha) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                content: const Text('As senhas não correspodem'),
              );
            });
      } else {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) => CadastroDadosPage(
                  cliente: this._cliente
                )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Cadastrar Conta',
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
                          textLabel: 'Email',
                          textColor: Colors.white,
                          labelColor: Colors.white,
                          padding: const EdgeInsets.only(bottom: 50),
                          keyboardType: TextInputType.emailAddress,
                          validator: this._validateEmail,
                          onSaved: (value) {
                            setState(() {
                              this._cliente.email = value;
                            });
                          }),
                      UxInput(
                        textLabel: 'CPF',
                        // textMask: MaskedTextController(mask: '000.000.000-00'),
                        keyboardType: TextInputType.number,
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                        validator: this._validateCpf,
                        onSaved: (value) {
                          setState(() {
                            this._cliente.cpf = value;
                          });
                        },
                      ),
                      UxInput(
                        textLabel: 'Senha',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                        keyboardType: TextInputType.text,
                        textPass: true,
                        validator: this._validateSenha,
                        onSaved: (value) {
                          setState(() {
                            this._cliente.senha = value;
                          });
                        },
                      ),
                      UxInput(
                        textLabel: 'Confirmar Senha',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                        keyboardType: TextInputType.text,
                        textPass: true,
                        validator: this._validateSenha,
                        onSaved: (value) {
                          setState(() {
                            this._confirmaSenha = value;
                          });
                        },
                      ),
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
}
