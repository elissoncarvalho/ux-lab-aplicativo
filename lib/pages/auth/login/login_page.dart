import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/auth/recuperar/recuperar.dart';
import 'package:uxlab/widgets/ux_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
  final Cliente _cliente = new Cliente();

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
              'Entrar',
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ],
          ),
          body: Center(
            child: Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    UxInput(
                      labelColor: Colors.white,
                      textLabel: 'Email ou CPF',
                      textColor: Colors.white,
                      textPass: false,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, entre com seu email ou cpf'
                              .toString();
                        }
                      },
                      onSaved: (val) => setState(() => this._cliente.email = val),
                    ),
                    UxInput(
                      labelColor: Colors.white,
                      textLabel: 'Senha',
                      textColor: Colors.white,
                      textPass: true,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, entre com sua senha.';
                        }
                      },
                      onSaved: (val) => setState(() => this._cliente.senha = val),
                    ),
                    ButtonTheme(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (BuildContext context, _, __) =>
                                  Recuperar()));
                        },
                        child: const Text(
                          'RECUPERAR SENHA',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
