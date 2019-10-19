import 'dart:developer';

import 'package:flutter/material.dart';

class AgendaOrdem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agendar Exame',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            color: Colors.black54,
          ),
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 25, bottom: 16, left: 16, right: 16),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Paciente',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Vinculo',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Telefone',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ButtonTheme(
              height: 55.0,
              child: OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Auth/Login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.camera_alt),
                    ),
                    Text('FOTO DO PEDIDO DE EXAME'),
                  ],
                ),
                textColor: Colors.blue,
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ButtonTheme(
              height: 55.0,
              child: OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Auth/Login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.add_to_photos),
                    ),
                    Text('SELECIONAR EXAMES'),
                  ],
                ),
                textColor: Colors.blue,
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Data da coleta',
                labelStyle: TextStyle(
                  color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
