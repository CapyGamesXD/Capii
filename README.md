# Capii

This here is a little program for a Pi or similar device!

It uses Cog to display the program, which auto-updates with service workers! :D

To install it, simply run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/CapyGamesXD/Capii/main/install.sh | bash
```

If you (understandably) want to see what this runs, it's all available at that URL above. :D

# If it doesn't update, run this:

```bash
sudo systemctl stop capii
rm -rf ~/.cache/wpe
sudo systemctl start capii
```

If there are any issues don't hesistate to log them!

<sub> Disclaimer! Updating might have some issues, since I made the system for the first time. I'll continue testing! Please log an issue if you find one! :D</sub>
