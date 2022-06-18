// allow custom userChrome.css file
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// disable letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);
// disable alt-key focus
user_pref("ui.key.menuAccessKeyFocuses", false);
// disable fullscreen warning
user_pref("full-screen-api.warning.timeout", 0);
// disable picture in picture button
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);

/* override recipe: enable session restore ***/
user_pref("browser.startup.page", 3); // 0102
// user_pref("browser.privatebrowsing.autostart", false); // 0110 required if you had it set as true
// user_pref("browser.sessionstore.privacy_level", 0); // 1003 optional to restore cookies/formdata
user_pref("privacy.clearOnShutdown.history", false); // 2811
// user_pref("privacy.cpd.history", false); // 2812 optional to match when you use Ctrl-Shift-Del

user_pref("keyword.enabled", true);
