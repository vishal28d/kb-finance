import 'package:credit_app/views/BankerForm/Banker_form_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BankerFormScreen extends GetView<BankerFormController> {

  final BankerFormController bankerFormController = Get.put(BankerFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banker Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Select Bank Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedBank.value.isEmpty
                        ? null
                        : controller.selectedBank.value,
                    hint: Text("Select Bank or NBFC"),
                    onChanged: (newValue) {
                      controller.selectedBank.value = newValue!;
                    },
                    items: controller.banks.map((bank) {
                      return DropdownMenuItem(
                        value: bank,
                        child: Text(bank),
                      );
                    }).toList(),
                  )),
              SizedBox(height: 16),

              // Designation Input
              TextField(
                controller: controller.designationController,
                decoration: InputDecoration(
                  labelText: 'Designation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Full Name Input
              TextField(
                controller: controller.fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Email ID Input
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Select State Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedState.value.isEmpty
                        ? null
                        : controller.selectedState.value,
                    hint: Text("Select State"),
                    onChanged: (newValue) {
                      controller.selectedState.value = newValue!;
                      controller.selectedDistrict.value = ''; // Reset district when state changes
                    },
                    items: controller.states.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                  )),
              SizedBox(height: 16),

              // Select District Dropdown (based on selected state)
              Obx(() {
                if (controller.selectedState.value.isNotEmpty) {
                  return DropdownButtonFormField<String>(
                    value: controller.selectedDistrict.value.isEmpty
                        ? null
                        : controller.selectedDistrict.value,
                    hint: Text("Select District"),
                    onChanged: (newValue) {
                      controller.selectedDistrict.value = newValue!;
                    },
                    items: controller.districts[controller.selectedState.value]!
                        .map((district) {
                      return DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                  );
                }
                return SizedBox.shrink();
              }),
              SizedBox(height: 16),

              // Pincode Input
              TextField(
                controller: controller.pincodeController,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.isFormValid()) {
                      // Handle form submission
                      Get.snackbar("Success", "Form Submitted");
                      controller.clearForm(); // Clear form after submission
                    } else {
                      Get.snackbar("Error", "Please fill all fields");
                    }
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
