#!/usr/bin/env swift

import AppKit
import Darwin

func setWallpaper(wallpaperPath: String) {
  let sharedWorkspace = NSWorkspace.shared
  let allScreens = NSScreen.screens

  let wallpaperUrl : URL = NSURL.fileURL(withPath: wallpaperPath)

  DispatchQueue.global(qos: .userInteractive).async {
    for screen in allScreens {
      let optScreen = Optional(screen)

      do {
        try sharedWorkspace.setDesktopImageURL(wallpaperUrl, for: optScreen!, options: [:])
      } catch (let error) {
        print(error)
      }
    }
  }
}

if CommandLine.arguments.count == 2 {
  let wallpaperPath = CommandLine.arguments[1]
  setWallpaper(wallpaperPath: wallpaperPath)
} else {
  print("Usage: \(CommandLine.arguments[0]) WALLPAPER")
}
