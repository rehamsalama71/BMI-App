
import 'package:flutter/material.dart';
import 'package:tecno_bmi_app/pages/home_page.dart';
import 'package:tecno_bmi_app/widgets/constant.dart';
import 'package:tecno_bmi_app/widgets/retry_button.dart';

class ResultPage extends StatefulWidget {
  ResultPage({
    super.key,
    required this.weigth,
    required this.heigth,
    required this.age, required this.gender,
  });
  final int weigth;
  final int heigth;
  final int age;
  final String gender;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0;
  late String adviceText;
   late String bmiText;

    void initState() {
    super.initState();
    calculateBMI();
     setAdvice();
  }

  void calculateBMI() {
  
    double weightInKg = widget.weigth.toDouble();
    double heightInMeters = widget.heigth / 100;
    bmi = weightInKg / (heightInMeters * heightInMeters);
     bmiText = bmi.toStringAsFixed(2);

  }
  void setAdvice() {
    if (bmi < 18.5) {
      adviceText =   'According to your BMI, you fall within the underweight range. It\'s important to maintain a healthy weight to reduce the risk of nutrient deficiencies and other health complications associated with being underweight. Consider consulting with a healthcare professional for guidance on achieving a balanced weight.';
    } else if (bmi < 25) {
      adviceText = 'According to your BMI, you fall within the normal weight range. This is a positive result as it indicates that your weight is generally healthy. However, it\'s still important to maintain a balanced diet and engage in regular physical activity to support overall well-being.';
    } else if (bmi < 30) {
      adviceText =   'According to your BMI, you fall within the overweight range. It\'s advisable to take steps towards achieving a healthier weight to reduce the risk of obesity-related health issues. Consider consulting with a healthcare professional or a registered dietitian for personalized guidance on nutrition and exercise.';
    } else if (bmi < 35) {
      adviceText =  'According to your BMI, you fall within the obesity range. It\'s crucial to prioritize your health and take steps towards weight management. Consult with a healthcare professional or a registered dietitian to create a suitable plan for achieving a healthier weight and reducing the risk of obesity-related diseases.';
    } else {
      adviceText =       'According to your BMI, you fall within the extremely obesity range. It\'s crucial to prioritize your health and consult with a healthcare professional or a registered dietitian for personalized guidance on weight management. They can provide tailored advice on nutrition, exercise, and other interventions to support your journey';
    }
  }
  

  
  @override
  Widget build(BuildContext context) {
    bmi = widget.weigth / ((widget.heigth / 100) * (widget.heigth / 100));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Back',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text(
                    'Result',
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              ' Your BMI is',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: kprimaryColor,
              width: 70,
              height: 80,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    bmiText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      ' Kg/m2',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
               '(' +
                  (bmi < 18.5
                      ? 'UnderWeight'
                      : bmi < 25
                          ? 'Normal weight'
                          : bmi < 30
                              ? 'OverWeight'
                              : bmi < 35
                                  ? 'Obese'
                                  : 'Extremely Obese') +
                  ')',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: kprimaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              widget.gender == 'Male'
                                  ? 'assets/images/photo_2024-03-30_04-22-12.jpg'
                                  : 'assets/images/photo_2024-03-30_04-22-07.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                        widget.gender == 'Male' ? 'Male' : 'Female',
                            style:
                                TextStyle(color: kprimaryColor, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Hero(
                            tag: 'age-<span class="math-inline">\{widget\.age\}',
                            child: Text(
                              widget.age.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(17),
                          child: Text(
                            ' age',
                            style:
                                TextStyle(color: kprimaryColor, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Hero(
                        tag: 'height\-</span>{widget.heigth}',
                            child: Text(
                              (widget.heigth).toInt().toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(17),
                          child: Text(
                            ' Height',
                            style:
                                TextStyle(color: kprimaryColor, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Hero(
                            tag: 'weightResult',
                            child: Text(
                              widget.weigth.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(17),
                          child: Text(
                            ' weight',
                            style:
                                TextStyle(color: kprimaryColor, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xff2566CF))),
                    child: Center(
                  child: Text(
                    adviceText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            RetryButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
