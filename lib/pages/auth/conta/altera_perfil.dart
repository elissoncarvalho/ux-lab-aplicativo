import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/widgets/ux_input.dart';

class AlteraPerfil extends StatelessWidget {
  final Cliente cliente;
  const AlteraPerfil({Key key,
    @required this.cliente,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Editar Dados Pessoais',
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
            const EdgeInsets.only(top: 25, bottom: 16, left: 16, right: 16),
        children: <Widget>[
          UxInput(
            textLabel: 'Nome completo',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
            valor: this.cliente.nome,
          ),
          UxInput(
            textLabel: 'Data de Nascimento',
            // textMask: MaskedTextController(mask: '00/00/0000'),
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.only(bottom: 22),
            valor: this.cliente.dataNascimento ?? '',
          ),
          UxInput(
            textLabel: 'Sexo',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
            valor: this.cliente.sexo ?? '',
          ),
          UxInput(
            textLabel: 'Telefone',
            // textMask: MaskedTextController(mask: '(00) 00000-0000'),
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.only(bottom: 22),
            valor: this.cliente.telefone ?? '',
          ),
        ],
      ),
    );
  }
}
