import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SI Calcualtor',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SI calculator',
          ),
        ),
        body: SICalculator(),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    );
  }
}

class SICalculator extends StatefulWidget {
  @override
  _SICalculatorState createState() => _SICalculatorState();
}

class _SICalculatorState extends State<SICalculator> {
  var _formKey=GlobalKey<FormState>();
  double _answer = 0.0;
  List<String> _currencies = ['Rupees', 'Pounds', 'Dollar'];
  String _currentCurrency = 'Rupees';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.caption;
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          //Image.asset(''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: principalController,
              validator: (String value){
                if(value.isEmpty)
                  return 'Please enter the principal amount';
              },
              decoration: InputDecoration(
                labelText: 'Principal',
                labelStyle: textStyle,
                   errorStyle: TextStyle(color:Colors.orangeAccent),
                hintText: 'eg 5000',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: roiController,
              validator: (String value)
              {
                if(value.isEmpty)
                  return 'Please Enter a rate';
              },
              decoration: InputDecoration(
                labelText: 'Rate Of Interest',
                labelStyle: textStyle,
                errorStyle: TextStyle(color:Colors.orangeAccent),
                hintText: 'eg 3',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: termController,
                    validator: (String value){
                      if(value.isEmpty)
                        return 'Please Enter term';
                    },
                    decoration: InputDecoration(
                      labelText: 'Term',
                         errorStyle: TextStyle(color:Colors.orangeAccent),
                      hintText: 'eg 3 years',
                      border: OutlineInputBorder(),
                      
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String eachString) {
                      return DropdownMenuItem(
                        child: Text(eachString),
                        value: eachString,
                      );
                    }).toList(),
                    onChanged: (String stringSelected) {
                      setState(() {
                        _currentCurrency = stringSelected;
                      });
                    },
                    value: _currentCurrency,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if(_formKey.currentState.validate())
                          _answer= calculator();
                      });
                     
                    },
                    child: Text('Calculate'),
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
               
              '$_answer',
            ),
          ),
        ],
      ),
    );

  }
  double calculator()
  {
    double principal=double.parse(principalController.text);
    double rate=double.parse(roiController.text);
    double term=double.parse(termController.text);
    return principal*rate*term/100;
  }
  void reset()
  {
    principalController.text='';
    roiController.text='';
    termController.text='';
    _currentCurrency=_currencies[0];
  }
}
