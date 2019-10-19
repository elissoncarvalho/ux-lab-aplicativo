import 'dart:ui';

import 'package:flutter/material.dart';

class MinhaContaPage extends StatelessWidget {
  MinhaContaPage() : super();
  @override
  Widget build(BuildContext context) {
    AssetImage _urlImagemPerfil = AssetImage('assets/images/avatar_girl.jpg');
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
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
                          'Luísa Braga Santos',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: <Text>[
                            Text(
                              'Cliente: 00021',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'CPF: 123.123.123-12',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'E-mail: luísa.santos@email.com',
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
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: <ButtonTheme>[
                          ButtonTheme(
                            height: 55.0,
                            child: FlatButton(
                              onPressed: () {
                                
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Icon(Icons.edit),
                                  ),
                                  Text('Editar perfil'),
                                ],
                              ),
                              textColor: Colors.blue,
                            ),
                          ),
                          ButtonTheme(
                            height: 55.0,
                            child: FlatButton(
                              onPressed: () {
                                
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Icon(Icons.map),
                                  ),
                                  Text('Editar endereço'),
                                ],
                              ),
                              textColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: <ButtonTheme>[
                          ButtonTheme(
                            height: 55.0,
                            child: FlatButton(
                              onPressed: () {
                                
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Icon(Icons.settings),
                                  ),
                                  Text('Definições do aplicativo'),
                                ],
                              ),
                              textColor: Colors.blue,
                            ),
                          ),
                          ButtonTheme(
                            height: 55.0,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32),
                                    child: Icon(Icons.exit_to_app),
                                  ),
                                  Text('Sair'),
                                ],
                              ),
                              textColor: Colors.blue,
                            ),
                          ),
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
