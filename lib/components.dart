import 'package:flutter/material.dart';
import 'constants.dart';
class genderCard extends StatelessWidget {
  genderCard({required this.genderName, required this.icon});
  late final String genderName;
  late final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(genderName,style: labelTextStyle)

      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,this.cardChild, this.onPressed});
  late final Color colour;
  late final Widget? cardChild;
  late void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,


        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(color: colour,borderRadius: BorderRadius.circular(10)),

      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonTitle});
  late final void Function() onTap;
  late final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: bottomContainerHeight,

        child: Center(child: Text(buttonTitle, style: largeButtonTextStyle,)),
      ),
    );
  }
}

class roundIconButton extends StatelessWidget {
  roundIconButton({required this.icon, required this.onPressed});
  late final IconData icon;
  late final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon),
    );
  }
}

