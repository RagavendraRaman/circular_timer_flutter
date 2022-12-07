import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  CountDownController _controller = CountDownController();
  bool _isPause = false;

  @override
  Widget build(BuildContext context) {

    var timerDuration = 120;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Timer'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: Row(
               children: [
                 Container(
                  height: 50,
                  width: 100,
                  color: Colors.amber,
          ),
          IconButton(
                  onPressed: () {
                       setState(() {
                          if(_isPause){
                _isPause = false;
                _controller.resume();
              }else{
                _isPause = true;
                _controller.pause();
              }
                       });
                  },
                  icon: Icon(_isPause ? Icons.play_arrow : Icons.pause,color: Colors.amber,),
                ),
               ],
             ),
           ),
          CircularCountDownTimer(
              width: 100,
              height: 100,
              duration: timerDuration * 60,
              fillColor: Colors.transparent,
              ringColor: Colors.transparent,
            controller: _controller,
            backgroundColor: Colors.transparent,
            strokeWidth: 0.0,
            strokeCap: StrokeCap.butt,
            isTimerTextShown: true,
            isReverse: true,
            onComplete: (){
                Alert(
                    context: context,
                    title: 'Done',
                  style: const AlertStyle(
                    isCloseButton: true,
                    isButtonVisible: false,
                    titleStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  type: AlertType.success
                ).show();
            },
            textStyle: const TextStyle(fontSize: 25.0,color: Colors.black),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: (){
      //       setState(() {
      //         if(_isPause){
      //           _isPause = false;
      //           _controller.resume();
      //         }else{
      //           _isPause = true;
      //           _controller.pause();
      //         }
      //       });
      //     },
      //     icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
      //     label: Text(_isPause ? 'Resume' : 'Pause'),
      // ),
    );
  }
}













