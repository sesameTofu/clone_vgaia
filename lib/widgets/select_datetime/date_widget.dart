import 'package:flutter_mobile/import.dart';

class DateTimeWidget extends BaseWidget<BaseController> {
  DateTimeWidget({required this.date, required this.changeDate, Key? key})
      : super(key: key);

  final DateTime date;
  final Function(DateTime fromDate) changeDate;
  @override
  Widget builder() {
    return InkWell(
      onTap: () {
        showDateTimePicker(
          currentTime: date,
          confirmDate: (DateTime date) => changeDate(date),
        );
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: color.background0,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: color.grey80),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(date.formatDDMMYYYY(),
                    style: textStyle.regular(
                      size: 13,
                      color: color.grey0,
                    ))),
            Icon(
              Icons.date_range,
              color: color.grey0,
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDateTimePicker({
    required DateTime currentTime,
    DateTime? firstDate,
    DateTime? lastDate,
    Function(DateTime)? confirmDate,
  }) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        // locale: context.locale,
        initialDate: currentTime,
        firstDate: firstDate ?? DateTime(1970),
        lastDate: lastDate ?? DateTime(9999),
        currentDate: currentTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(),
            child: child ?? Container(),
          );
        });
    if (selectedDate != null && confirmDate != null) {
      confirmDate(selectedDate);
    }
  }
}
