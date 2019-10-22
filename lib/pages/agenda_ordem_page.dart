import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:uxlab/widgets/ux_input.dart';

class AgendaOrdemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Agendar Exame',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
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
            color: Colors.blueGrey,
          ),
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 25, bottom: 16, left: 16, right: 16),
        children: <Widget>[
          UxInput(
            textLabel: 'Paciente',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            autofocus: true,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
          ),
          UxInput(
            textLabel: 'CPF',
            textMask: MaskedTextController(mask: '000.000.000-00'),
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.only(bottom: 22),
          ),
          UxInput(
            textLabel: 'Vinculo',
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.text,
            padding: const EdgeInsets.only(bottom: 22),
          ),
          UxInput(
            textLabel: 'Telefone',
            textMask: MaskedTextController(mask: '(00) 00000-0000'),
            textColor: Colors.blueGrey,
            labelColor: Colors.blue,
            labelBorderWidth: 1,
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.only(bottom: 22),
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
            child: DateTimeField(
              format: DateFormat("dd MMMM yyyy HH:mm"),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2019, 12, 31));

                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
              decoration: InputDecoration(
                labelText: 'Data da coleta',
                labelStyle: TextStyle(color: Colors.blue),
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
