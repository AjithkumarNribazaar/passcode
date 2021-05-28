import 'package:flutter/material.dart';
import 'package:passcode/pages/home_page.dart';
import 'package:passcode/pages/main_page.dart';

import 'mpin_widget.dart';

class MPinPage extends StatefulWidget {
  @override
  _MPinPageState createState() => _MPinPageState();
}

class _MPinPageState extends State<MPinPage> {
  MPinController mPinController = MPinController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white38, Colors.white70],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MPinWidget(
                    pinLegth: 4,
                    controller: mPinController,
                    onCompleted: (mPin) {
                      print('You entered -> $mPin');
                      if (mPin == '5522') {
                        Navigator.push(
                          context,MaterialPageRoute(builder:(context)=>LandingPage()),
                        );

                      } else {
                        //animate wrong input
                        mPinController.notifyWrongInput();
                      }
                    },
                  ),
                  SizedBox(height: 32),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: List.generate(
                        9, (index) => buildMaterialButton(index + 1)),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                      ),
                      buildMaterialButton(0),
                      MaterialButton(
                        onPressed: () {
                          mPinController.delete();
                        },
                        textColor: Colors.black,
                        child: Icon(Icons.backspace_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput('$input');
      },
      textColor: Colors.black,
      child: Text(
        '$input',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}