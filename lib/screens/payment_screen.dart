import 'package:credit_payment/config/theme/app_colors.dart';
import 'package:credit_payment/config/theme/default_btn.dart';
import 'package:credit_payment/config/theme/font_size.dart';
import 'package:credit_payment/config/theme/input_style.dart';
import 'package:credit_payment/config/theme/paddings.dart';
import 'package:credit_payment/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class NewCreditCardScreen extends StatefulWidget {
  const NewCreditCardScreen({super.key});

  @override
  State<NewCreditCardScreen> createState() => _NewCreditCardScreenState();
}

class _NewCreditCardScreenState extends State<NewCreditCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  late final TextEditingController _expiryDateController =
      TextEditingController();
  late final TextEditingController _cvvController = TextEditingController();
  late final TextEditingController _holderNameController =
      TextEditingController();

  CardType cardType = CardType.Invalid;
  final formkey = GlobalKey<FormState>();
  bool isAccountLoading = false;
  @override
  void initState() {
    _cardNumberController.addListener(() {
      getCardTypeFrmNum();
    });
    super.initState();
  }

  void getCardTypeFrmNum() {
    if (_cardNumberController.text.length <= 6) {
      CardType type =
          CardUtils.getCardTypeFrmNumber(_cardNumberController.text);

      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20.0,
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Card Number",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _cardNumberController,
                    validator: (value) {
                      return CardUtils.validateCardNum(value);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter()
                    ],
                    decoration: InputsStyles.primaryInputDecoration(
                        hintText: "Card number",
                        suffixIcon: cardType == CardType.Invalid
                            ? null
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardUtils.getCardIcon(cardType),
                              ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Remix.bank_card_fill,
                            color: AppColors.secondaryGrey,
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CVV",
                          style: TextStyle(
                            fontSize: FontSize.base,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return CardUtils.validateCVV(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputsStyles.primaryInputDecoration(
                              hintText: "CVV",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Remix.secure_payment_line,
                                  color: AppColors.secondaryGrey,
                                ),
                              )),
                        ),
                      ],
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Exp. Date",
                          style: TextStyle(
                            fontSize: FontSize.base,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _expiryDateController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return CardUtils.validateDate(value);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ],
                          decoration: InputsStyles.primaryInputDecoration(
                              hintText: "MM/YY",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Icon(
                                  Remix.calendar_2_line,
                                  color: AppColors.secondaryGrey,
                                ),
                              )),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Paddings.paddingY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nickname(optinal)",
                      style: TextStyle(
                        fontSize: FontSize.base,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _holderNameController,
                      decoration: InputsStyles.primaryInputDecoration(
                          hintText: "e.g joint account or work card",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Icon(
                              Remix.user_line,
                              color: AppColors.secondaryGrey,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _saveButton() {
    return DefaultButton(
      onPressed: () async {
        if (formkey.currentState!.validate()) {}
      },
      text: 'Add credit card',
      valid: true,
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'New Card',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
