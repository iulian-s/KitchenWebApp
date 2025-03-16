<!DOCTYPE html>
<html>
<head>
  <title>Anti risipa</title>
  <style>
  	body {
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #dbeafe, #bfdbfe); /* Gradient bleu deschis */
    background-attachment: fixed;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
}

.tabs {
    display: flex;
    cursor: pointer;
    padding: 10px;
    background: rgba(255, 255, 255, 0.4); /* Alb transparent */
    backdrop-filter: blur(8px);
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.tab {
    padding: 10px 20px;
    margin-right: 10px;
    background-color: rgba(255, 255, 255, 0.5);
    border-radius: 8px;
    transition: 0.3s;
    color: #1e3a5f;
    font-weight: bold;
}

.tab:hover {
    background-color: rgba(255, 255, 255, 0.7);
}

.active {
    background-color: white;
    color: #1e3a5f;
    font-weight: bold;
    border: 1px solid #1e3a5f;
}

.tab-content {
    display: none;
    margin-top: 20px;
    width: 90%;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    color: #1e3a5f;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    border: 1px solid #93c5fd; /* Albastru deschis */
}

h2 {
    color: #1e3a5f;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.logout-container {
    position: absolute;
    top: 10px;
    right: 10px;
}

.logout-button {
    background-color: #ef4444; /* Roșu pastel */
    color: white;
    border: none;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 16px;
    border-radius: 5px;
    transition: 0.3s;
}

.logout-button:hover {
    background-color: #dc2626;
}

    
  </style>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    function openTab(tabId) {
      var contents = document.querySelectorAll('.tab-content');
      contents.forEach(function(content) {
        content.style.display = 'none';
      });
      var tabs = document.querySelectorAll('.tab');
      tabs.forEach(function(tab) {
        tab.classList.remove('active');
      });
      document.getElementById(tabId).style.display = 'block';
      event.target.classList.add('active');
    }
     window.onload = function() {
        openTab('tab3');
      } 
  </script>
</head>
<body>
	
	<%
	HttpSession sessionUser = request.getSession(false);
	  if (sessionUser == null || sessionUser.getAttribute("userId") == null) {
	    response.sendRedirect("login.jsp");
	    return;
	  }

	  String username = (String) sessionUser.getAttribute("username");
%>

<h2>Bine ai venit, <%= username %>!</h2>

	
  <div class="tabs">
    <div class="tab" onclick="openTab('tab1')">Alimente</div>
    <div class="tab" onclick="openTab('tab2')">Retete</div>
    <div class="tab" onclick="openTab('tab3')">Frigider</div>
  </div>


  <div class="tab-content" id="tab1">
    <iframe src="alimente.jsp" width="100%" height="1000px"></iframe>
  </div>
  
  <div class="tab-content" id="tab2">
    <iframe src="retete.jsp" width="100%" height="1000px"></iframe>
  </div>
  
  <div class="tab-content" id="tab3">
    <iframe src="alimente_user.jsp" width="100%" height="1000px"></iframe>
  </div>

<div class="logout-container">
    <form action="logout.jsp" method="post">
      <button type="submit" class="logout-button">Deconectare</button>
    </form>
  </div>

</body>
</html>
