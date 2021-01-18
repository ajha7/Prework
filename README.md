# Tip Calculator - *Prework*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Anshul Jha**

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:
* [x] UI animations - image for each person in party, upto 8
* [x] Remembering the bill amount, party size, tip amount, total amount, and per person amount across app restarts (if <10mins)
* [x] Using locale-specific currency
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
      - This will cause the user to be unable to see some of the information on the screen in my app


The following **additional** features are implemented:

- [x] Splits tip based on party size
- [x] Settings page to customize default tips
- [x] Settings option to reset back to the original default tips

## Video Walkthrough

Here's a walkthrough of implemented user stories:
Note: full GIF not displayed, too long

![Tip Calculator](https://i.imgur.com/rTvLlFt.gif)
<!--<img src="https://i.imgur.com/rTvLlFt.gif" width=250><br>-->

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I found the reliance on different libraries to perform different functions in the app a challenge. I didn't find a clear place for 
information how exactly to use these libraries like Locale, so I ended up piecing together info from the developer Apple docs and other resources
on the internet to try to figure out how to implement features. One challenge I wasn't able to fully get past was implementing proper UIAnimation,
I couldn't figure out what lines of code to write and when I did, it didn't work probably because I was doing something wrong, but I had no
way of figuring out what I had done wrong. I ended up using a workaround to create a "UIAnimation," doing something with the isHidden
property in UIImageViews. 

## License

    Copyright [2020] [Anshul Jha]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
