// import 'package:Biolx/presentation/home_screen/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Use Future.delayed to navigate after a specific duration
//     Future.delayed(Duration(seconds: 3), () {
//       // Navigate to the HomeScreen after 3 seconds (adjust the duration as needed)
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     });

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Container(
//             height: 610,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage('assets/images/Slogo.png'),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             height: 162,
//             width: double.infinity,
//             child: Text(
//               "Biolx",
//               textAlign: TextAlign.center,
//               style: GoogleFonts.cinzel(
//                 textStyle: TextStyle(
//                   color: Color(0xff8ECFFD),
//                   fontSize: 80,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:Biolx/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to navigate after a specific duration
    Future.delayed(Duration(seconds: 6), () {
      // Navigate to the HomeScreen after 3 seconds (adjust the duration as needed)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 610,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Slogo.png'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 162,
            width: double.infinity,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF64B5F6),
                    Color(0xFF0D47A1),
                  ],
                ).createShader(bounds);
              },
              child: Text(
                "Biolx",
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(
                  textStyle: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
