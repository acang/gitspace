<%@ page contentType="text/html; charset=GBK" %>
<html style="background-color: buttonface; color: buttontext;">

<head>
	<meta http-equiv="content-type" content="text/xml; charset=gbk" />

	<title>Simple calendar setups [popup calendar]</title>
	<link rel="stylesheet" type="text/css" media="all" href="calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="calendar-setup.js"></script>
</head>

<body>
<input type="text" readonly name="testDate" id="testDate"><img src="img.gif" id="testImg">
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "testDate",      // id of the input field
        ifFormat       :    "%Y-%m-%d %I:%M",       // format of the input field
        showsTime      :    true,            // will display a time selector
        button         :    "testImg",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script>

</body>
</html>
