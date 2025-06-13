import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<IconData> iconpic = [
  CupertinoIcons.lock,
  Icons.notification_important_outlined,
  CupertinoIcons.mail,
  CupertinoIcons.question_circle,
  Icons.block,
];

List<String> iconlist = [
  "Change PIN",
  "Notification and Email",
  "Invite to Pay Synce",
  "Privacy Policy",
  "Deleted account",
];

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.back),
        title: Text("Settings", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Container(
                    height: 170,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Text("Katherine Smith", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("@Katherine1102", style: TextStyle(color: Colors.grey, fontSize: 13),),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.verified, color: Colors.indigo.shade300, size: 15),
                              SizedBox(width: 5),
                              Text("account verified", style: TextStyle(color: Colors.indigo.shade300, fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/image.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: iconlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                        leading: Icon(iconpic[index], color: index == 4 ? Colors.red : Colors.black,),
                        title: index == 4
                            ? GestureDetector(
                          onTap: () {
                            showWallet(context);
                          },
                          child: Text(iconlist[index], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),),) : Text(iconlist[index],
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),),
                        trailing: Icon(Icons.navigate_next, color: Colors.grey),
                      ),
                      Divider(height: 10),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text("Version 2.1.2(9)", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)), Text("Released on February 04,2021", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5),
                  Container(
                    height: 8,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 50);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height); 
    path.close(); 

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

void showWallet(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
   builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Transfer your wallet cash before deleting account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,), textAlign: TextAlign.center,),
                      SizedBox(height: 10),
                      Text(
                        'Transfer remaining money to your bank account', style: TextStyle(color: Colors.grey[600], fontSize: 14,),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: StadiumBorder(),
                          minimumSize: Size(double.infinity, 48),
                        ),
                        child: Text('Transfer wallet balance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -30,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
