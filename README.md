ios8_carousel
============-

[prototyping] Carousel iOS8 App

[![image](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_carousel/assets/ios8_carousel.gif)](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_carousel/assets/ios8_carousel.gif)

## Overview

The purpose of this homework is to leverage views, view properties, and events to create a high fidelity prototype that is difficult to distinguish from a production app. We're going to use the techniques from this week to implement the Carousel app from the signed out state to the basic signed in state.


## User Stories

- [ ] Photo tiles on the initial screen moves with scrolling
- [ ] Sign In
    - [ ] Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
    - [ ] User sees an error alert when no email is present or no password is present.
    - [ ] User sees a loading screen upon tapping the Sign In button.
    - [ ] User sees an error alert when entering the wrong email/password combination.
    - [ ] User is taken to the tutorial screens upon entering the correct email/password combination.
    - [ ] Optional: When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
    - [ ] Optional: On appear, scale the form up and fade it in.
- [ ] Optional: Sign Up
    - [ ] Optional: Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
    - [ ] Optional: Tapping the Agree to Terms checkbox selects the checkbox.
    - [ ] Optional: Tapping on Terms shows a webview with the terms.
    - [ ] Optional: User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
- [ ] Tutorial Screens
    - [ ] User can page between the screens
    - [ ] Optional: User can page between the screens with updated dots
    - [ ] Optional: Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.
- [ ] Image Timeline
    - [ ] Display a scrollable view of images.
    - [ ] User can tap on the conversations button to see the conversations screen (push).
    - [ ] User can tap on the profile image to see the settings view (modal from below).
- [ ] Settings
    - [ ] User can dismiss the settings screen.
    - [ ] User can log out
- [ ] Optional: Learn more about Carousel
    - [ ] Optional: Show the "Learn more about Carousel" button in the photo timeline.
    - [ ] Optional: Tap the X to dismiss the banner
    - [ ] Optional: Track the 3 events:
        - [ ] View a photo full screen
        - [ ] Swipe left and right
        - [ ] Share a photo
    - [ ] Optional: Upon completion of the events, mark them green.
    - [ ] Optional: When all events are completed, dismiss the banner.

## Time spent
x hours spent in total

## Libraries
```
platform :ios, '8.0'
pod 'AVHexColor', '~> 1.2.0'
pod 'Reveal-iOS-SDK'
```
