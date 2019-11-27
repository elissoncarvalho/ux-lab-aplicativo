import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/agenda_ordem_page.dart';
import 'package:uxlab/pages/meus_exames_page.dart';
import 'package:uxlab/pages/minha_conta_page.dart';
import 'package:http/http.dart' as http;
import 'package:uxlab/widgets/ux_circular_load.dart';

// Faz a requsição na API
Future<Cliente> fetchCliente() async {
  final response = await http.get('http://uxlab.eastus.cloudapp.azure.com/api/cliente');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Cliente.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Cleinte');
  }
}

class NavBar extends StatefulWidget {
  final CameraDescription camera;
  const NavBar({Key key, @required this.camera}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Future<Cliente> cliente;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    cliente = fetchCliente();
  }

  @override
  Widget build(BuildContext context) {
    var _widgetOptions = {
      0: AgendaOrdemPage(
        camera: widget.camera,
      ),
      1: MeusExamesPage(),
      2: FutureBuilder<Cliente>(
        future: cliente,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MinhaContaPage(
                cliente: Cliente(
              codCliente: snapshot.data.codCliente,
              nome: snapshot.data.nome,
              cpf: snapshot.data.cpf,
              email: snapshot.data.email,
              urlImagePerfil: snapshot.data.urlImagePerfil,
            ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return UxCircularLoad();
        },
      )
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Agendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Meus Exames'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Minha Conta'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
