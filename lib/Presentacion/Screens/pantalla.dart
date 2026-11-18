import 'package:flutter/material.dart';

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {

  int _clicksMas = 0;
  int _clicksMenos = 25;
  int _total = 0;

  void _incrementarMas() {
    setState(() {
      _clicksMas++;
    });
  }

  void _decrementarMenos() {
    setState(() {
      _clicksMenos--;
    });
  }

  void _calcularTotal() {
    setState(() {
      _total = _clicksMenos - _clicksMas;
    });
  }

  Widget _construirCaja(String texto) {
    return Container(
      width: 210,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _construirBotonCircular(String simbolo, VoidCallback alPresionar) {
    return ElevatedButton(
      onPressed: alPresionar,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
          side: BorderSide(color: Colors.black, width: 1.5),
        ),
        padding: const EdgeInsets.all(18),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      child: Text(
        simbolo,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calculadora de Clicks'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _construirCaja('Numero de clicks +'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 75),
                  _construirCaja('$_clicksMas'),
                  const SizedBox(width: 15),
                  _construirBotonCircular('+', _incrementarMas),
                ],
              ),

              const SizedBox(height: 24),

              _construirCaja('Numero de clicks -'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 75),
                  _construirCaja('$_clicksMenos'),
                  const SizedBox(width: 15),
                  _construirBotonCircular('-', _decrementarMenos),
                ],
              ),

              const SizedBox(height: 24),
              _construirCaja('Total'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 75),
                  _construirCaja('$_total'),
                  const SizedBox(width: 15),
                  _construirBotonCircular('=', _calcularTotal),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}