<h1><img src="resources/icon.png"/> F.lux</h1>

older version, not portable, just the binary (exe) files required,
with the embedded manifest.

Installed by default under <code>%USERPROFILE%\AppData\Local\Apps\F.lux</code>,
it does not require admin rights but nor a <a href="resources/allow%20monitor%20color%20correction%20below%203400k.reg">registry patch to allow lower than 3400k color correction</a>,
but it still can be useful. there are some limitations on gamma-changing programs,
which are lifted if the program runs with admin rights or from a safe location (profile folder),
I've included a required manifest for admin rights, so set the compatibility to run as admin (and include the registry color-fix) to allow it to run from anywhere,
you still need the registry values though...

for blocking internet access you can use those hosts in your HOSTS file:
<pre>
#---------------------------------- F.lux
0.0.0.0 forum.stereopsis.com
0.0.0.0 www.stereopsis.com
0.0.0.0 stereopsis.com
0.0.0.0 update.stereopsis.com
0.0.0.0 fluxupdate.stereopsis.com
0.0.0.0 justgetflux.com
0.0.0.0 forum.justgetflux.com
0.0.0.0 update.justgetflux.com
0.0.0.0 www.justgetflux.com
</pre>

its registry values are stored in <code>HKEY_CURRENT_USER\Software\Flux</code> and <code>HKEY_CURRENT_USER\Software\Michael Herf</code> by default,
all the registry values installed (example) can be seen in: <a href="resources/all_registry_values.reg">all_registry_values.reg</a>, this includes your geo-location.
