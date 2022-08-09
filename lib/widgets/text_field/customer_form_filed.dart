import 'dart:core';

import 'package:flutter/services.dart';
import 'package:flutter_mobile/import.dart';

class CustomerFormField extends StatefulWidget {
  CustomerFormField({
    Key? key,
    this.editingController,
    this.autoValidateMode,
    this.onSave,
    this.onChanged,
    this.onClear,
    this.textStyle,
    this.minLines,
    this.hintText,
    this.maxLength,
    this.labelText,
    this.enable,
    this.leftIcon,
    this.rightIcon, //sould be icon
    this.onValidator,
    this.borderColor,
    this.maxLines,
    this.initialValue,
    this.textInputType,
    this.height,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.formKey,
    this.contentPadding,
    this.buildCounter,
    this.inputFormatters,
    this.colorError,
    this.isClear = false,
    this.borderRadius = 4,
    this.obscureText = false,
    this.currentFocusNote,
    this.scrollPadding,
    this.autofocus = false,
  }) : super(key: key) {
    editingController ??= TextEditingController(text: initialValue ?? '');
  }

  late final TextEditingController? editingController;
  final AutovalidateMode? autoValidateMode;
  final Function(String?)? onSave;
  final void Function(String)? onChanged;
  final void Function()? onClear;
  final TextStyle? textStyle;
  final int? minLines;
  final String? hintText;
  final int? maxLength;
  final String? labelText;
  final bool? enable;
  final Widget? leftIcon;
  final Widget? rightIcon; //sould be icon
  final String? Function(String?)? onValidator;
  final Color? borderColor;
  final int? maxLines;
  final String? initialValue;
  final TextInputType? textInputType;
  final double? height;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Key? formKey;
  final EdgeInsets? contentPadding;
  final EdgeInsets? scrollPadding;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final Color? colorError;
  final bool isClear;
  final double borderRadius;
  final bool? obscureText;
  final FocusNode? currentFocusNote;
  final bool autofocus;

  @override
  _CustomerFormFieldState createState() => _CustomerFormFieldState();
}

class _CustomerFormFieldState extends State<CustomerFormField> with BaseMixin {
  bool _isShowButtonClear = false;

  @override
  void initState() {
    super.initState();

    widget.editingController!.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {
        if (widget.editingController!.text.isNotEmpty) {
          _isShowButtonClear = true;
        } else {
          _isShowButtonClear = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      key: widget.formKey,
      controller: widget.editingController,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 10,
      minLines: widget.minLines ?? 1,
      autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.always,
      enabled: widget.enable,
      onSaved: widget.onSave,
      scrollPadding: widget.scrollPadding ?? EdgeInsets.all(20.0),
      onChanged: (String v) {
        if (!_isShowButtonClear || v.isEmpty) {
          _isShowButtonClear = v.isNotEmpty;
        }
        if (widget.onChanged != null) {
          widget.onChanged!(v);
        }
      },
      autofocus: widget.autofocus,
      focusNode: widget.currentFocusNote,
      keyboardType: widget.textInputType,
      style: widget.textStyle,
      buildCounter: widget.buildCounter,
      validator: widget.onValidator,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.bottom,
      inputFormatters: widget.inputFormatters,
      textDirection: widget.textDirection,
      decoration: InputDecoration(
        isCollapsed: true,
        errorMaxLines: 2,
        contentPadding: widget.contentPadding ??
            EdgeInsets.fromLTRB(
              widget.height ?? 16,
              widget.height ?? 16,
              0,
              widget.height ?? 16,
            ),
        labelText: widget.labelText,
        prefixIcon: widget.leftIcon,
        suffixIcon: widget.isClear ? _buildButonClear() : widget.rightIcon,
        fillColor: color.grey80,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? color.grey70,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? color.grey70,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: color.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.colorError ?? color.grey70,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: color.grey70,
          ),
        ),
        // errorText: errorText,
        hintText: widget.hintText,
        hintStyle: textStyle.custom(
            color: color.grey40, size: widget.textStyle!.fontSize),
      ),
    );
  }

  Widget _buildButonClear() => Visibility(
        visible: _isShowButtonClear,
        child: GestureDetector(
          onTap: () {
            widget.editingController!.clear();
            _isShowButtonClear = false;

            if (widget.onClear != null) {
              widget.onClear!();
            }
          },

          /// Use container expan size
          child: Container(
            color: Colors.transparent,
            child: Icon(
              Icons.cancel,
              color: color.grey40,
              size: 16,
            ),
          ),
        ),
      );
}
