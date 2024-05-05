// import 'package:Biolx/presentation/display_screen/display_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:Biolx/presentation/loading_screen.dart';
// import 'dart:convert';
// import 'package:Biolx/core/app_export.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatelessWidget {
//   final TextEditingController _textFieldController = TextEditingController();

//   Future<List<Map<String, dynamic>>> predictNER(String inputText) async {
//     final response = await http
//         .post(
//           Uri.parse('http://192.168.47.119:5000/predict-ner'),
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(<String, String>{
//             'input_text': inputText,
//           }),
//         )
//         .timeout(const Duration(seconds: 300)); // Set timeout to 30 seconds
//     ;

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<Map<String, dynamic>> nerPredictions =
//           List<Map<String, dynamic>>.from(data);
//       return nerPredictions;
//     } else {
//       throw Exception('Failed to load NER predictions');
//     }
//   }

//   Future<String> predictSummary(String inputText) async {
//     final response = await http
//         .post(
//           Uri.parse(
//               'http://192.168.47.119:5000/predict-summary'), //192.168.47.119
//           headers: <String, String>{
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode(<String, String>{
//             'input_text': inputText,
//           }),
//         )
//         .timeout(const Duration(seconds: 300)); // Set timeout to 30 seconds
//     ;

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body)['summary'];
//     } else {
//       throw Exception('Failed to generate summary');
//     }
//   }

//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         extendBodyBehindAppBar: true,
//         body: Container(
//           width: SizeUtils.width,
//           height: SizeUtils.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               stops: [0.1, 0.6, 0.9],
//               colors: [
//                 Color(0xff132740),
//                 Color(0xff000000),
//                 Color(0xff020314),
//               ],
//             ),
//           ),
//           child: Container(
//             width: double.maxFinite,
//             padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 47.v),
//             child: Column(
//               children: [
//                 _buildHeaderRow(context),
//                 Spacer(flex: 64),
//                 SizedBox(
//                   height: 206.v,
//                   width: 256.h,
//                   child: Stack(
//                     alignment: Alignment.topCenter,
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: SizedBox(
//                           width: 256.h,
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Welcome to\n",
//                                   style: CustomTextStyles.displayMediumAlata,
//                                 ),
//                                 TextSpan(
//                                   text: "B",
//                                   style: CustomTextStyles.displayMedium48,
//                                 ),
//                                 TextSpan(
//                                   text: "i",
//                                   style:
//                                       CustomTextStyles.displayMediumEmilysCandy,
//                                 ),
//                                 TextSpan(
//                                   text: "oLx",
//                                   style: CustomTextStyles.displayMedium48,
//                                 ),
//                               ],
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 83.h),
//                           padding: EdgeInsets.all(6.h),
//                           decoration: AppDecoration
//                               .gradientPrimaryContainerToOnErrorContainer
//                               .copyWith(
//                             borderRadius: BorderRadiusStyle.circleBorder45,
//                           ),
//                           child: Card(
//                             clipBehavior: Clip.antiAlias,
//                             elevation: 0,
//                             margin: EdgeInsets.all(0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadiusStyle.roundedBorder38,
//                             ),
//                             child: Container(
//                               height: 77.adaptSize,
//                               width: 77.adaptSize,
//                               padding: EdgeInsets.all(4.h),
//                               decoration: AppDecoration.gradientIndigoToIndigoC
//                                   .copyWith(
//                                 borderRadius: BorderRadiusStyle.roundedBorder38,
//                               ),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   CustomImageView(
//                                     imagePath:
//                                         ImageConstant.imgReplicatePredi67x67,
//                                     height: 67.adaptSize,
//                                     width: 67.adaptSize,
//                                     radius: BorderRadius.circular(33.h),
//                                     alignment: Alignment.center,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: SizedBox(
//                                       height: 64.adaptSize,
//                                       width: 64.adaptSize,
//                                       child: Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           CustomImageView(
//                                             imagePath:
//                                                 ImageConstant.imgIce164x64,
//                                             height: 64.adaptSize,
//                                             width: 64.adaptSize,
//                                             radius: BorderRadius.circular(32.h),
//                                             alignment: Alignment.center,
//                                           ),
//                                           CustomImageView(
//                                             imagePath:
//                                                 ImageConstant.imgLogo61x61,
//                                             height: 61.adaptSize,
//                                             width: 61.adaptSize,
//                                             radius: BorderRadius.circular(30.h),
//                                             alignment: Alignment.center,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 19.v),
//                 Text(
//                   "Your Biomedical Text Companion",
//                   textAlign: TextAlign.center,
//                   style: theme.textTheme.headlineSmall,
//                 ),
//                 Spacer(flex: 40),
//                 _buildTextOrDocumentTextField(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderRow(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 4.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomImageView(
//             imagePath: ImageConstant.imgIcons8Back96Xxxhdpi,
//             height: 30.adaptSize,
//             width: 30.adaptSize,
//             margin: EdgeInsets.only(bottom: 2.v),
//             onTap: () {
//               onTapImgIconsBackXxxhdpi(context);
//             },
//           ),
//           GestureDetector(
//             onTap: () {
//               onTapTxtBack(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.only(left: 2.h),
//               child: Text(
//                 "Back",
//                 style: theme.textTheme.headlineSmall,
//               ),
//             ),
//           ),
//           Spacer(),
//           CustomImageView(
//             imagePath: ImageConstant.imgEllipsisVIcon,
//             height: 28.v,
//             width: 7.h,
//             margin: EdgeInsets.symmetric(vertical: 2.v),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextOrDocumentTextField(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       constraints: BoxConstraints(
//         maxHeight: 150.0,
//       ),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 0, 0, 0),
//         borderRadius: BorderRadius.circular(20.0),
//         border: Border.all(color: Color(0xff8ECFFD)),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             onPressed: () {
//               // Handle attachment icon tap
//             },
//             icon: Icon(
//               Icons.attach_file_outlined,
//               color: Color(0xff8ECFFD),
//               size: 35,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 8.0),
//               child: TextField(
//                 controller: _textFieldController,
//                 style: TextStyle(color: Color(0xff8ECFFD)),
//                 maxLines: 5,
//                 minLines: 1,
//                 maxLength: null,
//                 decoration: InputDecoration(
//                   hintText: 'Type your message...',
//                   hintStyle: TextStyle(color: Color(0xff8ECFFD)),
//                   border: InputBorder.none,
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoadingScreen()),
//               );

//               String inputText = _textFieldController.text;
//               List<dynamic> nerPredictionsDynamic = await predictNER(inputText);
//               List<Map<String, dynamic>> nerPredictions = nerPredictionsDynamic
//                   .map((prediction) => prediction as Map<String, dynamic>)
//                   .toList();
//               String summary = await predictSummary(inputText);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DisplayScreen(
//                     nerPredictions: nerPredictions,
//                     summary: summary,
//                   ),
//                 ),
//               );
//             },
//             icon: Icon(
//               Icons.send,
//               color: Color(0xff8ECFFD),
//               size: 35,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   onTapImgIconsBackXxxhdpi(BuildContext context) {
//     Navigator.pop(context);
//   }

//   onTapTxtBack(BuildContext context) {
//     Navigator.pop(context);
//   }
// }

import 'package:Biolx/presentation/display_screen/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:Biolx/presentation/loading_screen.dart';
import 'dart:convert';
import 'package:Biolx/core/app_export.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  Future<List<Map<String, dynamic>>> predictNER(String inputText) async {
    final response = await http
        .post(
          Uri.parse('http://192.168.47.119:5000/predict-ner'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'input_text': inputText,
          }),
        )
        .timeout(const Duration(seconds: 300)); // Set timeout to 30 seconds
    ;

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> nerPredictions =
          List<Map<String, dynamic>>.from(data);
      return nerPredictions;
    } else {
      throw Exception('Failed to load NER predictions');
    }
  }

  Future<String> predictSummary(String inputText) async {
    final response = await http
        .post(
          Uri.parse(
              'http://192.168.47.119:5000/predict-summary'), //192.168.47.119
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'input_text': inputText,
          }),
        )
        .timeout(const Duration(seconds: 300)); // Set timeout to 30 seconds
    ;

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['summary'];
    } else {
      throw Exception('Failed to generate summary');
    }
  }

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.6, 0.9],
              colors: [
                Color(0xff132740),
                Color(0xff000000),
                Color(0xff020314),
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 47.v),
            child: Column(
              children: [
                Spacer(flex: 64),
                SizedBox(
                  height: 206.v,
                  width: 256.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 256.h,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Welcome to\n",
                                  style: CustomTextStyles.displayMediumAlata,
                                ),
                                TextSpan(
                                  text: "B",
                                  style: CustomTextStyles.displayMedium48,
                                ),
                                TextSpan(
                                  text: "i",
                                  style:
                                      CustomTextStyles.displayMediumEmilysCandy,
                                ),
                                TextSpan(
                                  text: "oLx",
                                  style: CustomTextStyles.displayMedium48,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 83.h),
                          padding: EdgeInsets.all(6.h),
                          decoration: AppDecoration
                              .gradientPrimaryContainerToOnErrorContainer
                              .copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder45,
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.roundedBorder38,
                            ),
                            child: Container(
                              height: 77.adaptSize,
                              width: 77.adaptSize,
                              padding: EdgeInsets.all(4.h),
                              decoration: AppDecoration.gradientIndigoToIndigoC
                                  .copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder38,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgReplicatePredi67x67,
                                    height: 67.adaptSize,
                                    width: 67.adaptSize,
                                    radius: BorderRadius.circular(33.h),
                                    alignment: Alignment.center,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgIce164x64,
                                            height: 64.adaptSize,
                                            width: 64.adaptSize,
                                            radius: BorderRadius.circular(32.h),
                                            alignment: Alignment.center,
                                          ),
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgLogo61x61,
                                            height: 61.adaptSize,
                                            width: 61.adaptSize,
                                            radius: BorderRadius.circular(30.h),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.v),
                Text(
                  "Your Biomedical Text Companion",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
                Spacer(flex: 40),
                _buildTextOrDocumentTextField(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextOrDocumentTextField(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 150.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color(0xff8ECFFD)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Handle attachment icon tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'There was a problem. Please input text instead.',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red, // Customize the color as needed
                ),
              );
            },
            icon: Icon(
              Icons.attach_file_outlined,
              color: Color(0xff8ECFFD),
              size: 35,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _textFieldController,
                style: TextStyle(color: Color(0xff8ECFFD)),
                maxLines: 5,
                minLines: 1,
                maxLength: null,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Color(0xff8ECFFD)),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoadingScreen()),
              );

              String inputText = _textFieldController.text;
              List<dynamic> nerPredictionsDynamic = await predictNER(inputText);
              List<Map<String, dynamic>> nerPredictions = nerPredictionsDynamic
                  .map((prediction) => prediction as Map<String, dynamic>)
                  .toList();
              String summary = await predictSummary(inputText);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayScreen(
                    nerPredictions: nerPredictions,
                    summary: summary,
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.send,
              color: Color(0xff8ECFFD),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
