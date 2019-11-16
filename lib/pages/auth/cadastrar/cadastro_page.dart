import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_dados_page.dart';
import 'package:uxlab/widgets/ux_input.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key key}) : super(key: key);

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
                onPressed: () {
                   Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (BuildContext context, _ , __ ) => 
                          CadastroDadosPage()
                      ));
                  // return showDialog<void>(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: const Text('Entrando...'),
                  //         content:
                  //             const Text('login sendo realizado, aguarde...'),
                  //         actions: <Widget>[
                  //           FlatButton(
                  //             child: Text('Okay'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     });
                },
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
                  child: Column(
                    children: [
                      UxInput(
                        textLabel: 'Email',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      UxInput(
                        textLabel: 'CPF',
                        textMask: MaskedTextController(mask: '000.000.000-00'),
                        keyboardType: TextInputType.number,
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                       UxInput(
                        textLabel: 'Senha',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                       UxInput(
                        textLabel: 'Confirmar Senha',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 30),
                      //   child: TextFormField(
                      //     autofocus: true,
                      //     keyboardType: TextInputType.number,
                      //     decoration: InputDecoration(
                      //       labelText: 'CPF',
                      //       fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(25.0),
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 30),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       labelText: 'Senha',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(25.0),
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 30),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       labelText: 'Confirmar senha',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(25.0),
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //   ),
                      // )
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
