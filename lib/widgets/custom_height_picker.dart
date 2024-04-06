import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomHeightPicker extends StatefulWidget {
  CustomHeightPicker({super.key, required this.onHeightChanged});
  final Function(int) onHeightChanged;
  @override
  State<CustomHeightPicker> createState() => _CustomHeightPickerState();
}

class _CustomHeightPickerState extends State<CustomHeightPicker> {
  int currentValue = 0;
  

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
            ),
            Positioned(
                    left: 154,
                    
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
              ),
            ),
            Container(
              child: NumberPicker(
                  axis: Axis.horizontal,
                  itemHeight: 50,
                  itemWidth: 50,
                  minValue: 0,
                  maxValue: 220,
                  itemCount: 7,
                  value: currentValue,
                  onChanged: ( v) {
                    setState(() {
                      currentValue = v;
                      widget.onHeightChanged(currentValue);
                    });
                  }),
            ),
          ],
        )
      ],
    );
  }
}
