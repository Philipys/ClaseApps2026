import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Básica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculadoraHome(),
    );
  }
}

class CalculadoraHome extends StatefulWidget {
  const CalculadoraHome({super.key});

  @override
  State<CalculadoraHome> createState() => _CalculadoraHomeState();
}

class _CalculadoraHomeState extends State<CalculadoraHome> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double? _resultado;

  void _calcular(String operacion) {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _resultado = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa números válidos')),
      );
      return;
    }

    setState(() {
      switch (operacion) {
        case '+':
          _resultado = num1 + num2;
          break;
        case '-':
          _resultado = num1 - num2;
          break;
        case '*':
          _resultado = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            _resultado = null;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No se puede dividir entre cero')),
            );
          } else {
            _resultado = num1 / num2;
          }
          break;
      }
    });
  }

  void _limpiar() {
    _num1Controller.clear();
    _num2Controller.clear();
    setState(() {
      _resultado = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Básica'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primer número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: const Text('Sumar (+)'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: const Text('Restar (-)'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: const Text('Multiplicar (×)'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: const Text('Dividir (÷)'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: _limpiar,
              child: const Text('A C'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Resultado:',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              _resultado == null ? '--' : _resultado.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}