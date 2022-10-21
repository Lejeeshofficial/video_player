import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          // child: SizedBox(width: 10,),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF240E8B),
                  Color(0xFF787FF6),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.1, 1.0]),
          ),
        ),
        // backgroundColor:const Color(0xFF6E012A),
        leading: const Icon(
          Icons.ondemand_video_outlined,
          size: 40,
        ),

        title: Text(
          'LXC',
          style: GoogleFonts.podkova(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: const [
          Icon(
            Icons.more_vert_outlined,
            size: 35,
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                    child: GradientText(
                      colors: const [
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                      'Current Watching...',
                      style: GoogleFonts.podkova(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),

                    // child: Container(
                    //   width: 200,
                    //   height: 35,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xFF787FF6),
                    //     borderRadius:BorderRadius.circular(20)
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       'Current Watching...',
                    //       style: GoogleFonts.podkova(
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.w700,
                    //           color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: const BoxDecoration(
                    //   image: DecorationImage( image: AssetImage('lib/assets/image1.png'), ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        // Color(0xFFED1E79),
                        // Color(0xFF662D8C),
                        //  Color(0xFF596164),
                        //   Color(0xFF868F96),
                        Color(0xFF240E8B),
                        Color(0xFF787FF6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.9],
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 10),
                        blurRadius: 20,
                        color: Color(0xa6240E8B),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/asthetic.jpg'),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(80),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                // Color(0xFFED1E79),
                                // Color(0xFF662D8C),
                                //  Color(0xFF596164),
                                //   Color(0xFF868F96),
                                Color(0xFF240E8B),
                                Color(0xFF787FF6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.1, 0.9],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 290,
                          top: 140,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.play_circle_outline_sharp,
                                size: 35, color: Colors.black87),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 8,
                          child: Text(
                            'Special Agent.OSO',
                            style: GoogleFonts.podkova(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 30,
                          child: Text(
                            'John Sam',
                            style: GoogleFonts.podkova(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[900]),
                          ),
                        ),
                        const Positioned(
                          left: 3,
                          top: 187,
                          //bottom: 100,
                          child: SizedBox(
                            width: 180,
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.red,
                              value: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ), //stack
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                    child: Container(
                      width: 150,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Color(0xFF787FF6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          'More Videos',
                          style: GoogleFonts.podkova(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 10,
                    // mainAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  itemBuilder: ((context, index) {
                    return GridTile(child: Container(
                        // width: 190,
                        // height: 130,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 160,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage('lib/assets/image1.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const Positioned(
                                    top: 6,
                                    left: 130,
                                    child: Icon(
                                      Icons.more_vert_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            Text(
                              'Special Agent.OSO',
                              style: GoogleFonts.podkova(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[900]),
                            ),
                            Text(
                              '18:25',
                              style: GoogleFonts.podkova(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              // Container(
              //   // width: 190,
              //   // height: 130,
              //   color: Colors.white,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Stack(
              //         children: [
              //           Container(
              //             width: 160,
              //             height: 100,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               image: const DecorationImage(
              //                   image: AssetImage('lib/assets/image1.png'),
              //                   fit: BoxFit.cover),
              //             ),
              //           ),
              //           const Positioned(
              //               top: 6,
              //               left: 130,
              //               child: Icon(
              //                 Icons.more_vert_outlined,
              //                 size: 25,
              //                 color: Colors.white,
              //               ))
              //         ],
              //       ),
              //       Text(
              //         'Special Agent.OSO',
              //         style: GoogleFonts.podkova(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.blue[900]),
              //       ),
              //       Text(
              //         '18:25',
              //         style: GoogleFonts.podkova(
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //             color: Colors.grey),
              //       ),
              //     ],
              //   ),
              // ),
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children: [
              //               Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image:
              //                           AssetImage('lib/assets/cartoon1.jpeg'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),
              //               const Positioned(
              //                   top: 6,
              //                   left: 132,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'Fire Hero Back',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '10:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children: [
              //               Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image:
              //                           AssetImage('lib/assets/cartoon4.jpeg'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),
              //               const Positioned(
              //                   top: 6,
              //                   left: 130,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'Childern Game',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '22:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children:   [
              //               Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image:
              //                           AssetImage('lib/assets/cartoon2.jpeg'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),

              //              const Positioned(
              //                   top: 6,
              //                   left: 132,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'PAW Patrol',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '50:00',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children:   [
              //               Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image:
              //                           AssetImage('lib/assets/Sita-Ramam-Movie-Stills-01.jpg'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),

              //             const  Positioned(
              //                   top: 6,
              //                   left: 130,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'Seeta Ramam',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '02:18:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children:   [
              //                Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image: AssetImage(
              //                           'lib/assets/deadpool.png'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),

              //            const   Positioned(
              //                   top: 6,
              //                   left: 132,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'DeadPool 3',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '02:08:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children:   [
              //                Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image:
              //                           AssetImage('lib/assets/climbing-2609319_960_720.webp'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),

              //             const  Positioned(
              //                   top: 6,
              //                   left: 130,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'The Adventures',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '18:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Container(
              //       // width: 190,
              //       // height: 130,
              //       color: Colors.white,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Stack(
              //             children:   [
              //                Container(
              //                 width: 160,
              //                 height: 100,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   image: const DecorationImage(
              //                       image: AssetImage(
              //                           'lib/assets/Kongh.png'),
              //                       fit: BoxFit.cover),
              //                 ),
              //               ),

              //              const Positioned(
              //                   top: 6,
              //                   left: 132,
              //                   child: Icon(
              //                     Icons.more_vert_outlined,
              //                     size: 25,
              //                     color: Colors.white,
              //                   ))
              //             ],
              //           ),
              //           Text(
              //             'The Gorilla 3',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.blue[900]),
              //           ),
              //           Text(
              //             '02:18:25',
              //             style: GoogleFonts.podkova(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.grey),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
