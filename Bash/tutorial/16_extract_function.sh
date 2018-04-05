#!/bin/sh
#
# Summary
#   This script is a tutorial for extracting a segment of reusable bash logic.
#
# Glossary
#   Host Script - The script you're calling the extracted function from.
#
# Questions
#   - What are some good learning resources for developing this guide?
#   - Where do you put the extracted function
#   - How do you load the extracted function from your host script
#   - Terminate the host script if function returns non-zero

# use appropriate exit codes, 0 = success, Non-Zero = fail.
# external scripts can be called directly in an if-else-fi statement.
#   - what good are functions then...
