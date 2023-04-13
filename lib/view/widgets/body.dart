import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safety_url/model/urlInput.dart';

class UrlInput {
  set url(String url) {}
}

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
                  height: 100,
                  width: size.width * 0.8,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Введите ссылку',
                      prefixIcon: SvgPicture.asset('assets/url_icon.svg'),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _nameController.clear();
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          child: const Icon(
                            size: 32,
                            Icons.delete_outline,
                            color: Colors.orange,
                          ),
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
                child: const Text('Проверить'),
              ),
            ],
          ),
        ),
      );
    }
  }


class CenterOutput extends StatelessWidget {
  CenterOutput({super.key, required this.data});
  String data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: data != '-1' ? Text(data) : Text('Ошибка'),
      actions: [],
    );
  }
}
