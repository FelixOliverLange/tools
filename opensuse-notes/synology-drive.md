# Synology drive on OpenSuse
Unfortunately, Synology does not provide a RPM package of the Synology drive client, so it can't be directly installed in OpenSuse (or other RPM distrobutions like Fedora). 

Fortunately, there are two solutions:

## Flatpak
This may be the easiest route and has some benefits. Mainly, you'll profit from automatic updates via flatpak and don't have to care about manual package management. 
Therefore, this route is probably the preferable choice for those who are not (as) comfortable with the command line.
A drawback of this is that Flatpak versions seem to have some issues with regards to system UI integration and that the distributions are community maintained. 
**So these are not coming from Synology directly!** Which means **you consume them on your own risk and need to trust the community** that provides them. 
Again, that in turn comes with above benefits.

If you wish to go down this route:
* open the "Software" application
* search for "Synology Drive" (search icon in the top left corner)
* click "install" (source should automatically be flatpak)
* once installed, click "Open" to run Drive and set it up

Don't forget to regularly run `flatpak update` in the CLI as otherwise Drive will not be updated (regular `zypper up` does _not_ update flatpaks!).

## Converting the official package
Synology does provide a DEB package (labeled as the version for Ubuntu) for Synology Drive on its official website: 
https://www.synology.com/en-global/dsm/feature/drive

You can download the DEB file from there and then convert it to an RPM package using alien following this guidance (thanks to palmstrom in the Synology community):
https://community.synology.com/enu/forum/1/post/121686?reply=399777

**Note that in this approach, you don't have to trust a community but you will have to manually build package updates if updating Drive directly does not work, so in this sense YOU are responsible for security updates!**

Just in case the forum post is deleted, here is what I did:
1. run `sudo alien --to-rpm -vv <insert path to Synology drive client DEB that you downloaded here>`
2. run `sudo rpm -ivh <insert name of RPM you built in step 1 (see output) here> --nodeps`
3. run `sudo ln -s /usr/lib/nautilus/extensions-3.0/libnautilus-drive-extension.so /usr/lib64/nautilus/extensions-3.0/`
4. using the achive utility in the file explorer, upack the DEB file and unpack the archive named "control" inside of it
5. navigate to the directory that contains the content of "control" unpacked in step 4
6. run `sudo sh ./preinst install`
7. run `sudo sh ./postinst configure`
8. from the application menu in OpenSuse (i.e. hitting the Windows button), select Synology Drive and start it in order to configure your connection

