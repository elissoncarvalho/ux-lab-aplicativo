import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/models/cliente.dart';
import 'package:uxlab/pages/agenda_ordem_page.dart';
import 'package:uxlab/pages/meus_exames_page.dart';
import 'package:uxlab/pages/minha_conta_page.dart';

class NavBar extends StatefulWidget {
  final CameraDescription camera;
  const NavBar({Key key, @required this.camera}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _widgetOptions = {
      0: AgendaOrdemPage(
        camera: widget.camera,
      ),
      1: MeusExamesPage(),
      2: MinhaContaPage(
        cliente: Cliente(
          codCliente: '00021',
          nome: 'Luísa Braga Santos',
          cpf: '123.123.123-32',
          email: 'luísa.santos@email.com',
          urlImagePerfil: 'assets/images/avatar_girl.jpg',
        ),
      ),
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
