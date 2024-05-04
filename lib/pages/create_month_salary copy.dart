// import 'package:flutter/material.dart';
// import 'package:salarys_v_1/pages/home_page/sideBarDesctop.dart';
// import 'package:salarys_v_1/widget/custom_drop_down_btn.dart';
// import 'package:salarys_v_1/widget/custom_drop_down_simple.dart';
// import 'package:salarys_v_1/widget/custom_text_field.dart';

// class  CreateMonthSalary extends StatefulWidget {
//   const  CreateMonthSalary({super.key});

//   @override
//   State< CreateMonthSalary> createState() => _CreateMonthSalaryState();
// }

// class _CreateMonthSalaryState extends State< CreateMonthSalary> {
//   TextEditingController fullName = TextEditingController();
//   TextEditingController motherName = TextEditingController();
//   TextEditingController  empName = TextEditingController();
//   TextEditingController jobNumber = TextEditingController();
//   TextEditingController empCertificate = TextEditingController();
//   TextEditingController birthDay = TextEditingController();
//   TextEditingController directDay = TextEditingController();
//   TextEditingController bonusDay = TextEditingController();
//   TextEditingController upgradingDay = TextEditingController();
//   TextEditingController ibanNumber = TextEditingController();
//   TextEditingController swiftCodeNumber = TextEditingController();
//   TextEditingController bankName = TextEditingController();
//   TextEditingController accountNumber = TextEditingController();
//   TextEditingController taxType = TextEditingController();
//   TextEditingController taxNumber = TextEditingController();
//   TextEditingController mIdary = TextEditingController();
//   TextEditingController mMihani = TextEditingController();
//   TextEditingController mNaql = TextEditingController();
//   TextEditingController mCildern = TextEditingController();
//   TextEditingController mMarid = TextEditingController();
//   TextEditingController mDriving = TextEditingController();
//   TextEditingController mMansib = TextEditingController();
//   TextEditingController mEngeneer = TextEditingController();
//   TextEditingController mTakhdir = TextEditingController();
//   TextEditingController mIshaa = TextEditingController();
//   TextEditingController mHirafy = TextEditingController();
//   TextEditingController mTibAdly = TextEditingController();
//   TextEditingController mMakTibAdly = TextEditingController();
//   TextEditingController mTashja = TextEditingController();
//   TextEditingController mTaqad = TextEditingController();
//   TextEditingController mTotalMokasasat = TextEditingController();
//   TextEditingController mTotalIstiqta = TextEditingController();
//   TextEditingController mTotalIsthqaq = TextEditingController();
//   TextEditingController mTotalSalaryAmount = TextEditingController();
//   TextEditingController mBaseSalary = TextEditingController();
//   TextEditingController mRisk = TextEditingController();




  









  



  

//   TextEditingController taxationSearchController = TextEditingController();

//   TextEditingController jobTitleSearchController = TextEditingController();

//   final List<String> items = ["fff", "xxx", "ddd", "sss"];

//   final List<String> items2 = [
//     'ذكر',
//     'انثى',
//   ];
//   String? dgreeSelectedValue;
//   String? stageSelectedValue;
//   String? jobTitelSelectedValue;
//   String? genderSelectedValue;
//   String? depSelectedValue;




//   final TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     print("width $width");
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("القسم : ", style: TextStyle(fontFamily: 'Tajawal-Medium',color: Colors.black87 ,)),
//                 CustomDropdownSearch(
//                                     width: 300,
//                                     searchController: jobTitleSearchController,
//                                   title: "",
//                                     items: items2,
//                                     selectedValue: depSelectedValue,
//                                     onChanged: (x) {
//                                       setState(() {
//                                         depSelectedValue = x;
//                                       });
//                                     },
//                                   ),SizedBox(width: 30,),
//               Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xff263238),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: IconButton(
//                       color: Colors.white,
//                       onPressed: () {


//                         print((int.parse(jobNumber.text)+int.parse(fullName.text)));
//                       },
//                       icon: const Row(
//                         children: [
                          
//                           Text("جديد",
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: Colors.white,
//                               )),
//                           Icon(Icons.my_library_add_outlined),
//                         ],
//                       ))),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 3),
//                 decoration: BoxDecoration(
//                     color: const Color(0xff263238),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: IconButton(
//                       color: Colors.white,
//                       onPressed: () {},
//                       icon: const Row(
//                         children: [
//                           Text("حفظ",
//                               style: TextStyle(
//                                 fontFamily: 'Tajawal',
//                                 color: Color(0xFFffffff),
//                               )),
//                           Icon(Icons.save),
//                         ],
//                       )),
//                 ),
//               ),
             
//               Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 3),
//                   decoration: BoxDecoration(
//                       color: const Color(0xff263238),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: IconButton(
//                         color: Colors.white,
//                         onPressed: () {},
//                         icon: const Row(
//                           children: [
//                             Text("حذف",
//                                 style: TextStyle(
//                                   fontFamily: 'Tajawal',
//                                   color: Colors.white,
//                                 )),
//                             Icon(Icons.delete_outline_outlined),
//                           ],
//                         )),
//                   )),
//               Container(
//                   margin: EdgeInsets.symmetric(horizontal: 3),
//                   decoration: BoxDecoration(
//                       color: const Color(0xff263238),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: IconButton(
//                         color: Colors.white,
//                         onPressed: () {},
//                         icon: const Row(
//                           children: [
//                             Text("بحث",
//                                 style: TextStyle(
//                                   fontFamily: 'Tajawal',
//                                   color: Colors.white,
//                                 )),
//                             Icon(Icons.search),
//                           ],
//                         )),
//                   )),
//             ],
//           ),
//         ),
//       ),
//       drawer: const Drawer(
//         child: SideBarDesctop(),
//       ),
//     backgroundColor: const Color(0xffE5E5E5),  body: Row(
//       children: [
//       width>1000?  Expanded(
         
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 50, bottom: 50, right: 10, left: 10),
//             child: Container(height: height*0.8,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(15))),child: SingleChildScrollView(
//                     child: Column(
//                       children: [
                     
//                        SizedBox(
//                                 height: 85,
//                                 width: 300,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "الرقم الوظيفي",
//                                   hint: ' ',
//                                   controller:  jobNumber,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                        SizedBox(
//                                 height: 85,
//                                 width: 300,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "اسم الموظف  ",
//                                   hint: ' ',
//                                   controller:  empName,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
                              
//                                SizedBox(
//                                 height: 85,
//                                 width: 300,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "العنوان الوظيفي",
//                                   hint: ' ',
//                                   controller: jobTitleSearchController ,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ), SizedBox(
//                                 height: 85,
//                                 width: 300,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "التحصيل الدراسي",
//                                   hint: ' ',
//                                   controller: empCertificate ,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               Wrap(children: [
//                                 SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "الراتب الاسمي",
//                                   hint: ' ',
//                                   controller: mBaseSalary,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "م. المخصصات",
//                                   hint: ' ',
//                                   controller: mTotalMokasasat,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "م. الاستحقاق",
//                                   hint: ' ',
//                                   controller: mTotalIsthqaq,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "الضريبة",
//                                   hint: ' ',
//                                   controller: taxNumber,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                                    SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "التقاعد",
//                                   hint: ' ',
//                                   controller: mTaqad,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                                    SizedBox(
//                                 height: 85,
//                                 width: 150,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "م. الاستقطاع",
//                                   hint: ' ',
//                                   controller: mTotalIstiqta,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 85,
//                                 width: 300,
//                                 child:  CustomTextField(isreadOnly: true,
//                                   isdate: false,
//                                   fieldTitle: "صافي الراتب",
//                                   hint: ' ',
//                                   controller: mTotalSalaryAmount,
//                                   onChanged: (x) {},
//                                   obscureText: false,
//                                   titleColor: Colors.black,
//                                   baseColor: Colors.black54,
//                                   borderColor: Colors.black,
//                                   errorColor: Colors.red,
//                                 ),
//                               ),
//                               ],)
//                     ],),
//                   ),
//             ),
//           ),
//         ):Container(),
//         Expanded(
//           flex: 3,
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 50, bottom: 50, right: 10, left: 10),
//             child: Container( height: height*0.8,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(15))),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10, bottom: 50,right: 15),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [

//                         const Padding(
//                           padding: EdgeInsets.all(1.0),
//                           child: Text(
//                             "المخصصات",
//                             style: TextStyle(
//                               fontFamily: 'Tajawal',
//                               color: Color.fromARGB(255, 36, 36, 36),
//                             ),
//                           ),
//                         ),
//                         const Divider(),
//                         Wrap(
//                           children: [
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. خطورة",
//                                  hint: ' 0',
//                                 controller:  mRisk,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. ادارية",
//                                 hint: '0',
//                                 controller: mIdary ,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. مهنية",
//                                hint: ' 0',
//                                 controller:  mMihani,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. المنصب",
//                                hint: '0',
//                                 controller:  mMansib,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. هندسية",
//                           hint: '0',
//                                 controller: mEngeneer ,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. تخدير",
//                                 hint: '0',
//                                 controller:  mTakhdir,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. اشعاع",
//                                hint: '0',
//                                 controller:  mIshaa,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                               SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. تشجيعية",
//                                 hint: ' 0',
//                                 controller:  mTashja,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
                
//                         //#####################################################################################################//
//                         //#####################################################################################################//
//                         //#####################################################################################################//
                
//                         Wrap(
//                           children: [
                          
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. طب عدلي",
//                               hint: ' 0',
//                                 controller:  mTibAdly,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. طب عدلي",
//                               hint: ' 0',
//                                 controller:  mTibAdly,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. زوجية",
//                                 hint: ' 0',
//                                 controller: mMarid ,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. حرفين",
//                                 hint: '0',
//                                 controller:  mHirafy,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
                         
//                             SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. اطفال",
//                                 hint: '0',
//                                 controller:  mCildern,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 85,
//                               width: 150,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. نقل",
//                                 hint: '0',
//                                 controller:  mNaql,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                                SizedBox(
//                               height: 85,
//                               width: 125,
//                               child:  CustomTextField(isreadOnly: false,isdate: false,
//                                 fieldTitle: "م. سواق",
//                                   hint: ' 0',
//                                 controller:  mDriving,
//                                 onChanged: (x) {},
//                                 obscureText: false,
//                                 titleColor: Colors.black,
//                                 baseColor: Colors.black54,
//                                 borderColor: Colors.black,
//                                 errorColor: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )),
//           ),
//         ),
//       ],
//     ),
//     );
//   }
// }
