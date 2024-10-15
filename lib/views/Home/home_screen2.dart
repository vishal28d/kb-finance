// ignore_for_file: non_constant_identifier_names, must_be_immutable
//flutter
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:credit_app/controllers/home_controller.dart';
import 'package:credit_app/controllers/home_loan_controller.dart';
import 'package:credit_app/controllers/loan_against_property_controller.dart';
import 'package:credit_app/views/AffordableEMiCalculator/AffordableEmiCalculator.dart';
import 'package:credit_app/views/CarLoan/car_loan_screen.dart';

import 'package:credit_app/views/EMICalculator/emi_calculator_screen.dart';
import 'package:credit_app/views/FdCalculator/fd_calculator.dart';
import 'package:credit_app/views/Home/commercialVehicleLoan.dart';
import 'package:credit_app/views/Home/industrialLoan.dart';
import 'package:credit_app/views/Home/job_cibil.dart';
import 'package:credit_app/views/Home/learnWithKB.dart';
import 'package:credit_app/views/Home/otherLoans.dart';
import 'package:credit_app/views/Leads/add_lead_screen.dart';

import 'package:credit_app/views/Property%20Loans/property_loan_screen.dart';
// 
import 'package:credit_app/views/SimpleCalculator.dart/readymade_calculator.dart';
import 'package:credit_app/views/Leads/lead_screen.dart';

import 'package:credit_app/views/UnsecuredLoans/professionalLoan.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:credit_app/widget/not_available_page.dart';
import 'package:dots_indicator/dots_indicator.dart';


//controllers
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/views/BusinessLoan/choose_screen_blscreen.dart';
// import 'package:credit_app/views/HomeLoan/choose_screen_hlscreen.dart';
import 'package:credit_app/views/LoanAgainstProperty/choose_screen_lapscreen.dart';
import 'package:credit_app/views/OtherLoan/other_loan_screen.dart';
import 'package:credit_app/views/OtherServices/other_service.dart';
import 'package:credit_app/views/PersonalLoan/personal_loan_basic_detail_entry_plscreen3.dart';
import 'package:credit_app/widget/appBarWidget.dart';
//models
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen2 extends StatefulWidget {

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final HomeController homeController = Get.put(HomeController());

  CarouselSliderController? carouselController;

  String UserRole = 'Customer' ; 
  String displayName = "Guest" ;

  Future<void> setUserRole() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
      UserRole = prefs.getString('UserRole') ?? 'Customer'; 
      displayName = prefs.getString('name') ?? 'Guest';
      });
      print(UserRole);
      
}

  @override
  void initState() {
    super.initState();
    setUserRole() ;
  }


  int? selectedimg;

  List<Color> colors = [
    Color(0xFFFE2161),
    Color(0xFF58C0FC),
    Color(0xFFffcf00), //0xFF2DD0C3
    Color(0xFF7853FF),
    Color(0xFFFFBC00),
    Color(0xFF5634D2),
    Color(0xFFFE2161),
    Color(0xFF2DD0C3),
  ];

  List<String> UnsecuredLoanName = [
    'Personal Loan',
    'Business Loan',
    'Balance Transfer',
    'Professional Loan' ,
  ];

  List<String> propertyLoanNames= [
    'Home Loan',
    'Mortgage Loan',
    'Commercial Purchase',
    'Commercial Mortgage' ,
  ];

  List<String> CarLoanNames= [
    'New Car Purchase',
    'Used Car Purchase',
    'Car Refinance',
    'Car Loan Transfer' ,
  ];

  List<String> iconList = [
    'assets/bank.svg',
    'assets/businessman-and-dollar-coin-svgrepo-com.svg',
    'assets/business-svgrepo-com.svg',
    'assets/card.svg',
    'assets/bank.svg',
    'assets/Group 650.svg',
    'assets/otherloan.svg',
    'assets/otherloanservice.svg'
  ];

  List<String> titleList = [
    'Credit Card',
    'Business Loan',
    'Home Loan',
    'Loan against property',
    'Other Loan',
    'Other Services'
  ];

  List<String> subTitle = [
    'Get up to ${global.currencySymbol}75 lac for 72 months EMI',
    'Get up to ${global.currencySymbol}20 lac for 72 months EMI',
    'Get up to ${global.currencySymbol}20 lac for 72 months EMI',
    'Get up to ${global.currencySymbol}20 lac for 72 months EMI',
    'Get up to ${global.currencySymbol}20 lac for 72 months EMI',
    'Get up to ${global.currencySymbol}20 lac for 72 months EMI',
  ];

  List<String> promotionam_banners = [
    'assets/banner.jpg',
    'assets/banner1.jpg',
    'assets/banner1.jpg',
  ];

  List<String> calculatorList = [
    'EMI Calculator' , 
    'Affordable EMI' ,
    'FD Calculator' ,
    'Normal Calculator' ,

  ] ;

  List<String> dataStatusList = [
    "Follow Up" ,
    "Login Cases" ,
    "Approval/Reject",
    "Disbursed Cases" ,

  ] ;

  List<String> carLoanIcons = [
    'assets/new-car-loan.png',
    'assets/used-car-loan.png',
    'assets/car-refinance.png',
    'assets/car-loan-transfer.png',

  ] ;

  List<String> propertyLoanIcons = [
      'assets/property-loan.png' ,
      'assets/mortageLoan.png' ,
      'assets/commercialPurchase.png' ,
      'assets/commercialMortage.png' ,

  ];

  List<String> UnsecuredLoansIcons = [
    'assets/loan_icons/personal_loan.png' ,
    'assets/loan_icons/business_loan.png' ,
    'assets/loan_icons/balance_transfer.png' ,
    'assets/loan_icons/professional_loan.png' ,
   

  ] ;


  List<Widget> banners(context) {
    List<Widget> list = [];
    try {
      for (int i = 0; i < promotionam_banners.length; i++) {
        list.add(GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              color: Theme.of(context).primaryColor,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      promotionam_banners[i],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
      }

      return list;
    } catch (e) {
      print("Exception - home_screen.dart - banners(): " + e.toString());
      list.add(SizedBox());
      return list;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    // removed Drawer
        // drawer: DrawerWidget(
        //   a: a,
        //   o: o,
        // ),
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          title: Row(
            children: [
              CircleAvatar(
                  child: Icon(
                Icons.person,
                size: 20,
              )),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                    'Hi $displayName',
                    style: TextStyle(
                      fontSize: displayName.length > 20 ? 20/1.15 : 20,  // Adjust font size based on string length
                    ),
                  ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: <Widget>[
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.bell),
                    onPressed: () {
                      //  Get.to(() => NotificationScreen(
                          
                      //     ));
                      Get.to(()=> NotAvailablePage()) ;


                    }),
                Positioned(
                  right: 11,
                  top: 11,
                  child: new Container(
                    padding: EdgeInsets.all(2),
                    decoration: new BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),


        body: SingleChildScrollView(
          child: CommonPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // promotionam_banners != null
                //     ?
                GetBuilder<HomeController>(builder: (controller) {
                  return Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Column(
                        children: [
                          carousel_slider.CarouselSlider(
                              items: banners(context),
                              carouselController: carouselController,
                              options: carousel_slider.CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  aspectRatio: 1,
                                  viewportFraction: 1,
                                  initialPage: homeController.currentIndex,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, _) {
                                    homeController.setCurrentIndex(index);
                                  })),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: DotsIndicator(
                              dotsCount: promotionam_banners.length,
                              position: homeController.currentIndex.toDouble(),
                              decorator: DotsDecorator(
                                activeSize: const Size(6, 6),
                                size: const Size(6, 6),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.0))),
                                activeColor: Theme.of(context).primaryColor,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  );
                }),
               
              // removed emi calculator in blue colour
              
              // card( emi calc) was removed

              // EMI Calculator 

               SingleChildScrollView(
                  child: Card(
                    color: Color(0xFFC63437)  ,
                    margin: EdgeInsets.only(top: 0 , bottom: 15 ),
                    child: Column(
              
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Text(
                            'Calculate EMI for Customer',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 25), 
  
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisSpacing: 0 ,
                            mainAxisSpacing: 20 ,
                            crossAxisCount: 4,
                            children: List.generate(
                                4,
                                (index) => GestureDetector(
                                      onTap: () {
                                        if (index == 0) {
                                           Get.to(() => (EmiCalculatorScreen(
                                             
                                                )));
                                        } 
                                        
                                        else if (index == 1) {

                                          Get.to(()=> AffordableEmiCalculator() ) ;
                                         
                                          // Get.to(() => BasicDetailEntryPLScreen(
                                          //       a: a,
                                          //       o: o,
                                          //     ));
                                        } 
                                        else if (index == 2) {

                                          Get.to(() => FixedDepositCalculator()) ;

                                          // Get.to(() => ChooseScreenBLScreen(
                                          //       a: a,
                                          //       o: o,
                                          //     ));
                                        } 
                                        else if (index == 3) {
                                          Get.to(()=> ReadyMadeCalculator() ) ;
                                        } 
                                        
                                        // else if (index == 4) {
                                        //   Get.to(() => chooseScreenHLScreen(
                                        //         a: a,
                                        //         o: o,
                                        //       ));
                                        // } 
               
                                      },
                  
                                      child: Column(
                                        
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                              margin:
                                              EdgeInsets.only(left: 1, right: 1),
                                             
                                              decoration: BoxDecoration(
                                                  color: Colors.white ,
                                                  border: Border.all(
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(15)
                                                        )
                                                      ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10 , right: 10 , top: 0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                        width: 32 ,
                                                        child: SvgPicture.asset(
                                                          // iconList[index],
                                                          'assets/calculatorSVG.svg' ,                                                     
                                                          height: 45 ,
                                                          // color: colors[index],
                                                          // ignore: deprecated_member_use
                                                          color: Color(0xFFC63437)  ,
                                                          
                                                        )
                                                      ),
                                                        
                                                  ],
                                                ),
                                              )
                                            ),
                                                        
                                          SizedBox(height: 5,) ,
                                                  
                                            Expanded(  
                                                  
                                                child: Container(
                                                    child: Text(
                                                    '${calculatorList[index]}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,  
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    maxLines: 2, 
                                                    overflow: TextOverflow.visible, 
                                                  ),
                                                ),

                                         ),
                       
                                       ],
                                    ),
                  
                                  )
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              // Data Status 
            // condition for banker
            if(UserRole == "Banker")
                 SingleChildScrollView(
                  child: Card(
                    color: Color(0xFFC63437) ,
                   
                    margin: EdgeInsets.only(top: 0 , bottom: 15 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Text(
                            'Data Status',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white ,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 25), 
                      
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisSpacing: 0 ,
                            mainAxisSpacing: 20 ,
                            crossAxisCount: 4,
                            children: List.generate(
                                4,
                                (index) => GestureDetector(
                                      onTap: () {
                                        if (index == 0) {
                                           Get.to(() => (LeadListScreen(
                                               
                                                )));
                                        } 
                                        
                                        else if (index == 1) {
                                           Get.to(() => (AddLeadScreen(onRefresh: (){},
                                               
                                                )));
                                        }                
                                        
                                        else if (index == 2) {
                                          

                                        } 
                                        else if (index == 3) {

                                        } 
                                        
                                        else if (index == 4) {
                                          
                                        } 
               
                                      },
                  
                                      child: Column(
                                        
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                              margin:
                                                  EdgeInsets.only(left: 1, right: 1),
                                             
                                              decoration: BoxDecoration(
                                                  color: Colors.white ,
                                                  border: Border.all(
                                                    color: Colors.grey.shade500 ,
                                            
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(15)
                                                        )
                                                      ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10, top: 0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                                        width: 32 ,
                                                        child: SvgPicture.asset(
                                                          iconList[index],                                                     
                                                          height: 45 ,
                                                          // color: colors[index],
                                                          // ignore: deprecated_member_use
                                                          color: Color(0xFFC63437) ,
                                                          
                                                        )
                                                      ),
                                                        
                                                  ],
                                                ),
                                              )
                                            ),
                                                        
                                          SizedBox(height: 5,) ,
                                                  
                                            Expanded(                                               
                                                child: Container( 
                                                    child: Text(
                                                    '${dataStatusList[index]}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,  
                                                      color: Colors.white ,
                                                      fontWeight: FontWeight.w600  ,
                                                    ),
                                                    maxLines: 2, 
                                                    overflow: TextOverflow.visible, 
                                                  ),
                                                ),
                                         ),                                                   
                                      ],
                                   ),
                  
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


        //  Learn With KB Finance
          LearnWithKb() ,

         // Job & CIBIL 
         JobAndCibil() , 

        // unsecured loans

SingleChildScrollView(
  child: Card(
    color: Color(0xFFC63437),  // Applying custom color
    margin: EdgeInsets.only(top: 0, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
          child: Text(
            'Unsecured Loans',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // Changing text color to white
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 25),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            crossAxisCount: 4,
            children: List.generate(
              4 ,
              (index) => GestureDetector(
                onTap: () {
                  // Handle onTap
                  if (index == 0) {
                    Get.to(()=> ProfessionalLoanForm()) ;

                  } else if (index == 1) {
                        Get.to(()=> ProfessionalLoanForm()) ;

                  } else if (index == 2) {
                      Get.to(()=> ProfessionalLoanForm()) ;

                  } else if (index == 3) {
                        Get.to(()=> ProfessionalLoanForm()) ;

                  }
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(left: 1, right: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                              width: 32,
                              child: Image.asset(
                                UnsecuredLoansIcons[index],
                                height: 45,
                                // ignore: deprecated_member_use
                                color: Color(0xFFC63437),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        child: Text(
                          '${UnsecuredLoanName[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white, 
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),


      // Check Cibil // removed 

      // Car Loan 

       SingleChildScrollView(
                  child: Card(
                    color:  Color(0xFFC63437) ,
                    margin: EdgeInsets.only(top: 0 , bottom: 15 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Text(
                            'Car Loan',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white ,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 25), 
                      
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisSpacing: 0 ,
                            mainAxisSpacing: 20 ,
                            crossAxisCount: 4,
                            children: List.generate(
                                4,
                                (index) => GestureDetector(
                                      onTap: () {
                                        if (index == 0) {
                                           Get.to(()=> CarLoanForm()) ;

                                        } 
                                        
                                        else if (index == 1) {
                                            Get.to(()=> CarLoanForm()) ;

                                        }                
                                        
                                        else if (index == 2) {
                                            Get.to(()=> CarLoanForm()) ;

                                        } 
                                        else if (index == 3) {
                                              Get.to(()=> CarLoanForm()) ;
                                        } 
                                              
                                      },
                  
                                      child: Column(
                                        
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                              margin:
                                                  EdgeInsets.only(left: 1, right: 1),
                                             
                                              decoration: BoxDecoration(
                                                  color: Colors.white ,
                                                  border: Border.all(
                                                    color: Colors.grey.shade500 ,
                                                    width: 2 ,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(15)
                                                        )
                                                      ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10, top: 0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                                                        width: 70 ,
                                                        child: Image.asset(
                                                         carLoanIcons[index] ,                                                      
                                                          height: 45 ,
                                                          width: 45 ,
                                                          // color: colors[index],
                                                          // ignore: deprecated_member_use
                                                          color: Color(0xFFC63437) ,
                                                          
                                                        )
                                                      ),
                                                        
                                                  ],
                                                ),
                                              )
                                            ),
                                                        
                                          SizedBox(height: 5,) ,
                                                  
                                            Expanded(                                               
                                                child: Container( 
                                                    child: Text(
                                                    '${CarLoanNames[index]}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,  
                                                      color: Colors.white ,
                                                      fontWeight: FontWeight.w600  ,
                                                    ),
                                                    maxLines: 2, 
                                                    overflow: TextOverflow.visible, 
                                                  ),
                                                ),
                                         ),                                                
                                        ],
                                      ),
      
                                    )
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

          // Property Loan 

SingleChildScrollView(
  child: Card(
    color: Color(0xFFC63437),  // Applying custom color
    margin: EdgeInsets.only(top: 0, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
          child: Text(
            'Property Loans',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // Changing text color to white
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 25),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
            crossAxisCount: 4,
            children: List.generate(
              4 ,
              (index) => GestureDetector(
                onTap: () {
                  // Handle onTap
                  if (index == 0) {
                    // Action for first item
                      Get.to(()=> PropertyLoanForm()) ;

                  } else if (index == 1) {
                        Get.to(()=> PropertyLoanForm()) ;

                  
                  } else if (index == 2) {
                      Get.to(()=> PropertyLoanForm()) ;

                  } else if (index == 3) {
                      Get.to(()=> PropertyLoanForm()) ;

                  }
                },
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(left: 1, right: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                              width: 32,
                              child: Image.asset(
                                propertyLoanIcons[index] ,
                                height: 45,
                                width: 45,
                                // ignore: deprecated_member_use
                                color: Color(0xFFC63437),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        child: Text(
                          '${propertyLoanNames[index]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white, 
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),
      
        
        CommercialVehicleLoan() ,
        IndustrialLoan(),
        OtherLoansAndCreditCard() ,


              ],
            ),
          ),
        ));
  }



  Widget loanCardlist(context) {
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            width: Get.width,
            height: 160,
            child: Card(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${titleList[index]}',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .displayLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                  width: Get.width - 80,
                                  child: Text(
                                    '${subTitle[index]}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .displayMedium,
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButtonWIdget(
                            voidCallback: () {
                              if (index == 0) {
                                Get.to(() => BasicDetailEntryPLScreen(
                                     
                                    ));
                              } else if (index == 1) {
                                Get.to(() => ChooseScreenBLScreen(
                                      
                                    ));
                              } else if (index == 2) {
                                Get.delete<HomeLoanController>();
                                Get.to(() => NotAvailablePage(
                                    
                                    ));
                              } else if (index == 3) {
                                Get.delete<LoanAgainstPropertyController>();
                                Get.to(() => chooseScreenLAPScreen(
                                   
                                    ));
                              } else if (index == 4) {
                                Get.to(() => OtherLoanScreen(
                                    
                                    ));
                              } else if (index == 5) {
                                Get.to(() => OtherServicesScreen(
                                     
                                    ));
                              }
                            },
                            child: Text('Apply'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(16)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              image: DecorationImage(
                                  image: AssetImage('assets/homescreen.jpg'),
                                  fit: BoxFit.cover)),
                          width: 110,
                          height: 80,
                        ),
                      ))
                ],
              ),
            ),
          );
        });

        
  }




}

