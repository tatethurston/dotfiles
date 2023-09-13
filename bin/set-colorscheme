#!/usr/bin/osascript -l JavaScript
"use strict";
function run([theme]) {
    const terminal = Application("Terminal");
    const tab = terminal.windows[0].selectedTab;
    tab.currentSettings = terminal.settingsSets.whose({
        name: { _contains: theme },
    })[0];
}
