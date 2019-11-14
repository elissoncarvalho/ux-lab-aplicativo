import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uxlab/pages/auth/auth_page.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_page.dart';
import 'package:uxlab/pages/auth/login/login_page.dart';
import 'package:uxlab/widgets/nav_bar.dart';

class Routes extends StatelessWidget {
  final CameraDescription camera;
  const Routes({Key key, this.camera}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UX Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        // Rotas de Login e Cadastro
        '/': (context) => AuthPage(),
        '/Auth/Login': (context) => LoginPage(),
        '/Auth/Cadastro': (context) => CadastroPage(),
        '/auth/RecuperarSenha': (context) => AuthPage(),

        // Rotas de Navegação
        '/home': (context) => NavBar(camera: this.camera,),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt'),
      ],
    );
  }
}
