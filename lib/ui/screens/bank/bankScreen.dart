import 'package:flutter/material.dart';
import 'package:pretevest/core/api/data_models/user_response/getAllBankModel.dart';
import 'package:pretevest/core/api/data_models/user_response/resolvedBankModel.dart';
import 'package:pretevest/core/repositories/user_repositories.dart';
import 'package:pretevest/ui/responsiveness/responsive.dart';
import 'package:pretevest/ui/theme/textStyle.dart';
import 'package:pretevest/ui/widgets/bankDropDown.dart';
import 'package:pretevest/ui/widgets/customDropdown.dart';
import 'package:pretevest/ui/widgets/widgetsExport.dart';
import 'package:provider/provider.dart';

import '../../responsive_state.dart/responsive_state.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  TextEditingController accountNumber = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserProvider>(context, listen: false);
      userProv.getAllBank();
      userProv.getMyBank();
    });
    super.initState();
  }

  GetAllBankModel selectedbank = GetAllBankModel();
  bool accountNameAvailable = false;
  String accountAvailble = "sddd";
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Center(
      child: ResponsiveState(
          state: userProv.state,
          busyWidget: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
          idleWidget: Scaffold(
            body: Center(
              child: Container(
                width: responsive.isMobile(context)
                    ? double.infinity
                    : size.width / 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Bank',
                          style: AppFonts.blueHeader,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Account Number',
                          hintText: '1112223334',
                          controller: accountNumber,
                          validator: (value) =>
                              userProv.validateAccountNumber(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BankDropdown(
                          options: userProv.bankList,
                          onChanged: (option) {
                            setState(() {
                              selectedbank = option;
                            });
                          },
                          width: double.infinity,
                          height: 56,
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.black,
                          ),
                          hintText: 'Choose a bank',
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFFEBEBEB),
                          borderWidth: 1,
                          borderRadius: 12,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                          initialOption: selectedbank == null
                              ? GetAllBankModel(name: "Choose a bank")
                              : selectedbank,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: accountNameAvailable
                              ? Text(
                                  accountAvailble,
                                  style: AppFonts.tinyBlue2,
                                )
                              : SizedBox(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ResponsiveState(
                            state: userProv.state,
                            busyWidget: const SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    CircularProgressIndicator(strokeWidth: 6)),
                            idleWidget: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      onTap: () async {
                                        if (!accountNameAvailable) {
                                          if (!_key.currentState!.validate())
                                            return;

                                          bool response =
                                              await userProv.resolvedBank(
                                                  accountNumber.text,
                                                  selectedbank.code!);

                                          if (response) {
                                            setState(() {
                                              accountNameAvailable = true;
                                              accountAvailble = userProv
                                                  .resolvedBankDetails
                                                  .data!
                                                  .accountName!;
                                              print(userProv.resolvedBankDetails
                                                  .data!.accountName!);
                                            });
                                          }
                                        } else {
                                          if (!_key.currentState!.validate())
                                            return;

                                          bool response =
                                              await userProv.saveBankAccount(
                                                  userProv.resolvedBankDetails
                                                      .data!.accountName!,
                                                  accountNumber.text,
                                                  selectedbank.name,
                                                  selectedbank.code);

                                          if (response) {
                                            setState(() {
                                              accountNameAvailable = true;
                                              accountAvailble = userProv
                                                  .resolvedBankDetails
                                                  .data!
                                                  .accountName!;
                                              print(userProv.resolvedBankDetails
                                                  .data!.accountName!);
                                            });
                                          }
                                        }
                                      },
                                      label: accountNameAvailable
                                          ? 'Add Bank'
                                          : 'Fetch Bank Details'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank list',
                          style: AppFonts.blueHeader,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: userProv.myBankList.length,
                              itemBuilder: (context, index) {
                                return userProv.bankList.isEmpty
                                    ? Text(
                                        'No bank added yets',
                                        style: AppFonts.tinyBlackBold,
                                      )
                                    : Card(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '${userProv.myBankList.elementAt(index).accName}',
                                                  style: AppFonts.tinyBlue2Bold,
                                                ),
                                                Text(
                                                  '${userProv.myBankList.elementAt(index).accNum}',
                                                  style: AppFonts.tinyBlackBold,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                    );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
