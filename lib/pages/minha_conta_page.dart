import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/auth/conta/definicoes_app.dart';
import 'package:uxlab/pages/auth/conta/editar_endereco_page.dart';
import 'package:uxlab/pages/auth/conta/altera_perfil.dart';
import 'package:uxlab/widgets/ux_button_item.dart';
import 'package:http/http.dart' as http;
import 'package:uxlab/widgets/ux_circular_load.dart';

// Faz a requsição na API
Future<Cliente> fetchCliente() async {
  // final response = await http.get('http://uxlab.eastus.cloudapp.azure.com/api/cliente/1');
  final response = await http.get('http://192.168.1.3:8080/api/cliente/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Cliente.fromJson(jsonDecode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception(jsonDecode(response.body)['msg']);
  }
}

class MinhaContaPage extends StatefulWidget {
  MinhaContaPage({Key key}) : super();

  @override
  _MinhaContaPage createState() => _MinhaContaPage();
}

class _MinhaContaPage extends State<MinhaContaPage> {
  Future<Cliente> cliente;

  @override
  void initState() {
    super.initState();
    cliente = fetchCliente();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Cliente>(
      future: cliente,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Cliente cliente = new Cliente(
            codCliente: snapshot.data.codCliente,
            nome: snapshot.data.nome,
            cpf: snapshot.data.cpf,
            email: snapshot.data.email,
            urlImagePerfil: snapshot.data.urlImagePerfil,
          );
          return this._exibe(cliente);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return UxCircularLoad();
      },
    );
  }

  _exibe(Cliente cliente) {
    AssetImage _urlImagemPerfil = AssetImage(cliente.urlImagePerfil);
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
                          cliente.nome,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: <Text>[
                            Text(
                              'Cliente: ${cliente.codCliente}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'CPF: ${cliente.cpf}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'E-mail: ${cliente.email}',
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
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) =>
                                      AlteraPerfil(cliente: cliente,)));
                            },
                          ),
                          UxButtonItem(
                            text: 'Editar endereço',
                            icon: Icon(Icons.map),
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) =>
                                      EditarEnderecoPage(
                                        cliente: cliente,
                                      )));
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
                            onPressed: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) =>
                                      DefinicoesApp()));
                            },
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
