import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m2_lesson9/screens/home/access_page.dart';
import 'package:m2_lesson9/utils/app_colors.dart';
import 'package:m2_lesson9/utils/app_icons.dart';
import 'package:m2_lesson9/utils/app_images.dart';
import 'package:m2_lesson9/utils/app_string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool light = true;
  bool isValidate = false;
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  late TextEditingController userNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Image.asset(AppImages.ellips),
                        SvgPicture.asset(AppIcons.backIcon)
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppString.welcome,
              style: TextStyle(
                  color: AppColors.C_1D1E20,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              AppString.data,
              style: TextStyle(
                  color: AppColors.C_8F959E,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 135,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: false,
                      controller: userNameController,
                      // initialValue: AppString.hemendraMali,
                      decoration: InputDecoration(
                          labelText: AppString.username,
                      suffixIcon: isValidate ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(AppIcons.checkIcon,),
                      ): null),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 4) {
                          return 'Username must be at least 4 characters in length';
                        }
                        return null;
                      },
                      onChanged: (value){
                        if(value.trim().length > 4){
                          setState(() {
                            isValidate = true;
                          });
                        }else{
                          setState(() {
                            isValidate = false;
                          });
                        }
                      }
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                       InputDecoration(labelText:  AppString.password,
                           suffixIcon: isValidate ? Text("Strong",
                           style: TextStyle(
                             fontSize: 11,
                             fontWeight: FontWeight.w400,
                             color: AppColors.C_34C759
                           ),): null
                      ),
                      obscureText: false,
                      validator: (value) {
                        if (!regex.hasMatch(value!)) {
                          return 'Enter a valid password';
                        }
                        if (value.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        // Return null if the entered password is valid
                        return null;
                      },

                      onChanged: (value){
                        if(value.trim().length > 8){
                          setState(() {
                            isValidate = true;
                          });
                        }else{
                          setState(() {
                            isValidate = false;
                          });
                        }
                      }
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppString.forgotPassword,
                      style: TextStyle(
                          color: AppColors.C_EA4335,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    AppString.rememberMe,
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.C_1D1E20,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Switch(
                      value: light,
                      activeColor: AppColors.C_34C759,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                AppString.accountConifirm,
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.C_8F959E,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AccessPage();
                        },
                        settings: RouteSettings(arguments: {
                          'name': userNameController.text,
                          'password': passwordController.text,
                        }),
                      ),
                    );
                  } /*else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Ma'lumot to'liq emas",
                    style: TextStyle(fontSize: 20),
                  ),
                  duration: Duration(seconds: 5),
                ),
              );
            }*/
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: AppColors.C_9775FA,
                  fixedSize: Size(375, 75)
                ),
                child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ))),
          ],
        ),
      ),
    );
  }
}

/*
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Eamil
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                        onChanged: (value) => _userEmail = value,
                      ),

                      /// username
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),

                      /// Password
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),

                      /// Confirm Password
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          if (value != _password) {
                            return 'Confimation password does not match the entered password';
                          }

                          return null;
                        },
                        onChanged: (value) => _confirmPassword = value,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              onPressed: _trySubmitForm,
                              child: const Text('Sign Up')))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}*/
