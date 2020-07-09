import 'package:bytebanck/components/editor.dart';
import 'package:bytebanck/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoValor = 'Valor';
const _dica = '0000';
const _dicaValor = '0.00';
const _numeroConta = 'Número da conta';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _numeroConta,
              dica: _dica),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaValor,
              icone: Icons.monetization_on),
          RaisedButton(
            child: Text(_textoBotaoConfirmar),
            onPressed: () => _criaTransferencia(context),
          ),
        ]),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}