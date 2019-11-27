import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:uxlab/routes.dart';

Future<void> main() async {
  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(Routes(camera: firstCamera));
}

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:uxlab/models/cliente.dart';


// Future<Cliente> createPost(String url, {Map body}) async {
//   return http.post(url, body: body).then((http.Response response) {
//     final int statusCode = response.statusCode;

//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       throw new Exception("Error while fetching data");
//     }
//     return Cliente.fromJson(json.decode(response.body));
//   });
// }

// class MyApp extends StatelessWidget {
//   final Future<Cliente> cliente;

//   MyApp({Key key, this.cliente}) : super(key: key);
//   static final CREATE_POST_URL = 'http://192.168.1.3/api/cliente';
//   TextEditingController emailControler = new TextEditingController();
//   TextEditingController senhaControler = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: "WEB SERVICE",
//       theme: ThemeData(
//         primaryColor: Colors.deepOrange,
//       ),
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Create Cliente'),
//           ),
//           body: new Container(
//             margin: const EdgeInsets.only(left: 8.0, right: 8.0),
//             child: new Column(
//               children: <Widget>[
//                 new TextField(
//                   controller: emailControler,
//                   decoration: InputDecoration(
//                       hintText: "title....", labelText: 'Cliente Title'),
//                 ),
//                 new TextField(
//                   controller: senhaControler,
//                   decoration: InputDecoration(
//                       hintText: "body....", labelText: 'Cliente Body'),
//                 ),
//                 new RaisedButton(
//                   onPressed: () async {
//                     Cliente newcliente = new Cliente(
//                         email: emailControler.text, senha: senhaControler.text);
//                     Cliente c = await createPost(CREATE_POST_URL,
//                         body: newcliente.toMap());
//                     print(c.email);
//                   },
//                   child: const Text("Create"),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// void main() => runApp(MyApp());
