import '../../lib_exp.dart';

class CommonInputWidget extends StatelessWidget {
  final Function(String value)? onChanged;
  final Function(String value)? onEntered;
  final TextEditingController editingController;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final String? prefixIcon;
  final double? prefixIconSize;
  final String? label;
  final TextStyle? labelStyle;
  final String hintText;
  final int maxLines;
  final String? suffixIcon;
  final VoidCallback? suffixCallback;
  final String? description;
  final Color? descriptionTextColor;
  final double? prefixIconLeftPadding;
  final double? prefixIconRightPadding;
  final double suffixIconPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool useOutlineInputBorder;
  final bool alwaysShowUnderlineInputBorder;
  final TextAlign textAlign;
  final bool readonly;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const CommonInputWidget({
    this.onChanged,
    this.onEntered,
    required this.editingController,
    this.textStyle,
    this.focusNode,
    this.obscureText = false,
    this.textInputType,
    this.prefixIcon,
    this.prefixIconSize,
    this.label,
    this.labelStyle,
    required this.hintText,
    this.maxLines = 1,
    this.suffixCallback,
    this.suffixIcon,
    this.description,
    this.inputFormatters,
    this.prefixIconLeftPadding = 0,
    this.prefixIconRightPadding,
    this.suffixIconPadding = 0,
    this.descriptionTextColor,
    this.autofocus = false,
    this.useOutlineInputBorder = false,
    this.alwaysShowUnderlineInputBorder = false,
    this.textAlign = TextAlign.start,
    this.readonly = false,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Text(
            label!,
            style: labelStyle ??
                const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
          ),
        if (useOutlineInputBorder) verticalHeight8,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixIcon == null || prefixIcon!.isEmpty
                ? emptyUI
                : Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: prefixIconLeftPadding ?? 0,
                      right: prefixIconRightPadding ?? 6,
                    ),
                    child: Image.asset(
                      prefixIcon!,
                      width: prefixIconSize ?? 34,
                      height: prefixIconSize ?? 34,
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    readOnly: readonly,
                    autofocus: autofocus,
                    minLines: 1,
                    maxLines: maxLines,
                    controller: editingController,
                    onFieldSubmitted: onEntered,
                    focusNode: focusNode,
                    onChanged: onChanged,
                    obscureText: obscureText,
                    keyboardType: textInputType,
                    textCapitalization: textCapitalization,
                    textInputAction: textInputAction,
                    inputFormatters: inputFormatters,
                    textAlign: textAlign,
                    style: textStyle,
                    decoration: InputDecoration(
                      // helperText: description ?? '',
                      // helperMaxLines: 100,
                      // helperStyle: TextStyle(
                      //   color: descriptionTextColor ?? errorColor,
                      //   fontSize: 12,
                      // ),
                      isDense: true,
                      border: useOutlineInputBorder
                          ? _outlineInputBorder(readonly)
                          : _underlineInputBorder(
                              readonly &&
                                  alwaysShowUnderlineInputBorder == false,
                            ),
                      errorBorder: useOutlineInputBorder
                          ? _outlineInputBorder(readonly)
                          : _underlineInputBorder(
                              readonly &&
                                  alwaysShowUnderlineInputBorder == false,
                            ),
                      focusedBorder: useOutlineInputBorder
                          ? _outlineInputBorder(readonly)
                          : _underlineInputBorder(
                              readonly &&
                                  alwaysShowUnderlineInputBorder == false,
                            ),
                      enabledBorder: useOutlineInputBorder
                          ? _outlineInputBorder(readonly)
                          : _underlineInputBorder(
                              readonly &&
                                  alwaysShowUnderlineInputBorder == false,
                            ),
                      disabledBorder: useOutlineInputBorder
                          ? _outlineInputBorder(readonly)
                          : _underlineInputBorder(
                              readonly &&
                                  alwaysShowUnderlineInputBorder == false,
                            ),
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      suffixIcon: suffixIcon != null
                          ? Clickable(
                              borderRadius: BorderRadius.circular(8),
                              onTap: suffixCallback ?? () {},
                              child: Padding(
                                padding: EdgeInsets.all(suffixIconPadding),
                                child: Image.asset(
                                  suffixIcon!,
                                  width: 32,
                                  height: 32,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : const SizedBox(height: 32),
                      suffixIconConstraints:
                          BoxConstraints.loose(const Size.fromHeight(32)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

OutlineInputBorder _outlineInputBorder(bool readOnly) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: readOnly ? Colors.white : Colors.grey,
      ),
    );

UnderlineInputBorder _underlineInputBorder(bool readOnly) =>
    UnderlineInputBorder(
      borderSide: BorderSide(
        color: readOnly ? Colors.white : Colors.grey,
      ),
    );
