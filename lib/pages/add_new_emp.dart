
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '/db/db_helper.dart';
import '/pages/home_page/sideBarDesctop.dart';
import '/widget/custom_drop_down_btn.dart';
import '/widget/custom_drop_down_simple.dart';
import '/widget/custom_text_field.dart';

class AddNewEmp extends StatefulWidget {
  const AddNewEmp({super.key});

  @override
  State<AddNewEmp> createState() => _AddNewEmpState();
}

class _AddNewEmpState extends State<AddNewEmp> {
  TextEditingController motherName = TextEditingController();

  TextEditingController empName = TextEditingController();
TextEditingController jobTitleController= TextEditingController();
  TextEditingController jobNumber = TextEditingController();
  TextEditingController empCertificate = TextEditingController();
  int certificateMony = 0; //مخصصات شهادة

  TextEditingController birthDay = TextEditingController();
  TextEditingController directDay = TextEditingController();
  TextEditingController bonusDay = TextEditingController();
  TextEditingController upgradingDay = TextEditingController();
  TextEditingController ibanNumber = TextEditingController();
  TextEditingController swiftCodeNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController mIdary = TextEditingController();
  int mIdaryMony = 0;
  TextEditingController mMihani = TextEditingController();
  int mMihaniMony = 0;
  TextEditingController mNaql = TextEditingController();
  int locationMony = 0; // نقل

  TextEditingController mCildern = TextEditingController();
  int childMony = 0; //اطفال
  TextEditingController mMaridController = TextEditingController();
  int maridMony = 0; //زوجية

  TextEditingController mDriving = TextEditingController();
  int mDrivingMony = 0;
  TextEditingController mMansib = TextEditingController();
  int mMansibMony = 0;
  TextEditingController mEngeneer = TextEditingController();
  int mEngeneerMony = 0;
  TextEditingController mTakhdir = TextEditingController();
  int mTakhdirMony = 0;
  TextEditingController mIshaa = TextEditingController();
  int mIshaaMony = 0;
  TextEditingController mHirafy = TextEditingController();
  int mHirafyMony = 0;
  TextEditingController mTibAdly = TextEditingController();
  int mTibAdle1Mony = 0;
  TextEditingController mMakTibAdly = TextEditingController();
  int mTibAdle2Mony = 0;
  TextEditingController mTashja = TextEditingController();
  int mTashjaMony = 0;
  TextEditingController mTaqad = TextEditingController();

  int taxMony = 0; //الضريبة
  int taqud = 0; // التقاعد

  TextEditingController mTotalMokasasat = TextEditingController();
  int totalMokasasat = 0;
  TextEditingController mTotalIstiqta = TextEditingController();
  int totalAstiqta = 0;
  TextEditingController mTotalIsthqaq = TextEditingController();
  int totalIsthqaq = 0;
  TextEditingController mTotalSalaryAmount = TextEditingController();
  int totalFinalSalary = 0;
  TextEditingController mBaseSalary = TextEditingController();
  int baseSalary = 0; //راتب اسمي

  TextEditingController mRisk = TextEditingController();
  int mRiskMony = 0;
  TextEditingController mGamia = TextEditingController();
  int mGamiaMony = 0;
  TextEditingController mHimaia = TextEditingController();
  int himaia = 0; //حماية
  TextEditingController mDirasat = TextEditingController();
  int mDirasatMony = 0;
  TextEditingController notse = TextEditingController();
  TextEditingController musahmatTaqaudControler = TextEditingController();

  int musahmatTaqaud = 0; //مساهمات تقاعدية
  int astiqtaaFromSalary = 0; //استقطاع من الراتب

  TextEditingController certificateSearchController = TextEditingController();
  TextEditingController jobTitleSearchController = TextEditingController();

  final List<String> gender = ["ذكر", "انثى"];
  final List<String> mMaridL = ["متزوج", "اعزب"];
  final List<String> childNumList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8'
  ];

  List<Map<String, dynamic>> _sectionsData = [];
  List<Map<String, dynamic>> _daribaData = [];
  List<Map<String, dynamic>> _locationData = [];
  List<Map<String, dynamic>> _jobTiltelsData = [];
  List<Map<String, dynamic>> _certificateData = [];

  final List<String> sections = [];
  final List<String> jobTitles = [];
  final List<String> daribaStat = [];
  final List<String> locationList = [];
  final List<String> certificateList = [];

  final List<String> degree = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  final List<String> stage = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11'
  ];
  String? dgreeSelectedValue;
  String? stageSelectedValue;
  String? daribaSelectedState;
  String? jobTitelSelectedValue;
  String? certificateSelectedValue;

  String? genderSelectedValue;
  String? depSelectedValue;
  String? mMarid = "اعزب";
  String? location = "لا يوجد";
  String? taxTable;
  String? childNumSelected = '0';
  String? otherChildNumSelected = '0';

  List<bool> openSection = [true, false, false];

  DatabaseManager databaseManager = DatabaseManager();

  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
    setState(() {
      getJobTitle(xx: null);
      mNaql.text=0.toString();

    });

    mMaridController.text=maridMony.toString();
    mCildern.text=childMony.toString();
  }

  getcertificateMony() async {
    if (certificateSelectedValue!.isNotEmpty) {
      var cer = await databaseManager.fetchDataWhere(
          'SELECT * FROM certificateTable WHERE certificate=?',
          [certificateSelectedValue]);
      cer.asMap();

      double cerCal = (cer.first['nes'] * baseSalary);
      certificateMony = cerCal.toInt();
calculateSalary();
      print(" certificateMony= $certificateMony");
    } else {
      certificateMony = 0;
    }
    empCertificate.text = certificateMony.toString();
  }

  void getBaseSalary() async {
    if (stageSelectedValue != null && dgreeSelectedValue != null) {
      var salary = await databaseManager.fetchDataWhere(
          'SELECT * FROM salaryStage WHERE dgree=? AND step=?',
          [int.parse(dgreeSelectedValue!), int.parse(stageSelectedValue!)]);
      salary.asMap();

      baseSalary = salary.first['salary'];
      taqud = (baseSalary * 0.1).toInt();
      mBaseSalary.text = baseSalary.toString();
      himaia = (baseSalary * 0.0025).toInt();
      mHimaia.text = himaia.toString();
      mTaqad.text = taqud.toString();
      if (certificateSelectedValue != null &&
          certificateSelectedValue!.isNotEmpty) {
        getcertificateMony();
      }
      print("baseSalary  =  $baseSalary");
    } else {
      baseSalary = 0;
    }
  }

  void getLocatinMony() async {
    var selectLocation = await databaseManager
        .fetchDataWhere('SELECT * FROM locations WHERE location=?', [location]);
    selectLocation.asMap;
    setState(() {
      selectLocation.asMap;

      locationMony = selectLocation.first['amont'];
            mNaql.text = locationMony.toString();
       calculateSalary();
      print("locationMony = $locationMony");
    });
  }

  void getData() async {
    await databaseManager.connectToDatabase();
    _sectionsData = await databaseManager.fetchData('SELECT * FROM sections');
    _daribaData = await databaseManager.fetchData('SELECT * FROM taxState');
    _locationData = await databaseManager.fetchData('SELECT * FROM locations');
    _certificateData =
        await databaseManager.fetchData('SELECT * FROM certificateTable');

    setState(() {
      _sectionsData.forEach((element) => sections.add(element['secName']));
      _daribaData.forEach((element) => daribaStat.add(element['empState']));
      _locationData.forEach((element) => locationList.add(element['location']));
      _certificateData
          .forEach((element) => certificateList.add(element['certificate']));
    });
  }

  void getTaxTable() async {
    await databaseManager.connectToDatabase();
    if (daribaSelectedState!.isNotEmpty) {
      var tax = await databaseManager.fetchDataWhere(
          'SELECT * FROM taxState WHERE empState=?', [daribaSelectedState]);
      tax.asMap();

      taxTable = tax.first['taxTable'];
      if (daribaSelectedState == "موظف اعزب - او مطلق ليس لديه حضانة الاطفال" ||
          daribaSelectedState == "الموظفة المفصول دخلها عن دخل زوجها") {
        var d = await databaseManager.fetchData(
            'SELECT tt FROM $taxTable WHERE $baseSalary BETWEEN rang1 AND rang2');
        taxMony = d.first['tt'];
        taxNumber.text = taxMony.toString();
        print(d);
      } else {
        var d = await databaseManager.fetchData(
            'SELECT t$childNumSelected FROM $taxTable WHERE $baseSalary BETWEEN rang1 AND rang2');
        d.asMap();
        taxMony = d.first['t$childNumSelected'];
        taxNumber.text = taxMony.toString();
        print(d.first['t$childNumSelected']);
      }

      print(taxTable);
    }
  }

  void getJobTitle({int? xx}) async {
    await databaseManager.connectToDatabase();

    if (xx == null) {
      print("xx=null");
      _jobTiltelsData =
          await databaseManager.fetchData('SELECT * FROM jobTitles ');
      setState(() {
        jobTitelSelectedValue = null;
        jobTitles.clear();
        _jobTiltelsData
            .forEach((element) => jobTitles.add(element['jobTitle']));
      });
    } else {
      print("xx =! null");
      _jobTiltelsData = await databaseManager
          .fetchDataWhere('SELECT * FROM jobTitles WHERE degree=?', [xx]);
      setState(() {
        jobTitelSelectedValue = null;
        jobTitles.clear();
        _jobTiltelsData
            .forEach((element) => jobTitles.add(element['jobTitle']));
      });
    }
  }

  void calculateSalary() async {
    setState(() {
      totalAstiqta =
          taxMony + taqud + himaia + musahmatTaqaud + astiqtaaFromSalary;
      totalIsthqaq = baseSalary +
          maridMony +
          childMony +
          certificateMony +
          locationMony +
          mRiskMony +
          mIdaryMony +
          mMihaniMony +
          mIshaaMony +
          mTibAdle1Mony +
          mTibAdle2Mony +
          mTakhdirMony +
          mTashjaMony +
          mMansibMony +
          mGamiaMony +
          mEngeneerMony +
          mDrivingMony +
          mDirasatMony +
          mHirafyMony;
      totalMokasasat = maridMony +
          childMony +
          certificateMony +
          locationMony +
          mRiskMony +
          mIdaryMony +
          mMihaniMony +
          mIshaaMony +
          mTibAdle1Mony +
          mTibAdle2Mony +
          mTakhdirMony +
          mTashjaMony +
          mMansibMony +
          mGamiaMony +
          mEngeneerMony +
          mDrivingMony +
          mDirasatMony +
          mHirafyMony;
      totalFinalSalary = totalIsthqaq - totalAstiqta;
      mTotalIsthqaq.text = totalIsthqaq.toString();
      mTotalIstiqta.text = totalAstiqta.toString();
      mTotalMokasasat.text = totalMokasasat.toString();
      mTotalSalaryAmount.text = totalFinalSalary.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    setState(() {
      print(depSelectedValue);
    });

    print("width $width");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("القسم : ",
                  style: TextStyle(
                    fontFamily: 'Tajawal-Medium',
                    color: Colors.black87,
                  )),
              CustomDropdownSearch(
                width: 300,
                searchController: jobTitleSearchController,
                title: "",
                items: sections,
                selectedValue: depSelectedValue,
                onChanged: (x) {
                  setState(() {
                    calculateSalary();
                  });
                  setState(() {
                    depSelectedValue = x;
                  });
                },
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff263238),
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Row(
                        children: [
                          Text("جديد",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                              )),
                          Icon(Icons.my_library_add_outlined),
                        ],
                      ))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: const Color(0xff263238),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                         try {
                          databaseManager.insertEmploeeData(
                              context: context,
                              year: "2024", //set year varibale
                              month: "mmmm", //set month varibale
                              empJubNumber: jobNumber.text.isNotEmpty
                                  ? jobNumber.text
                                  : " ",
                              department: depSelectedValue,
                              empName:
                                  empName.text.isNotEmpty ? empName.text : " ",
                              empMotherName: motherName.text.isNotEmpty
                                  ? motherName.text
                                  : " ",
                              degree: int.parse(dgreeSelectedValue!),
                              step: int.parse(stageSelectedValue!),
                              mShhada: certificateMony,
                              lastTarfia: upgradingDay.text.isNotEmpty
                                  ? upgradingDay.text
                                  : " ",
                              lastAlawa: bonusDay.text.isNotEmpty
                                  ? bonusDay.text
                                  : " ",
                              startJub: directDay.text.isNotEmpty
                                  ? directDay.text
                                  : " ",
                              empTawald: birthDay.text.isNotEmpty
                                  ? birthDay.text
                                  : " ",
                              iban: ibanNumber.text.isNotEmpty
                                  ? ibanNumber.text
                                  : "No Iban",
                              accountNumber: accountNumber.text.isNotEmpty
                                  ? accountNumber.text
                                  : " ",
                              swift: swiftCodeNumber.text.isNotEmpty
                                  ? swiftCodeNumber.text
                                  : " ",
                              bankName: bankName.text.isNotEmpty
                                  ? bankName.text
                                  : " ",
                              mainSalary:
                                  baseSalary,
                              maridState: mMarid!.isNotEmpty ? mMarid : " ",
                              mMarid: maridMony,
                              childCount: childNumSelected!.isNotEmpty
                                  ? int.parse(childNumSelected!)
                                  : 0,
                              mChildren: childMony,
                              locationState:
                                  location!.isNotEmpty ? location : " ",
                              mNaqil: locationMony,
                              nesManseb: mMansib.text.isNotEmpty
                                  ? (int.parse(mMansib.text) / 100)
                                  : 0,
                              mManseb: mMansibMony,
                              nesAdaria: mIdary.text.isNotEmpty
                                  ? (int.parse(mIdary.text))
                                  : 0,
                              mAdaria: mIdaryMony,
                              nesMihania: mMihani.text.isNotEmpty
                                  ? (int.parse(mMihani.text))
                                  : 0,
                              mMihania: mMihaniMony,
                              nesKutora: mRisk.text.isNotEmpty
                                  ? (int.parse(mRisk.text))
                                  : 0,
                              mKutora:mRiskMony,
                              nesEng: mEngeneer.text.isNotEmpty
                                  ? (int.parse(mEngeneer.text))
                                  : 0,
                              mEng: mEngeneerMony,
                              nesDriving: mDriving.text.isNotEmpty
                                  ? (int.parse(mDriving.text))
                                  : 0,
                              mDriving: mDrivingMony,
                              nesGamia: mGamia.text.isNotEmpty
                                  ? (int.parse(mGamia.text))
                                  : 0,
                              mGamia: mGamiaMony,
                              nesIshaa: mIshaa.text.isNotEmpty
                                  ? (int.parse(mIshaa.text))
                                  : 0,
                              mIshaa: mIshaaMony,
                              himaia: himaia,
                              nesTakdeer: mTakhdir.text.isNotEmpty
                                  ? (int.parse(mTakhdir.text))
                                  : 0,
                              mTakdeer: mTakhdirMony,
                              nesTashjia: mTashja.text.isNotEmpty
                                  ? (int.parse(mTashja.text))
                                  : 0,
                              mTashjia: mTashjaMony,
                              nesTibadle1: mTibAdly.text.isNotEmpty
                                  ? (int.parse(mTibAdly.text))
                                  : 0,
                              mTibAdle1: mTibAdle1Mony,
                              nesTibadle2: mMakTibAdly.text.isNotEmpty
                                  ? (int.parse(mMakTibAdly.text))
                                  : 0,
                              mTibAdle2:mTibAdle2Mony,
                              tqaud: taqud,
                              mDirasat: mDirasatMony,
                              musahmatTqaud: musahmatTaqaud,
                              sumAsthqaq: totalIsthqaq,
                              sumAstiqtaa: totalAstiqta,
                              finalSalary: totalFinalSalary,
                              dariba: taxMony,
                              astiqtaaFromSalary: astiqtaaFromSalary,
                              jobTitle: jobTitelSelectedValue!.isNotEmpty ? jobTitelSelectedValue : " ",
                              certificate: certificateSelectedValue!.isNotEmpty ? certificateSelectedValue : " ",
                              taxState: daribaSelectedState!.isNotEmpty ? daribaSelectedState : " ");
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: '$e',
                            btnCancelText: "حسناً",
                            width: 300,
                            btnOkColor: const Color(0xff263238),
                          ).show();
                        }
                      },
                      icon: const Row(
                        children: [
                          Text("حفظ",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Color(0xFFffffff),
                              )),
                          Icon(Icons.save),
                        ],
                      )),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xff263238),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Row(
                          children: [
                            Text("حذف",
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  color: Colors.white,
                                )),
                            Icon(Icons.delete_outline_outlined),
                          ],
                        )),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xff263238),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Row(
                          children: [
                            Text("بحث",
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  color: Colors.white,
                                )),
                            Icon(Icons.search),
                          ],
                        )),
                  )),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: SideBarDesctop(),
      ),
      backgroundColor: const Color(0xffE5E5E5),
      body: Row(
        children: [
          width > 1000
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 50, right: 10, left: 10),
                    child: Container(
                      height: height * 0.8,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 85,
                              width: 300,
                              child: CustomTextField(
                                isreadOnly: true,
                                isdate: false,
                                fieldTitle: "اسم الموظف  ",
                                hint: ' ',
                                controller: empName,
                                onChanged: (x) {
                                  setState(() {
                                    calculateSalary();
                                  });
                                  empName.text = x;
                                },
                                obscureText: false,
                                titleColor: Colors.black,
                                baseColor: Colors.black54,
                                borderColor: Colors.black,
                                errorColor: Colors.red,
                              ),
                            ),
                            SizedBox(
                              height: 85,
                              width: 300,
                              child: CustomTextField(
                                isreadOnly: true,
                                isdate: false,
                                fieldTitle: "العنوان الوظيفي",
                                hint: ' ',
                                controller: jobTitleController,
                                onChanged: (x) {
                                  setState(() {
                                    calculateSalary();
                                  });
                                },
                                obscureText: false,
                                titleColor: Colors.black,
                                baseColor: Colors.black54,
                                borderColor: Colors.black,
                                errorColor: Colors.red,
                              ),
                            ),
                            Wrap(
                              children: [
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "الراتب الاسمي",
                                    hint: ' ',
                                    controller: mBaseSalary,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                      setState(() {
                                        baseSalary = int.parse(x);
                                        himaia = (baseSalary * 0.0025).toInt();
                                        mHimaia.text = himaia.toString();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. الشهادة",
                                    hint: ' ',
                                    controller: empCertificate,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. زوجية",
                                    hint: ' ',
                                    controller: mMaridController,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. اطفال",
                                    hint: ' ',
                                    controller: mCildern,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. نقل",
                                    hint: ' ',
                                    controller: mNaql,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. المخصصات",
                                    hint: ' ',
                                    controller: mTotalMokasasat,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. الاستحقاق",
                                    hint: ' ',
                                    controller: mTotalIsthqaq,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "الضريبة",
                                    hint: ' ',
                                    controller: taxNumber,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "التقاعد",
                                    hint: ' ',
                                    controller: mTaqad,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "م. الاستقطاع",
                                    hint: ' ',
                                    controller: mTotalIstiqta,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 300,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "صافي الراتب",
                                    hint: ' ',
                                    controller: mTotalSalaryAmount,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 50, right: 10, left: 10),
              child: Container(
                  height: height * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 50, right: 15),
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(
                        expandedHeaderPadding: EdgeInsets.all(2),
                        materialGapSize: 0,
                        elevation: 1,
                        expansionCallback: (i, isOpen) {
                          setState(() {
                            openSection[i] = isOpen;
                          });
                        },
                        children: [
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Color(0xFFffffff),
                            isExpanded: openSection[0],
                            headerBuilder: (context, isOpen) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "المعلومات الشخصية",
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      color: Color.fromARGB(255, 36, 36, 36),
                                    ),
                                  ),
                                  openSection[0] ? Divider() : Container()
                                ],
                              );
                            },
                            body: Wrap(
                              textDirection: TextDirection.rtl,
                              children: [
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "الرقم الوظيفي",
                                    hint: ' ',
                                    controller: jobNumber,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 200,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "الاسم الرباعي واللقب",
                                    hint: ' ',
                                    controller: empName,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 200,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "اسم الام الثلاثي",
                                    hint: ' ',
                                    controller: motherName,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                CustomDropdownSimple(
                                  selectedValue: dgreeSelectedValue,
                                  onChanged: (x) {
                                    setState(() {
                                      dgreeSelectedValue = x;
                                      getJobTitle(xx: int.parse(x));
                                      getBaseSalary();
                                      calculateSalary();
                                      print(dgreeSelectedValue);
                                    });
                                  },
                                  width: 125,
                                  items: degree,
                                  title: "الدرجة",
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                CustomDropdownSimple(
                                  selectedValue: stageSelectedValue,
                                  onChanged: (x) {
                                    setState(() {
                                      stageSelectedValue = x;
                                      getBaseSalary();
                                      print(stageSelectedValue);
                                      calculateSalary();
                                    });
                                  },
                                  width: 125,
                                  items: stage,
                                  title: "المرحلة",
                                ),
                                CustomDropdownSearch(
                                  width: 200,
                                  searchController: jobTitleSearchController,
                                  title: "العنوان الوظيفي",
                                  items: jobTitles,
                                  selectedValue: jobTitelSelectedValue,
                                  onChanged: (x) {
                                    setState(() {
                                      calculateSalary();
                                    });
                                    setState(() {
                                      jobTitelSelectedValue = x;
                                      jobTitleController.text=jobTitelSelectedValue!;

                                    });
                                  },
                                ),
                                CustomDropdownSimple(
                                  width: 200,
                                  title: "التحصيل الدراسي",
                                  items: certificateList,
                                  selectedValue: certificateSelectedValue,
                                  onChanged: (x) {
                                    setState(() {
                                      certificateSelectedValue = x;
                                      getcertificateMony();
                                      
                                    });
                                  },
                                ),
                                CustomDropdownSimple(
                                  selectedValue: genderSelectedValue,
                                  onChanged: (x) {
                                    setState(() {
                                      calculateSalary();
                                    });
                                    setState(() {
                                      genderSelectedValue = x;
                                      print(genderSelectedValue);
                                    });
                                  },
                                  width: 125,
                                  items: gender,
                                  title: "الجنس ",
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 175,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: true,
                                    fieldTitle: "تاريخ التولد",
                                    hint: '2024/01/01',
                                    controller: birthDay,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 175,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: true,
                                    fieldTitle: "تاريخ المباشرة",
                                    hint: '2024/01/01',
                                    controller: directDay,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 175,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: true,
                                    fieldTitle: "تاريخ اخر علاوة",
                                    hint: '2024/01/01',
                                    controller: bonusDay,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 175,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: true,
                                    fieldTitle: "تاريخ اخر ترفيع",
                                    hint: '2024/01/01',
                                    controller: upgradingDay,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Color(0xFFffffff),
                            isExpanded: openSection[1],
                            headerBuilder: (context, isOpen) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (openSection[0] || openSection[1])
                                      ? Divider()
                                      : Container(),
                                  const Text(
                                    "معلومات التوطين ",
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      color: Color.fromARGB(255, 36, 36, 36),
                                    ),
                                  ),
                                  openSection[1] ? Divider() : Container()
                                ],
                              );
                            },
                            body: Wrap(
                              children: [
                                CustomDropdownSimple(
                                  selectedValue: daribaSelectedState,
                                  onChanged: (x) {
                                    setState(() {
                                      daribaSelectedState = x;
                                      getTaxTable();
                                      print(daribaSelectedState);
                                      calculateSalary();
                                    });
                                  },
                                  width: 250,
                                  items: daribaStat,
                                  title: " الوظع الضريبي ",
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 275,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "Iban",
                                    hint: 'IQ12RAFB123456789000000',
                                    controller: ibanNumber,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 200,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "رقم حساب",
                                    hint: ' 0123456789',
                                    controller: accountNumber,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "سويفت",
                                    hint: 'RAFBIQBA1089 ',
                                    controller: swiftCodeNumber,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 150,
                                  child: CustomTextField(
                                    isreadOnly: true,
                                    isdate: false,
                                    fieldTitle: "اسم. المصرف",
                                    hint: '  الرافدين',
                                    controller: bankName,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: Color(0xFFffffff),
                            isExpanded: openSection[2],
                            headerBuilder: (context, isOpen) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (openSection[1] || openSection[2])
                                      ? Divider()
                                      : Container(),
                                  const Text(
                                    "المخصصات",
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      color: Color.fromARGB(255, 36, 36, 36),
                                    ),
                                  ),
                                  openSection[2] ? Divider() : Container()
                                ],
                              );
                            },
                            body: Wrap(
                              children: [
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. خطورة%",
                                    hint: ' 100%',
                                    controller: mRisk,
                                    onChanged: (x) {
                                      setState(() {
                                        mRiskMony =
                                            (baseSalary * (int.parse(x) / 100))
                                                .toInt();

                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. ادارية%",
                                    hint: ' 40%',
                                    controller: mIdary,
                                    onChanged: (x) {
                                      setState(() {
                                        mIdaryMony =
                                            (baseSalary * (int.parse(x) / 100))
                                                .toInt();
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. مهنية%",
                                    hint: ' 30%',
                                    controller: mMihani,
                                    onChanged: (x) {
                                      setState(() {
                                        mMihani.text=x;
                                        mMihaniMony =
                                            (baseSalary * (int.parse(x) / 100))
                                                .toInt();

                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                CustomDropdownSimple(
                                  selectedValue: mMarid,
                                  onChanged: (x) {
            
                                  
                                    setState(() {
                                      mMarid=x;
                                      if (mMarid == "متزوج") {
                                        maridMony = 50000;
                                      } else if (mMarid == "اعزب") {
                                        maridMony = 0;
                                      }
                                      mMaridController.text =
                                          maridMony.toString();
                                      print(maridMony);
                                        setState(() {
                                      calculateSalary();
                                    });
                                    });
                                  },
                                  width: 125,
                                  items: mMaridL,
                                  title: "م. زوجية ",
                                ),
                                CustomDropdownSimple(
                                  selectedValue: childNumSelected,
                                  onChanged: (x) {
                                    setState(() {
                                      calculateSalary();
                                    });
                                    setState(() {
                                      childNumSelected = x;
                                      if (int.parse(childNumSelected!) <= 4) {
                                        childMony =
                                            int.parse(childNumSelected!) *
                                                10000;
                                      }else{
                                         childMony =
                                            4 *
                                                10000;
                                      }

                                      getTaxTable();
                                      mCildern.text = childMony.toString();
                                    });
                                  },
                                  width: 125,
                                  items: childNumList,
                                  title: "م. اطفال ",
                                ),
                                CustomDropdownSimple(
                                  selectedValue: location,
                                  onChanged: (x) {
                                    
                                    setState(() {
                                      location = x;
                                      getLocatinMony();
                                      calculateSalary();

                                      print(location);
                                    });
                                  },
                                  width: 125,
                                  items: locationList,
                                  title: "م. نقل ",
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. المنصب%",
                                    hint: ' 15%',
                                    controller: mMansib,
                                    onChanged: (x) {
                                      mMansibMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. هندسية%",
                                    hint: ' 50%',
                                    controller: mEngeneer,
                                    onChanged: (x) {
                                      mEngeneerMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. تخدير%",
                                    hint: ' 100%',
                                    controller: mTakhdir,
                                    onChanged: (x) {
                                      mTakhdirMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. اشعاع%",
                                    hint: ' 100%',
                                    controller: mIshaa,
                                    onChanged: (x) {
                                      mIshaaMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. تشجيعية%",
                                    hint: ' 100%',
                                    controller: mTashja,
                                    onChanged: (x) {
                                      mTashjaMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. طب عدلي%",
                                    hint: ' 100%',
                                    controller: mTibAdly,
                                    onChanged: (x) {
                                      mTibAdle1Mony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. طب عدلي%",
                                    hint: ' 100%',
                                    controller: mMakTibAdly,
                                    onChanged: (x) {
                                      mTibAdle2Mony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "م. سواق%",
                                    hint: ' 100%',
                                    controller: mDriving,
                                    onChanged: (x) {
                                      mDrivingMony =
                                          (baseSalary * (int.parse(x) / 100))
                                              .toInt();
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "دراسات\$",
                                    hint: ' 100000',
                                    controller: mDirasat,
                                    onChanged: (x) {
                                      mDirasatMony = int.parse(x);

                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 175,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "مساهمات تقاعدية\$",
                                    hint: ' 100000',
                                    controller: musahmatTaqaudControler,
                                    onChanged: (x) {
                                      musahmatTaqaud = int.parse(x);
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: 125,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "حماية\$",
                                    hint: "",
                                    controller: mHimaia,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                      setState(() {});
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 85,
                                  width: width * 0.4,
                                  child: CustomTextField(
                                    isreadOnly: false,
                                    isdate: false,
                                    fieldTitle: "ملاحظات",
                                    hint: "",
                                    controller: notse,
                                    onChanged: (x) {
                                      setState(() {
                                        calculateSalary();
                                      });
                                    },
                                    obscureText: false,
                                    titleColor: Colors.black,
                                    baseColor: Colors.black54,
                                    borderColor: Colors.black,
                                    errorColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
