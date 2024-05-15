import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaxNoticeSupportScreen extends StatefulWidget {
  const TaxNoticeSupportScreen({super.key});

  @override
  State<TaxNoticeSupportScreen> createState() => _TaxNoticeSupportScreenState();
}

class _TaxNoticeSupportScreenState extends State<TaxNoticeSupportScreen> {
  @override
  Widget build(BuildContext context) {
    Key formKey = GlobalKey<FormState>();

    TextEditingController myController = TextEditingController();

    @override
    void initState() {
      super.initState();
      myController.text = "Initial text";
      myController.selection = TextSelection.collapsed(
        offset: myController.text.length,
      );
    }

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              padding: const EdgeInsets.only(left: 20),
              iconSize: 40,
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: const Color(0xFFaf0e0e),
            title: const IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                    width: 20,
                  ),
                  Text(
                    "Tax Notice Support",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFff0000),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 35.0, right: 35.0, bottom: 10.0, top: 10.0),
                    child: Text(
                      "Kindly provide pertinent details regarding the notice you have received",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))),
        body: Column(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Notice Date",
                      style: TextStyle(color: Color(0xFFaf0e0e)),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Notice Type",
                      style: TextStyle(color: Color(0xFFaf0e0e)),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: myController,
                        decoration: const InputDecoration(
                          hintText: "e.g Audit, income Tax, Sales Tax, Penalty",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Tax Year",
                      style: TextStyle(color: Color(0xFFaf0e0e)),
                    ),
                    SizedBox(
                      height: 45,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xFFaf0e0e)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              width: 380,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(left: 10, right: 0)),
                    side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Color(0xFFaf0e0e))),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Please upload your Text Notice here",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cloud_upload,
                            color: Colors.red,
                          ))
                    ],
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Add another attachment",
                    style: TextStyle(color: Color(0xFFaf0e0e), fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFFaf0e0e),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFFaf0e0e)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      )),
                  FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFFaf0e0e)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
