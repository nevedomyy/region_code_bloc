import 'dart:math' as math;
import 'dart:async';
import 'data.dart';


class BLoC{
  final _controller = StreamController<String>();
  final _region = Regions();

  Stream<String> get stream => _controller.stream;

  sink(double angle){
    int i = ((math.pi-angle)*130)~/(2*math.pi);
    _controller.sink.add(_region.getRegion(i));
  }

  dispose() => _controller.close();
}