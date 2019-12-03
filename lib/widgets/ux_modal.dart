import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uxlab/models/ordem_pedido.dart';
import 'package:uxlab/widgets/comprovantes/ux_agendamento_comprovante.dart';
import 'package:uxlab/widgets/comprovantes/ux_aguardando_analise_comprovante.dart';
import 'package:uxlab/widgets/comprovantes/ux_concluido_comprovante.dart';
import 'package:uxlab/widgets/comprovantes/ux_pendente_comprovante.dart';

class UxModal extends StatelessWidget {
  final OrdemPedido ordemPedido;

  UxModal({
    Key key,
    @required this.ordemPedido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 30, left: 16, right: 16),
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: this._tipoComprovante(context, ordemPedido)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tipoComprovante(BuildContext context, OrdemPedido ordemPedido) {
    switch (ordemPedido.status.prefixo) {
      case 'aguardando_coleta':
        return UxAgendamentoComprovante(
          ordemPedido: ordemPedido,
        );
        break;
      case 'aguardando_analise':
        return UxAguardandoAnaliseComprovante(
          ordemPedido: ordemPedido,
        );
        break;
      case 'pendente':
        return UxPendenteComprovante(
          ordemPedido: ordemPedido,
        );
        break;
      case 'concluido':
        return UxConcluidoComprovante(
          ordemPedido: ordemPedido,
        );
        break;
      default:
        return Text(
          'Comprovante não implementado, contate o suporte.',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        );
    }
  }
}
