import 'package:flutter/material.dart';
import 'package:uxlab/Pages/Auth/Auth.dart';
import 'package:uxlab/Pages/Auth/Cadastrar/CadastroPage.dart';
import 'package:uxlab/Pages/Auth/Login/LoginPage.dart';
import 'package:uxlab/Pages/NavBar.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UX Lab',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        fontFamily: 'TrajanPro',
      ),
      routes: {
        // Rotas de Login e Cadastro
        '/': (context) => Auth(),
        '/Auth/Login': (context) => LoginPage(),
        '/Auth/Cadastro': (context) => CadastroPage(),
        '/auth/RecuperarSenha': (context) => Auth(),

        // Rotas de Navegação
        '/home': (context) => NavBar(),
      },
    );
  }
}