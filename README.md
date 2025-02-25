# IIS Management Script for Windows

Welcome to the **IIS Management Script**! This script is designed to help you manage your **Internet Information Services (IIS)** on a Windows system with ease. Whether you're an admin or a developer, this tool makes it simple to install, configure, and manage IIS servers without hassle.

## Features

- **Install and Enable IIS**  
  Installs IIS on your system with a simple command.

- **List All IIS Sites**  
  Displays all the websites hosted on IIS with details like port, state, and bindings.

- **Add a New Website**  
  Easily add new websites with a customizable name, port, and physical path.

- **Remove a Website**  
  Remove any website hosted on IIS with a single command.

- **Start, Stop, and Restart IIS**  
  Manage your IIS services without leaving the command line.

- **Backup IIS Configuration**  
  Backup your IIS configuration settings to safeguard your server setup.

- **Restore IIS Configuration**  
  Restore your IIS configuration from a previous backup file.

## Requirements

- **Windows OS**  
  This script works on Windows with IIS installed.

- **Administrator Rights**  
  The script requires administrative privileges to manage IIS and execute necessary commands.

## Getting Started

### Step 1: Download the Script

- Download the **`IIS.bat`** file to your system.

### Step 2: Run as Administrator

- Right-click on the `IIS.bat` file and choose **Run as Administrator**.

### Step 3: Select an Option

- The script will display a menu with options. Simply enter the number corresponding to the operation you want to perform.

## Usage

Here are the available options:

1. **Install and Enable IIS**  
   Installs IIS if it's not already installed.

2. **List All IIS Sites**  
   Lists all the websites configured in IIS with details like name, port, physical path, etc.

3. **Add a New Website**  
   Adds a new website to IIS with a customizable name, port, and path.

4. **Remove a Website**  
   Removes an existing website from IIS.

5. **Start IIS**  
   Starts IIS services.

6. **Stop IIS**  
   Stops IIS services.

7. **Restart IIS**  
   Restarts IIS services.

8. **Backup IIS Configuration**  
   Creates a backup of your IIS configuration for safe keeping.

9. **Restore IIS Configuration**  
   Restores IIS configuration from a backup file.

10. **Exit**  
   Exits the script.

## Error Handling

- The script includes built-in error handling to ensure that operations such as adding/removing websites or starting/stopping IIS are done safely.
- It will prompt you if a required operation is invalid (e.g., missing website name, incorrect file paths) and help you fix it.

## License

This script is provided under the **MIT License**. You are free to use, modify, and distribute it as long as you include the original copyright and license notice.

---

Enjoy managing IIS with ease! 💻✨
