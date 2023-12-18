import 'dart:io';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Detection extends StatefulWidget {
  const Detection({Key? key}) : super(key: key);

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  bool isLoading = false;
  late File file = File('');
  List? result;
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      classifyImage();
      showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffFFFFFF),
                    width: 7,
                  ),
                ),
                child: CircularSeekBar(
                  width: double.infinity,
                  height: 200,
                  progress: 100.0,
                  barWidth: 8,
                  startAngle: 45,
                  sweepAngle: 360,
                  strokeCap: StrokeCap.butt,
                  progressGradientColors: const [Color(0xffFF4572), Color(0xffFF4572)],
                  innerThumbRadius: 5,
                  innerThumbStrokeWidth: 3,
                  innerThumbColor: Colors.white,
                  outerThumbRadius: 5,
                  outerThumbStrokeWidth: 10,
                  outerThumbColor: Color(0xffFF4572),
                  dashWidth: 1,
                  dashGap: 2,
                  animation: true,
                  curves: Curves.bounceOut,
                  valueNotifier: _valueNotifier,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (_, double value, __) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${value.round()}', style:TextStyle(
                              color: Color(0xffFF4572),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pop(context);
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Image.file(
                    file,
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text('the Result is :'),
                  const SizedBox(height: 10),
                  Text(
                    result![0]['label'].toString().split(' ')[1],
                    style: const TextStyle(
                      color: Color(0xff00c400),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'with ${result![0]['confidence'] * 100}% confidence',
                    style: const TextStyle(
                      color: Color(0xff00c400),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    }
  }
  Future<void> classifyImage() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/metadata.txt',
    );
    final List? output = await TfLite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      result = output;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const SizedBox(height: 30),
            const Text(
              'Upload\nMegnatic Resonance Image',
              style: TextStyle(
                color: Color(0xff121212),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'You can upload the\nMegnatic Resonance Image on this\npage to see if there is a brain\ntumor or not.',
              style: TextStyle(
                color: Color(0xff121212),
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 1),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFF4572),
                  maximumSize: const Size(290, 50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.cloud_upload,
                      color: Color(0xffFFFFFF),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Upload',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}