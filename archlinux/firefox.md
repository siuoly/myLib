# change toolbar fontsize, 
from: https://support.mozilla.org/en-US/questions/1342224
1) url: about.config
2) filter: "devp"
3) layout.css.devPixelsPerPx: 0.8

# change F11 not effect the i3-wm, only hidden title,and url bar
https://www.reddit.com/r/i3wm/comments/yc7o5d/comment/itlhe29/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
For Firefox:
1) url:about:config 
2) full-screen-api.ignore-widgets 
3) set: true

# change tab size
You can go to `about:config` and switch `browser.compactmode.show` to true (double click on it and it will switch from false to true). Then right-click in empty space on the tab bar, select *Customize toolbar*, then click on Density at the bottom-left and select Compact.
Edit: Just realized that *browser.compactmode.show* essentially changes *browser.uidensity* to 1.
