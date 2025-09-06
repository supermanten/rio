
#!/usr/bin/env bash

# This script uses ANSI escape codes to display a colored Doraemon graphic in the terminal.
# It follows the same pattern as the previous scripts, defining color variables and then
# using a 'here document' to print the ASCII art with those colors.

# Initialize foreground (f) and background (b) color variables
# The loop generates variables like f0, f1, f2... for easy access to the colors.
f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done

# Define some common text styles
bld=$'\e[1m' # Bold text
rst=$'\e[0m' # Reset all attributes
inv=$'\e[7m' # Invert colors

# Use a "here document" to print the ASCII art
# The color variables are used to color the different parts of Doraemon.
# f1=Red, f4=Blue, f7=White
cat << EOF

${rst}
                  ${f4}▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                ${f4}▄█████████████████████▄
               ${f4}█████████████████████████
              ${f4}███████████████████████████
             ${f4}█████████████████████████████
            ${f4}█████${f7}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${f4}██████
            ${f4}████${f7}▀▄█▄▀█▄▀▄█▄▀█▄▀${f4}█████
           ${f4}████${f7}▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄${f4}████
          ${f4}███${f7}▄████▀▀▀▀▀▀▀▀▀▀▀▀▀███▄${f4}██
         ${f4}███${f7}█████▄▄▄▄▄▄▄▄▄▄▄▄█████${f4}███
        ${f4}████${f7}██████████████████████${f4}████
      ${f4}▄████${f7}████████████████████████▄${f4}███
    ${f4}▄█▀ ${f7}▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄${f4}▀█▄${f4}█
  ${f4}▄█▀ ${f7}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${f4}▀▄${f4}█
 ${f4}▄█▀ ${f7}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${f4}▀▄${f4}█
 ${f4}██${f7}▀${f4}██${f1}▄▄▄▄▄▄▄▄▄▄▄▄▄${f4}██${f7}▀${f4}██
 ${f4}██${f7}▀▀${f4}█${f1}█████████████${f4}█${f7}▀▀${f4}█
${f4}▄█▀▀▀█${f1}█████████████${f4}█▀▀▀█▄
${f4}███████${f1}█████████████${f4}███████
${f4}▀▀▀▀▀▀▀${f1}█████████████${f4}▀▀▀▀▀▀▀
 ${f4}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
  ${f4}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
EOF
