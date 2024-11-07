import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/utils/validators.dart';
import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ///.... Text Editing Controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  ///.... _formKey
  late GlobalKey<FormState> _formKey;

  ///.... initialization of Controllers and _formKey
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  ///.... release the resources
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///.... Name text field
                CustomTextField(
                  controller: _nameController,
                  hintText: StringConstants.userName,
                  validator: customUsernameValidator,
                ),
                const SizedBox(
                  height: 10,
                ),

                ///.... Email text field
                CustomTextField(
                  controller: _emailController,
                  hintText: StringConstants.email,
                  validator: customEmailValidator,
                ),
                const SizedBox(
                  height: 10,
                ),

                ///.... Password text field
                CustomTextField(
                  controller: _passwordController,
                  hintText: StringConstants.password,
                  isPasswordField: true,
                  validator: customPasswordValidator,
                ),
                const SizedBox(
                  height: 30,
                ),

                ///.... signup button
                CustomButton(
                  btnName: StringConstants.signup,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      debugPrint('signup Form is valid');
                    } else {
                      debugPrint('signup Form is not valid');
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(StringConstants.alreadyHaveAccount),
                    InkWell(
                      onTap: () {
                        context.go('/');
                      },
                      child: const Text(StringConstants.login),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
