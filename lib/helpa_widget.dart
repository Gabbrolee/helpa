import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TextValidator = Function(String value);
class HelpaWidget{
  static TextStyle formFieldTextStyle(
      {double fontSize = 16, Color color: Colors.black}) =>
      TextStyle(color: color, fontSize: fontSize, fontFamily: "ARoman");
  static TextStyle formFieldLabelStyle({double fontSize = 14}) => TextStyle(
      fontSize: fontSize,
      fontFamily: "ARoman",
      color: Colors.black.withOpacity(0.5));

  static Widget PositiveButton(
      BuildContext context, String title, VoidCallback callback,
      { Color? bgColor,
        bool isEnabled = true,
         Color? textColor,
        int width = 180,
        double elevation = 3.0,
         Key? key,
        double borderRadius = 6.0,
        EdgeInsets padding = const EdgeInsets.symmetric(vertical: 12)}) {
    return ElevatedButton(
      key: key,
      onPressed: isEnabled
          ? () {
        callback != null
            ? callback()
            : print('Positive Callback Not Present');
      }
      : null,
      style: ElevatedButton.styleFrom(
        primary: isEnabled ? (bgColor ?? Colors.orange) : Colors.grey,
        textStyle: TextStyle(color: textColor ?? Colors.white,),
        padding: padding,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),

      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontFamily: "ABlack",
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

    );
  }

  static PreferredSizeWidget appBar(String title,
      {List<Widget> actions = const [],    Widget? leadingWidget}) {
    var appBar = AppBar(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontFamily: "AMedium", color: Colors.black),
        ),
      ),
      actions: actions,
      leading: leadingWidget,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.grey
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,

    );
    return appBar;
  }

  static Widget roundEdgeFormTextField(
      String label,
      String hint,
      TextEditingController _controller,
      TextInputType inputType,
      String errorMessage,
      {bool isObscureText = false,
        Color? borderColor,
        TextValidator? textValidator,
        bool isLastTextField = false,
        FocusNode? focusNode,
        FocusNode? nextFocusNode,
         BuildContext? context,
        TextStyle? labelTextStyle,
        int maxLines = 1,
        int? maxLength,
        InputBorder? border,
        TextStyle? inputTextStyle,
        Widget? prefix,
        Widget? suffixIcon,
        Widget? prefixIcon,
        bool isDense = false,
        bool isEnabled = true,
        VoidCallback? onTap,
        bool rejectSpecialChars = false,
      }) {
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "$label",
                hintStyle:
                formFieldTextStyle(fontSize: 14, color: Colors.black38),
                errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                border: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            color: borderColor ?? Color(0xffB7B7B7), width: 1)),
                enabledBorder: border ??
                    OutlineInputBorder(
                        borderSide: BorderSide(
                            color: borderColor ?? Colors.black26, width: 1)),
                //  labelText: "$label",
                labelStyle: labelTextStyle ?? formFieldLabelStyle(),
                contentPadding: const EdgeInsets.only(left: 10.0),
                isDense: isDense,
                prefix: prefix ?? const SizedBox(),
                suffix: suffixIcon ?? const SizedBox(),
                prefixIcon: prefixIcon ?? const SizedBox(),
                counterText: "",
              ),
              controller: _controller,
              maxLines: maxLines,
              maxLength: maxLength,
              enabled: isEnabled,
              keyboardType: inputType,
              obscureText: isObscureText,
              textInputAction:
              isLastTextField ? TextInputAction.done : TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) return errorMessage;
                // if(rejectSpecialChars){
                //   if(Utility.containsSpecialCharacter(value))
                //     return "Special characters not allowed";
                // }
                return null;
              },
              focusNode: focusNode,
              onFieldSubmitted: (term) {
                if (focusNode != null && context != null) {
                  isLastTextField
                      ? FocusScope.of(context).consumeKeyboardToken()
                      : FocusScope.of(context).requestFocus(nextFocusNode);
                }
              },
              style: inputTextStyle ??
                  const TextStyle(
                      color: Colors.black, fontSize: 16, fontFamily: "ARoman"),
            ),
          ),
        ],
      ),
    );
  }

}