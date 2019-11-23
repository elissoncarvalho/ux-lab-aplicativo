import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/pages/minha_conta_page.dart';
import 'package:uxlab/widgets/ux_input.dart';

class EditarEnderecoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text(
          'Editar Endereço',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.blueGrey,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              return showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Edição de Endereço'),
                          content: const Text('Edição realizada com sucesso'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            MinhaContaPage(cliente: null,)));
                              },
                            ),
                          ],
                        );
                      });
            },
            color: Colors.blueGrey,
          ),
        ],
        ),
        backgroundColor: Colors.white,
         body: ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
                  child: Column(
                    children: [
                      UxInput(
                        textLabel: 'Novo Endereço',
                        textColor: Colors.blue,
                        labelColor: Colors.blue,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      UxInput(
                        textLabel: 'Novo Número',
                        textColor: Colors.blue,
                        labelColor: Colors.blue,
                        padding: const EdgeInsets.only(bottom: 50),
                        keyboardType: TextInputType.number,
                      ),
                       UxInput(
                        textLabel: 'Novo Bairro',
                        keyboardType: TextInputType.text,
                        textColor: Colors.blue,
                        labelColor: Colors.blue,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                       UxInput(
                        textLabel: 'Novo CEP',
                        textMask: MaskedTextController(mask: '00000-000'),
                       keyboardType: TextInputType.number,
                        textColor: Colors.blue,
                        labelColor: Colors.blue,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}