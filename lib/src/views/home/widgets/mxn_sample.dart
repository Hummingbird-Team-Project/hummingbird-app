import 'package:flutter/material.dart';

import '../../../../../core/enum/mxnRate.dart';
import '../../../../../core/widgets/mxnContainer.dart';

class MxNSample extends StatelessWidget {
  const MxNSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MxNcontainer(
                MxN_rate: MxNRate.TWOBYONE,
                MxN_child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MxNcontainer(
                MxN_rate: MxNRate.ONEBYONE,
                MxN_child: Container(
                  color: Colors.amber,
                ),
              ),
              MxNcontainer(
                MxN_rate: MxNRate.ONEBYONE,
                MxN_child: Container(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MxNcontainer(
                    MxN_rate: MxNRate.ONEBYTWO,
                    MxN_child: Container(
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MxNcontainer(
                    MxN_rate: MxNRate.ONEBYONE,
                    MxN_child: Container(
                      color: Colors.green,
                    ),
                  ),
                  MxNcontainer(
                    MxN_rate: MxNRate.ONEBYONE,
                    MxN_child: Container(
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
