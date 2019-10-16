import 'package:flutter/material.dart';
import 'package:uxlab/pages/auth/auth.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_page.dart';
import 'package:uxlab/pages/auth/login/login_page.dart';
import 'package:uxlab/pages/nav_bar.dart';

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