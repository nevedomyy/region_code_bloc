import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'custom_widget.dart';
import 'bloc.dart';


class RegionCode extends StatefulWidget {
  @override
  _RegionCodeState createState() => _RegionCodeState();
}

class _RegionCodeState extends State<RegionCode> {
  final _bloc = BLoC();
  Offset _offset = Offset(0, -14);

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width/2;
    double _height = MediaQuery.of(context).size.height/2;
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            StreamBuilder(
              stream: _bloc.stream,
              initialData: '99|\n\nг. Москва',
              builder: (context, snapshot){
                List<String> data = snapshot.data.split('|');
                return Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 24.0, color: Colors.white, fontFamily: 'AdventPro'),
                      children: [
                        TextSpan(text: data[0], style: TextStyle(fontSize: 100.0)),
                        TextSpan(text: data[1])
                      ]
                    ),
                  )
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: CustomPaint(
                size: Size.infinite,
                painter: CustomWidget(),
              ),
            ),
            Transform.translate(
              offset: _offset,
              child: GestureDetector(
                onPanUpdate: (data){
                  double angle = math.atan2(data.globalPosition.dy-_height, data.globalPosition.dx-_width);
                  _offset = Offset((_width-30)*math.cos(angle), _height-57+(_height-44)*math.sin(angle));
                  _bloc.sink(angle);
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    color: Colors.white,
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(14),
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}