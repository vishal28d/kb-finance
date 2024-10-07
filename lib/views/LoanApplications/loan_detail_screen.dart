// ignore_for_file: must_be_immutable
//flutter
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:credit_app/utils/global.dart' as global;
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LoanDetailScreen extends StatelessWidget {
  
  LoanDetailScreen({a, o, required  this.loanDetail});
  TabController? _tabController;

  File? photo;
  
  var loanDetail;
  
  void setPhoto(File file) {
    photo = (file);
  }


  @override
  Widget build(BuildContext context ) {

  // Assign values from loanDetail or provide default 'N/A' if index out of range
String fullName = loanDetail.length > 0 ? loanDetail[0].trim() : 'N/A';
String mobileNo = loanDetail.length > 1 ? loanDetail[1].trim() : 'N/A';
String email = loanDetail.length > 2 ? loanDetail[2].trim() : 'N/A';
String alternateMobile = loanDetail.length > 3 ? loanDetail[3].trim() : 'N/A';
String loanAmount = loanDetail.length > 4 ? loanDetail[4].trim() : 'N/A';
String maritalStatus = loanDetail.length > 5 ? loanDetail[5].trim() : 'N/A';
String currentAddress = loanDetail.length > 6 ? loanDetail[6].trim() : 'N/A';
String currentPin = loanDetail.length > 7 ? loanDetail[7].trim() : 'N/A';
String currentLandmark = loanDetail.length > 8 ? loanDetail[8].trim() : 'N/A';
String houseType = loanDetail.length > 9 ? loanDetail[9].trim() : 'N/A';
String SpouseName = loanDetail.length > 10 ? loanDetail[10].trim() : 'N/A';
String SpouseMobileNo = loanDetail.length > 11 ? loanDetail[11].trim() : 'N/A';
String yearsAtCity = loanDetail.length > 12 ? loanDetail[12].trim() : 'N/A';
String ownershipStatus = loanDetail.length > 13 ? loanDetail[13].trim() : 'N/A';
String permanentAddress = loanDetail.length > 14 ? loanDetail[14].trim() : 'N/A';
String permanentLandmark = loanDetail.length > 15 ? loanDetail[15].trim() : 'N/A';
String permanentPin = loanDetail.length > 16 ? loanDetail[16].trim() : 'N/A';
String selectedReligion = loanDetail.length > 17 ? loanDetail[17].trim() : 'N/A';
String selectedLoanType = loanDetail.length > 18 ? loanDetail[18].trim() : 'N/A';
String squareFeet = loanDetail.length > 19 ? loanDetail[19].trim() : 'N/A';

// Assign values from loanDetail or provide default 'N/A' if index out of range
String SpouseDob = loanDetail.length > 22 ? loanDetail[22].trim() : 'N/A';    // 22
String motherName = loanDetail.length > 23 ? loanDetail[23].trim() : 'N/A';  // 23
String nomineeDob = loanDetail.length > 24 ? loanDetail[24].trim() : 'N/A';  // 24
String nomineeName = loanDetail.length > 25 ? loanDetail[25].trim() : 'N/A';  // 25
String nomineeRelation = loanDetail.length > 26 ? loanDetail[26].trim() : 'N/A';  // 26
String permanentOwnershipStatus = loanDetail.length > 27 ? loanDetail[27].trim() : 'N/A'; // 27
String permanentYearsAtCity = loanDetail.length > 28 ? loanDetail[28].trim() : 'N/A'; // 28
String selectedCaste = loanDetail.length > 29 ? loanDetail[29].trim() : 'N/A';  // 29



    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Loan Detail'),
        centerTitle: true,
      ),
      
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              onTap: (int index) async {},
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.headlineSmall,
              tabs: [
                Tab(
                  child: Text(
                    'Basic Details',
                  ),
                ),
                Tab(
                  child: Text(
                    'Uploaded Documents',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Full Name", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( fullName , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Mobile No", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( mobileNo , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Alternate Mobile No", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( alternateMobile , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Email", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( email , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Loan Amount", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( loanAmount , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),

                            Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Selected Loan Type", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( selectedLoanType , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Selected Religion", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( selectedReligion , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Selected Caste", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( selectedCaste , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Marital Status", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( maritalStatus , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Spouse's Name (if married)", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( SpouseName , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Spouse Mobile No (if married)", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( SpouseMobileNo , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Spouse DOB (if married)", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(SpouseDob)) , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Nominee Name", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( nomineeName , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Nominee Date of Birth", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( nomineeDob , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Nominee Relation", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( nomineeRelation , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                          ),
                         
                        
                         
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Current Address", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( currentAddress , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Current LandMark", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( currentLandmark , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Current Pin", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( currentPin , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Current House OwnerShip", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( ownershipStatus , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Parmanent Address", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( permanentAddress + ', PinCode : $permanentPin' , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Parmanent LandMark", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( permanentLandmark , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Parmanent OwnerShip", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( permanentOwnershipStatus , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Parmanent House Area(Square feet)", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( squareFeet , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                           Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: ListTile(
                              title: Text("Years at Current City", style: Theme.of(context).textTheme.headlineSmall),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 5),
                                child: Text( yearsAtCity , style: Theme.of(context).primaryTextTheme.titleLarge),
                              ),
                            ),
                          ),
                            Divider(
                            height: 1,
                            thickness: 1,
                          ),

                        ],
                      ),
                    ),
                  ),


                  CommonPadding(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photo',
                            style: Theme.of(context).primaryTextTheme.displayLarge,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CommonPadding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: Image.asset('assets/unknownUser.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Text(
                            'Aadhar Card',
                            style: Theme.of(context).primaryTextTheme.displayLarge,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CommonPadding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: Image.asset('assets/aadhar.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'Pan Card',
                            style: Theme.of(context).primaryTextTheme.displayLarge,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CommonPadding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: Image.asset('assets/pan.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


            )
          ],
        ),
      ),
    );
  }
}
