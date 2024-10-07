// loan_model.dart
class LoanModel {
  final String name;
  final String mobile;
  final String email;
  final String alternateMobile;
  final double loanAmount;
  final String maritalStatus;
  final String currentAddress;
  final String currentPin;
  final String currentLandmark;
  final String houseType;
  final String SpousesName;
  final String SpousesMobile;
  final int yearsAtCity;
  final String ownershipStatus;
  final String permanentAddress;
  final String permanentLandmark;
  final String permanentPin;
  final String religion;
  final String loanType;
  final String squareFeet;

  LoanModel({
    required this.name,
    required this.mobile,
    required this.email,
    required this.alternateMobile,
    required this.loanAmount,
    required this.maritalStatus,
    required this.currentAddress,
    required this.currentPin,
    required this.currentLandmark,
    required this.houseType,
    required this.SpousesName,
    required this.SpousesMobile,
    required this.yearsAtCity,
    required this.ownershipStatus,
    required this.permanentAddress,
    required this.permanentLandmark,
    required this.permanentPin,
    required this.religion,
    required this.loanType,
    required this.squareFeet,
  });

  // You can also add a method to convert from JSON if you're fetching data from an API.
  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      name: json['Name'],
      mobile: json['Mobile'],
      email: json['Email'],
      alternateMobile: json['Alternate Mobile'],
      loanAmount: json['Loan Amount'],
      maritalStatus: json['Marital Status'],
      currentAddress: json['Current Address'],
      currentPin: json['Current Pin'],
      currentLandmark: json['Current Landmark'],
      houseType: json['House Type'],
      SpousesName: json["Spouse's Name"],
      SpousesMobile: json["Spouse's Mobile"],
      yearsAtCity: json['Years at City'],
      ownershipStatus: json['Ownership Status'],
      permanentAddress: json['Permanent Address'],
      permanentLandmark: json['Permanent Landmark'],
      permanentPin: json['Permanent Pin'],
      religion: json['Religion'],
      loanType: json['Loan Type'],
      squareFeet: json['Square Feet'],
    );
  }
}
