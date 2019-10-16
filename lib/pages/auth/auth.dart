import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  Auth({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.44), 
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 30),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/images/bio_lab.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  'A praticidade de um laboratório agora em suas mãos',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 150,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ButtonTheme(
                              height: 50.0,
                              child: OutlineButton(
                                onPressed: (){
                                  Navigator.of(context).pushNamed('/Auth/Login');
                                },
                                child: const Text('ENTRAR'),
                                textColor: Colors.white,
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              height: 50.0,
                              child: OutlineButton(
                                onPressed: (){
                                  Navigator.of(context).pushNamed('/Auth/Cadastro');
                                },
                                child: const Text('CADASTRAR CONTA'),
                                textColor: Colors.white,
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/images/ux_lab_icon.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}