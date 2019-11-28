import 'package:flutter/material.dart';
import 'package:uxlab/pages/auth/conta/altera_senha.dart';
import 'package:uxlab/widgets/ux_button_item.dart';

class DefinicoesApp extends StatelessWidget {
  DefinicoesApp({Key key}) : super(key: key);
  bool isSwitched = true;
  void setState(bool){
  this.isSwitched = false;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Ajuste de definições',
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
            const EdgeInsets.only(top: 40, bottom: 50, left: 20, right: 16),
        children: <Widget>[
          Container(
            padding:
            const EdgeInsets.only(top: 20, bottom: 50, left: 50, right: 16),
            child: Row(children: <Widget>[
              Text('Receber notificações',
              style: TextStyle(fontSize: 15),
              ),
              Switch(
  value: isSwitched,
  onChanged: (value) {
    setState(() {
      isSwitched = value;
    });
  },
  activeTrackColor: Colors.lightBlueAccent, 
  activeColor: Colors.blueGrey,
),
            ],),
          ),
          UxButtonItem(
            text: 'ALTERAR SENHA',
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) => AlteraSenha()));
            },
          ),
        ],
      ),
    );
  }
}
