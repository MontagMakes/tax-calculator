import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tax_calculator/screens/screen_business_tax_calculator.dart';
import 'package:tax_calculator/screens/screen_salary_tax_calculator.dart';
import 'package:tax_calculator/screens/screen_tax_notice_support.dart';

Logger logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const DrawerHeader(child: Text("Drawer Header")),
              ListTile(
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("About"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Tax Calculator'),
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: Text(
              "Tax Calculator",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: 300,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFD50000)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SalaryTaxCalculatorScreen(),
                    ),
                  );
                },
                child: const Text("Salary Tax Calculator")),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFD50000)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BusinessTaxCalculatorScreen(),
                    ),
                  );
                },
                child: const Text("Business Tax Calculator")),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFD50000)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TaxNoticeSupportScreen(),
                    ),
                  );
                },
                child: const Text("Tax Notice Support")),
          ),
        ],
      ),
    );
  }
}
