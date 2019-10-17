import 'package:flutter/material.dart';
import 'package:uxlab/pages/meus_exames_page.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 1;
  static var _widgetOptions = {
    0: Text('Tela de Agendamento'),
    1: MeusExamesPage(),
    2: Text('Tela de Perfil'),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.person),
            title: Text('Minha Conta'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
