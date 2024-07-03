#!/bin/bash
#Author: michael_kedey
#Date: 03/07/2024
#Last_modified: 03/07/2024
#Purpose: install nginx

sudo apt-get update
sudo apt-get upgrade -y

# Install nginx and start the service
sudo apt-get install -y nginx
sudo systemctl enable nginx


# Create the index.html file
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Info</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Personal Information</h1>
        <p id="name">Name: "michael_kedey"</p>
        <p id="username">Username: "michael" </p>
        <p id="email">Email: "info@michael.com"</p>

        <h2>About US</h2>
        <ul>
            <a href="https://hng.tech" target="_blank">HNG Internship</a>
            <li><a href="https://www.github.com/michaelkedey">Github</a></li>
            <li><a href="https://www.linkedin.com/in/michaelkedey">LinkedIn</a></li>
        </ul>
        
    </div>
    <script src="script.js"></script>

</body>
</html>
EOF'

# Create the styles.css file
sudo bash -c 'cat <<EOF > /var/www/html/styles.css
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
}

h1 {
    color: #333333;
}

p {
    color: #666666;
}
EOF'

# Create the script.js file
sudo bash -c 'cat <<EOF > /var/www/html/script.js
document.addEventListener("DOMContentLoaded", function() {
    const name = "Michael Kedey";
    const username = "privatemyk";
    const email = "privatemyk@gmail.com";

    document.getElementById("name").innerText = "Name: " + name;
    document.getElementById("username").innerText = "Username: " + username;
    document.getElementById("email").innerText = "Email: " + email;
});
EOF'

# Restart nginx to apply changes
sudo systemctl restart nginx
