import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class Counter extends StatefulWidget {
  final String number;
  final Color color;
  final String title;
  Counter({
    Key key, this.number, this.color, this.title,
  }) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(.26)
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                    color: widget.color,
                    width: 2
                )
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(
          widget.number,
          style: TextStyle(
            fontSize: 20,
            color: widget.color,
          ),
        ),
        Text(
          widget.title,
          style: SubTextStyle,
        )
      ],
    );
  }


}