// import 'package:activeai/common_widget/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class EditProfileView extends StatefulWidget {
//   const EditProfileView({Key? key}) : super(key: key);

//   @override
//   State<EditProfileView> createState() => _EditProfileViewState();
// }

// class _EditProfileViewState extends State<EditProfileView> {
//   late Size media;
//   final TextEditingController _nameController =
//       TextEditingController(text: 'Jackson');
//   final TextEditingController _genderController =
//       TextEditingController(text: 'Male');
//   final TextEditingController _heightFeetController =
//       TextEditingController(text: '5');
//   final TextEditingController _heightInchesController =
//       TextEditingController(text: '1');
//   final TextEditingController _weightController =
//       TextEditingController(text: '128');
//   final TextEditingController _targetWeightController =
//       TextEditingController(text: '142');
//   final TextEditingController _dobController =
//       TextEditingController(text: '1989-05-02');
//   final TextEditingController _foodPreferenceController =
//       TextEditingController(text: 'Eggetarian');

//   @override
//   Widget build(BuildContext context) {
//     media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xFF141414),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             margin: const EdgeInsets.all(8),
//             height: 40,
//             width: 40,
//             alignment: Alignment.center,
//             child: Image.asset(
//               "assets/img/black_btn.png",
//               width: 20,
//               height: 20,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         title: const Text(
//           'Jackson',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 25,
//             fontFamily: 'Roboto',
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Add your save logic here
//             },
//             child: const Text(
//               'Save',
//               style: TextStyle(
//                 color: Color(0xFF046CC6),
//                 fontSize: 18,
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1.0),
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10.0),
//             height: 1.0,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           const Positioned.fill(
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/img/profile_bg.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Photo',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           CircleAvatar(
//                             radius: 30,
//                             child: IconButton(
//                               icon: Icon(Icons.camera_alt, color: Colors.white),
//                               onPressed: () {
//                                 // Add your change photo logic here
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField("Name", _nameController),
//                       _buildTextField("Gender", _genderController),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: GestureDetector(
//                               onTap: () {
//                                 _showFeetToCmDialog(context, media);
//                               },
//                               child: _buildTextField(
//                                   "Height", _heightFeetController,
//                                   suffix: ""),
//                             ),
//                           ),
//                           SizedBox(width: media.width * 0.2),
//                           Expanded(
//                             flex: 3,
//                             child: _buildTextField(
//                                 "   ", _heightInchesController,
//                                 suffix: "ft"),
//                           ),
//                         ],
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _showLbsToKgDialog(context, media);
//                         },
//                         child: _buildTextField("Weight", _weightController,
//                             suffix: "lbs"),
//                       ),
//                       _buildTextField("Target weight", _targetWeightController,
//                           suffix: "lbs"),
//                       _buildTextField("Date of Birth", _dobController),
//                       _buildTextField(
//                           "Food Preference", _foodPreferenceController),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Contact Info',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField("Email", TextEditingController()),
//                       _buildTextField("Code", TextEditingController()),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: _buildTextField("Mobile number", TextEditingController()),
//                           ),
//                           const SizedBox(width: 8),
//                           const Text(
//                             'Verified',
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 16,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       _buildTextField("Country", TextEditingController()),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Social',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField("Facebook link", TextEditingController()),
//                       _buildTextField("Twitter link", TextEditingController()),
//                       _buildTextField("Instagram link", TextEditingController()),
//                       _buildTextField("Linkedin link", TextEditingController()),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(String label, TextEditingController controller,
//       {String? suffix}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (label.isNotEmpty)
//             Text(
//               label,
//               style: const TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           const SizedBox(height: 4),
//           TextField(
//             controller: controller,
//             style: const TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               suffixText: suffix,
//               suffixStyle: const TextStyle(color: Colors.white),
//               enabledBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               focusedBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

import 'package:activeai/common_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<void> _pickImage() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // Handle the selected image
    print("Image selected: ${image.path}");
  }
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late Size media;

  final TextEditingController _nameController =
      TextEditingController(text: 'Jackson');
  final TextEditingController _genderController =
      TextEditingController(text: 'Male');
  final TextEditingController _heightFeetController =
      TextEditingController(text: '5');
  final TextEditingController _heightInchesController =
      TextEditingController(text: '1');
  final TextEditingController _weightController =
      TextEditingController(text: '128');
  final TextEditingController _targetWeightController =
      TextEditingController(text: '142');
  final TextEditingController _dobController =
      TextEditingController(text: '1989-05-02');
  final TextEditingController _foodPreferenceController =
      TextEditingController(text: 'Eggetarian');

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          'Jackson',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add save logic
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xFF046CC6),
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 1.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/profile_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  "Personal Info",
                  [
                    _buildPhotoRow(),
                    _buildTextField("Name", _nameController),
                    _buildTextField("Gender", _genderController),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showFeetToCmDialog(context, media),
                            child: _buildTextField(
                                "Height (ft)", _heightFeetController),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextField(
                              "Height (in)", _heightInchesController),
                        ),
                      ],
                    ),
// GestureDetector with media argument
                    GestureDetector(
                      onTap: () => _showLbsToKgDialog(
                          context, media), // Pass context and media
                      child: _buildTextField("Weight", _weightController),
                    ),

// Another GestureDetector with media argument (same update)
                    GestureDetector(
                      onTap: () => _showLbsToKgDialog(
                          context, media), // Pass context and media
                      child: _buildTextField("Weight", _weightController),
                    ),

// Continue with other TextFields
                    _buildTextField("Target Weight", _targetWeightController),
                    _buildTextField("Date of Birth", _dobController),
                    _buildTextField(
                        "Food Preference", _foodPreferenceController),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  "Contact Info",
                  [
                    _buildTextField("Email", TextEditingController()),
                    _buildTextField("Country", TextEditingController()),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                              "Mobile Number", TextEditingController()),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Verified',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSection(
                  "Social Links",
                  [
                    _buildTextField("Facebook Link", TextEditingController()),
                    _buildTextField("Twitter Link", TextEditingController()),
                    _buildTextField("Instagram Link", TextEditingController()),
                    _buildTextField("LinkedIn Link", TextEditingController()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildPhotoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Photo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Roboto',
          ),
        ),
        CircleAvatar(
          radius: 30,
          child: IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              // Add logic for photo upload
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {String? suffix}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixText: suffix,
              suffixStyle: const TextStyle(color: Colors.white),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFeetToCmDialog(BuildContext context, Size media) {
    String _selectedConversion = '';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Feet to Centimeters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedConversion = 'Feet to Centimeters';
                          });
                        },
                        child: Container(
                          width: 175,
                          height: 157,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: _selectedConversion == 'Feet to Centimeters'
                                ? Colors.white
                                : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: media.width * 0.01),
                              Row(
                                children: [
                                  SizedBox(width: 8),
                                  Text(
                                    "Feet to Centimeters",
                                    style: TextStyle(
                                      color: _selectedConversion ==
                                              'Feet to Centimeters'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "* Choose your conversion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RoundButton(
                    title: "Convert",
                    height: 60,
                    width: 360,
                    onPressed: () {
                      // Handle conversion logic
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showLbsToKgDialog(BuildContext context, Size media) {
    String _selectedConversion = '';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Pounds to Kilograms",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedConversion = 'Pounds to Kilograms';
                          });
                        },
                        child: Container(
                          width: 175,
                          height: 157,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: _selectedConversion == 'Pounds to Kilograms'
                                ? Colors.white
                                : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: media.width * 0.01),
                              Row(
                                children: [
                                  SizedBox(width: 8),
                                  Text(
                                    "Pounds to Kilograms",
                                    style: TextStyle(
                                      color: _selectedConversion ==
                                              'Pounds to Kilograms'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "* Choose your conversion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RoundButton(
                    title: "Convert",
                    height: 60,
                    width: 360,
                    onPressed: () {
                      // Handle conversion logic
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
