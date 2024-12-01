import 'package:blog_app/core/theme/color_constants.dart';
import 'package:blog_app/core/theme/theme_selection_bottom_sheet.dart';
import 'package:blog_app/core/utils/validators.dart';
import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/common/custom_bottom_sheet.dart';
import 'package:blog_app/core/widgets/common/custom_sizedbox.dart';
import 'package:blog_app/core/widgets/error/custom_error_snackbar.dart';
import 'package:blog_app/core/widgets/text_fields/custom_text_field.dart';
import 'package:blog_app/feature/profile/widgets/logout_bottom_sheet.dart';
import 'package:blog_app/l10n/widgets/language_selection_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  //late NetworkInfo networkInfo;

  ///.... initialization of Controllers and _formKey
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    //networkInfo = NetworkInfoImpl();
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
      appBar: AppBar(
        actions: [
          ///check for internet  button
          IconButton(
            onPressed: () async {
              customErrorSnackbar(context, 'No internet connection');
            },
            icon: const Icon(
              Icons.person_outlined,
            ),
          ),

          ///theme change icon button
          IconButton(
            onPressed: () {
              showCustomBottomSheet(
                context,
                const ThemeSelectionBottomSheet(),
              );
            },
            icon: const Icon(
              Icons.dark_mode_outlined,
            ),
          ),

          ///language change icon button
          IconButton(
            onPressed: () {
              showCustomBottomSheet(
                context,
                const LanguageSelectionBottomSheet(),
              );
            },
            icon: const Icon(
              Icons.language_outlined,
            ),
          ),

          ///logout icon button
          IconButton(
            onPressed: () {
              showCustomBottomSheet(
                context,
                const LogoutConfirmationBottomSheet(),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
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
                  AppLocalizations.of(context)!.login,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const CustomSizedBox(
                  height: 15,
                ),

                ///.... Email text field
                CustomTextField(
                  controller: _emailController,
                  hintText: AppLocalizations.of(context)!.email,
                  validator: customEmailValidator,
                ),
                const CustomSizedBox(
                  height: 15,
                ),

                ///.... Password text field
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppLocalizations.of(context)!.password,
                  isPasswordField: true,
                  validator: customPasswordValidator,
                ),
                const CustomSizedBox(
                  height: 30,
                ),

                ///.... login button
                CustomButton(
                  btnName: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      debugPrint('login Form is valid');
                    } else {
                      debugPrint('login Form is not valid');
                    }
                  },
                ),

                const CustomSizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.do_not_have_account,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap: () {
                        context.go('/signupScreen');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.sign_up,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
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
