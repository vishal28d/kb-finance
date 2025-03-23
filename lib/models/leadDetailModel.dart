class LeadModel {
  final String id;  // Adding `id` field to handle the document ID
  final DateTime createdAt;
  final List<Detail> details;

  LeadModel({required this.id, required this.createdAt, required this.details});

  factory LeadModel.fromJson(Map<String, dynamic> json, String id) {
    return LeadModel(
      id: id,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'].seconds * 1000 + json['createdAt'].nanoseconds ~/ 1000000),
      details: (json['details'] as List<dynamic>).map((detail) => Detail.fromJson(detail as Map<String, dynamic>)).toList(),
    );
  }
}

class Detail {
  final String fullName;
  final String mobileNo;
  final String email;
  final int loanAmount;
  final String employmentType;
  final String loanType;
  final String aadharNo;
  final String panNo;
  final String location;

  Detail({
    required this.fullName,
    required this.mobileNo,
    required this.email,
    required this.loanAmount,
    required this.employmentType,
    required this.loanType,
    required this.aadharNo,
    required this.panNo,
    required this.location,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      fullName: json['Full Name'] ?? '',
      mobileNo: json['Mobile No'] ?? '',
      email: json['Email'] ?? '',
      loanAmount: json['Loan Amount'] ?? 0,
      employmentType: json['Employment Type'] ?? '',
      loanType: json['Loan Type'] ?? '',
      aadharNo: json['Aadhar No'] ?? '',
      panNo: json['PAN No'] ?? '',
      location: json['Location'] ?? '',
    );
  }
}
