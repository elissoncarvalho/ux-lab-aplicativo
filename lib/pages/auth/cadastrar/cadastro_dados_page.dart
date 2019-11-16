import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/pages/auth/cadastrar/cadastro_endereco_page.dart';
import 'package:uxlab/widgets/ux_input.dart';

class CadastroDadosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fundo.png'),
          fit: BoxFit.fill,
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
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                   Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (BuildContext context, _ , __ ) => 
                          CadastroEnderecoPage()
                      ));
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
                        textLabel: 'Nome Completo',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      UxInput(
                       textMask: MaskedTextController(mask: '00/00/0000'),
                       keyboardType: TextInputType.number,
                        textLabel: 'Data Nascimento',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                       UxInput(
                        textLabel: 'Sexo',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                       UxInput(
                         textMask: MaskedTextController(mask: '(00) 00000-0000'),
                         keyboardType: TextInputType.number,
                        textLabel: 'Telefone',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      ],
                  ),
                ),
              ),
            ],
          ),
      )
      )
    );
    
  }
}
