// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:sizer/sizer.dart';
// import '../../../constants/api_url.dart';
// import '../../../controllers/saving_schemes_screens_controllers/saving_schemes_list_screen_controller.dart';

// class PageViewbuilders extends StatelessWidget {
//   PageViewbuilders({Key? key}) : super(key: key);
//   final savingSchemesListScreenController =
//       Get.find<SavingSchemesListScreenController>();
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: savingSchemesListScreenController.specialofferlist.length,
//       itemBuilder: (context, i, realIndex) {
//         // String imgUrl = ApiUrl.apiMainPath +
//         //     screenController.announcementOfferList[i].imageurl;
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey,
//               image: DecorationImage(
//                   image: NetworkImage(
//                     ApiUrl.apiImagePath +
//                         savingSchemesListScreenController
//                             .specialofferlist[i].imagePath,
//                   ),
//                   fit: BoxFit.cover),
//             ),
//           ),
//         ) /*.commonSymmetricPadding(horizontal: 5)*/;
//       },
//       options: CarouselOptions(
//         height: Get.size.height * 0.25,
//         autoPlay: true,
//         viewportFraction: 0.90,
//         // autoPlayAnimationDuration: const Duration(seconds: 10),
//         autoPlayInterval: const Duration(seconds: 10),
//       ),
//     );
//   }

//   // Widget _imageModule(String imgUrl) {
//   // }
// }

// class Listviewbuilder extends StatelessWidget {
//   Listviewbuilder({Key? key}) : super(key: key);
//   final savingSchemesListScreenController =
//       Get.find<SavingSchemesListScreenController>();

//   @override
//   Widget build(BuildContext context) {
//     int index = 0;
//     List<String> text = [
//       'Swarna Sanchay',
//       'No Making Charge',
//       '11+1 Months Scheme',
//     ];
//     List<String> text2 = [
//       'Pay for 24 months,we will give 1 month payment as bonus',
//       'Pay for 12 months to avail free making charge.',
//       'Pay for 11 months,we will pay for additional one month',
//     ];
//     return ListView.builder(
//         itemCount: savingSchemesListScreenController.specialofferlist.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(() => const NextScreen(),
//                     arguments: savingSchemesListScreenController
//                         .specialofferlist[index]);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: 180,
//                           width: 15,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(12),
//                               topLeft: Radius.circular(12),
//                             ),
//                             color: index.floor().isEven
//                                 ? Colors.green
//                                 : Colors.blue,
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   savingSchemesListScreenController
//                                       .specialofferlist[index].schemeName,
//                                   style: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.redAccent),
//                                 ),
//                                 SizedBox(
//                                   height: Get.size.height * 0.02,
//                                 ),
//                                 Text(
//                                   savingSchemesListScreenController
//                                       .specialofferlist[index].schemeTagLine,
//                                   style: const TextStyle(
//                                       fontSize: 15, color: Colors.black),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Padding(
//                                   padding: const EdgeInsets.all(16),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       MoreInfoButtonModule(
//                                         onTap: () {
//                                           Get.to(() => const NextScreen(),
//                                               arguments:
//                                                   savingSchemesListScreenController
//                                                       .specialofferlist[index]);
//                                         },
//                                       ),
//                                       SizedBox(
//                                         width: Get.size.width * 0.03,
//                                       ),
//                                       const EnrollButtonModule()
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
