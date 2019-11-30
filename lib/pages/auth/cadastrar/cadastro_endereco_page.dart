import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/widgets/ux_input.dart';

class CadastroEnderecoPage extends StatelessWidget {
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
              'Cadastrar Conta Endereço',
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
                  return showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            ),
                          title: const Text('Login'),
                          content: const Text('Cadastro realizado com sucesso'),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text('Ok'),
                               textColor: Colors.white,
                              onPressed: () {
                                
                              },
                            ),
                          ],
                        );
                      });
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
                        textLabel: 'Endereço',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      UxInput(
                        textLabel: 'Número',
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                        keyboardType: TextInputType.number,
                      ),
                      UxInput(
                        textLabel: 'Bairro',
                        keyboardType: TextInputType.text,
                        textColor: Colors.white,
                        labelColor: Colors.white,
                        padding: const EdgeInsets.only(bottom: 50),
                      ),
                      UxInput(
                        textLabel: 'CEP',
                        textMask: MaskedTextController(mask: '00000-000'),
                        keyboardType: TextInputType.number,
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
        ),
      ),
    );
  }
}
