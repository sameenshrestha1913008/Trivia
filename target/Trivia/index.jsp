<%@include file="components/header.jsp"%>

<h1>Java Questions</h1>
<div id="quiz">
    <h2 id="question"></h2>
    <div><input type="radio" name="choices" value="A"><span id="choiceA"></span></div>
    <div><input type="radio" name="choices" value="B"><span id="choiceB"></span></div>
    <div><input type="radio" name="choices" value="C"><span id="choiceC"></span></div>
    <div><input type="radio" name="choices" value="D"><span id="choiceD"></span></div>
    <button id="submit">Submit</button>
    <h3 id="quizStatus"></h3>
</div>
<footer id="options" style="display:none">
    <p><a href="index.html">Retake the quiz!</a></p>
    <p><a href="questions.html">Contribute to question set!</a></p>
</footer>
<%@include file="components/footer.jsp"%>
