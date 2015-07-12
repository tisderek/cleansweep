### Version 2.0.0 - June 30, 2015

- **Grid** - `page grid` has been deprecated.  `page grids` used percentage gutters which made it unnecessarily difficult to style responsive page content. Moving forward we recommend using `ui container` a fixed width responsive container for holding page contents.
- **Container** - Containers are fixed width containers meant for holding page contents, and are a simpler alternative to `ui page grid`, view more [examples in docs](http://www.semantic-ui.com/elements/container.html#examples)
- **Search** - Search will now generate `results` container if one is not present on init
- **Dropdown** - Fixed dropdown menu items should not center inside of a center aligned container.
- **Rail** - Rail 100% height now uses `border-box` to ensure exact height match to container
- **Sticky** - Fix issues when `pushing: true` with sticky content having incorrect bottom spacing, when container has bottom padding

### Version 1.11.3-4 - March 6, 2015

- **Grid** - Fixed `right/left/center aligned` to adjust `align-items` in flex containers like `equal height/width`

### Version 1.11.0 - March 3, 2015

- **Table** - Fixes table on `mobile` sizes can surpass parent container width
- **Sticky** - Fix bottom attached position not adjusting for bottom padding on container element

### Version 1.10.3 - February 27, 2015

- **Button** - Fixes `<button>` inside `vertical buttons` not taking full container width

### Version 1.8.0 - January 23, 2015

- **Sticky** - Fixes issue with container size not being set explicitly on rail due to improper method renaming

### Version 1.0.0 - November 24, 2014

- **Grid** - Fixed page grid allows for fixed pixel size containers used with a grid instead of percentage

### Version 0.1.0 - Sep 25, 2013