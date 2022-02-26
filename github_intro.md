# Introduction to GitHub for 1.5 Max
## Why is GitHub useful?

#### Version control
GitHub is a widely used platform, particularly in the programming community, because of version control. Version control saves previous versions of documents and folders, enabling project contributors to revert to older versions at any time. This feature is also very useful for creating reproducible research. Collaborators can see the progress of a project by viewing its history (more on this later). <br> 

#### A platform designed for collaborative projects
GitHub has many tools that make interacting with other project collaborators relatively easy. In this document, I'll highlight the 'Issues' tool as one of my favourite ways to organise project tasks and ask other collaborators for help. 

## Sign Up for GitHub
#### 1. Go to the [GitHub website](https://github.com/)
#### 2. Click on the 'Sign Up' button in the top right hand corner of your screen
#### 3. Follow the steps prompted by GitHub
Here, you're going to be asked to input the basics, like an email, passcode and username. Note that once you choose a username, it cannot be changed later on. Rather than via email, the username is how other collaborators on GitHub will be able to find and communicate with you. 

On a side note, it may be useful to create a document with everyone's names and GitHub usernames for reference when initiating a project.
#### 4. Your dashboard
After you create your account, you'll see your main GitHub dashboard. You can always come back to this dashboard by clicking this icon on the top left hand side of the menu bar: <br>
<img width="45" alt="Screenshot 2022-02-19 at 17 58 57" src="https://user-images.githubusercontent.com/91272561/154813875-045693f1-9bf4-41bf-afb3-618bb4543117.png"> 

(As an aside, this ^^ icon is an 'octocat', which is GitHub's logo.)

At the top of the screen there's also a link to the [Hello World guide](https://docs.github.com/en/get-started/quickstart/hello-world) GitHub offers as an introduction to the platform. I highly recommend taking a look at this, but I'll also go through and elaborate on bits of it here. <br>
<img width="704" alt="Screenshot 2022-02-19 at 17 06 50" src="https://user-images.githubusercontent.com/91272561/154811337-a2f61e16-611e-4b78-8389-f3557ca9fb56.png">

## Create a repository
Repositories in GitHub are a place you can store information, organise it into folders, and share/edit with other collaborators -- essentially it is the backbone of the whole platform. You can store a bunch of different file types, from text (e.g. .md, .pdf) to images (e.g. .png, .jpg), to code scripts, etc. For those interested in coding, GitHub will also keep track of which code scripts contain which programming language. For projects that will likely contain lots of different file formats and which may include code scripts, using GitHub repositories is arguably the best way to store project information.

Onto how to make a repository!

There are a couple different ways you can start this process. I'll assume we're starting at the main GitHub dashboard (which you can access by clicking the octocat in the top left hand corner of your screen).

#### 1. In the left hand menu bar, click on the 'New' button next to 'Recent Repositories'
<img width="269" alt="Screenshot 2022-02-20 at 19 55 28" src="https://user-images.githubusercontent.com/91272561/154861735-89a1c836-c9d2-410c-b5e1-02c82a44ae37.png">

<br> This will bring you to a new page, where GitHub will ask you whether you want to use a template; say no for now.

#### 2. Give your repository a name and description
<img width="659" alt="Screenshot 2022-02-20 at 19 59 08" src="https://user-images.githubusercontent.com/91272561/154861820-a66c71b5-bcce-4bdd-a195-d481e1aa3c1f.png">
<br> This is pretty self explanatory, but I recommend keeping the repository name short and informative. It is common practice to avoid using spaces and special characters in the title. This makes coding within the repository a bit easier -- instead people may use capitalisations to indicate a new word, or use underscores. <br> 
#### 3. Choose to keep your repository public or private
<br> I generally keep them public, but this decision may be dependent on what you intend to use the repository for. <br>
<img width="458" alt="Screenshot 2022-02-20 at 20 04 39" src="https://user-images.githubusercontent.com/91272561/154862057-dc397654-e206-413d-9000-138b87e60c32.png"> <br>
#### Initialising your repository
<br> This section has three potential steps -- adding a README file, adding a .gitignore file and choosing a license for code produced.

For organisational purposes, it is really important to include a README file regardless of project contents. The README file is the first thing anyone exploring your GitHub repository will see (I'll go into more detail on this in a minute). 

The .gitignore file is kind of complicated to explain without needing to write a couple paragraphs about it. However, the main thing to know is that you should include it if your project involves coding. If you know the programming language that'll be used in the project, you can find it under the template select tool. A .gitignore file is a useful organisational document for code contributors, but it is extraneous for projects that don't require coding.

The last bit -- choosing a license -- is one that I've not explored in depth. GitHub has a nice [document regarding how to choose a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository), but I generally skip this step. The default copyright settings have been fine in an academic setting, at least.

#### 5. Click 'Create repository'
<br> And you're done! <br>

## READMEs
README.md documents are among the most essential organisational features of a GitHub repository. A README is a document that outlines the purpose of the repository and its contents. Since it is a .md file, you can add headers, images, hyperlinks, etc to your document to make it more useful and appear professional. <br> 

A repository should contain an overarching README.md document and ideally, have one for each folder within the repository. The repository-wide README.md generally should provide a brief description of repository folders and their purpose, as well as any important information a new collaborator would need to understand repository contents. This could be, for example, elaborating on any common abbreviations or how to use the repository. 

Folder README.md files can generally be a little more relaxed in structure, but they should similarly contain a brief description of folder contents. Any background knowledge required to understand any content should also be included.

## Create a new file
In the online version of GitHub, you cannot create an empty folder within a repository; it requires you to make a file as well. It is useful to make this initial file a README for the intended purpose of the folder.

To do this, click on the 'Add file' button on the top of your repository screen. This will give you the option to either create a new file or upload a file. For now, go to 'Create new file'. <br> 

<img width="817" alt="Screenshot 2022-02-26 at 09 57 56" src="https://user-images.githubusercontent.com/91272561/155838843-31bf5403-0de8-4da3-8e1f-c29c00cca0a3.png"> <br> 
This will prompt you to name your new folder or file here: <br> 
<img width="276" alt="Screenshot 2022-02-26 at 10 02 48" src="https://user-images.githubusercontent.com/91272561/155838963-bd9c28fe-514f-49cd-b683-c3e233a0139c.png"> <br>
The repository name shows up in blue ('UGY3' in this case). Say I wanted to create a new folder for the contents of an Ecological Measurement class, called EM. To do that, I would enter EM and add another slash after the name: <br>
<img width="311" alt="Screenshot 2022-02-26 at 10 05 39" src="https://user-images.githubusercontent.com/91272561/155839039-58b35c9a-c5a9-4f67-b6fb-487ce9a7ea8a.png"> <br>
Then you can name your file. GitHub recognises different file types; you can add a document type to the end of your name (e.g. README.md rather than README) and GitHub will recognise that you are creating a markdown file. <br>
From there, add the desired contents to your document and scroll down to the 'Commit new file' section at the bottom of your screen. 

<img width="701" alt="Screenshot 2022-02-26 at 10 09 59" src="https://user-images.githubusercontent.com/91272561/155839176-46282e55-8c2b-4742-9d6a-b4a58cbf0f22.png">
The first text box is where you briefly describe the new document you created. It is good practice to include your name and keep the message to under 50 characters. When creating a README.md file, a good commit message may be: 'Anna created the EM folder README.md.'

The second text box is an optional extended description.

For the bubble choice, I recommend always committing directly to the ```main``` branch. Creating a new branch and doing pull requests, while useful in some instances, can create version control problems when learning how to use GitHub.

When you're ready, press 'Commit new file'. Your folder/file should now appear in the published GitHub repository for other collaborators to see.

## Issues
The Issues in GitHub is a multipurpose tool to communicate with other repository collaborators. This is one of my favourite functions in GitHub. Most often, it is used when someone has a question/problem they would like another collaborator to take a look at. Other times, it can also be used to give outlining structure to a project. For example, you can open an issue to assign project tasks and goals each week. 
A useful aside: You can opt into receiving email notifications from GitHub. These will then notify you via email when an issue is opened, or when someone responds to an issue within a repository you're a part of. 

Here's how to open an issue:

#### 1. Click the 'Issues' tab in the menu bar at the top of your screen
<img width="840" alt="Screenshot 2022-02-20 at 09 31 27" src="https://user-images.githubusercontent.com/91272561/154836524-17723fa2-3019-4410-88bb-5ec2c708ae65.png">

#### 2. Click the 'New Issue' button
<img width="1105" alt="Screenshot 2022-02-20 at 09 32 00" src="https://user-images.githubusercontent.com/91272561/154836549-ad6ac25f-e515-4dcf-a4cb-859857c5f576.png"> <br>

#### 3. Describe the problem
GitHub will prompt you to add a title and a description of what you would like to include in your issue. The title is what everyone will immediately when scrolling through the issues, so it is good to make these short and informative -- easily understandable at a glance, essentially. 
<img width="806" alt="Screenshot 2022-02-20 at 19 25 35" src="https://user-images.githubusercontent.com/91272561/154860502-022e289d-82bb-4dac-9abe-c67ecda452dc.png">

To help with organisation and clarity, GitHub also allows you to add tags called 'Labels' to your issue, e.g. "help wanted" or "weekly agenda". These labels can be created and re-used in different issues throughout the repository. For times when a repository accumulates a lot of active issues, you can find a specific issue by searching for a label attached to it.

GitHub starts you off with a list of 9 Label suggestions that you can find by clicking the Labels' button on the main Issues page:
<img width="116" alt="Screenshot 2022-02-20 at 19 14 59" src="https://user-images.githubusercontent.com/91272561/154860060-75e86c4b-7c14-46c4-a1b6-b16f2578dc7b.png">

Rather than exclusively use the preset ones, I find it much easier to create labels as they become relevant to a project or problem. GitHub lets you do that by using the 'New Label' button on the main Issues page. For more detail on making and using labels, here's [GitHub's guide to creating and using labels](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels).

Once you are content with a title and labels attached to your issue, the description gives you space to talk about your problem in as much detail as you like. The description of issues follows the same format as a standard .md file. This means you can use headers, images, code/bold/italics text, etc to help other collaborators understand a problem that you are having.

#### 4. Click 'Submit New Issue"
At this stage, other collaborators will be able to see that you have posted an issue, and they can respond to it. Responses follow a comment thread format, including an option to provide Reactions to comments: <br>
<img width="142" alt="Screenshot 2022-02-20 at 19 34 31" src="https://user-images.githubusercontent.com/91272561/154860868-9c4a6f75-4d85-4354-b51b-35339ac4e47d.png">
<br> Once an issue has been resolved, you can close the thread by clicking the 'Close Issue' button on the bottom of the screen: <br>
<img width="128" alt="Screenshot 2022-02-20 at 19 37 14" src="https://user-images.githubusercontent.com/91272561/154860944-234b034e-c814-45b7-b2cc-3e6b0cf0e381.png">

## Download GitHub Desktop Version
### What's the difference between the online and desktop versions of GitHub?
The online version of GitHub is the published version. This is the version that other collaborators viewing the files you upload will see. GitHub Desktop allows you to save a local version of GitHub repositories to your own computer. This will allow you to edit/add/delete files locally, but be aware that *such changes will not appear online until you 'push' them online* (more on this process later). 

While you can edit/add/delete files in the online version (e.g. .md documents), it may be easier for you to have your own local copies of repositories and documents to work on and upload to the published version when you are ready. 

Here's how to download the desktop version:

#### 1. Go to [desktop.github.com](desktop.github.com)
#### 2. For mac users, click on ['Download for macOS'](https://central.github.com/deployments/desktop/desktop/latest/darwin); below this button there is an option for [Windows](https://central.github.com/deployments/desktop/desktop/latest/win32) users as well.
For me, GitHub Desktop appeared in my 'Downloads' folder. You can move this to where ever you like on your computer; I keep it in my 'Applications' folder.
#### 3. Open GitHub Desktop and click 'Sign in to GitHub.com'
<img width="953" alt="Screenshot 2022-02-19 at 17 28 12" src="https://user-images.githubusercontent.com/91272561/154812661-b3a8bdde-2601-4e98-919d-9bc117645d99.png">
Your account information may already populate the screen, but if not, you may have to log in again. <br>
#### 4. Click 'Authorize Desktop' <br>
This will open GitHub Desktop again, and your username should autopopulate a form. After confirming this step, your GitHub Desktop and online GitHub account should be linked. <br>

From here, I recommend going through the tutorial that GitHub desktop provides on how to navigate the platform. This will create a tutorial repository and walk you through how to create a branch, edit a file, make commits, and publish to GitHub. <br>

This goes back to ensuring that all changes you make locally are 'pushed' to the online published version of GitHub. The main points to know about avoiding version control problems, are, in order: (1) committing changes, (2) pulling from origin and then (3) pushing. Committing your changes essentially saves them, but doesn't publish them to the online repository. Before that, it is good practice to pull from origin. That essentially ensures that all of your documents locally are up-to-date with thet published versions. Then, you can push the changes you have made to the online repository. When editing materials from a repository locally, it is good to commit, pull and push regularly to avoid version control issues.

** Also please let me know if y'all have any problems with GitHub Desktop -- I access GitHub locally on my computer through R, rather than GitHub Desktop, so I don't have a lot of experience with Desktop. Both processes seem to give the end result, but GitHub Desktop seems a lot friendlier to folks who don't code -- hence why I included it here. 

## Version Control

## Your profile
The last point I wanted to touch on in this brief introduction is customising your account. 
In the online version, you can view your profile by clicking the small circle icon in the top right hand side of your screen and selecting 'Your Profile'.  
<img width="167" alt="Screenshot 2022-02-19 at 18 00 27" src="https://user-images.githubusercontent.com/91272561/154813183-dab4e4b0-045d-419a-b3f7-a5a7d7f4e543.png"> <br>
From here, you add a profile picture, bio, links to social media accounts, the works. You can also see any repositories you have created as well as any activity you've done, from up to a full year ago. <br>

----- <br>
This was just an introduction to downloading and using GitHub -- at first, it can seem like a complicated platform, but it gets easier and is really wonderful due to its version control. This document is also limited, GitHub has many other wonderful features, such as Pull Requests and Projects that I would be happy to go into later on if you all found this useful and want to know more. Please let me know if there were parts of this you found difficult to follow, and I can go back and clarify any points of confusion.
