// //Realtime face detection
// import 'package:face_recognition/core/theming/colors.dart';
// import 'package:face_recognition/main.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:math';
// import 'dart:ui';
// import 'package:camera/camera.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

// class RealtimeFaceDetection extends StatefulWidget {
//   const RealtimeFaceDetection({super.key, required this.title});
//   final String title;
//   @override
//   RealtimeFaceDetectionState createState() => RealtimeFaceDetectionState();
// }

// class RealtimeFaceDetectionState extends State<RealtimeFaceDetection> {
//   dynamic controller;
//   bool isBusy = false;
//   dynamic faceDetector;
//   late Size size;
//   late List<Face> faces;
//   late CameraDescription description = cameras[1];
//   CameraLensDirection camDirec = CameraLensDirection.front;
//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   //TODO code to initialize the camera feed
//   initializeCamera() async {
//     //TODO initialize detector
//     final options = FaceDetectorOptions(enableContours: true, enableLandmarks: true);
//     faceDetector = FaceDetector(options: options);

//     controller = CameraController(description, ResolutionPreset.high);
//     await controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       controller.startImageStream((image) => {
//             if (!isBusy) {isBusy = true, img = image, doFaceDetectionOnFrame()}
//           });
//     });
//   }

//   //close all resources
//   @override
//   void dispose() {
//     controller?.dispose();
//     faceDetector.close();
//     super.dispose();
//   }

//   //TODO face detection on a frame
//   dynamic _scanResults;
//   CameraImage? img;
//   doFaceDetectionOnFrame() async {
//     //var frameImg = getInputImage();
//     // List<Face> faces = await faceDetector.processImage(frameImg);
//     // print("faces present = ${faces.length}");
//     setState(() {
//       //_scanResults = faces;
//       isBusy = false;
//     });
//   }

//   final _orientations = {
//     DeviceOrientation.portraitUp: 0,
//     DeviceOrientation.landscapeLeft: 90,
//     DeviceOrientation.portraitDown: 180,
//     DeviceOrientation.landscapeRight: 270,
//   };
//   InputImage? getInputImage() {
//     // get image rotation
//     // it is used in android to convert the InputImage from Dart to Java
//     // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C
//     // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas
//     final camera = cameras[1];
//     final sensorOrientation = camera.sensorOrientation;
//     InputImageRotation? rotation;
//     if (Platform.isIOS) {
//       rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
//     } else if (Platform.isAndroid) {
//       var rotationCompensation = _orientations[controller!.value.deviceOrientation];
//       if (rotationCompensation == null) return null;
//       if (camera.lensDirection == CameraLensDirection.front) {
//         // front-facing
//         rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
//       } else {
//         // back-facing
//         rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
//       }
//       rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
//     }
//     if (rotation == null) return null;

//     // get image format
//     final format = InputImageFormatValue.fromRawValue(img!.format.raw);
//     // validate format depending on platform
//     // only supported formats:
//     // * nv21 for Android
//     // * bgra8888 for iOS
//     if (format == null ||
//         (Platform.isAndroid && format != InputImageFormat.nv21) ||
//         (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

//     // since format is constraint to nv21 or bgra8888, both only have one plane
//     if (img?.planes.length != 1) return null;
//     final plane = img?.planes.first;

//     // compose InputImage using bytes
//     return InputImage.fromBytes(
//       bytes: plane!.bytes,
//       metadata: InputImageMetadata(
//         size: Size(img!.width.toDouble(), img!.height.toDouble()),
//         rotation: rotation, // used only in Android
//         format: format, // used only in iOS
//         bytesPerRow: plane.bytesPerRow, // used only in iOS
//       ),
//     );
//   }

//   //Show rectangles around detected faces
//   Widget buildResult() {
//     if (_scanResults == null || controller == null || !controller.value.isInitialized) {
//       return Text('');
//     }

//     final Size imageSize = Size(
//       controller.value.previewSize!.height,
//       controller.value.previewSize!.width,
//     );
//     CustomPainter painter = FaceDetectorPainter(imageSize, _scanResults, camDirec);
//     return CustomPaint(
//       painter: painter,
//     );
//   }

//   //toggle camera direction
//   void _toggleCameraDirection() async {
//     if (camDirec == CameraLensDirection.back) {
//       camDirec = CameraLensDirection.front;
//       description = cameras[1];
//     } else {
//       camDirec = CameraLensDirection.back;
//       description = cameras[0];
//     }
//     await controller.stopImageStream();
//     // await controller.dispose();
//     // controller = null;
//     setState(() {
//       controller;
//     });

//     initializeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> stackChildren = [];
//     size = MediaQuery.of(context).size;
//     if (controller != null) {
//       stackChildren.add(
//         Positioned(
//           top: 0.0,
//           left: 0.0,
//           width: size.width,
//           height: size.height - 250,
//           child: Container(
//             child: (controller.value.isInitialized)
//                 ? AspectRatio(
//                     aspectRatio: controller.value.aspectRatio,
//                     child: CameraPreview(controller),
//                   )
//                 : Container(),
//           ),
//         ),
//       );

//       stackChildren.add(
//         Positioned(top: 0.0, left: 0.0, width: size.width, height: size.height - 250, child: buildResult()),
//       );
//     }

//     stackChildren.add(Positioned(
//       top: size.height - 250,
//       left: 0,
//       width: size.width,
//       height: 250,
//       child: Container(
//         color: ColorsManager.baseBlueColor,
//         child: Center(
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 80),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.cached,
//                         color: Colors.white,
//                       ),
//                       iconSize: 50,
//                       color: Colors.black,
//                       onPressed: () {
//                         _toggleCameraDirection();
//                       },
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Face detector",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: ColorsManager.botttomNavBarColor,
//       ),
//       backgroundColor: ColorsManager.baseBlueColor,
//       body: Container(
//           margin: const EdgeInsets.only(top: 0),
//           color: Colors.black,
//           child: Stack(
//             children: stackChildren,
//           )),
//     );
//   }
// }

// class FaceDetectorPainter extends CustomPainter {
//   FaceDetectorPainter(this.absoluteImageSize, this.faces, this.camDire2);

//   final Size absoluteImageSize;
//   final List<Face> faces;
//   CameraLensDirection camDire2;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double scaleX = size.width / absoluteImageSize.width;
//     final double scaleY = size.height / absoluteImageSize.height;

//     final Paint paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0
//       ..color = Colors.red;

//     for (Face face in faces) {
//       canvas.drawRect(
//         Rect.fromLTRB(
//           camDire2 == CameraLensDirection.front
//               ? (absoluteImageSize.width - face.boundingBox.right) * scaleX
//               : face.boundingBox.left * scaleX,
//           face.boundingBox.top * scaleY,
//           camDire2 == CameraLensDirection.front
//               ? (absoluteImageSize.width - face.boundingBox.left) * scaleX
//               : face.boundingBox.right * scaleX,
//           face.boundingBox.bottom * scaleY,
//         ),
//         paint,
//       );
//     }

//     Paint p2 = Paint();
//     p2.color = Colors.green;
//     p2.style = PaintingStyle.stroke;
//     p2.strokeWidth = 5;

//     for (Face face in faces) {
//       Map<FaceContourType, FaceContour?> con = face.contours;
//       List<Offset> offsetPoints = <Offset>[];
//       con.forEach((key, value) {
//         if (value != null) {
//           List<Point<int>>? points = value.points;
//           for (Point p in points) {
//             Offset offset = Offset(
//                 camDire2 == CameraLensDirection.front
//                     ? (absoluteImageSize.width - p.x.toDouble()) * scaleX
//                     : p.x.toDouble() * scaleX,
//                 p.y.toDouble() * scaleY);
//             offsetPoints.add(offset);
//           }
//           canvas.drawPoints(PointMode.points, offsetPoints, p2);
//         }
//       });
//     }
//   }

//   @override
//   bool shouldRepaint(FaceDetectorPainter oldDelegate) {
//     return oldDelegate.absoluteImageSize != absoluteImageSize || oldDelegate.faces != faces;
//   }
// }
