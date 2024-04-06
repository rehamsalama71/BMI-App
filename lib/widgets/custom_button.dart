import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient:
              const LinearGradient(colors: [Colors.blue, Colors.black45])),
      child: ElevatedButton(
        
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.only(
                right: 75, left: 75, top: 15, bottom: 15)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            )),
        onPressed: widget.onPressed,
        child: const Text(
          'CALCULATE BMI',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
