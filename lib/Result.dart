import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resultLetter;
  final Function resetHandler;

  const Result(this.resultLetter, this.resetHandler, {Key? key})
      : super(key: key);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultLetter == 'A') {
      resultText = 'Downtown Living';
      //print(resultScore);
    } else if (resultLetter == 'B') {
      resultText = 'Cozy & Comfortable';
      //print(resultScore);
    } else if (resultLetter == 'C') {
      resultText = 'Thrifty & Thriving';
    } else if (resultLetter == 'D') {
      resultText = 'Parking Parking Parking';
    } else {
      resultText = 'privacy Please!';
     //print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultLetter',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: () => resetHandler(),
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}