#!/bin/bash

# Loop through all child directories in the current folder
for dir in */; do
    # Remove the trailing slash from the directory name for cleaner output
    dir_name="${dir%/}"
    
    # Check if the directory actually contains a .git folder
    if [ -d "$dir_name/.git" ]; then
        echo "Processing: $dir_name"
        
        # Enter the project directory
        cd "$dir_name" || continue
        
        # Create the bundle file with the full history
        if git bundle create "$dir_name.bundle" --all; then
            echo "   [SUCCESS] Bundle created: $dir_name.bundle"
            
            # Safely remove the .git directory after successful bundle creation
            rm -rf .git
            echo "   [SUCCESS] .git directory removed."
        else
            echo "   [ERROR] Failed to create bundle for $dir_name. The .git folder was NOT removed."
        fi
        
        # Return to the parent directory
        cd ..
    else
        echo "Skipping: $dir_name (Not a Git repository)"
    fi
    echo "--------------------------------------"
done

