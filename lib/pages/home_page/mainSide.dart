


import 'package:flutter/material.dart';
import '/widget/HomeButton.dart';
import '/widget/summaryContaner.dart';

class MainSideDesctop extends StatefulWidget {
  const MainSideDesctop({super.key});

  @override
  State<MainSideDesctop> createState() => _MainSideDesctopState();
}

class _MainSideDesctopState extends State<MainSideDesctop> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("width $width   height  $height");
    return Expanded(
        flex: 11,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.white),
          body: Container(
            color: Color(0xffE5E5E5),
            height: height,
            child: Column(children: [
              Row(textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SummaryUpdates(
                    amount: "37550443100",
                    title: "صافي الراتب",
                  ),
                  SummaryUpdates(
                    amount: "38550455120",
                    title: "استحقاق الراتب",
                  ),
                  SummaryUpdates(
                    amount: "1200335300",
                    title: "مجموع الاستقطاع",
                  ),
                  SummaryUpdates(
                    amount: "4475",
                    title: "عدد الموظفين",
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  children: [
                    Row(textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img8.png', fit: BoxFit.cover),
                          title: "التنقلات",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img2.png', fit: BoxFit.cover),
                          title: "العلاوات",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img9.png', fit: BoxFit.cover),
                          title: "الترفيعات",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img3.png', fit: BoxFit.cover ),
                          title: "اعداد الرواتب الشهرية",
                        )
                      ],
                    ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img11.png', fit: BoxFit.cover),
                          title: "التقارير",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img6.png', fit: BoxFit.cover),
                          title: "الاستقطاعات",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img1.png', fit: BoxFit.cover),
                          title: "اعداد موحد الرواتب",
                        ),
                        HomeButton(onPressed: (){},
                          iconPath:
                              Image.asset('assets/img10.png', fit: BoxFit.cover),
                          title: "الكلف التخمينية",
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
