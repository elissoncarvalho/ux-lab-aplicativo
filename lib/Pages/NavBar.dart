import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({Key key}) : super(key: key);

  
  int _selectedIndex = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
        children: [
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                      'Próximos Exames',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  leading: Text('2092'),
                  title: Text('Data: 18/04/2019'),
                  subtitle: Text('Preparo: Sim'),
                  trailing: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                      'Meus Exames',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  leading: Text('00029'),
                  title: Text('Status: Aguardando análise'),
                  subtitle: Text('Data da Coleta: 20/04/2019'),
                  trailing: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.blueGrey,
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
      ),
    );
  }
}