#!/bin/bash
echo "Cloning repo Benchmarking-DevOps"
git clone https://github.com/jhammarstedt/Benchmarking-DevOps.git

echo "Giving chmod access to all relevant scripts"
chmod +x scripts/clear_tutorial.sh scripts/clear_table.sh scripts/collectEgg.sh

echo "Setting up cool easter egg"

# Configuring a BOT github account
echo "Config github BOT credentials"
git config --global user.email "you@example.com"
git config --global user.name "Tutorial bot"
