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

This removes the cache.

## Developer info:

I provided a way to add your own programs! :D If you would like to make them consistent with the style of the rest of Capii, please use this info below!

The font is provided [here](https://fonts.google.com/specimen/SN+Pro).

In order to make it functional, please provide a back button linking back towards the [main site](https://capii.capydesigns.com), or the [selecton page](https://capii.capydesigns.com/selection)

The outline for the CSS of the back button is provided below, feel free to copy it.

```css
font-family: 'SN Pro', sans-serif;
font-optical-sizing: auto;
flex-direction: column;
display: flex;
color: white;
background-color: rgb(124, 169, 159);
width: 20vw;
height: 6vw;
align-items: center;
justify-content: center;
border-radius: 5vw;
text-decoration: none;
font-size: 3vw;
outline: none;
border: none;
```

The CSS for the background colour is 'background-color: rgb(44, 44, 44);'

### Adding your own apps!

Assuming I have added the feature, (version 1.2.5 or later), simply go to settings - scroll down to "developer panel", and add the name and link to your app! (it can be locally hosted on the network, but if you'd like to publish for other people, please do! :D)

Please note: adding own apps will require a keyboard/input method. Apps will be stored locally on device - to remain consistent across updates! Additionally, absolute path is required (https://...) as without it - it tries routing to a link relating to the WebOS itself.

## Notes:

If there are any issues don't hesistate to log them!

<sub>I'm a solo dev who's pretty new to making projects like this, so chances are, I made some mistakes! If you find them, please log them for me to fix! Thanks!</sub>
