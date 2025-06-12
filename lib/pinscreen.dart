import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pin = "";
  final TextEditingController _pinController = TextEditingController();

  void onKeyboardTap(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
        _pinController.value = TextEditingValue(text: pin);
      });
    }
  }

  void onBackspace() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
        _pinController.value = TextEditingValue(text: pin);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back,size: 28,),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Icon(CupertinoIcons.lock, size: 40),
            const SizedBox(height: 20),
            const Text(
              "Enter your Pay Sync PIN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: PinCodeTextField(
                readOnly: true,
                length: 4,
                animationType: AnimationType.fade,
                controller: _pinController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 30,
                  fieldWidth: 25,
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.black,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                appContext: context,
                enabled: true,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final List<String> keys = [
                    '1', '2', '3',
                    '4', '5', '6',
                    '7', '8', '9',
                    '', '0', '<'
                  ];
                  String key = keys[index];

                  if (key == '') {
                    return const SizedBox();
                  } else if (key == '<') {
                    return ElevatedButton(
                      onPressed: onBackspace,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                      ),
                      child: const Icon(Icons.backspace),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () => onKeyboardTap(key),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                      ),
                      child: Text(key, style: const TextStyle(fontSize: 20)),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}