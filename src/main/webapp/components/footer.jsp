<script type="text/javascript">
    // initialize variables
    var questionID, question, choiceA, choiceB, choiceC, choiceD, questions, numQuestions, qInfo, userChoice, current = 0,
        score = 0,
        points = [];

    var defaultQuestions = [
        {
            question: "Which of the following option leads to the portability and security of Java?",
                    choiceA: "Bytecode is executed by JVM",
                    choiceB: "The applet makes the Java code secure and portable",
                    choiceC: "Use of exception handling",
                    choiceD: "Dynamic binding between objects",
                    correct: "A"
        },
        {
            question: "Which of the following is not a Java features?",
                    choiceA: "Dynamic",
                    choiceB: "Architecture Neutral",
                    choiceC: "Use of pointers",
                    choiceD: "Object-oriented",
                    correct: "C"
        },
        {
            question: "The \u0021 article referred to as a",
                    choiceA: "Unicode escape sequence",
                    choiceB: "Octal escape",
                    choiceC: "Hexadecimal",
                    choiceD: "Line feed",
                    correct: "A"
        },
        {
            question: "_____ is used to find and fix bugs in the Java programs.",
                    choiceA: "JVM",
                    choiceB: "JRE",
                    choiceC: "JDK",
                    choiceD: "JDB",
                    correct: "D"
        },
        {
            question: "Which of the following is a valid declaration of a char?",
                    choiceA: "char ch = 'a';",
                    choiceB: "char ca = 'tea';",
                    choiceC: "char cr = \u0223;",
                    choiceD: "char cc = '\itea';",
                    correct: "A"
        },
        {
            question: "What is the return type of the hashCode() method in the Object class?",
                    choiceA: "Object",
                    choiceB: "int",
                    choiceC: "long",
                    choiceD: "void",
                    correct: "B"
        },
        {
            question: "Which of the following is a valid long literal?",
                    choiceA: "ABH8097",
                    choiceB: "ABH8097",
                    choiceC: "904423",
                    choiceD: "0xnf029L",
                    correct: "D"
        },
        {
            question: "What does the expression float a = 35 / 0 return?",
                    choiceA: "0",
                    choiceB: "Not a Number",
                    choiceC: "Infinity",
                    choiceD: "Run time exception",
                    correct: "C"
        },
        {
            question: "Which of the following tool is used to generate API documentation in HTML format from doc comments in source code?",
                    choiceA: "javap tool",
                    choiceB: "javaw command",
                    choiceC: "Javadoc tool",
                    choiceD: "javah command",
                    correct: "C"
        },

        {
            question: "Which package contains the Random class?",
            choiceA: "java.util package",
            choiceB: "java.lang package",
            choiceC: "java.awt package",
            choiceD: "java.io package",
            correct: "A"
        }];

    // reference HTML elements
    var elQuizStatus = document.getElementById("quizStatus");

    var elQuestion = document.getElementById("question");
    var elChoiceA = document.getElementById("choiceA");
    var elChoiceB = document.getElementById("choiceB");
    var elChoiceC = document.getElementById("choiceC");
    var elChoiceD = document.getElementById("choiceD");
    var elChoices = document.getElementsByName('choices');

    // start quiz
    populateQuestions();
    renderQuestion();
    document.getElementById("submit").onclick = gradeQuestion;

    function populateQuestions(){
        questions = defaultQuestions;
        // if local storage contains questions, add to question set
        if(localStorage.getItem("questions")){
            var storedQuestions = JSON.parse(localStorage.getItem("questions"));
            for(var i = 0; i < storedQuestions.length; i++){
                questions.push(storedQuestions[i]);
            }
        }
        numQuestions = questions.length;
    }

    function populateQuestionInfo(){
        // populate current question info from question list
        question = questions[current].question;
        qInfo = questions[current];
        choiceA = qInfo.choiceA;
        choiceB = qInfo.choiceB;
        choiceC = qInfo.choiceC;
        choiceD = qInfo.choiceD;
        correct = qInfo.correct;
    }

    function renderQuestion(){
        // display question on webpage
        questionID = current + 1;
        elQuizStatus.innerHTML = "Question " + (questionID) + " of " + (numQuestions);
        populateQuestionInfo();
        elQuestion.innerHTML = question;
        elChoiceA.innerHTML = choiceA;
        elChoiceB.innerHTML = choiceB;
        elChoiceC.innerHTML = choiceC;
        elChoiceD.innerHTML = choiceD;
    }

    function gradeQuestion(){
        if(getUserChoice()){
            if(userChoice == questions[current].correct){
                score++;
                points[current] = 1;
            }
            else{
                points[current] = 0;
            }
            // next question
            current++;
            renderQuestion();
        }
    }

    function getUserChoice(){
        for (var i = 0, length = elChoices.length; i < length; i++)
        {
            if (elChoices[i].checked)
            {
                userChoice = elChoices[i].value;

                // clear radio input for next question
                elChoices[i].checked = false;

                return true;
            }
        }
        // user didn't select an answer
        alert("Please select an answer before continuing");
        return false;
    }

</script>
</body>
</html>
