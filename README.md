# Scytale Cipher Menu

This is a simple command-line menu-driven program to interact with the Scytale cipher class for encrypting, decrypting, and hacking text files, image files, and text from the keyboard.

## Prerequisites

- Ruby installed on your machine

## Usage

1. Clone or download this repository to your local machine.

2. Navigate to the root of the project folder using your terminal or command prompt.

3. Run the following command to start the menu:

```bash
ruby lib/escitala.rb
```

4. Follow the on-screen prompts to choose the desired operation (encrypt, decrypt, or hack) and input type (text from keyboard, text file, or image file).

## Encrypting and Decrypting

For encryption and decryption, you will be prompted to enter the message and the key. If you choose the file input option, you will also be asked to enter the file path. The program will save the processed files in the files folder located at the root of the project.

## Hacking

For hacking, you will be prompted to enter the message if you choose text from the keyboard, or the file path if you choose file input. The program will attempt to find possible decrypted messages and save them in the files folder located at the root of the project.

## File Locations

- Input files should be placed in the root of the project folder.
- Output files will be saved in the files folder at the root of the project.

## Cleaning the Files Folder

It is recommended to clean the files folder periodically to remove old output files. To clean the folder, navigate to the root of the project folder using your terminal or command prompt and run the following command:

```bash
rm -r files/*

```
