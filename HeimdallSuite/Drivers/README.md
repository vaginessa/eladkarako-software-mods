the heimdall suite from: https://glassechidna.com.au/heimdall/ (<code>https://bitbucket.org/benjamin_dobell/heimdall/downloads/heimdall-suite-1.4.0-win32.zip</code>)
came with version 2.0.0 which is quite old,
according to https://github.com/pbatard/libwdi/blob/master/examples/zadig_README.creole
it is better to download/use the latest version (currently 2.3) from https://zadig.akeo.ie/downloads/
unless you're using Windows XP, in which case version 2.2 is the last one to support it.

<hr/>

the old version (2.0.0, 2.2.0) might work with the ini-file,
allowing 'some' configuration stored 'portable'-ly,
but mostly the values will be stored in the registry, under <code>HKEY_CURRENT_USER\Software\Akeo Consulting\Zadig\</code>.

running <code>_disable_online_updates.reg</code> before first run will make the program avoid online access,
to be sure of that you may block its online-access with your HOSTS file:

<pre>
#--------------------------blocking zadig online access.
0.0.0.0 zadig.akeo.ie
0.0.0.0 libwdi-cps.akeo.ie
0.0.0.0 libusb-win32.sourceforge.net
0.0.0.0 libwdi.akeo.ie
0.0.0.0 libusb.org
0.0.0.0 glassechidna.com.au
0.0.0.0 www.glassechidna.com.au
</pre>

<hr/>

the folder contain all the 3 versions (2.0 which came with the project originally, 2.2 for XP and 2.3),
all slightly modified, un<a href="https://en.wikipedia.org/wiki/UPX">UPX</a> and with a better manifest for Windows 10 support.

choose your version and rename/copy it to <code>zadig.exe</code>, currently it's the 2.3 version.

<hr/>

make sure to right click it and run it as an administrator.