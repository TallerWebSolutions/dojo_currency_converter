import 'package:dojocurrencyconverter/currency_field_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CurrencyFieldController currencyFieldController = CurrencyFieldController();
  String convertedValue = "0";

  @override
  Widget build(BuildContext context) {
    double currentCurrencyValue = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('O valor convertido é: $convertedValue'),
            TextField(
              controller: currencyFieldController,
              decoration: const InputDecoration(hintText: 'Moeda de entrada'),
            ),
            ElevatedButton(
              key: const Key("ConvertButton"),
              onPressed: () {
                setState(() {
                  convertedValue =
                      currencyFieldController.convert(currentCurrencyValue);
                });
              },
              child: const Text("Converter"),
            ),
          ],
        ),
      ),
    );
  }
}
