
import 'package:flutter/material.dart';
import 'package:tecno_bmi_app/pages/result_page.dart';
import 'package:tecno_bmi_app/widgets/custom_age_counter.dart';
import 'package:tecno_bmi_app/widgets/custom_button.dart';
import 'package:tecno_bmi_app/widgets/custom_height_picker.dart';
import 'package:tecno_bmi_app/widgets/custom_weight_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstImageActive = false;
  String Gender = '';

   int selectedHeight = 0;
     int selectedWeight = 0; 
     int selectedAge = 20; 

  void updateAge(int newAge) {
    setState(() {
      selectedAge = newAge;
    });
  }
    void updateHeight(int newHeight) {
    setState(() {
      selectedHeight = newHeight;
    });
  }
    void updateWeight(int newWeight) {
    setState(() {
      selectedWeight = newWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Gender',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageContainer(true,), // First image
              const SizedBox(width: 20),
              _buildImageContainer(false,),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: const Text(
              'Height (cm)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomHeightPicker(
            onHeightChanged: updateHeight,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child:  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Hero(
                          tag: 'age${selectedAge.toString()}',
                          child: Text(
                            'Age',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      AgeCounter(
                        onAgeChanged: updateAge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                       Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Hero(
                            tag: 'weight${selectedWeight.toString()}',
                            child: Text(
                              'Weight (Kg)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      CustomWeightPicker(
                        onWeightChanged: updateWeight,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ResultPage(
                  weigth: selectedWeight, 
                  heigth: selectedHeight,
                   age: selectedAge,
                   gender: Gender,
                   );
              },
            ));
          })
        ]),
      ),
    );
  }

  Widget _buildImageContainer(bool isFirstImage) {
    final String imagePath = isFirstImage
      ? 'assets/images/photo_2024-03-30_04-22-12.jpg'
      : 'assets/images/photo_2024-03-30_04-22-07.jpg'; 
    return GestureDetector(
      
      onTap: () {
        setState(() {
          firstImageActive = isFirstImage;

          Gender = isFirstImage ? 'Male' : 'Female';
        });
      },
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: firstImageActive == isFirstImage ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                isFirstImage
                    ? 'assets/images/photo_2024-03-30_04-22-12.jpg'
                    : 'assets/images/photo_2024-03-30_04-22-07.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5,
              right: 8,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.check,
                  color: firstImageActive == isFirstImage
                      ? Colors.blue
                      : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
