import 'package:fluent_ui/fluent_ui.dart';

class ReviewStatusLabel extends StatefulWidget {
  const ReviewStatusLabel({super.key, required this.status});
  final String status;

  @override
  State<ReviewStatusLabel> createState() => _ReviewStatusLabelState();
}

class _ReviewStatusLabelState extends State<ReviewStatusLabel> {
  @override
  Widget build(BuildContext context) {
    String text = "未审核";
    Color bgColor = Colors.white;
    Color textColor = Colors.black;
    if (widget.status == "1") {
      text = "审核中";
      bgColor = Colors.blue;
      textColor = Colors.white;
    } else if (widget.status == "2") {
      text = "审核被驳回";
      bgColor = Colors.grey;
      textColor = Colors.white;
    } else if (widget.status == "3") {
      text = "审核通过";
      bgColor = Colors.green;
      textColor = Colors.white;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: bgColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
