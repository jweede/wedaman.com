<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8" charset="utf-8">
 <meta name="description" content="{{ page.resume.Name }}'s Resume, Updated {{ 'now' | date: "%Y.%m.%d" }}">
 <meta name="keywords" content="jon, wedaman, resume, jweede">
 <link rel="stylesheet" href="/css/resume.css">
 <script type="text/javascript">
 </script>
 <title>Resume: {{ page.resume.Name }}</title>
</head>
<body>

<div id="pageContainer">

<div class="resumeHeader">
	<h1>{{ page.resume.Name }}</h1>
	<p class="contactInfo"><a href="mailto:{{ page.resume.Email }}" style="color:#777;">{{ page.resume.Email_human }}</a></p>
	<p class="contactInfo">{{ page.resume.Phone }}</p>
</div>
<div class="resumeBody">
<h2>Education</h2>
{% for edu in page.resume.Education %}
<p>{{ edu.Name }}. {{ edu.Locale }}.</p>
<p>{{ edu.Dept }}</p>
<p>{{ edu.Degree }}. {{ edu.Year }}.</p>
<p>&nbsp;&nbsp;</p>
{% endfor %}

<h2>Experience</h2>
{% for exp in page.resume.Experience %}
<p class="expSecHead">{{ exp.Company }} - {{ exp.Locale }} &nbsp;({{ exp.Dates }})</p>
<p class="expSecTitle">{{ exp.Title }}</p>
<p class="expSecDesc">{{ exp.Desc }}</p>
{% endfor %}


<h2>Skills</h2>
<p>Platforms:  {{ page.resume.Skills.Platforms | array_to_sentence_string }}</p>
<p>Languages:  {{ page.resume.Skills.Languages | array_to_sentence_string }}</p>
<p>&nbsp;&nbsp;</p>

<h2>Activities</h2>
{% for item in page.resume.Activities %}
   <p>{{ item }}</p>
{% endfor %}
<p>&nbsp;&nbsp;</p>

</div>

</div>

</body>
</html>