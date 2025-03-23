class LeadsData {
  // List to store lead details
  List<String> leadDetails = [];

  // Method to add lead details to the list
  void addLeadDetail(String leadDetail) {
    leadDetails.add(leadDetail);
  }

  // Optional: Method to fetch all lead details
  List<String> getAllLeadDetails() {
    return leadDetails;
  }

  
}