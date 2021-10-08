# Prerequisites

## MacOS

-  If you're on MacOS, [homebrew](https://brew.sh/) is a must have developer tool! Verify it's installed with `brew --version`
-  The default terminal app isn't great, [iterm 2](https://iterm2.com) is a better alternative

## Windows

Development on windows is a bit tedious due to it not running in a unix shell. So, it's a good idea to install the [Windows Subsystem For Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (called the WSL for short). This is not required, and you *can* proceed without it, but this guide will be assuming we're working in a unix shell. When going through this installation, select the latest version of Ubuntu available.

1. To install the WSL, open PowerShell **as administrator**.

   <img src=".readme_resources/powershell.admin.png" alt="Image of Yaktocat" style="zoom:66%;" />

2. run the following command `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

3. Restart your computer when prompted

4. Open the Microsoft store, and search for Ubuntu. Install either Ubuntu 20.04 LTS or 18.04 LTS

5. Launch the Ubuntu app to complete installation.

6. Follow this guide assuming you're a Linux (Ubuntu) user. 
   - For any development work requiring a terminal, use the WSL.
   - Run the Ubuntu app you installed or one of the below alternative terminals

### Alternative Terminals (Optional, But Strongly Recommended)

#### Windows Terminal (Preview)

The new Windows Terminal can be installed from the Microsoft store.

Once installed, you may want to set the WSL as the default profile in the terminal settings

1. press `ctrl + , ` to open the configuration settings
2. copy the guid listed above `"name": "Ubuntu..."` (for example `07b52e3e-de2c-5db4-bd2d-ba144ed6c273`) 
3. paste it in to the `defaultProfile`

#### Hyper.JS

 [hyper terminal](https://hyper.js) is another good alternative.

Once installed, you may want to set the WSL as the default profile.

1. press `ctrl + , ` to open the configuration settings
2. There is a line containing a `shell:` field. Set this line to:  `shell: 'C:\\Windows\\System32\\bash.exe',`



**Note: if you do not choose to use one of these terminal apps, your windows user's home directory is found at `/mnt/c/Users/<YOUR USER NAME>`. `cd` to that directory to navigate the windows file-system.**

# Our Tech

If you are running a unix shell (Linux, MacOS, WSL), these installation steps can be automated by running the `setup-dev.sh` script. `cd` into the directory where this script is located, and run `./setup-dev.sh`.

Otherwise, installation can be done by following the below instructions.

## Git

Install [git](https://git-scm.com/downloads) if you don't already have it. Verify it's installed with `git --version` 

## Node

It's a good idea to use the [node version manager](https://github.com/nvm-sh/nvm#install--update-script) to manage multiple node versions. Open a new terminal instance, and check if nvm installed correctly: `nvm --version`

Run the following commands to install the required node version:

```bash
nvm install '12.16.3'
nvm use '12.16.3'
```

Install yarn: `npm i -g yarn`

Verify yarn was installed correctly: `yarn --version`

# Your Development Environment

It's a good idea to have a central location for all your development projects. Having a `Developer` directory in your home directory is one possible location for this. This is just a suggestion -- if you have a project location strategy that works for you, more power to you.