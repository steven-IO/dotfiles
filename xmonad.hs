import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.FadeInactive
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Themes
import XMonad.Layout.NoBorders
--import XMonad.Layout.Tabbed
--import XMonad.Layout.Spacing
import System.IO
  
--myTheme = defaultTheme {activeBorderColor = "#BBBBBB"}

myLayout = avoidStruts $ layoutHook defaultConfig
--myLayout = (tabbed shrinkText myTheme) ||| spacing 2 $ Tall 1 (3/100) (1/2)
--myLayout = spacing 2 $ Tall 1 (3/100) (1/2)

-- This is for fade/transparency.
-- Note: Need xcompmgr or some similar program to have transparency.
myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.95

main = do
    xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = smartBorders $ myLayout
      --, layoutHook = myLayout
      , logHook = myLogHook
      , terminal = "urxvt"
      , modMask = mod4Mask
      } `additionalKeys`
      [ ((mod4Mask .|. controlMask, xK_t), spawn "/home/steven/Scripts/TimeDisplay.sh")
      , ((mod4Mask .|. controlMask, xK_b), spawn "/home/steven/Scripts/BatteryStatus.sh")
      ]
