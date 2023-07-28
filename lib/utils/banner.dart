// import 'package:flutter/material.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:tolongbeliin_costumer/utils/carousel_model.dart';
//
// class BannerCarousel extends StatefulWidget {
//   @override
//   _BannerCarouselState createState() => _BannerCarouselState();
// }
//
// class _BannerCarouselState extends State<BannerCarousel> {
//   int _current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 150,
//             child: Swiper(
//                 onIndexChanged: (index) {
//                   setState(() {
//                     _current = index;
//                   });
//                 },
//                 autoplay: true,
//                 layout: SwiperLayout.DEFAULT,
//                 itemCount: carousels.length,
//                 itemBuilder: (BuildContext context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(
//                             image: AssetImage(carousels[index].image),
//                             fit: BoxFit.cover)),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
