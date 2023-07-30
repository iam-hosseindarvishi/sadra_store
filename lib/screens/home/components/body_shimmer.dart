import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class BodyShimmer extends StatelessWidget {
  const BodyShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 250,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingIndicator(
                indicatorType: Indicator.ballPulseSync,
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.yellow,
                  Colors.blueAccent,
                  Colors.greenAccent,
                ],
              ),
              // SizedBox(
              //   height: 50,
              // ),
              Text(
                "دریافت اطلاعات از سرور مرکزی",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          )),
    );
  }
}
