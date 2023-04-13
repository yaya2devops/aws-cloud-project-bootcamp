# Find all PNG images in the root directory and its subdirectories, and sort them numerically
find . -type f -name "*.png" |
    sort -t '-' -k 2n |
    while read file
    do
        echo "<img src=\"$file\">" >> README.md
        echo "" >> README.md
    done

# Find all PNG images in the CLI-WORK directory and its subdirectories, and sort them numerically
find "CLI-WORK" -type f -name "*.png" |
    sort -t '-' -k 2n |
    while read file
    do
        echo "<img src=\"$file\">" >> README.md
        echo "" >> README.md
    done

# Find all PNG images in the media directory and its subdirectories, and sort them numerically
find "media" -type f -name "*.png" |
    sort -t '-' -k 2n |
    while read file
    do
        echo "<img src=\"$file\">" >> README.md
        echo "" >> README.md
    done
