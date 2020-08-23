# Create an AWS development environment on Ubuntu 18

Script used to set up a clean Ubuntu 18 AWS development environment from a new Virtual Machine

Installs

* VS Code
* git
* curl
* aws cli
* google-chrome
* pip3
* aws-shell
* cfn-lint        # CloudFormation lint: `"https://marketplace.visualstudio.com/items?itemName=kddejong.vscode-cfn-lint" `

Please see steps below for:

* set up aws profile
* set up SSH for github access

You can use the github website to download this repository to a zip file via a web browser, or  you can get it directly at the command line (note you should be in a working directory before running these commands):

`wget https://github.com/bill-medved/dev-U18-AWS/archive/master.zip`

`unzip master.zip`

The U18-AWS-dev-machine.sh file should now be in a working directory, or it will be in the subdirectory where zip placed the expanded files.

Next steps:

`chmod +x U18-AWS-dev-machine.sh`

`./U18-AWS-dev-machine.sh`

Note you will be asked for your sudo password.  You will also be asked to confirm various installs.

After complete install is complete, decide on an AWS profile name.

`aws configure --profile <my_profile>`

Enter your AWS keyid, and secret access key, and default region.

More information about AWS keys here:
`https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html`

In the home (~) directory:`

Add the next line to the bottom of the .bashrc file (nano .bashrc):

export AWS_PROFILE=<my_profile>

^O ^X from nano.

LAUNCH a new terminal

Test your AWS access credentials by entering any valid aws command to which your IAM user has access rights:

`aws s3 ls`

Now set up the default profile for aws-shell (you only have to do this once unless you want to change AWS profiles):

`aws-shell --profile <my_profile>`

^D to exit aws-shell

aws-shell is a great way to explore syntax directed editing for the AWS command line.  It will save you time, IMHO! 😄

Set up your local git install

`git config --global user.email you@example.com`

`git config --global user.name your-name`

Does your project require access to github?  If so, proceed...

Set up github SSH access.

`mkdir .ssh`

`cd .ssh`

Follow the instructrions below - * be sure to select the Linux tab*

Note I've never had to execute: Start the ssh-agent in the background.

Don't enter a paraphrase for this POC.  Please evaluate the security requirements for your organization in a production deployment, as this is targeted to a development POC environment.

`https://docs.github.com/en/enterprise/2.20/user/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent` `

Be sure to click on:

`https://docs.github.com/en/enterprise/2.20/user/articles/adding-a-new-ssh-key-to-your-github-account`

Note that bcopy is not included in this development environment.  It is pretty simple, enter:

`cat id_rsa.pub`

copy and paste from: ssh-rsa

continue with the github instructions to paste the SSH into github

test your github connection by entering the following:

`ssh -T git@github.com`

You now have everything you need to "phone home" to AWS and github!

https://www.linkedin.com/in/billmedved/

*In the pursuit of a connected world enabled by Technology!*
