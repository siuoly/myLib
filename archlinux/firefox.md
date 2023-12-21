# change toolbar fontsize, 
from: https://support.mozilla.org/en-US/questions/1342224
1) url: about.config
2) filter: "devp"
3) layout.css.devPixelsPerPx: 0.8

# change tab size
You can go to `about:config` and switch `browser.compactmode.show` to true (double click on it and it will switch from false to true). Then right-click in empty space on the tab bar, select *Customize toolbar*, then click on Density at the bottom-left and select Compact.
Edit: Just realized that *browser.compactmode.show* essentially changes *browser.uidensity* to 1.
