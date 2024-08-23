#!/bin/bash

# Clone the Ultraviolet repository
git clone https://github.com/titaniumnetwork-dev/Ultraviolet.git

# Navigate into the Ultraviolet directory
cd Ultraviolet || exit

# Remove the existing Git history to avoid any accidental pushes
rm -rf .git

# Create a backup of the original README.md
cp README.md README.md.bak

# Replace the content in README.md with your own information
cat <<EOL > README.md
# ShadowKnight Unblocker

ShadowKnight Unblocker is a customized version of Ultraviolet created by deadzomb.

For more details, visit our [Discord](https://discord.gg/QpheRqadJH).

## Owner

- **Username:** deadzomb
EOL

# Update the HTML and CSS files
# Create custom CSS file
mkdir -p src/static/css
cat <<EOL > src/static/css/custom.css
/* Custom CSS for ShadowKnight Unblocker */
body {
    font-family: Arial, sans-serif;
    background-color: #000;
    color: #fff;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
}

main {
    padding: 20px;
    text-align: center;
}

a {
    color: #1e90ff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
EOL

# Update index.html
cat <<EOL > src/static/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShadowKnight Unblocker</title>
    <link rel="stylesheet" href="/static/css/custom.css">
</head>
<body>
    <header>
        <h1>ShadowKnight Unblocker</h1>
    </header>
    <main>
        <p>Owner: deadzomb</p>
        <p>Welcome to ShadowKnight Unblocker. For more details, visit our <a href="https://discord.gg/QpheRqadJH" target="_blank">Discord</a>.</p>
    </main>
</body>
</html>
EOL

# Remove any existing domain or subdomain configuration (e.g., from `vercel.json`)
rm -f vercel.json

# Create a new Vercel configuration file without domain or subdomain setup
cat <<EOL > vercel.json
{
  "version": 2,
  "builds": [
    {
      "src": "src/static/index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "src/static/$1"
    }
  ]
}
EOL

# Initialize a new Node.js project if not already initialized
npm init -y

# Install dependencies
npm install

# Notify user of completion
echo "Setup complete. Your ShadowKnight Unblocker project has been customized."

# Instructions to build and deploy with Vercel
echo "To deploy your project to Vercel, follow these steps:"
echo "1. Make sure you're in the Ultraviolet directory."
echo "2. Run the following command to build and deploy your project:"
echo "   vercel --prod"
echo "3. Follow the prompts to complete the deployment."