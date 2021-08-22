import 'dart:math';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double? height = 120;
  int age = 23;
  int weight = 40;
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 15, 31),
      appBar: AppBar(
        // foregroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text('Bmi Calaculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale
                            ? Colors.blue
                            : Color.fromARGB(255, 17, 19, 36)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 15.0),
                        Text('MALE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: isMale
                            ? Color.fromARGB(255, 17, 19, 36)
                            : Colors.red),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 15.0),
                        Text('FEMALE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              )
            ]),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 17, 19, 36)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HIGHT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height?.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                          )),
                      SizedBox(
                        width: 5.00,
                      ),
                      Text('CM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  Slider(
                      inactiveColor: Colors.white,
                      activeColor: Colors.red,
                      value: height!,
                      min: 80.0,
                      max: 220.0,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(255, 17, 19, 36)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                        Text('$age',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                              ),
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(255, 17, 19, 36)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                        Text('$weight',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'add Weight',
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                            FloatingActionButton(
                              heroTag: 'remove Weight',
                              backgroundColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                              ),
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              onPressed: () {
                result = weight / pow((height! / 100), 2);
                // showDialog(context: context, builder: builder)
                showDialog(
                  barrierLabel: "BMI Result",
                  // barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  // transitionDuration: Duration(milliseconds: 300),
                  context: context,
                  builder: (context) {
                    return Align(
                        alignment: Alignment.center,
                        child: Container(
                            height: 300,
                            child: SizedBox.expand(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 100.0,
                                  child: Text('Result',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 40.0,
                                      )),
                                ),
                                Container(
                                    width: double.infinity,
                                    height: 2.0,
                                    color: Colors.white24),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('${result.round()}',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.white,
                                          fontSize: 80.0,
                                        )),
                                  ),
                                )
                              ],
                            )),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 17, 19, 36),
                              borderRadius: BorderRadius.circular(20),
                            )));
                  },
                );
              },
              height: 50.0,
              child: Text('Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          )
        ],
      ),
    );
  }
}
