import 'package:flutter_mobile/import.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime(
      {Key? key, required this.fromDate, required this.toDate, this.changeDate})
      : super(key: key);

  final DateTime fromDate;
  final DateTime toDate;
  final Function(DateTime fromDate, DateTime toDate)? changeDate;

  @override
  _SelectDateTimeState createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> with BaseMixin {
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    fromDate = widget.fromDate;
    toDate = widget.toDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
              child: _buildDateTime(
            date: fromDate,
            lastDate: toDate,
            confirmDate: (DateTime date) {
              setState(() {
                fromDate = date;
                if (widget.changeDate != null) {
                  widget.changeDate!(fromDate, toDate);
                }
              });
            },
          )),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.0.width),
          //   child: Text(
          //     '-',
          //     style: textStyle.regular(color: color.grey0, size: 20),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(width: 14, color: color.branding, height: 1),
          ),
          Expanded(
              child: _buildDateTime(
            date: toDate,
            confirmDate: (DateTime date) {
              setState(() {
                toDate = date;
                if (fromDate.isAfter(toDate)) {
                  fromDate = toDate;
                }
                if (widget.changeDate != null) {
                  widget.changeDate!(fromDate, toDate);
                }
              });
            },
          )),
        ],
      );

  Widget _buildDateTime({
    required DateTime date,
    DateTime? firstDate,
    DateTime? lastDate,
    Function(DateTime)? confirmDate,
  }) =>
      InkWell(
        onTap: () {
          showDateTimePicker(
            currentTime: date,
            firstDate: firstDate,
            lastDate: lastDate,
            confirmDate: confirmDate,
          );
        },
        child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0.width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: color.grey80),
            color: color.grey90,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  date.formatDDMMYYYY(),
                  style: textStyle.regular(
                    size: 13,
                    color: color.grey0,
                  ),
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                color: color.grey0,
                size: 18.0,
              ),
            ],
          ),
        ),
      );

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
