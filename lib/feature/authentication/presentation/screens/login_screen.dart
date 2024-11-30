import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/theme/color_constants.dart';
import 'package:blog_app/core/utils/validators.dart';
import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///.... Text Editing Controllers
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  ///.... _formKey
  late GlobalKey<FormState> _formKey;

  ///.... initialization of Controllers and _formKey
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  ///.... release the resources
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                Text(
                  StringConstants.login,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 15,
                ),

                ///.... Email text field
                CustomTextField(
                  controller: _emailController,
                  hintText: StringConstants.email,
                  validator: customEmailValidator,
                ),
                const SizedBox(
                  height: 15,
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

                ///.... login button
                CustomButton(
                  btnName: StringConstants.login,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      debugPrint('login Form is valid');
                    } else {
                      debugPrint('login Form is not valid');
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
                    Text(
                      StringConstants.doNotHaveAccount,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    InkWell(
                      onTap: () {
                        context.go('/signupScreen');
                      },
                      child: Text(
                        StringConstants.signup,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorConstants.blueColor),
                      ),
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
