import 'package:flutter/material.dart';

import 'c.dart';

class RegisterViolationHeader extends StatelessWidget {
  const RegisterViolationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Stack(alignment: AlignmentDirectional.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60.0),
            // Define the corner radius
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: 70,
              color: Colors.blue,
              child:  Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'بيانات المُخالِف',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'المعلومات الاساسية للمنشأة المسجلة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipOval(
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: CircularProgressWithText(
                      totalSteps: 5,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
