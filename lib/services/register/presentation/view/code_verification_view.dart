import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roxio/core/utils/styles/text_styles.dart';
import 'package:roxio/core/utils/widgets/custom_button.dart';
import 'package:roxio/core/utils/widgets/custom_title_text.dart';
import 'package:roxio/services/home/presentation/view/home_view.dart';
import 'package:roxio/services/register/presentation/view_model/register_cubit.dart';

import 'widgets/custom_code_verification_field.dart';

class CodeVerificationView extends StatefulWidget {
  const CodeVerificationView({super.key});

  static const routeName = 'codeVerificationView';

  @override
  State<CodeVerificationView> createState() => _CodeVerificationViewState();
}

class _CodeVerificationViewState extends State<CodeVerificationView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!hasBeenCalled) {
      hasBeenCalled = true;
      bloc = BlocProvider.of<RegisterCubit>(context);
      phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
      bloc.verifyPhoneNumber(phoneNumber);
    }
  }

  final List<TextEditingController> codeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  late final RegisterCubit bloc;

  late final String verificationId;
  late final String phoneNumber;
  bool hasBeenCalled = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        } else if (state is RegisterCodeSent) {
          verificationId = state.verificationId;
        } else if (state is RegisterSuccess) {
          bloc.close();
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                child: Image.asset(
                  'assets/images/code_verification_view_image.png',
                ),
              ),
              CustomTitleText(regularText: 'Verification ', boldText: 'Code'),
              SizedBox(height: 17),
              Text(
                'Please type the verification code\nsent to $phoneNumber',
                textAlign: TextAlign.center,
                style: AppTextStyles.text16,
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCodeVerificationField(
                        codeController: codeControllers[0]),
                    CustomCodeVerificationField(
                        codeController: codeControllers[1]),
                    CustomCodeVerificationField(
                        codeController: codeControllers[2]),
                    CustomCodeVerificationField(
                        codeController: codeControllers[3]),
                    CustomCodeVerificationField(
                        codeController: codeControllers[4]),
                    CustomCodeVerificationField(
                        codeController: codeControllers[5]),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 25),
                child: CustomButton(
                  onPressed: () {
                    String smsCode = codeControllers
                        .map((e) => e.text)
                        .reduce((value, element) => value + element);
                    bloc.signInWithPhone(verificationId, smsCode);
                  },
                  buttonText: 'Verify',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
