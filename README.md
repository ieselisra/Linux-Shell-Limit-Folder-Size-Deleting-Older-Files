# Linux-Shell-Limit-Folder-Size-Deleting-Older-Files
(Linux) Script to limit a Folder to a Maximal given Size deleting the older files.

## How it works?
1· Get the size of a given folder and compare it with the max allowed size
2· Get a list of all files in the $directory
3· Sort the list by creation date (oldest first)
4· Delete the oldest file.
5· Check the actual size VS $max_size, and if bigger, again to step 2 ("while" loop)

## Usage
Set up the "directory" (absolute path) and "max_size" (in Kb) vars to your needs.

Make the script executable
<code>
  sudo chmod +x limitSizeDeletingOlderFiles.sh
</code>

Run
<code>
  ./limitSizeDeletingOlderFiles.sh
</code>


You can logically automate this tasks making a Cronjob.
