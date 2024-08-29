import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient( //write radial in place of linear //search on google webgradients
                  colors: [
                    Color(0xfffbc2eb), //0xff wewrite and then google paste
                    Color(0xffa6c1ee),
                    Color(0xff8fd3f4)
                  ],
                  // begin: FractionalOffset(1.0,0.5), //for LinearGradient
                  // end: FractionalOffset(0.0,0.5), //for LinearGradient
                  stops: [0.2, 1.0, 0.5], //for both gradient
                  center: Alignment.center //for radial gradient
              )
          ),
          child: Center(
            child: Container(
              width: 300,
              // color: Colors.amber,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BMI', style: TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 21,),
                    TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Enter your Weight in (kgs)'),

                          prefixIcon: Icon(Icons.line_weight)
                      ),
                    ),
                    SizedBox(height: 11,),
                    TextField(
                      controller: ftController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Enter your Height (in Feet)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                    ),
                    SizedBox(height: 11,),
                    TextField(
                      controller: inController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Enter your Height (in Inch)'),
                          prefixIcon: Icon(Icons.height)
                      ),
                    ),
                    SizedBox(height: 16,),

                    ElevatedButton(onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        //BMI Calculation
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);
//si inut bmi kbmsquare
                        var tinch = (ift * 12) + iInch;
                        var tCm = tinch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You're OverWeight!! ";
                          bgColor = Colors.orange.shade200;
                        }
                        else if (bmi < 18) {
                          msg = "You're UnderWeight!! ";
                          bgColor = Colors.red.shade200;
                        }
                        else {
                          msg = "You're Healthy!! ";
                          bgColor = Colors.green.shade200;
                        }
                        setState(() {
                          result =
                          "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                        });
                      }
                      else {
                        setState(() {
                          result = "Please fill all the required blanks!!!";
                        });
                      }
                    },
                        child: Text('Calculate')),
                    SizedBox(height: 11,),
                    Text(result, style: TextStyle(fontSize: 19),)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
