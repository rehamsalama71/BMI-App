import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomWeightPicker extends StatefulWidget {
  CustomWeightPicker({super.key, required this.onWeightChanged});
   final Function(int) onWeightChanged;
  
  @override
  State<CustomWeightPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomWeightPicker> {
  int currentValue = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
            ),
            Positioned(
              left: 46,
                child: Container(
                  alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      spreadRadius: 0.1,
                    )
                  ]),
            )),
            Container(
              child: NumberPicker(
                  axis: Axis.horizontal,
                  itemHeight: 45,
                  itemWidth: 45,
                  minValue: 0,
                  maxValue: 220,
                  itemCount: 3,
                  value: currentValue,
                  onChanged: (v) {
                    setState(() {
                      currentValue = v;
                    widget.onWeightChanged(currentValue);
                    });
                  }),
            ),
          ],
        )
      ],
    );
  }
}
