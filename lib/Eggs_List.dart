// import 'package:flutter/material.dart';

// class EggsList extends StatefulWidget {
//   const EggsList({super.key});

//   @override
//   State<EggsList> createState() => _EggsListState();
// }

// class _EggsListState extends State<EggsList> {
//   final List<Map<String, String>> DairEggs = [
//     {
//       "image": "assets/image/pngfuel 16.png",
//       "name": "Egg Chicken Red",
//       "quantity": "4pcs",
//       "price": "\$1.99",
//     },
//     {
//       "image": "assets/image/pngfuel 18.png",
//       "name": "Egg Chicken White",
//       "quantity": "180g",
//       "price": "\$1.50"
//     },
//     {
//       "image": "assets/image/hiclipart 2.png",
//       "name": "Egg Pasta ",
//       "quantity": "30gm",
//       "price": "\$15.99"
//     },
//     {
//       "image": "assets/image/egg-noodle (1) 2.png",
//       "name": "Egg Noodles",
//       "quantity": "2L",
//       "price": "\$15.99"
//     },
//     {
//       "image": "assets/image/American-Garden-Mayonnaise-Eggless-473ml 2.png",
//       "name": "Mayonnais Eggless",
//       "quantity": "500g",
//       "price": "\$4.77"
//     },
//     {
//       "image": "assets/image/rp_24790392_0053554627_l 2.png",
//       "name": "Egg Noodles",
//       "quantity": "200g",
//       "price": "0.50"
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(
//           Icons.arrow_left,
//           color: Colors.transparent,
//         ),
//         title: TextField(
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.search,
//               size: 25,
//             ),
//             suffixIcon: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: CircleAvatar(
//                   backgroundColor: Colors.grey.shade400,
//                   radius: 5,
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.white,
//                     size: 18,
//                   )),
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.all(Radius.circular(15))),
//             fillColor: Colors.grey.shade200,
//             filled: true,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.tune_outlined,
//                   size: 30,
//                 )),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50),
//         child: Column(
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 15,
//                   childAspectRatio: 1,
//                 ),
//                 itemCount: DairEggs.length,
//                 itemBuilder: (context, index) {
//                   final eggList = DairEggs[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       width: 180,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Image.asset(
//                             eggList["image"]!,
//                             height: 80,
//                             width: 80,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   eggList["name"]!,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   eggList["quantity"]!,
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 14),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       eggList["price"]!,
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       width: 60,
//                                     ),
//                                     Container(
//                                       height: 40,
//                                       width: 40,
//                                       decoration: BoxDecoration(
//                                           color: Colors.green,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(15))),
//                                       child: IconButton(
//                                           onPressed: () {},
//                                           icon: Icon(
//                                             Icons.add,
//                                             color: Colors.white,
//                                           )),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
