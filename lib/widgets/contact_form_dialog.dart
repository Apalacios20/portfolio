import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    // const serviceId = 'service_sg3xr2u';
    // const templateId = 'template_nc2kosl';
    var serviceId = dotenv.env['EMAILJS_SERVICE_ID'];
    var templateId = dotenv.env['EMAILJS_TEMPLATE_ID'];

    Map<String, dynamic> templateParams = {
      'from_name': '${_nameController.text}  ${_emailController.text}',
      'message': _messageController.text
    };

    try {
      await emailjs.send(
        serviceId!,
        templateId!,
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
