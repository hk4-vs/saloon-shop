import 'package:barber/resources/components/custom_input_fields.dart';
import 'package:barber/resources/components/gender_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_owner_bloc/create_owner_bloc.dart';

class CreateOwnerView extends StatefulWidget {
  const CreateOwnerView({super.key});

  @override
  State<CreateOwnerView> createState() => _CreateOwnerViewState();
}

class _CreateOwnerViewState extends State<CreateOwnerView> {
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Step> stepList = [
      Step(
        title: const Text("Personal Info"),
        content: const PersonalInfoStepWidget(),
        isActive: _activeStepIndex >= 0,
      ),
      Step(
        title: const Text("Salon Details"),
        content: const ShopDetailsStepWidget(),
        isActive: _activeStepIndex >= 1,
      ),
      Step(
        title: const Text("Confirm"),
        content: const ConfirmStepWidget(),
        isActive: _activeStepIndex >= 2,
      ),
    ];
    return Scaffold(
        body: SafeArea(
      child: BlocProvider<CreateOwnerBloc>(
          create: (context) => CreateOwnerBloc(),
          child: Stepper(
            type: StepperType.horizontal,
            steps: stepList,
            currentStep: _activeStepIndex,
            onStepContinue: () {
              setState(() {
                _activeStepIndex < 2
                    ? _activeStepIndex += 1
                    : _activeStepIndex = 0;
              });
            },
          )),
    ));
  }
}

class ConfirmStepWidget extends StatelessWidget {
  const ConfirmStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Confirm");
  }
}

class ShopDetailsStepWidget extends StatelessWidget {
  const ShopDetailsStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 70.0,
        ),
        SizedBox(
          height: 12,
        ),
        CustomInputFieldWidget(
            fieldName: "Saloon Name", hindText: "Lovely Saloon"),
        SizedBox(
          height: 12,
        ),
        CustomInputFieldWidget(fieldName: "State", hindText: "Chattisgarh"),
        SizedBox(
          height: 12,
        ),
        CustomInputFieldWidget(fieldName: "City", hindText: "Raipur"),
        SizedBox(
          height: 12,
        ),
        CustomInputFieldWidget(
          fieldName: "Phone",
          hindText: "7417417411",
        ),
        SizedBox(
          height: 12,
        ),
        CustomInputFieldWidget(
          fieldName: "Address",
          hindText: "Tatibandh, Raipur Chattisgarh",
          maxLines: 4,
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class PersonalInfoStepWidget extends StatelessWidget {
  const PersonalInfoStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 70.0,
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomInputFieldWidget(
            fieldName: "Owner Name", hindText: "Vinay Singh"),
        const SizedBox(
          height: 12,
        ),
        const CustomInputFieldWidget(
            fieldName: "Email", hindText: "owner@barber.com"),
        const SizedBox(
          height: 12,
        ),
        const CustomInputFieldWidget(
          fieldName: "Phone",
          hindText: "7417417411",
        ),
        const SizedBox(
          height: 12,
        ),
        GenderWidget(onGenderSelected: (value) {}),
        const SizedBox(
          height: 12,
        ),
        const CustomInputFieldWidget(
          fieldName: "Address",
          hindText: "Tatibandh, Raipur Chattisgarh",
          maxLines: 4,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
