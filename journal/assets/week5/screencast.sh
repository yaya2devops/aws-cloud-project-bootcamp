#!/bin/bash

# Generate image tags for 1- DynamoDb Utility Scripts
echo "# Week 5: Screencast" > README.md

# Find all PNG images in the directory and its subdirectories, and sort them numerically
find "1- DynamoDb Utility Scrips/" -type f -name "*.png" | sort -t '-' -k 2n | while read file
do
  echo "<img src=\"$file\">" >> README.md
  echo "" >> README.md
done

# Generate image tags for 2- ImplementConversations
echo "<br>" >> README.md
echo "## 2- ImplementConversations" >> README.md

# Find all PNG images in the directory and its subdirectories, and sort them numerically
find "2- ImplementConversations/" -type f -name "*.png" | sort -t '-' -k 2n | while read file
do
  echo "<img src=\"$file\">" >> README.md
  echo "" >> README.md
done

# Generate image tags for 3- NeatDelivery
echo "<br>" >> README.md
echo "## 3- NeatDelivery" >> README.md

# Find all PNG images in the directory and its subdirectories, and sort them numerically
find "3- NeatDelivery/" -type f -name "*.png" | sort -t '-' -k 2n | while read file
do
  echo "<img src=\"$file\">" >> README.md
  echo "" >> README.md
done