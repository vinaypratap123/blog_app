import 'package:blog_app/core/theme/color_constants.dart';
import 'package:blog_app/core/utils/validators.dart';
import 'package:blog_app/core/widgets/buttons/custom_button.dart';
import 'package:blog_app/core/widgets/common/custom_sizedbox.dart';
import 'package:blog_app/core/widgets/error/custom_error_snackbar.dart';
import 'package:blog_app/core/widgets/loader/circular_progress_indicator.dart';
import 'package:blog_app/core/widgets/text_fields/custom_text_field.dart';
import 'package:blog_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              /// auth error state
              if (state is AuthFailure) {
                customErrorSnackbar(context, state.message);
              }

              ///auth success state
              if (state is AuthSuccess) {
                context.go('/homeScreen');
              }
            },
            builder: (context, state) {
              ///auth loading state
              if (state is AuthLoading) {
                return customCircularProgressIndicator();
              }
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.sign_up,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const CustomSizedBox(
                      height: 15,
                    ),

                    ///.... Name text field
                    CustomTextField(
                      controller: _nameController,
                      hintText: AppLocalizations.of(context)!.full_name,
                      validator: customFullnameValidator,
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

                    ///.... signup button
                    CustomButton(
                      btnName: AppLocalizations.of(context)!.sign_up,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          debugPrint('signup Form is valid');
                          context.read<AuthBloc>().add(
                                AuthSignUpEvent(
                                  fullName: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                        } else {
                          debugPrint('signup Form is not valid');
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
                          AppLocalizations.of(context)!.already_have_account,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        InkWell(
                          onTap: () {
                            context.go('/');
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
