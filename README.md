# cloudnoodlebar

Order cup of noodles and get them delivered.

## Getting Started

clone the project

## The Design Of Our Screens

### A Responsive UI

<p float="left">
<img src="./shipping_mobile_view.png" alt="shipping" width="300"/>
<img src="./shipping_web_view.png" alt="shipping" width="300"/>
</p>

References:
[Developing for Multiple Screen Sizes and Orientations in Flutter (Fragments in Flutter)](https://medium.com/flutter-community/build-responsive-uis-in-flutter-fd450bd59158)

We want our layout to change depending on what screen size the
user has. Otherwise things might look weird.

For the most part, follow the design of the shipping details
for a responsive UI. These classes are fairly large and contain
one function called `_buildMobile()` and another called `_buildWeb()`
that both return a widget. This widget in question is the entire
view for mobile-sized screens (small screens) or web-sized screens
(large screens). The class then has this build function:

```
@override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      isMobileViewPort = false;
    } else {
      isMobileViewPort = true;
    }
    return(
      isMobileViewPort? _buildMobile(): _buildWeb()
    );
```

In order to control which view is required, the boolean
`bool isMobileViewPort` is used as a class property.

Note that this is only used for high level widgets that build layouts. The primary widgets used to build the layout
(the CustomTextField widget, for example) don't have this
property.