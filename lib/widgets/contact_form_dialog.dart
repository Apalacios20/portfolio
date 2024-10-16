import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:get/get.dart';

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

  Future<void> sendEmail(
      String name, String email, String message, context) async {
    var serviceId = dotenv.env['EMAILJS_SERVICE_ID'];
    var templateId = dotenv.env['EMAILJS_TEMPLATE_ID'];
    var publicKey = dotenv.env['EMAILJS_PUBLIC_KEY'];
    var privateKey = dotenv.env['EMAILJS_PRIVATE_KEY'];

    Map<String, dynamic> templateParams = {
      'from_name': '${_nameController.text}  ${_emailController.text}',
      'message': _messageController.text
    };

    try {
      await emailjs.send(
        serviceId!,
        templateId!,
        templateParams,
        emailjs.Options(
          publicKey: publicKey,
          privateKey: privateKey,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully')),
      );
      debugPrint('EMAIL SUCCESS!');
    } catch (error) {
      debugPrint('EMAIL DENIED!');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email, error: $error')),
        // Text('Email sent successfully')),
      );
      debugPrint('Error: $error');
    }
  }

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
                context,
              ).then((_) {
                if (mounted) {
                  Get.back();
                }
              });
            }
          },
          child: const Text('Send'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
