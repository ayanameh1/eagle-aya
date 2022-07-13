// import 'package:eagle/components/components.dart';
// import 'package:eagle/constants/colors.dart';
// import 'package:eagle/ui/add_expo2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class AddExpoScreen extends StatefulWidget {
//   const AddExpoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddExpoScreen> createState() => _AddExpoScreenState();
// }
//
// class _AddExpoScreenState extends State<AddExpoScreen> {
//   String? value;
//
//
//   @override
//   Widget build(BuildContext context) {
//     var sizeAware = MediaQuery.of(context).size;
//     TextEditingController fnamecontroller = TextEditingController();
//     TextEditingController lnamecontroller = TextEditingController();
//     TextEditingController postitlecontroller = TextEditingController();
//     TextEditingController phone1controller = TextEditingController();
//     TextEditingController curaddresscontroller = TextEditingController();
//     TextEditingController emailaddresscontroller = TextEditingController();
//     TextEditingController compnamecontroller = TextEditingController();
//     TextEditingController phone2controller = TextEditingController();
//     TextEditingController busemailcontroller = TextEditingController();
//     TextEditingController faxnumcontroller = TextEditingController();
//     TextEditingController countrycontroller = TextEditingController();
//
//
//     //list
//     String? value;
//     final items = [
//       'Syria',
//       'Lebanon',
//       'Sudan',
//       'Russia',
//       'India',
//       'Armenia',
//       'Belarus',
//       'Brazil',
//       'Egypt',
//       'Iran',
//       'Jordan',
//       'Oman',
//       'palestine',
//       'Pakistan',
//       'Qatar',
//       'United-Arab-Emirates',
//       'Philippines'
//     ];
//     DropdownMenuItem<String> buildMenuItem(String? item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item!,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ));
//
//     //images
//     File? image;
//     String? _image;
//     final picker = ImagePicker();
//     Future getImageFromGallery() async {
//       final pickedFile =
//           await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
//
//       setState(() {
//         if (pickedFile != null) {
//           _image = pickedFile.path;
//         }
//       });
//     }
//
//     Future showOptions() async {
//       showCupertinoModalPopup(
//         context: context,
//         builder: (context) => CupertinoActionSheet(
//           actions: [
//             CupertinoActionSheetAction(
//               child: Text('Photo Gallery'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 getImageFromGallery();
//               },
//             ),
//           ],
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Image(
//           image: const AssetImage('assets/images/Group 8.png'),
//           width: sizeAware.width * 299 / 1080,
//           height: sizeAware.height * 131 / 1920,
//         ),
//         shadowColor: Colors.black.withOpacity(0),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SafeArea(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Container(
//                 width: sizeAware.width * 406 / 1080,
//                 height: sizeAware.width * 111 / 1920,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: darkpurple,
//                 ),
//                 child: Text(
//                   'Step 1',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: white,
//                     fontFamily: 'Uniform',
//                     fontWeight: FontWeight.bold,
//                     //fontSize: 30,
//                   ),
//                 ),
//               ),
//               SizedBox(height: sizeAware.height * 124 / 1920),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text('Personal information'),
//                         ],
//                       ),
//                       SizedBox(
//                         height: sizeAware.height * 47 / 1920,
//                       ),
//                       TextFormField(
//                         controller: fnamecontroller,
//                         keyboardType: TextInputType.name,
//                         onFieldSubmitted: (String value) {
//                           print(value);
//                         },
//                         onChanged: (String value) {
//                           print(value);
//                         },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'first name is not be empty';
//                             }
//                             return null;
//                           },
//                         decoration: const InputDecoration(
//                           labelText: 'First Name',
//                           border: OutlineInputBorder( borderRadius: BorderRadius.all(
//                             Radius.circular(54),),),
//                           focusColor: Color(0xffffd100),
//                         )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller:lnamecontroller ,
//                           keyboardType: TextInputType.name,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'last name is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration: const InputDecoration(
//                             labelText: 'Last Name',
//                             border: OutlineInputBorder( borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                           controller: postitlecontroller,
//                           keyboardType: TextInputType.text,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'position title is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:const  InputDecoration(
//                             labelText: 'Position Title',
//                             border: OutlineInputBorder( borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: phone1controller,
//                         keyboardType: TextInputType.phone,
//                         onFieldSubmitted: (String value) {
//                           print(value);
//                         },
//                         onChanged: (String value) {
//                           print(value);
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Phone Number is not be empty';
//                           }
//                           return null;
//                         },
//                         decoration:const  InputDecoration(
//                           labelText: 'Phone Number',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                             Radius.circular(54),),),
//                           focusColor: Color(0xffffd100),
//                         )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: curaddresscontroller,
//                         keyboardType: TextInputType.text,
//                         onFieldSubmitted: (String value) {
//                           print(value);
//                         },
//                         onChanged: (String value) {
//                           print(value);
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'current address is not be empty';
//                           }
//                           return null;
//                         },
//                         decoration:const InputDecoration(
//                           labelText: 'Current Address',
//                           border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                             Radius.circular(54),),),
//                           focusColor: Color(0xffffd100),
//                         )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: emailaddresscontroller,
//                         keyboardType: TextInputType.emailAddress,
//                         onFieldSubmitted: (String value) {
//                           print(value);
//                         },
//                         onChanged: (String value) {
//                           print(value);
//                         },
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'email address is not be empty';
//                           }
//                           return null;
//                         },
//                         decoration:const InputDecoration(
//                           labelText: 'Email Address',
//
//                           border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                             Radius.circular(54),),),
//                           focusColor: Color(0xffffd100),
//                         )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.grey[400],
//                     border: Border.all(
//                       width: 1,
//                     )),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text('Company information'),
//                         ],
//                       ),
//                       SizedBox(
//                         height: sizeAware.height * 47 / 1920,
//                       ),
//                       TextFormField(
//                         controller: compnamecontroller,
//                           keyboardType: TextInputType.name,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'company name is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:const InputDecoration(
//                             labelText: 'Company name',
//
//                             border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: phone2controller,
//                           keyboardType: TextInputType.phone,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'phone number is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:const InputDecoration(
//                             labelText: 'Phone Number',
//
//                             border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: busemailcontroller,
//                           keyboardType: TextInputType.emailAddress,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'business email is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:const InputDecoration(
//                             labelText: 'Business Email',
//
//                             border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       TextFormField(
//                         controller: faxnumcontroller,
//                           keyboardType: TextInputType.number,
//                           onFieldSubmitted: (String value) {
//                             print(value);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'fax number is not be empty';
//                             }
//                             return null;
//                           },
//                           decoration:const InputDecoration(
//                             labelText: 'Fax Number',
//
//                             border: OutlineInputBorder(borderRadius: BorderRadius.all(
//                               Radius.circular(54),),),
//                             focusColor: Color(0xffffd100),
//                           )),
//                       SizedBox(
//                         height: sizeAware.height * 28 / 1920,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular((50.0)),
//                           border: Border.all(),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             value: value,
//                             iconSize: 36,
//                             hint: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: ListTile(
//                                 title: Text('Country'),
//                               ),
//                             ),
//                             icon: const Icon(Icons.arrow_drop_down),
//                             isExpanded: true,
//                             items: items.map(buildMenuItem).toList(),
//                             onChanged: (value) =>
//                                 setState(() => this.value= value),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.grey[400],
//                     border: Border.all(
//                       width: 1,
//                     )),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [
//                         Expanded(
//                           child: Text(
//                             'Please provide a brochure to make it easier for visitor to understand your work and connect with you',
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: sizeAware.height * 47 / 1920,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 0, left: 0),
//                       child: GestureDetector(
//                         onTap: () {
//                           showOptions();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: Colors.grey[200],
//                               border: Border.all(
//                                 width: 1,
//                               )),
//                           child: Center(
//                             child: _image == null
//                                 ? Padding(
//                                     padding:
//                                         EdgeInsets.fromLTRB(25, 25, 25, 25),
//                                     child: Icon(
//                                       Icons.image,
//                                       size: 40,
//                                       color: Color(0xFF03566E),
//                                     ),
//                                   )
//                                 : Image.file(File(_image!)),
//                           ),
//                         ),
//                       ))] ),
//                     ),
//                  // ]),
//                 //),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.grey[400],
//                     border: Border.all(
//                       width: 1,
//                     )),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [
//                         Expanded(
//                           child: Text(
//                             'How to would you like to present your product?',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: sizeAware.height * 47 / 1920,
//                     ),
//                     const Text('')
//                   ]),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.grey[400],
//                     border: Border.all(
//                       width: 1,
//                     )),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 202 / 1920,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 359 / 1080,
//                 height: MediaQuery.of(context).size.height * 82 / 1920,
//                 child: MaterialButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddExpo2Screen(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Next",
//                     style: TextStyle(
//                       color: black,
//                       fontFamily: 'Uniform',
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(54),
//                     color: yellow1,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0xff565656),
//                         spreadRadius: 0,
//                         blurRadius: 0,
//                         offset: Offset(2, 4),
//                       ),
//                     ]),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
