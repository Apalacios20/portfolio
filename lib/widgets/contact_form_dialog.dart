import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:emailjs/emailjs.dart' as emailjs;

class ContactDialog extends StatefulWidget {
  const ContactDialog({super.key});

  @override
  ContactDialogState createState() => ContactDialogState();
}

class ContactDialogState extends State<ContactDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> sendEmail(String name, String email, String message) async {
    const serviceId = 'service_sg3xr2u';
    const templateId = 'template_nc2kosl';
    // const userId = 'your_user_id';

    Map<String, dynamic> templateParams = {
      'from_name': '${_nameController.text}  ${_emailController.text}',
      'message': _messageController.text
    };

    try {
      await emailjs.send(
        serviceId,
        templateId,
        templateParams,
        const emailjs.Options(
          publicKey: 'ZE09F4i9pMz6odtV9',
          privateKey: 'xzAEeAPo8qOOErq0UqN_a',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully')),
      );
      debugPrint('EMAIL SUCCESS!');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email: $error')),
      );
      debugPrint('Error: $error');
    }

    // AP20 old but works
    // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    // try {
    //   final response = await http.post(
    //     url,
    //     headers: {
    //       'origin': 'http://localhost',
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({
    //       'service_id': serviceId,
    //       'template_id': templateId,
    //       'user_id': userId,
    //       'template_params': {
    //         'name': name,
    //         'email': email,
    //         'message': message,
    //       },
    //     }),
    //   );

    //   if (response.statusCode == 200) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Email sent successfully')),
    //     );
    //   } else {
    //     debugPrint("AP20 else statement");
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Failed to send email')),
    //     );
    //   }
    // } catch (error) {
    //   debugPrint("AP20 catche error $error");
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('An error occurred: $error')),
    //   );
    // }
  }

  // Future<void> sendEmail(String name, String email, String message) async {
  //   const serviceId = 'your_service_id';
  //   const templateId = 'your_template_id';
  //   const userId = 'your_user_id';

  //   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'origin': 'http://localhost',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'service_id': serviceId,
  //       'template_id': templateId,
  //       'user_id': userId,
  //       'template_params': {
  //         'name': name,
  //         'email': email,
  //         'message': message,
  //       },
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Email sent successfully')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to send email')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Look forward to hearing from you!'),
      content: Container(
        width: 500,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(labelText: 'Message'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              sendEmail(
                _nameController.text,
                _emailController.text,
                _messageController.text,
              ).then((_) => Navigator.of(context).pop());
            }
          },
          child: const Text('Send'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

// void showContactDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: ContactDialog(),
//       );
//     },
//   );
// }


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ContactDialog extends StatefulWidget {
//   const ContactDialog({
//     super.key,
//   });

//   @override
//   State<ContactDialog> createState() => _ContactDialogState();
// }

// class _ContactDialogState extends State<ContactDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       elevation: 25,
//       content: Container(
//         height: MediaQuery.of(context).size.height * .28,
//         width: MediaQuery.of(context).size.width * .5,
//         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//         child: 
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Contact me',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 35.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             // TODO: ADD FUNCTIONALITY TO FORM
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Name',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20.0),
//             TextFormField(
//               minLines: 4,
//               maxLines: null,
//               decoration: const InputDecoration(
//                 labelText: 'Message',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
