import 'package:flutter/material.dart';
import 'package:mvp/modelViewer_Man.dart';
import 'modelViewer_Women.dart';

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
            //const Image(image: AssetImage("images/jh.png"),),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 90.0, vertical: 45.0),
              child: Center(
                child: Column(
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.black38,
                      //backgroundImage: AssetImage("images/is.png")
                    ),
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
                      "\n키와\n 몸무게를 \n입력해주세요\n",
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
  double w = 0;
  double h = 0;
  double temp = 0;
  double real_h = 0;
  double real_w = 0;
  String gender = "";
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
                      w = double.parse(value);
                      real_w = w;
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
                      h = double.parse(value);
                      temp = h;
                      real_h = h;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(overlayColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.redAccent;
                            }
                            return null;
                          },
                        )),
                        child: const Text("남자"),
                        onPressed: () {
                          gender = "Man";
                          print('w $w');
                          print('h $h');
                        },
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ButtonStyle(overlayColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.redAccent;
                            }
                            return null;
                          },
                        )),
                        child: const Text("여자"),
                        onPressed: () {
                          gender = "Women";
                          print('w $w');
                          print('h $h');
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: const Text("완료"),
                    onPressed: () async {
                      double bmi = 0;
                      bmi = real_w / ((temp / 100) * (temp / 100));

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            if (bmi < 15) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                content: const Text('너무 말랐어요'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('확인'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            } else if (bmi > 30) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                content: const Text('너무 뚱뚱해요'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('확인'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            } else {
                              if (bmi < 20) {
                                //저체중
                                w = 0.5;
                              } else if (20 <= bmi && bmi <= 24) {
                                //정상
                                w = 1.0;
                              } else if (25 <= bmi && bmi <= 29) {
                                //과체중
                                w = 1.5;
                              } else {
                                //비만
                                w = 1.8;
                              }
                              /*
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ModelScreen2(weight: w, height: h)),
            );
            */
                              print('w $w');
                              print('h $h');
                              if (gender == "Man") {
                                h = real_h;
                                h = h - 170;
                                h = 1.5 - 0.1 * h;
                                return ModelScreen(weight: w, height: h);
                              } else {
                                h = real_h;
                                h = h - 160;
                                h = 1.5 - 0.1 * h;
                                return ModelScreen2(weight: w, height: h);
                              }
                            }
                          });
                    },
                  ),
                  Row(
                    children: [Container()],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  dynamic nextPage() {}
}
