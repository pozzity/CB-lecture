import 'dart:async';

import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';

enum LoadingType { Circular, Linear }

class LoadingIndicator extends StatefulWidget {
  final bool minimize;
  final Stream<double> stream;
  final double epaisseur;
  final double width;
  final LoadingType type;

//  final void Function(Error e) onError;
//  final void Function() onDone;
//  final void Function(List<int> data) onData;

  LoadingIndicator({
    Key key,
    bool minimize,
    double epaisseur,
    this.width,
    LoadingType type,
    @required this.stream,
//      @required this.onError,
//      @required this.onData,
//      @required this.onDone
  })  : this.minimize = minimize ?? true,
        this.epaisseur = epaisseur ?? 3.0,
        this.type = type ?? LoadingType.Linear,
        super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return progress();
  }

  Widget progress() {
    if (widget.stream == null) return Container();
    return StreamBuilder<double>(
        stream: widget.stream,
        initialData: 0,
        builder: (BuildContext ctx, snapshot) {
          Color color;
          if (snapshot.hasError) color = Colors.red;
          if (!snapshot.hasData) return Container();
//          count += new Uint8List.fromList(snapshot.data).length;
//          fn.log(Count: count);
          if (snapshot.connectionState == ConnectionState.done) fn.log(done: true);
          return widget.type == LoadingType.Circular
              ? circular(snapshot.data, color: color)
              : linear(snapshot.data, color: color);
        });
  }

  Widget circular(double value, {Color color}) {
    final w = widget.width ?? 50;
    return Container(
      height: w,
      width: w,
      child: Stack(
        children: <Widget>[
          SizedBox(
              height: w,
              width: w,
              child: CircularProgressIndicator(
                backgroundColor: color,
                value: value,
                strokeWidth: widget.epaisseur,
              )),
          Center(
            child: Text(
              value == 1.1 ? "done" : "${(value * 100).round()}%",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }

  Widget linear(value, {Color color}) {
    final w = widget.width ?? 150;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
            height: widget.epaisseur,
            width: w,
            child: LinearProgressIndicator(
              backgroundColor: color,
              value: value,
            )),
        Text(
          " ${(value * 100).round()}%",
          style: fn.style.tsBody2,
        )
      ],
    );
  }
}
