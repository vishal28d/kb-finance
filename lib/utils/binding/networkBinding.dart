//packages
import 'package:credit_app/controllers/bottom_nav_controller.dart';
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/controllers/check_loan_eligibility_controller.dart';
import 'package:credit_app/controllers/cibili_score_controller.dart';
import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:credit_app/controllers/home_loan_controller.dart';
import 'package:credit_app/controllers/lean_controller.dart';
import 'package:credit_app/controllers/loan_against_property_controller.dart';
import 'package:credit_app/controllers/loan_application_controller.dart';
import 'package:credit_app/controllers/loan_compare_controller.dart';
import 'package:credit_app/controllers/loginController.dart';
import 'package:credit_app/controllers/other_loan_controller.dart';
import 'package:credit_app/controllers/other_service_controller.dart';
import 'package:credit_app/controllers/otp_verification_controller.dart';
import 'package:credit_app/controllers/permission_controller.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/controllers/reward_controller.dart';
import 'package:credit_app/views/BankerForm/Banker_form_Controller.dart';
import 'package:get/get.dart';
import 'package:credit_app/controllers/imageController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageControlller>(() => ImageControlller(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController(), fenix: true);
    Get.lazyPut<PersonalLoanController>(() => PersonalLoanController(), fenix: true);
    Get.lazyPut<BusinessLoanController>(() => BusinessLoanController(), fenix: true);
    Get.lazyPut<HomeLoanController>(() => HomeLoanController(), fenix: true);
    Get.lazyPut<LoanAgainstPropertyController>(() => LoanAgainstPropertyController(), fenix: true);
    Get.lazyPut<OtherLoanController>(() => OtherLoanController(), fenix: true);
    Get.lazyPut<OtherServicesController>(() => OtherServicesController(), fenix: true);
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<LoanApplicationController>(() => LoanApplicationController(), fenix: true);
    Get.lazyPut<AddLeadController>(() => AddLeadController(), fenix: true);
    Get.lazyPut<EmiCalculatorController>(() => EmiCalculatorController(), fenix: true);
    Get.lazyPut<CIBILScoreController>(() => CIBILScoreController(), fenix: true);
    Get.lazyPut<LoanEligibilityController>(() => LoanEligibilityController(), fenix: true);
    Get.lazyPut<RewardController>(() => RewardController(), fenix: true);
    Get.lazyPut<PermissionController>(() => PermissionController(), fenix: true);
    Get.lazyPut<LoanCompareController>(() => LoanCompareController(), fenix: true);
    Get.lazyPut<BankerFormController>(() => BankerFormController(), fenix:true ) ;

  }
}
