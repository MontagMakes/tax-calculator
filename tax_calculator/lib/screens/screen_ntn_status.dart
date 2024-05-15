// import 'package:webdriver/async_io.dart';

// class NtnStatus {
//   // Create a new WebDriver instance
//   Future<WebDriver> initDriver() async {
//     WebDriver driver = await createDriver(
//         uri: Uri.parse(
//             'http://localhost:4444/'), // replace with your WebDriver server URI
//         desired: Capabilities.chrome);

//     return driver;
//   }

//   void getNTNStatus() async {
//     late WebDriver driver;
//     try {
//       driver = await initDriver();
//     } catch (e) {
//       print('Could not create WebDriver: $e');
//     }
    

//     // Go to the website
//     await driver.get('https://www.befiler.com/tax-tools/ntn-status');

//     // Find the text field by its name attribute
//     final textField = await driver.findElement(const By.id('NTN'));
//     // Type your ID into the text field
//     await textField.sendKeys('4130353456037');

//     // Find the search button by its name attribute and click it
//     final searchButton = await driver.findElement(const By.id('findNTNBtn'));
//     await searchButton.click();

//     // Wait for the page to load and get the results
//     await Future.delayed(const Duration(seconds: 10)); // Wait up to 10 seconds

//     final regNo = await driver.findElement(const By.id('registrationNo'));
//     final refNo = await driver.findElement(const By.id('referenceNo'));

//     print("Registration No: ${regNo.text}");
//     print("Reference No: ${refNo.text}");

//     // Close the browser
//     await driver.quit();
//   }
// }
