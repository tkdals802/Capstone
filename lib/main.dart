import 'package:flutter/material.dart';
import 'modelViewer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Fitting',
      home: signIn(),
    );
  }
}

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Stack(
          children: <Widget>[
            const Image(
              image: AssetImage("images/jh.png"),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 45.0),
              child: Center(
                child: Column(
                  children: const <Widget>[
                    CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("images/is.png")),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "\nVR Fitting",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 40.0),
                    ),
                    Text(
                      "\n키와\n 몸무게를 \n입력해보거라\n",
                      style: TextStyle(
                          fontFamily: "Bamin",
                          color: Colors.red,
                          fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                    secondSignIn()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class secondSignIn extends StatefulWidget {
  const secondSignIn({super.key});

  @override
  _secondSignInState createState() => _secondSignInState();
}

class _secondSignInState extends State<secondSignIn> {
  int w = 0;
  int h = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Form(
              child: Theme(
            data: ThemeData(
                inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.red, fontSize: 40.0))),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.monitor_weight,
                          color: Colors.teal.shade400,
                        ),
                        hintText: "몸무게를입력하세요"),
                    onChanged: (value) {
                      w = int.parse(value);
                    },
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.teal.shade400,
                        ),
                        hintText: "키를입력하세요"),
                    onChanged: (value) {
                      h = int.parse(value);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("완료"),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ModelScreen(weight: w, height: h)),
                      );
                    },
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
