const { execSync } = require('child_process');

// Helper function to run system commands
function runCommand(command) {
  try {
    console.log(`Running: ${command}`);
    execSync(command, { stdio: 'inherit' });
    console.log("Command executed successfully!");
  } catch (error) {
    console.error(`Error executing command: ${error.message}`);
  }
}

// Function to install an application using Winget
function installApp(appId) {
  console.log(`Installing application with Winget ID: ${appId}`);
  try {
    runCommand(`winget install --id ${appId} -e --accept-package-agreements --accept-source-agreements`);
  } catch (error) {
    console.error(`Failed to install application: ${appId}.`);
  }
}

// function to update the PATH environment variable
function updatePath(newPath) {
  console.log(`Adding "${newPath}" to system PATH...`);
  try {
    runCommand(`setx PATH "%PATH%;${newPath}"`);
    console.log("PATH updated successfully!");
  } catch (error) {
    console.error(`Failed to update PATH: ${error.message}`);
  }
}

// Main function
function main() {
  const appIds = process.argv.slice(2); // Get all app IDs from command-line arguments
  if (appIds.length === 0) {
    console.error("Please provide the Winget IDs of the apps you want to install.");
    console.log("Usage: node installApp.js <WingetAppID1> <WingetAppID2> ...");
    process.exit(1);
  }

  console.log("Starting installation of multiple applications...");
  appIds.forEach(appId => installApp(appId));
  console.log("Finished installing all applications!");

    // update the path after installation
    const newPath = "C:\\Program Files\\7-Zip"; // Replace with the actual path you want to add
    updatePath(newPath);
}

main();
