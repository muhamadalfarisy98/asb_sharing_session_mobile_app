import 'package:flutter/material.dart';
// import 'LoginScreen.dart';
import 'GetDataProduct.dart';

class StartingScreen extends StatefulWidget {

  @override
  _StartingScreenState createState() => _StartingScreenState();
}
class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/chart.png',
                  height: 150,
                  width: 300,
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                TextSpan(
                text: 'WELCOME TO',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                    text: '\n    TOKO-Faris',
                    style: TextStyle(
                      shadows: [
                        Shadow(blurRadius: 10,
                        color: Colors.green[200],
                        offset: Offset(5.0,5.0))
                      ],
                      fontWeight: FontWeight.bold, 
                      color: Colors.green[300],
                      fontSize: 20),
                  )
                ]
              ),
                style: TextStyle(fontSize: 20),
              ),],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'see amazing products!',
                  style: TextStyle(fontSize: 19),)
              ],
            ),
            SizedBox(height: 30),
            // LOGIN
            Container(
              height: 40.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                boxShadow: [BoxShadow(blurRadius: 5,
                color: Colors.blue,offset: Offset(1,3))]
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Route route = MaterialPageRoute(builder: (context) => HomeScreen());
                  Navigator.pushNamed(context, '/data');
                  // Navigator.push(context, route);
                },
                child: Text('Login', 
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,)
                ),
            ),
            SizedBox(height: 40),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(
            //       "OR",
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17,),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 40),
            // Container(
            //   height: 40.0,
            //   width: 350.0,
            //   decoration: BoxDecoration(
            //     color: Colors.yellow[400],
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(10.0)),
            //     boxShadow: [BoxShadow(blurRadius: 5,
            //     color: Colors.blue,offset: Offset(1,3))]
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Route route = MaterialPageRoute(builder: (context) => HomeScreen());
            //       Navigator.pushNamed(context, '/login');
            //       // Navigator.push(context, route);
            //     },
            //     child: Text('Login', 
            //     style: TextStyle(color: Colors.white, fontSize: 18),
            //     textAlign: TextAlign.center,)
            //     ),
            // ),
          ],
        )],
      ),),
    );
  }
}