# sdcli
Command line tools for the Stability AI API

Share via https://j.aicu.ai/SaiImgBat

|[English](README.md)|[日本語](README_ja.md)|

## SD3_SIC_Image_Creator

## What is this?

This is the readme for the Stable Diffusion 3.0 API Image Creator / Stable Image Core API Image Creator.
Thank you for downloading these batch files. Please read the following instructions before using them.
Please note that we are not responsible for any problems caused by using this program.

## Features

This tool generates images using the Stable Diffusion 3.0 and Stable Image Core APIs.
The two batch files have different functionalities.

### Stable Diffusion 3.0 API Image Creator features:

* Generate multiple images with the same prompt.
* Generate images containing text.

### Stable Image Core API Image Creator features:

* Generate images with various preset styles using the same prompt.


## How to use

### (1) First steps

You need an API key to generate images using these batch files.
Before running the batch files, please obtain an API key from https://platform.stability.ai/account/keys.

### (2) Setting the API key and prompt

The prompt and other settings are configured in separate text files.
Use a text editor like Notepad to edit them.

* **Stable Diffusion 3.0 API Image Creator:**
The configuration file is `SD3_setting.txt`.
Enter settings like `[PROMPT=urban street]` and save the file.
**Note:** All items must be filled in for the script to work.

**Configurable items:**
* Prompt
* Negative prompt
* Aspect ratio (Available options: 1:1, 16:9, 21:9, 2:3, 3:2, 4:5, 5:4, 9:16, 9:21)
* Output format (Available options: jpeg, png, webp)
* Number of images to generate
* API key

* **Stable Image Core API Image Creator:**
The configuration file is `SIC_setting.txt`.
Enter settings like `[PROMPT=urban street]` and save the file.
**Note:** All items must be filled in for the script to work.

**Configurable items:**
* Prompt
* Negative prompt
* Aspect ratio (Available options: 1:1, 16:9, 21:9, 2:3, 3:2, 4:5, 5:4, 9:16, 9:21)
* Output format (Available options: jpeg, png, webp)
* Generation cycle count (Number of image sets generated; each cycle generates 17 images)
* API key


### (3) Running the batch files

Double-click the batch file to run it.

* **Stable Diffusion 3.0 API Image Creator:**
Double-click `SD3_IMG_Creator.bat`.

* **Stable Image Core API Image Creator:**
Double-click `SIC_IMG_Creator.bat`.


## (4) Generating images

When you run each batch file, the current settings will be displayed.



[Example]--------------------------------------------------------------------------------
Welcome to the Stable Image Core API Image Creator!
This batch file allows you to generate multiple styles of images in succession at the same prompt
Output with the following settings
Prompt: urban street
Negative prompt: NSFW
Aspect ratio: 16:9
Save format: png
Number of output cycles: 1
Total number of outputs: 17
Do you want to generate with these settings? (If you generate with the same prompt, it will be overwritten!)
(Y/N)
------------------------------------------------------------------------------------
If you want to generate with these settings, enter [y] and press [Enter]

## (5) Checking the generated image

You can check the generated image in Explorer.
If you want to generate the same image again after it has been generated, move the image to another location before executing it.
If you do not move it, it will be overwritten.

- In the case of Stable Diffusion 3.0 API Image Creator
It is saved in the SD3_image folder.

- In the case of Stable Image Core API Image Creator
It is saved in the SIC_image folder.

## FAQ

[Q1] When I run the batch file, the message "Your PC has been protected by Windows" appears.
[A1] This is because the batch file is not signed.
To run the file, press "More info" and then "Run".

[Q2] When I run the batch file, an error appears and the program terminates.
[A2] If the API key is not entered, an error occurs and the program terminates.
Open the configuration file and enter the API key.

[Q3] The generated image is hazy...
[A3] If the generated image contains "NSFW-Workplace circular warning" elements, it will be hazy when generated.
You can reduce the number of hazy images by entering "NSFW" in the negative prompt.

[Q4] I can run the batch file, but no images are generated.
[A4] Please review the configuration file. Images cannot be generated unless all settings are filled in.

[Q4] Can I modify this batch file?
[A4] Modifications are allowed. Copyright belongs to AICU Inc.

[Q5] Can this program be used commercially?
[A5] The commercial license for Stability AI is subject to the API license. For commercial use and customization, please contact sai@aicu.ai.
