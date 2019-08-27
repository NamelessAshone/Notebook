# How to change your console font?
Under `Ubuntu/Debian`:
- using console-setup tool
```bash
$ sudo dpkg-reconfigure console-setup
```
- directly edit console-setup config under `/etc/default/console-setup`
Show console font
```bash
$ showconsolefont
```
Under OS using Systemd:
- directly edit config udner `/etc/vconsole.conf`
