 3397  2019-08-08 15:16  gpg
 3398  2019-08-08 15:17  gpg --gen-key
 3399  2019-08-08 15:21  gpg --gen-revoke F4D3617BDB5CD5A3
 3402  2019-08-08 15:30  gpg --list-key
 3403  2019-08-08 15:35  gpg --list-keys
 3404  2019-08-08 15:35  gpg --list-key
 3405  2019-08-08 15:35  gpg --list-keys
 3406  2019-08-08 15:41  gpg --send-keys F4D3617BDB5CD5A3 --keyserver hkp://subkeys.pgp.net
 3407  2019-08-08 15:42  gpg --fingerprint F4D3617BDB5CD5A3
 3408  2019-08-08 15:43  gpg --fingerprint F4D3617BDB5CD5A3 > pub.fingerprint
 3418  2019-08-08 15:46  gpg --search-keys F4D3617BDB5CD5A3
 3419  2019-08-08 15:47  gpg --recipient F4D3617BDB5CD5A3 --encrypt 
 3422  2019-08-08 15:48  gpg --recipient F4D3617BDB5CD5A3 --encrypt test.md
 3424  2019-08-08 15:48  gpg --recipient F4D3617BDB5CD5A3 --encrypt test.md --output test.md.en
 3425  2019-08-08 15:49  gpg --recipient F4D3617BDB5CD5A3 --encrypt test.md
 3426  2019-08-08 15:49  v test.md.gpg
 3427  2019-08-08 15:49  gpg --decrypt test.md.gpg
 3429  2019-08-08 15:50  gpg --encrypt test.md
 3430  2019-08-08 15:50  rm test.md.gpg
 3436  2019-08-08 15:51  gpg --recipient F4D3617BDB5CD5A3 --encrypt bookmarks_8_8_19.html
 3438  2019-08-08 15:55  gpg --help\\n
 3439  2019-08-08 15:55  gpg --fingerprint
 3440  2019-08-08 15:56  gpg --show-keyring
 3441  2019-08-08 15:56  gpg --list-options show-keyring
 3442  2019-08-08 15:56  gpg --show-keys
 3443  2019-08-08 15:57  gpg --show-key
 3445  2019-08-08 15:57  gpg --show-keys
 3446  2019-08-08 16:00  gpg --list-sigs
 3448  2019-08-08 16:05  gpg -a -o gpg_private_key.tt --export-secret-keys F4D3617BDB5CD5A3
 3450  2019-08-08 16:05  mv gpg_private_key.tt ~/
 3462  2019-08-08 16:06  mv gpg_private_key.tt gpg_private_key.txt
 3464  2019-08-08 16:07  cat gpg_private_key.txt
 3465  2019-08-08 16:07  rm gpg_private_key.txt
 3572  2019-08-08 17:18  gcmsg "[Change] 1.add a command 'gwd' combined 'wd' and 'fzf'. 2.add a gpg pub.fingerprint. 3.add my bookmarks."
 4153  2019-08-28 10:02  v how_to_use_gpg.md
