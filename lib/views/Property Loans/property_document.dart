
import 'package:credit_app/views/Property%20Loans/property_loan_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class PropertyUploadDocumentsScreen extends StatefulWidget {
  @override
  State<PropertyUploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<PropertyUploadDocumentsScreen> {
  final propertyDocController = Get.put(PropertyDocController());

  final propertyLoanController = Get.put(PropertyLoanController()) ; 

  Future<void> _pickImage(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      propertyDocController.setDocument(docType, filePath);
    }
  }

  Future<void> _pickPDF(String docType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      propertyDocController.setDocument(docType, filePath);
    }
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Upload Documents' ), leading: Container() , centerTitle: true,),
    body: Obx(() {
      // Show loading spinner when uploading
      if (propertyDocController.isLoading.value) {
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
  Text('Your selected loan type : ${propertyLoanController.selectedLoanType}', style: Theme.of(context).textTheme.titleLarge),
  SizedBox(height: 10),

  // Conditional Fields based on Loan Type
      Text("KYC Documents" , style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 17 ),) ,
     SizedBox(height: 10,),

          Obx(() {
                List<Widget> documentWidgets = [
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
  ];

  // Conditionally show documents based on the selected occupation
            if (propertyLoanController.selectedJobType.value == "Job") {
              documentWidgets.addAll([
                _buildUploadCard(context, 'Photo Of Degree', 'degree'),
                SizedBox(height: 10),
                _buildUploadCard(context, 'Form 16 / Form 26AS / Joining Letter', 'form16_JoiningLetter'),
              ]);
            } else if (propertyLoanController.selectedJobType.value == "Business") {
              documentWidgets.addAll([
                _buildUploadCard(context, 'Gumasta / GST / Other Licence', 'licence'),
                SizedBox(height: 10),
                _buildUploadCard(context, 'ITR Last 3 Years', 'itr'),
              ]);
           }

        return Column(children: documentWidgets);
      }),
      SizedBox(height: 10,),
      Text("Property Loan Documents" , style: TextStyle(color: Colors.black54 , fontWeight: FontWeight.bold , fontSize: 17 ),) ,

            SizedBox(height: 10,),
            _buildUploadCard(context, 'Registery Paper', 'registery_paper'),
            SizedBox(height: 10,),
            _buildUploadCard(context, 'Rin Pustika ', 'rin_pustika'),
            SizedBox(height: 10,),
            _buildUploadCard(context, 'B1 P2', 'b1_p2'),
            SizedBox(height: 10,),
            _buildUploadCard(context, 'Diversion Paper', 'diversion_paper'),
            SizedBox(height: 10,),
            _buildUploadCard(context, 'Building Permission', 'building_permission'),
            SizedBox(height: 10,),
            _buildUploadCard(context, 'Nashri Naksha', 'nashri_naksha'),


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
        await propertyDocController.uploadAllDocuments();
        if (propertyDocController.isError.value) {
          // Show error snackbar if upload fails
          Get.snackbar('Upload Failed', 'Some documents failed to upload. Please try again.', backgroundColor: Colors.red[400], duration: Duration(seconds: 5));
        } else {
          Get.snackbar('Upload Complete', 'All documents uploaded successfully.', backgroundColor: Colors.green[400], duration: Duration(seconds: 5));
          setState(() {
            propertyDocController.clearSelectedDocuments();
          });

        }
      },
      child: Text('Uploaded All Documents'),
      
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
    final PropertyDocController loanController = Get.find<PropertyDocController>();

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
                      filePath.isNotEmpty ? 'Upload:\n ${filePath.split('/').last}' : 'No file selected',
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


class PropertyDocController extends GetxController {
  var selectedJobType = ''.obs;
 
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
  'form16_JoiningLetter': '',         
  
  // Property docs
  'registery_paper': '',              
  'rin_pustika': '',                  
  'b1_p2': '',                        
  'diversion_paper': '',              
  'building_permission': '',          
  'nashri_naksha': '',      

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
      Reference storageRef = FirebaseStorage.instance.ref().child('propertyLoanDocuments/$docType/$fileName');

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
