import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/auth/editar/editar_endereco_page.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class MinhaContaPage extends StatelessWidget {
  final Cliente cliente;

  MinhaContaPage({Key key, @required this.cliente}) : super();

  @override
  Widget build(BuildContext context) {
    AssetImage _urlImagemPerfil = AssetImage(this.cliente.urlImagePerfil);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 55,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: _urlImagemPerfil, fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: _urlImagemPerfil, fit: BoxFit.cover),
                          ),
                        ),
                        Text(
                          this.cliente.nome,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: <Text>[
                            Text(
                              'Cliente: ${this.cliente.codCliente}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'CPF: ${this.cliente.cpf}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'E-mail: ${this.cliente.email}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 45,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: <UxButtonItem>[
                          UxButtonItem(
                            text: 'Editar perfil',
                            icon: Icon(Icons.edit),
                            onPressed: () {
                            },
                          ),
                          UxButtonItem(
                            text: 'Editar endereço',
                            icon: Icon(Icons.map),
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder: (BuildContext context, _ , __ ) => 
                                EditarEnderecoPage(cliente: this.cliente,)
                               ));
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: <UxButtonItem>[
                          UxButtonItem(
                            text: 'Definições do aplicativo',
                            icon: Icon(Icons.settings),
                            onPressed: () {},
                          ),
                          UxButtonItem(
                            text: 'Sair',
                            icon: Icon(Icons.exit_to_app),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
