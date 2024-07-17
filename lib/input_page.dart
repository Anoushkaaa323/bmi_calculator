import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 1.0,
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activecardColour
                        : inactiveCardColour,
                    cardChild: genderCard(
                      genderName: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? activecardColour
                        : inactiveCardColour,
                    cardChild: genderCard(
                      genderName: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activecardColour,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:8),
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: numberTextStyle,
                            ),
                            Text(
                              "kg",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: roundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight -= 1;
                                      });
                                    })),
                            Expanded(
                                child: roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activecardColour,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 8,),
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(), style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: roundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            )),
                            Expanded(
                              child: roundIconButton(
                                icon:FontAwesomeIcons.plus,
                                onPressed:(){
                                  setState(() {
                                    age+=1;
                                  });
                                }
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          BottomButton(buttonTitle: "CALCULATE",
          onTap: (){
            Calculator calc= Calculator(height: height, weight: weight);

            Navigator.push(context,
          MaterialPageRoute(builder: (context)=> ResultsPage(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          )));},)
        ],
      ),
    );
  }
}



