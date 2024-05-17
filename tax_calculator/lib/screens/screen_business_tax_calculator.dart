import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tax_calculator/data/tax_brackets.dart';
import 'package:tax_calculator/main.dart';
import 'package:tax_calculator/widgets/dotted_line.dart';

class BusinessTaxCalculatorScreen extends StatefulWidget {
  const BusinessTaxCalculatorScreen({super.key});

  @override
  State<BusinessTaxCalculatorScreen> createState() =>
      _BusinessTaxCalculatorScreenState();
}

class _BusinessTaxCalculatorScreenState extends State<BusinessTaxCalculatorScreen> {
  String? dropdownValue;
  bool isYearChosen = false;
  final TextEditingController controller1 = TextEditingController();
  final currencyFormat = NumberFormat.decimalPattern('ur_PK');

  String formatCurrency(double? value) {
    if (value == 0 || value == null) {
      return '0.00';
    } else {
      return NumberFormat.decimalPattern('ur_PK').format(value);
    }
  }

  Map<String, double> resultForBusiness = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tax Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Center(
                child: Text(
              "Business Tax Calculator",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  alignment: Alignment.center,
                  hint: const Center(child: Text('Select Salary Tax Year')),
                  isExpanded: true,
                  value: dropdownValue,
                  onChanged: (newValue) {
                    setState(() {
                      isYearChosen = true;
                      dropdownValue = newValue.toString();
                    });
                  },
                  items: <String>[
                    '2018',
                    '2019',
                    '2020',
                    '2021',
                    '2022',
                    '2023',
                    '2024',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            //monthly
            SizedBox(
              height: 70,
              width: 370,
              child: TextField(
                enabled: isYearChosen,
                keyboardType: TextInputType.number,
                controller: controller1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Monthly Salary',
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            const Center(
                child: Text(
              'Tax Rate for Non-Salaried Individual',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),

            const SizedBox(
              height: 20.0,
            ),

            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Monthly Salary: '),
                    Text(formatCurrency(resultForBusiness['monthlySalary'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Monthly Tax: '),
                    Text(formatCurrency(resultForBusiness['monthlyTax'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Monthly Salary After Tax: '),
                    Text(formatCurrency(
                        resultForBusiness['monthlySalaryAfterTax'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Yearly Salary: '),
                    Text(formatCurrency(resultForBusiness['yearlySalary'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Yearly Tax: '),
                    Text(formatCurrency(resultForBusiness['yearlyTax'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Yearly Salary After Tax: '),
                    Text(formatCurrency(
                        resultForBusiness['yearlySalaryAfterTax'])),
                  ],
                ),
                const DottedLine(),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: FilledButton(

                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith(
                          (states) => const Color(0xFFD50000)),
                    ),
                    onPressed: dropdownValue != null ? () {
                      try {
                        resultForBusiness = taxCalculateForSalaries(
                          dropdownValue.toString(),
                          double.parse(controller1.value.text),
                          'business');
                      setState(() {});
                      } catch (e) {
                        logger.e(e);
                      }
                    } :() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a tax year'),
                        ),
                      );
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  
                )
              ],
            ),

            // Table(
            //   border: TableBorder.all(),
            //   children: [
            //     TableRow(children: [
            //       Container(),
            //       const Text('Monthly'),
            //       const Text('Yearly'),
            //     ]),
            //     TableRow(children: [
            //       const Text('Salary'),
            //       Text(resultForSalaried['monthlySalary']?.toString() ?? ''),
            //       Text(resultForSalaried['yearlySalary']?.toString() ?? ''),
            //     ]),
            //     TableRow(children: [
            //       const Text('Tax'),
            //       Text(resultForSalaried['monthlyTax']?.toString() ?? ''),
            //       Text(resultForSalaried['yearlyTax']?.toString() ?? ''),
            //     ]),
            //     TableRow(children: [
            //       const Text('Salary after Tax'),
            //       Text(resultForSalaried['monthlySalaryAfterTax']?.toString() ??
            //           ''),
            //       Text(resultForSalaried['yearlySalaryAfterTax']?.toString() ??
            //           ''),
            //     ]),
            //   ],
            // ),

            // const SizedBox(
            //   height: 50,
            // ),

            // const Center(
            //     child: Text(
            //   'Tax Rate for Salaried Individual',
            //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            // )),

            // const SizedBox(
            //   height: 20.0,
            // ),

            // Table(
            //   border: TableBorder.all(),
            //   children: [
            //     TableRow(children: [
            //       Container(),
            //       const Text('Monthly'),
            //       const Text('Yearly'),
            //     ]),
            //     TableRow(children: [
            //       const Text('Salary'),
            //       Text(resultForBusiness['monthlySalary']?.toString() ?? ''),
            //       Text(resultForBusiness['yearlySalary']?.toString() ?? ''),
            //     ]),
            //     TableRow(children: [
            //       const Text('Tax'),
            //       Text(resultForBusiness['monthlyTax']?.toString() ?? ''),
            //       Text(resultForBusiness['yearlyTax']?.toString() ?? ''),
            //     ]),
            //     TableRow(children: [
            //       const Text('Salary after Tax'),
            //       Text(resultForBusiness['monthlySalaryAfterTax']?.toString() ??
            //           ''),
            //       Text(resultForBusiness['yearlySalaryAfterTax']?.toString() ??
            //           ''),
            //     ]),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            //Button for Salary Calculation
            // const SizedBox(
            //   height: 50,
            // ),
            // OutlinedButton(
            //     onPressed: () {
            //       resultForSalaried = taxCalculateForSalaries(
            //           dropdownValue.toString(),
            //           double.parse(controller1.value.text),
            //           'salaried');
            //       setState(() {});
            //     },
            //     child: const Text('Calculate Salaried Tax')),
            // const SizedBox(
            //   height: 10,
            // ),
            // OutlinedButton(
            //     onPressed: () {
            //       resultForBusiness = taxCalculateForSalaries(
            //           dropdownValue.toString(),
            //           double.parse(controller1.value.text),
            //           'business');
            //       setState(() {});
            //     },
            //     child: const Text('Calculate Business Tax')),
          ],
        ),
      ),
    );
  }

  Map<String, double> taxCalculateForSalaries(
      String selectedYear, double monthlySalary, String type) {
    logger.d('Calculating tax for $selectedYear');
    logger.d('Monthly Salary: $monthlySalary');
    double yearlySalary = monthlySalary * 12;
    double yearlySalaryAfterTax = yearlySalary;
    double yearlyTax = 0;
    double taxRate = 0; // 12.5% tax rate

    if (type == 'salaried') {
      if (taxBrackets['salaries']!.containsKey(selectedYear)) {
        for (var bracket in taxBrackets['salaries']![selectedYear] ?? []) {
          logger.d('Bracket: ${bracket['upper']}');
          if (yearlySalary > bracket['lower'] &&
              yearlySalary <= bracket['upper']) {
            taxRate = bracket['variableRate'];
            logger.d('Tax Rate: $taxRate');
            yearlySalaryAfterTax -= (bracket['lower'] - 1);
            logger.d('Yearly Salary After Tax: $yearlySalaryAfterTax - lower');
            yearlySalaryAfterTax *= bracket['variableRate'] / 100;
            logger.d('Yearly Salary After Tax: $yearlySalaryAfterTax - rate');
            yearlyTax = yearlySalaryAfterTax + bracket['fixedRate'];
            logger.d('Yearly Tax: $yearlyTax - fixed');
            yearlySalaryAfterTax = yearlySalary - yearlyTax;
            logger.d('Yearly Tax: $yearlySalaryAfterTax - ');
          }
        }
      }
    } else if (type == 'business') {
      if (taxBrackets['business']!.containsKey(selectedYear)) {
        for (var bracket in taxBrackets['business']![selectedYear] ?? []) {
          if (yearlySalary > bracket['lower'] &&
              yearlySalary <= bracket['upper']) {
            taxRate = bracket['variableRate'];
            logger.d('Tax Rate: $taxRate');
            yearlySalaryAfterTax -= (bracket['lower'] - 1);
            logger.d('Yearly Salary After Tax: $yearlySalaryAfterTax - lower');
            yearlySalaryAfterTax *= bracket['variableRate'] / 100;
            logger.d('Yearly Salary After Tax: $yearlySalaryAfterTax - rate');
            yearlyTax = yearlySalaryAfterTax + bracket['fixedRate'];
            logger.d('Yearly Tax: $yearlyTax - fixed');
            yearlySalaryAfterTax = yearlySalary - yearlyTax;
            logger.d('Yearly Tax: $yearlySalaryAfterTax - ');
          }
        }
      }
    }

    double monthlyTax = yearlyTax / 12;
    double monthlySalaryAfterTax = yearlySalaryAfterTax / 12;

    return {
      'monthlySalary': double.parse(monthlySalary.toStringAsFixed(2)),
      'monthlyTax': double.parse(monthlyTax.toStringAsFixed(2)),
      'monthlySalaryAfterTax':
          double.parse(monthlySalaryAfterTax.toStringAsFixed(2)),
      'yearlySalary': double.parse(yearlySalary.toStringAsFixed(2)),
      'yearlyTax': double.parse(yearlyTax.toStringAsFixed(2)),
      'yearlySalaryAfterTax':
          double.parse(yearlySalaryAfterTax.toStringAsFixed(2)),
    };
  }
}
