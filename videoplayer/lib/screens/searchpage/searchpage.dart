// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

// class ScreenSearch extends StatelessWidget {
//   const ScreenSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF240E8B),
//                 Color(0xFF787FF6),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.topRight,
//               stops: [0.1, 1],
//             ),
//           ),
//         ),
//         title: Row(
//           children: [
//             // const SizedBox(
//             //   width: 80,
//             // ),
//             Text(
//               'Search',
//               style: GoogleFonts.podkova(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             const Icon(
//               Icons.search_outlined,
//               size: 25,
//               color: Colors.white,
//             )
//           ],
//         ),
//       ),
//       body: Row(
//         children: [
//           Container(
//             height: 70,
//             width: 320,
//             padding: EdgeInsets.fromLTRB(18, 18, 10, 18),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 label: Text(
//                   'Search...',
//                   style: GoogleFonts.podkova(color: Colors.blue),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5),
//                   // borderSide:const BorderSide(  color: Colors.blue),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 35,
//             width: 60,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(10),
//               //  border:OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
//             ),
//             child: Center(
//               child: Text(
//                 'Go',
//                 style: GoogleFonts.podkova(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
