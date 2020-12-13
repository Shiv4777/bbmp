<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

<style>
* {
  box-sizing: border-box;
}

body {
  background-color:white;
}

#regForm {
  background-color: #EEEEEE;
  margin: 100px auto;
  font-family: Raleway;
  padding: 40px;
  width: 99%;
  min-width: 300px;
}


h1 {
  text-align: center;  
}

input {
  padding: 10px;
  width: 60%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #FBE3E4;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
 
  margin: 0 2px;
 
  border: none;  
 
  display: inline-block;
  
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */

.step.finish {
background-color: gray;
   
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

.pill-nav a {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px;
  text-decoration: none;
  font-size: 14px;
  border-radius: 5px;
}

.pill-nav a:hover {
  background-color: #ddd;
  color: black;
}

.pill-nav a.active {
  background-color: dodgerblue;
  color: white;
}
a{
background-color: gray;
}
#div1{
    margin-right: 496px !important;
    float: right;
}
</style>

<body>
<form id="regForm" action="#">
  <h1>LAWYER PERSONAL ASSISTANCE SYSTEM</h1>
  <!-- One "tab" for each step in the form: -->
  <div>
  <div class="pill-nav">
   <a href="#CreatSubUser"class="step">Creat New Client</a>
  <a href="#CreateAPIKey" class="step">Create a Client Case</a>
  <a href="#CreateCustomField" class="step">Create a Case Hearing</a>
  <a href="#createSenderIdentity" class="step">create an Appointment</a>
  
  <!--
  <a href="#updateEventNotification" class="step">updateEventNotification</a>
  <a href="#forwardSpam" class="step">forwardSpam</a>
  <a href="#updateClickTracking" class="step">updateClickTracking</a>
  <a href="#updateOpenTracking" class="step">updateOpenTracking</a>
  -->
</div>

  <div class="tab">
    <p><input placeholder="Client ID" oninput="this.className = ''" name="clientID" id="ClientID"></p>
     <label id="message"></label>
     <p><input placeholder="Client Name..." oninput="this.className = ''" name="clientName""></p>
     <p><input placeholder="E-mail..." oninput="this.className = ''" name="email"></p>
     <p><input placeholder="Client Phone..." oninput="this.className = ''" name="clientPhone" type="number"></p>     
     <p><input placeholder="Client ADDRESS" oninput="this.className = ''" name="address"></p>
	 <p><input placeholder="Other Details" oninput="this.className = ''" name="details"></p>
  </div>
  <div class="tab">
    <p><input placeholder="Client ID..." oninput="this.className = ''" name="clientID"></p>
    <p><input placeholder="Case ID..." oninput="this.className = ''" name="caseID"></p>
    <p><input placeholder="case type -Civil/Criminal..." oninput="this.className = ''" name="caseType"></p>  
    <p><input placeholder="Start Date" oninput="this.className = ''" name="startDate"  type="datetime"></p>
	<p><input placeholder="End Date" oninput="this.className = ''" name="endDate"  type="datetime"></p>
	<p><input placeholder="Case Status..." oninput="this.className = ''" name="caseStatus"></p>
	<p><input placeholder="Reference Books" oninput="this.className = ''" name="refBooks"></p>
	<p><input placeholder="Case Description..." oninput="this.className = ''" name="caseDesc"></p>
  </div>
  <div class="tab">
    <p><input placeholder="Client ID..." oninput="this.className = ''" name="clientID"></p>
    <p><input placeholder="Case ID..." oninput="this.className = ''" name="caseID"></p>
	<p><input placeholder="Hearning Number..." oninput="this.className = ''" name="hearNo" type="number"></p>
   <p><input placeholder="Hearing Date" oninput="this.className = ''" name="hearDate"  type="datetime"></p>
	 <p><input placeholder="Other Details" oninput="this.className = ''" name="details"></p>
  </div>
  <div class="tab">
    <p><input placeholder="Appointment Date..." oninput="this.className = ''" name="appointDate"></p>
	  <p><input placeholder="Appointment Time..." oninput="this.className = ''" name="appointTime"></p>
    <p><input placeholder="Meeting Type... urgent/casual" oninput="this.className = ''" name="meetType"></p>
    <p><input placeholder="Meeting Details..." oninput="this.className = ''" name="meetingDetails"></p>
  </div>
  <!--
  <div class="tab">
    <p><input placeholder="Api Key..." oninput="this.className = ''" name="apikey"></p>  
    <p><input placeholder="URL..." oninput="this.className = ''" name="url"></p>
  </div>
  
  <div class="tab">
    <p><input placeholder="E-mail..." oninput="this.className = ''" name="email"></p>
    <p><input placeholder="Api Key..." oninput="this.className = ''" name="apikey"></p>  
    <p><input placeholder="URL..." oninput="this.className = ''" name="url"></p>
  </div>
  
  <div class="tab">
     <p><input placeholder="Api Key..." oninput="this.className = ''" name="apikey"></p>     
    <p><input placeholder="URL..." oninput="this.className = ''" name="url"></p>
  </div>
  
  <div class="tab">
     <p><input placeholder="Api Key..." oninput="this.className = ''" name="apikey"></p>     
    <p><input placeholder="URL..." oninput="this.className = ''" name="url"></p>
  </div>
  -->
  
  <div style="overflow:auto;">
    <div style="float:right;" id="div1">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1);validate();">Next</button>
    </div>
  </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  
</form>

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}

function validate() {       
    if (document.getElementById("Uname").value == "") { 
        document.getElementById('message').innerHTML = "Please Enter UserName";
     }
}
</script>
</body>
</html>
