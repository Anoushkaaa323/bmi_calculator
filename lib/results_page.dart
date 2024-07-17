import 'package:flutter/material.dart';
import 'constants.dart';
import 'components.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.interpretation, required this.resultText});
  late final String bmiResult;
  late final String resultText;
  late final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result", style: titleTextStyle,),
          )),
          Expanded(
            flex:5,
            child: ReusableCard(colour: activecardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText.toUpperCase(), style: resultTextStyle,),
                Text(bmiResult,style: bmiTextStyle,),
                Text(interpretation, style: bodyTextStyle,
                textAlign: TextAlign.center,)
              ],
            ),
            )
          ),
          BottomButton(onTap: (){Navigator.pop(context);}, buttonTitle: 'RE-CALCULATE')
        ],
      ),

    );
  }
}
