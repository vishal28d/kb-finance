import 'package:credit_app/views/CommonLoanForm/common_loan_form.dart';
import 'package:credit_app/widget/not_available_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Ensure this import for SVGs

class OtherLoansAndCreditCard extends StatelessWidget {
  final List<String> loanNames = [
    'Micro \n Loan',
    'Gold \n Loan',
    'Education \n Loan',
    'Credit \n Card'
  ];

  final List<String> iconList = [
    'assets/loan_icons/micro_loan.png',
    'assets/loan_icons/gold_loan.png',
    'assets/loan_icons/education_loan.png',
    'assets/loan_icons/credit_card.png' ,
   
    'assets/business-svgrepo-com.svg',
    'assets/bank.svg',
    'assets/Group 650.svg',
    'assets/otherloan.svg',
    'assets/otherloanservice.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: Color(0xFFC63437),  // Applying custom color
        margin: EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
              child: Text(
                'Other Loans & Credit Card',
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
                  4,
                  (index) => GestureDetector(
                    onTap: () {
                      // Handle navigation on tap based on index
                      Get.to(() => NotAvailablePage());
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
                                    iconList[index],
                                    height: 45,
                                    // ignore: deprecated_member_use
                                    color: Color(0xFFC63437), // Applying color to SVG icons
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
                              '${loanNames[index]}',
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
    );
  }
}
