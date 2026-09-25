import 'package:flutter/material.dart';

void main() {
  runApp(const TasbheeApp());
}

// =====================================================
// ABSTRACTION
// =====================================================

abstract class Counter {
  void increment();
  void reset();
}

// =====================================================
// BASE CLASS
// =====================================================

class TasbheeCounter extends Counter {
  // Encapsulation: private variables
  String _tasbheeName;
  int _count;

  // Constructor
  TasbheeCounter(this._tasbheeName, [this._count = 0]);

  // Getter
  String get tasbheeName => _tasbheeName;

  // Getter
  int get count => _count;

  // Setter
  set tasbheeName(String name) {
    _tasbheeName = name;
  }

  // Method
  @override
  void increment() {
    _count++;
  }

  // Method
  @override
  void reset() {
    _count = 0;
  }
}

// =====================================================
// INHERITANCE
// =====================================================

class SpecialTasbhee extends TasbheeCounter {
  SpecialTasbhee(String name) : super(name);

  // POLYMORPHISM
  @override
  void increment() {
    super.increment();
  }
}

// =====================================================
// FLUTTER APP
// =====================================================

class TasbheeApp extends StatelessWidget {
  const TasbheeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbhee Counter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TasbheeScreen(),
    );
  }
}

// =====================================================
// HOME SCREEN
// =====================================================

class TasbheeScreen extends StatefulWidget {
  const TasbheeScreen({super.key});

  @override
  State<TasbheeScreen> createState() => _TasbheeScreenState();
}

class _TasbheeScreenState extends State<TasbheeScreen> {
  // Object creation
  final TasbheeCounter tasbhee = SpecialTasbhee('SubhanAllah');

  void increaseCounter() {
    setState(() {
      tasbhee.increment();
    });
  }

  void resetCounter() {
    setState(() {
      tasbhee.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbhee Counter'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Tasbhee Name
            Text(
              tasbhee.tasbheeName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Counter
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 5,
                ),
              ),
              child: Center(
                child: Text(
                  '${tasbhee.count}',
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Count Button
            ElevatedButton(
              onPressed: increaseCounter,
              child: const Text(
                '+  COUNT',
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 15),

            // Reset Button
            OutlinedButton(
              onPressed: resetCounter,
              child: const Text(
                'RESET',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}