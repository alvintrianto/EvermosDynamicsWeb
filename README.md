# EvermosDynamicsWeb Automation
How to Run this automation

**Tools used:**
- Java 17.0.1 (https://java.tutorials24x7.com/blog/how-to-install-java-17-on-windows)
- Robot Framework 4.1.2 (https://robotframework.org/?tab=0#getting-started)
- Chromedriver 96.0.4664.45 (https://chromedriver.storage.googleapis.com/index.html?path=96.0.4664.45/)
- Python 3.10.0 (https://www.python.org/downloads/release/python-3100/)
- Selenium 

**Step to Run**
1. Install Java and set Environment path
2. Install python and set Environment path
3. Open terminal and type  
```
Java --version 
```
4. Then type
```
python get-pip.py
```
5. Check the version after finish install
```
python --version 
```
6. Install Robot Framework with command 
```
pip install robotframework
```
7. then check the version with 
```
robot --version
```
8. Install Selenium for Python  
```
pip install --upgrade robotframework-seleniumlibrary
```
9. Download web driver from
```
- Chrome: https://chromedriver.chromium.org/downloads
- Firefox:https://github.com/mozilla/geckodriver/releases
- Edge: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
```
10. Save the web driver in directory : ```C:\Users\[user]\AppData\Local\Programs\Python\Python39\```
12. Clone this repo to your directory
13. Open the directory from cmd/terminal with command ```cd [User dir]\EvermosDynamicsWeb```
14. Run the automation with command ```robot Features\```
15. Open the automation report from file ```report.html```

**REPO DIRECTORY GUIDE**   
```
- Features : Consist of robot framework based automation for Evermos Features. if you want to add more features just add new file with name [new_feature.robot]
- Resource : Consist of resource and locator of the web elements. if you want to add more locator and resource just add new file with name [new_locator.yaml] and import to .robot file in Features```

