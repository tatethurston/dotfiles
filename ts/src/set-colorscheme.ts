#!/usr/bin/osascript -l JavaScript

//import type { Terminal } from "@jxa/types";

// @typescript-eslint/no-unused-vars
function run([theme]: string[]): void {
  const terminal = Application("Terminal");
  const tab = terminal.windows[0].selectedTab;
  tab.currentSettings = terminal.settingsSets.whose({
    name: { _contains: theme },
  })[0];
}
