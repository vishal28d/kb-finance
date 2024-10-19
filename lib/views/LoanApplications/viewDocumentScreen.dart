

import 'dart:io';
import 'dart:math';

import 'package:credit_app/widget/common_padding.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';

class DocumentView extends StatelessWidget {
  final List<Map<String, String>> documentLinks;

  DocumentView({required this.documentLinks});

  Future<void> _openPDF(BuildContext context, String url) async {
    try {
      // Show progress indicator while downloading the PDF temporarily to open
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Opening PDF...'), duration: Duration(seconds: 2)),
      );

      // Get the app's directory to store the file temporarily
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/temp.pdf');

      // Download the PDF
      Dio dio = Dio();
      await dio.download(url, file.path);

      // Open the PDF
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewScreen(filePath: file.path),
        ),
      );
    } catch (e) {
      print('Error opening PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open PDF')),
      );
    }
  }

  Future<void> _downloadFile(BuildContext context, String url) async {
    try {
      // Get the app's directory
  final downloadsDirectory = Directory('/storage/emulated/0/Download/');

  // Generate a random number
  final random = Random();
  final randomNumber = random.nextInt(10000); 
  final file = File('${downloadsDirectory.path}/document_$randomNumber.pdf');
      
      Dio dio = Dio();
      await dio.download(url, file.path);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File downloaded to ${file.path}')),
      );
    } catch (e) {
      print('Error downloading file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file')),
      );
    }
  }

  String getFileExtension(String url) {
    try {
      String fileName = url.split('/').last.split('?').first;
      return fileName.split('.').last.toLowerCase();
    } catch (e) {
      return '';
    }
  }

  bool isValidUrl(String url) {
    // Only show the document if it starts with http or https
    return url.startsWith('http') || url.startsWith('https');
  }

  Future<void> _downloadImage(BuildContext context, String url) async {
  try {

  final downloadsDirectory = Directory('/storage/emulated/0/Download/');
  final filePath = '${downloadsDirectory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
  final file = File(filePath);

    // Download the image
    Dio dio = Dio();
    await dio.download(url, file.path);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Image downloaded to ${file.path}')),
    );
  } catch (e) {
    print('Error downloading image: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to download image')),
    );
  }
}

@override
Widget build(BuildContext context) {
  return CommonPadding(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: documentLinks.where((document) {
          String value = document['value'] ?? '';
          return value.isNotEmpty && isValidUrl(value);
        }).map((document) {
          String title = document['title'] ?? 'Document';
          String value = document['value'] ?? 'N/A';
          String fileExtension = getFileExtension(value);

          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: CommonPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  DottedBorder(
                    strokeWidth: 1,
                    color: Theme.of(context).primaryColor,
                    child: GestureDetector(
                      onTap: () {
                        if (fileExtension == 'jpg' || fileExtension == 'png') {
                          // Handle image viewing here (e.g., show in a dialog or new screen)
                        } else if (fileExtension == 'pdf') {
                          _openPDF(context, value); // Open PDF without downloading
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: fileExtension == 'jpg' || fileExtension == 'png'
                            ? Stack(
                                children: [
                                  // GestureDetector to handle tap on the image
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to the FullImageScreen with the image URL
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FullImageScreen(imageUrl: value),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      value,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: SpinKitCircle(
                                              color: Theme.of(context).primaryColor,
                                              size: 50.0,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Center(child: Text('Error loading image'));
                                      },
                                    ),
                                  ),
                                  // Download button
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () => _downloadImage(context, value), // Trigger image download
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.black , // Red background color
                                          borderRadius: BorderRadius.circular(20), // Circular shape
                                        ),
                                        child: Icon(
                                          Icons.download, // Download icon
                                          color: Colors.white, // Black icon color
                                          size: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : fileExtension == 'pdf'
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // View PDF Button
                                      GestureDetector(
                                        onTap: () => _openPDF(context, value), // Open PDF
                                        child: Container(
                                          height: 50,
                                          width: 180,
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color:  Color(0xFF257180) ,  // Button background color
                                            borderRadius: BorderRadius.circular(8), // Rounded corners
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5), // Add shadow
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.picture_as_pdf, color: Colors.white, size: 20), // PDF icon
                                              SizedBox(width: 10), // Space between icon and text
                                              Text(
                                                'View PDF',
                                                style: TextStyle(fontSize: 15, color: Colors.white), // Text styling
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20), // Space between the buttons
                                      // Download PDF Button
                                      GestureDetector(
                                        onTap: () => _downloadFile(context, value), // Trigger the download
                                        child: Container(
                                          height: 50,
                                          width: 180,
                                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1A4870), // Button background color
                                            borderRadius: BorderRadius.circular(8), // Rounded corners
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5), // Add shadow
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.download, color: Colors.white, size: 20), // Download icon
                                              SizedBox(width: 10), // Space between icon and text
                                              Text(
                                                'Download PDF',
                                                style: TextStyle(fontSize: 15, color: Colors.white), // Text styling
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(child: Text('Unsupported file type')),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


class PDFViewScreen extends StatelessWidget {
  final String filePath;

  PDFViewScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Document'),
      ),
      body: PDFView(
        filePath: filePath,
        enableSwipe: true,
        swipeHorizontal: false,
        onError: (error) {
          print('Error while opening the PDF: $error');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error opening PDF')),
          );
        },
        onRender: (_pages) {
          print('Rendered with $_pages pages');
        },
        onPageChanged: (int? page, int? total) {
          print('Page changed: $page of $total');
        },
      ),
    );
  }
}



class FullImageScreen extends StatelessWidget {
  final String imageUrl;

  FullImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Image'),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(), // Show loading indicator
              );
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return Center(child: Text('Error loading image'));
          },
        ),
      ),
    );
  }
}
