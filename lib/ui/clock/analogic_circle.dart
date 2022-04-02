import 'package:flutter/material.dart';

class AnalogicCircle extends StatelessWidget {
  const AnalogicCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isPortait = height > width;
    return Container(
      height: isPortait ? height * 0.5 : height * 0.6,
      width: width * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 5),
            blurRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            //color: Colors.red[800],
            shape: BoxShape.circle,
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.3, 0.7, 0.9],
              colors: [
                Color(0xff7d7158),
                Color(0xff6f6c65),
                Color(0xff6a6a6a),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '12',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            '6',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '3',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
