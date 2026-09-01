
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int contador = 0;

  void _sumar() {
    setState(() {
      contador++;
    });
  }

  void _restar() {
    setState(() {
      contador--;
    });
  }

  void _resetear() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi primera app contador'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AQUÍ ESTÁ LA FOTO: Cambia el link entre comillas por la imagen que quieras
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://picsum.photos/200', 
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              ),
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Valor actual:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$contador',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _restar,
                  child: const Text("- Restar"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetear,
                  child: const Text("Reset"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sumar,
                  child: const Text("+ Sumar"),
                ),
              ],
            ),
          ],
        ),
      ),
      // AQUÍ ESTÁN LOS BOTONES FLOTANTES DE MÁS Y MENOS
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _restar,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10), // Espacio entre los dos botones
          FloatingActionButton(
            onPressed: _sumar,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

