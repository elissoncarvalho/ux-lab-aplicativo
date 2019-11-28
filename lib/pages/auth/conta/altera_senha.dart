import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/widgets/ux_input.dart';

class AlteraSenha extends StatelessWidget {
  const AlteraSenha({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Alterar Senha de Acesso',
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
              Navigator.pop(context, false);
            },
            color: Colors.blueGrey,
          ),
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 60, bottom: 16, left: 16, right: 16),
        children: <Widget>[
          UxInput(
            textLabel: 'Senha Atual',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
          ),
          UxInput(
            textLabel: 'Nova Senha',
            textMask: MaskedTextController(mask: '00/00/0000'),
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.only(bottom: 22),
          ),
          UxInput(
            textLabel: 'Confirmar Senha',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
          ),
        ],
      ),
    );
  }
}
