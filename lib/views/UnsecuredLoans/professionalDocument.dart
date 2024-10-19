// import 'package:credit_app/controllers/professional_loan_controller.dart';
import 'package:credit_app/views/UnsecuredLoans/professional_loan_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadDocumentsScreen extends StatefulWidget {
  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  final loanController = Get.put(ProfessionalDocController());

  final professionalController = Get.put(ProfessionalLoanController()) ; 

  void initState(){
    super.initState();
  }

  Future<void> _pickImage(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      loanController.setDocument(docType, filePath);
    }
  }

  Future<void> _pickPDF(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      loanController.setDocument(docType, filePath);
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Upload Documents' ), leading: Container() , centerTitle: true,),
    body: Obx(() {
      // Show loading spinner when uploading
      if (loanController.isLoading.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Document Upload is in progress...', style: TextStyle(color: Colors.black54, fontSize: 20)),
              CircularProgressIndicator(strokeWidth: 5),
            ],
          ),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your selected loan type : ${professionalController.selectedLoanType}', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),

            // Always Required Fields
            _buildUploadCard(context, 'Aadhar Card', 'aadhar'),
            SizedBox(height: 10),
            _buildUploadCard(context, 'Pan Card', 'pan'),
            SizedBox(height: 10),
            _buildUploadCard(context, 'Latest Electricity Bill', 'electricity_bill'),
            SizedBox(height: 10),
            _buildUploadCard(context, 'Latest 6 Months Bank Statement From 1st Day', 'bank_statement'),
            SizedBox(height: 10),
            _buildUploadCard(context, 'Selfie Photo', 'selfie'),
            SizedBox(height: 10),

            // Conditional Fields based on Loan Type
            if (professionalController.selectedLoanType.value == 'Professional Loan' || professionalController.selectedLoanType.value == 'Business Loan') ...[
              _buildUploadCard(context, 'Gumasta / GST / Other Licence', 'licence'),
              SizedBox(height: 10),
              _buildUploadCard(context, 'ITR Last 3 Years', 'itr'),
              SizedBox(height: 10),
            ],

            if (professionalController.selectedLoanType.value == 'Professional Loan') ...[
              _buildUploadCard(context, 'Photo Of Degree', 'degree'),
              SizedBox(height: 10),
            ],

            if (professionalController.selectedLoanType.value == 'Business Loan' || professionalController.selectedLoanType.value == 'Professional Loan' ) ...[
              if (professionalController.isAudited.value == "Yes") ...[
                _buildUploadCard(context, 'Last 2 Years Audit Report', 'audit_report'),
                SizedBox(height: 10),
                _buildUploadCard(context, 'Last 12 Month GST', 'audit_gst'),
                SizedBox(height: 10),
              ],
            ],

            if (professionalController.selectedLoanType.value == 'Personal Loan') ...[
              _buildUploadCard(context, 'Latest 3 Month Salary Slip', 'salary_slip_3month'),
              SizedBox(height: 10),
              _buildUploadCard(context, 'Form 16 / Form 26AS / Joining Letter', 'form16_JoiningLetter'),
              SizedBox(height: 10),
            ],

            if (professionalController.selectedLoanType.value == 'Balance Transfer') ...[
              _buildUploadCard(context, 'Loan Statement', 'loan_statement'),
              SizedBox(height: 10),
              _buildUploadCard(context, 'Foreclosure', 'foreclosure'),
              SizedBox(height: 10),
            ],

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                onPressed: () async {
                  await loanController.uploadAllDocuments();
                  if (loanController.isError.value) {
                    // Show error snackbar if upload fails
                    Get.snackbar('Upload Failed', 'Some documents failed to upload. Please try again.', backgroundColor: Colors.red[400], duration: Duration(seconds: 5));
                  } else {
                    Get.snackbar('Upload Complete', 'All documents uploaded successfully.', backgroundColor: Colors.green[400], duration: Duration(seconds: 5));
                    setState(() {
                      loanController.clearSelectedDocuments() ;
                    });
                  }
                },
                child: Text('Upload All Documents'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    }),
  );
}

  Widget _buildUploadCard(BuildContext context, String label, String docType) {
    return DocumentUploadCard(
      label: label,
      docType: docType,
      onPickImage: () => _pickImage(docType),
      onPickPDF: () => _pickPDF(docType),
    );
  }
}

// DocumentUploadCard widget
class DocumentUploadCard extends StatelessWidget {
  final String label;
  final String docType;
  final Future<void> Function() onPickImage;
  final Future<void> Function() onPickPDF;

  const DocumentUploadCard({
    Key? key,
    required this.label,
    required this.docType,
    required this.onPickImage,
    required this.onPickPDF,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a local observable for the file type
    Rx<bool> isImageUpload = true.obs;
    final ProfessionalDocController loanController = Get.find();

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() {
                    final filePath = loanController.getDocument(docType);
                    return Text(
                      filePath.isNotEmpty ? 'Uploaded:\n ${filePath.split('/').last}' : 'No file selected',
                      style: TextStyle(
                        color: filePath.isNotEmpty ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ),
                IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                    if (isImageUpload.value) {
                      onPickImage();
                    } else {
                      onPickPDF();
                    }
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          
            // Radio buttons for selecting file type
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Upload Type', style: TextStyle(color: Colors.black54)),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: isImageUpload.value,
                            onChanged: (value) {
                              if (value != null) {
                                isImageUpload.value = true;
                              }
                            },
                          ),
                          Text("Image", style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: isImageUpload.value,
                            onChanged: (value) {
                              if (value != null) {
                                isImageUpload.value = false;
                              }
                            },
                          ),
                          Text("PDF", style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
        
            Divider(thickness: 1.5, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}



class ProfessionalDocController extends GetxController {
  var selectedJobType = ''.obs;
  var isAuditSelected = false.obs;
  var isLoading = false.obs; // Observable to track loading state
  var isError = false.obs; // Observable to track error state

  // To store the file paths of the uploaded documents
  Map<String, String> documents = {
    'aadhar': '',
    'pan': '',
    'electricity_bill': '',
    'bank_statement': '',
    'selfie': '',
    'licence': '',
    'itr': '',
    'degree': '',
    'salary_slip_3month': '',
    'form16_JoiningLetter': '',
    'loan_statement': '',
    'foreclosure': '',
    'audit_report': '',
    'audit_gst': '',
  }.obs;

  // To store the download links of the uploaded documents
  RxMap downloadLinks = {}.obs;

  void setDocument(String docType, String path) {
    documents[docType] = path;
  }

  String getDocument(String docType) {
    return documents[docType] ?? '';
  }

  Future<String> uploadDocumentToFirebase(String docType, String filePath) async {
    File file = File(filePath);
    try {
      String fileName = filePath.split('/').last;
      Reference storageRef = FirebaseStorage.instance.ref().child('unsecuredLoan/$docType/$fileName');

      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL after the file is uploaded
      String downloadURL = await snapshot.ref.getDownloadURL();
      print(downloadURL) ;

      return downloadURL;
    } catch (e) {
      print('Error uploading $docType: $e');
      return '';
    }
  }

  Future<void> uploadAllDocuments() async {
    isLoading.value = true; // Start loading
    isError.value = false; // Reset error state
    downloadLinks.clear(); // Clear previous download links

    for (String docType in documents.keys) {
      String filePath = documents[docType] ?? '';
      if (filePath.isNotEmpty) {
        // Upload the document and get the download URL
        String downloadURL = await uploadDocumentToFirebase(docType, filePath);
        if (downloadURL.isEmpty) {
          isError.value = true; // Set error state if upload fails
        } else {
          // Save the download URL to the downloadLinks map
          downloadLinks[docType] = downloadURL;
          
        }
      }
    }

    print('uploaded all docs') ;
    isLoading.value = false; // Stop loading
  }

  // Function to get download link of a specific document
  String getDownloadLink(String docType) {
    return downloadLinks[docType] ?? '';
  }

   // Clear the selected documents
  void clearSelectedDocuments() {
    documents.updateAll((key, value) => ''); // Clear all file paths
  }

  // Called when the controller is no longer needed
  @override
  void onClose() {
    super.onClose();
    clearSelectedDocuments(); 
  }



}
