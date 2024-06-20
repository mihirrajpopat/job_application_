//
// Map<String, bool> values = {
//   'hindi': true,
//   'Read': false,
//   'Write': false,
//   'Speak': false,
// };
//
// List<Map> val = [
//   {
//     'hindi': true,
//     'Read': false,
//     'Write': false,
//     'Speak': false,
//   },
//   {
//     'English': true,
//     'Read': false,
//     'Write': false,
//     'Speak': false,
//   },
//   {
//     'Gujrati': true,
//     'Read': false,
//     'Write': false,
//     'Speak': false,
//   },
// ];
//
// List<CheckboxItem> fList = [
//   CheckboxItem(
//     index: 1,
//     name: "male",
//   ),
//   CheckboxItem(
//     index: 2,
//     name: "female",
//   ),
// ];
// String radioItem = 'male';
// import 'package:flutter/material.dart';
//
// class LanguageKnown extends StatelessWidget {
//   const LanguageKnown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Column(
//           children: val
//               .map(
//                 (line) => SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Expanded(
//                     child: Row(
//                       children: [
//                         Row(
//                           children: line.keys
//                               .map((key) => Row(
//                                     children: [
//                                       SizedBox(
//                                         width: 90,
//                                         child: Row(
//                                           children: [
//                                             SizedBox(
//                                               width: 43,
//                                               child: CheckboxListTile(
//                                                 contentPadding: EdgeInsets.zero,
//                                                 dense: true,
//                                                 visualDensity: const VisualDensity(
//                                                   horizontal: VisualDensity.minimumDensity,
//                                                   vertical: VisualDensity.minimumDensity,
//                                                 ),
//                                                 value: line[key],
//                                                 onChanged: (bool? value) {
//                                                   setState(() {
//                                                     line[key] = value!;
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Flexible(
//                                                 child: Text(
//                                               "$key ",
//                                               style: TextStyle(fontSize: 13),
//                                             )),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ))
//                               .toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//         InkWell(
//           onTap: () {
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text("JAPANIS"),
//                     content: InkWell(
//                       onTap: () {
//                         val.add(
//                           {
//                             'japanish': true,
//                             'Read': false,
//                             'Write': false,
//                             'Speak': false,
//                           },
//                         );
//                         setState(() {});
//                       },
//                       child: Text("ADD"),
//                     ),
//                   );
//                 });
//           },
//           child: Text("ADD"),
//         ),
//       ],
//     );
//   }
// }
