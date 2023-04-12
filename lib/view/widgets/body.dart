import 'package:flutter/material.dart';
import 'package:safety_url/model/urlInput.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  UrlInput newUrl = UrlInput();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value!.startsWith('http', 0)) {
      return 'Это не qr код сайта, а что-то другое. Пожалуйста попробуйте снова';
    } else {
      return null;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 50,
                width: size.width * 0.8,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    hintText: 'What do people call you?',
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _nameController.clear();
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: _validateName,
                  onSaved: (value) => newUrl.url = value!,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Проверить'),
            ),
          ],
        ),
      ),
    );
  }
}
