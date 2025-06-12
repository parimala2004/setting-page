import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChangePinPage extends StatefulWidget {
  @override
  _ChangePinPageState createState() => _ChangePinPageState();
}

class _ChangePinPageState extends State<ChangePinPage> {
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool isConfirming = false;

  void onKeyTap(String value) {
    setState(() {
      final controller = isConfirming ? confirmController : pinController;
      if (value == 'back') {
        if (controller.text.isNotEmpty) {
          controller.text =
              controller.text.substring(0, controller.text.length - 1);
        }
      } else {
        if (controller.text.length < 6) {
          controller.text += value;
        }
      }
    });
  }

  void onSave() {
    final pin = pinController.text;
    final confirm = confirmController.text;

    if (pin.length < 4 || confirm.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PIN must be at least 4 digits")),
      );
      return;
    }

    if (pin != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PINs do not match")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PIN Set Successfully")),
      );
    }
  }

  Widget buildKey(String value, {IconData? icon}) {
    return Expanded(
      child: GestureDetector(
        onTap: () =>
            onKeyTap(value),
        child: Container(
          margin: EdgeInsets.all(4),
          height:40,
          decoration: BoxDecoration(

            color:icon==null ?Colors.white:Colors.transparent,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(

            child: icon != null
                ? Icon(icon, size: 28)
                : Text(value, style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }

  Widget buildKeyboard() {
    return Container(
      color: Colors.black26,
      padding: EdgeInsets.fromLTRB(0,0,8,70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [buildKey('1'), buildKey('2'), buildKey('3')]),
          Row(children: [buildKey('4'), buildKey('5'), buildKey('6')]),
          Row(children: [buildKey('7'), buildKey('8'), buildKey('9')]),
          Row(
            children: [
              Spacer(),
              buildKey('0'),
              buildKey('back', icon: Icons.backspace_outlined),

            ],
          ),
        ],

      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, bool isConfirm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          obscureText: true,
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          onTap: () {
            setState(() {
              isConfirming = isConfirm;
            });
          },
          decoration: InputDecoration(
            hintText: "Enter new PIN",
            hintStyle: TextStyle(color: Colors.black26,fontSize: 15),
            prefixIcon: Icon(CupertinoIcons.lock),

          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:Icon(CupertinoIcons.back,size: 29,),
          title: Text('Change PIN',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 2,),
                  buildTextField("Enter new PIN", pinController, false),
                  buildTextField("Confirm new PIN", confirmController, true),
                  ElevatedButton(
                    onPressed: onSave,
                    child: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(280, 50),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildKeyboard(),
        ],
      ),
    );
  }
}