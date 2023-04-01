part of "widgets.dart";

class DoubleIconFormFieldWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final bool shouldReadOnly;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final int? maxLength;

  const DoubleIconFormFieldWidget({
    super.key,
    this.label,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled,
    this.shouldReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              enabled: isEnabled,
              onTap: onTap != null ? onTap!() : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: maxLength,
              controller: textEditingController,
              cursorColor: PColors.primaryColor,
              keyboardType: keyboardType,

              readOnly: shouldReadOnly,
              obscureText: obscureText ?? false,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              validator: validator,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter
              ],
              // style: AppTextStyles.textfieldTextStyle(context),
              decoration: InputDecoration(
                counterText: "",
                hintText: hintText,
                hintStyle: context.getTextTheme.bodySmall?.copyWith(
                  color: PColors.greyColor,
                  fontSize: 15.5,
                  letterSpacing: 1.0,
                  fontFamily: PStrings.mediumFontName,
                  fontWeight: FontWeight.w200,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 8.0,
                  top: 19.0,
                ),
                prefixIcon: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10.0),
                    child: prefixIcon),
                suffixIcon: suffixIcon,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PColors.greyColor.withOpacity(0.7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PColors.greyColor.withOpacity(0.7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PColors.greyColor.withOpacity(0.7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: PColors.greyColor.withOpacity(0.7),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
