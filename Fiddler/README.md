<h1><img src="resources/icon.png"/> Fiddler</h1>

How to use:
<ol>
<li>Get the Fiddler setup,

either from this archive:
<table>
<thead>
  <tr><td>File</td><td>Size</td><td>Version</td><td>Last Modified</td></tr>
</thead>
<tbody>
  <tr><td><a href="https://raw.githubusercontent.com/eladkarako/mods/master/Fiddler/resources/FiddlerSetup_2.6.3.48898.exe"                     >FiddlerSetup_2.6.3.48898.exe</a>                     </td><td>1.65MB</td><td>v2.6.3.48898                              </td><td>February 7<sup><em>th</em></sup>, 2017 - 10:32AM.  </td></tr>
  <tr><td><a href="https://raw.githubusercontent.com/eladkarako/mods/master/Fiddler/resources/FiddlerSetup_4.6.20173.38786.exe"                 >FiddlerSetup_4.6.20173.38786.exe</a>                 </td><td>2.43MB</td><td>v4.6.20173.38786                          </td><td>September 15<sup><em>th</em></sup>, 2017 - 5:48PM. </td></tr>
  <tr><td><a href="https://raw.githubusercontent.com/eladkarako/mods/master/Fiddler/resources/FiddlerSetup_5.0.20181.14850__forDotNet4.5.exe"   >FiddlerSetup_5.0.20181.14850__forDotNet4.5.exe</a>   </td><td>2.97MB</td><td>5.0.20181.14850 For .Net Framework 4.5    </td><td>Merch 20<sup><em>th</em></sup>, 2018 - 3:45PM.     </td></tr>
  <tr><td><a href="https://raw.githubusercontent.com/eladkarako/mods/master/Fiddler/resources/FiddlerSetup_5.0.20181.14850__forDotNet4.6.1.exe" >FiddlerSetup_5.0.20181.14850__forDotNet4.6.1.exe</a> </td><td>2.97MB</td><td>5.0.20181.14850 For .Net Framework 4.6.1  </td><td>Merch 20<sup><em>th</em></sup>, 2018 - 3:45PM.     </td></tr>
</tbody>
</table>

Or by following those links <strong>(may be slow)</strong>:
<ul>
<li>
<a href="https://telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe">telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe</a>
</li>
<li>
<a href="https://www.telerik.com/docs/default-source/fiddler/fiddlersetup.exe?sfvrsn=4">telerik.com/docs/default-source/fiddler/fiddlersetup.exe?sfvrsn=4</a></li>
</ul>


You may also workaround the DNS-resolve process in-case you've already blocked the domains by using <a href="https://raw.githubusercontent.com/eladkarako/mods/master/Fiddler/resources/updater.cmd">updater.cmd</a>,
or running <code>call curl.exe --verbose --ipv4 --anyauth --insecure --location-trusted --url "https://telerik-fiddler.s3.amazonaws.com/fiddler/FiddlerSetup.exe" --output "FiddlerSetup.exe" --resolve "telerik-fiddler.s3.amazonaws.com:443:52.216.160.107" --resolve "telerik-fiddler.s3.amazonaws.com:80:52.216.160.107"</code> yourself.

<br/>
The <code>FiddlerSetup.exe</code> is an archive,<br/>
usually holding couple of setups inside,<br/>
on the older versions it included v2 and v4, prefering v4 unless there was no .Net 4 available on the machine.<br/>
Current-versions includes just two versions of v5, depanding if your machine have .Net 4.5 or the newer 4.6.1.<br/>

To install your prefered version,
use <a href="https://github.com/eladkarako/mods/tree/master/7z">7Zip</a> and open-up <code>FiddlerSetup.exe</code>,
extracting your prefered version. <sub>*It might be a little tricky to find-out.</sub>
</li>
<li>Add the following blocking rules to your HOSTS-file:

<pre>
0.0.0.0 0.9.am.eqatec.com
0.0.0.0 0ngk6wviv7u64k49.cname.platform.telerik.com
0.0.0.0 1fc66e376eaf4032b374e7b60fbd25ea.e.a.am.eqatec.com
0.0.0.0 7efcf298169c4f4dac056e8263bc279f.9.f.am.eqatec.com
0.0.0.0 9.f.am.eqatec.com
0.0.0.0 9d659d3f069843668016edba84744109.0.9.am.eqatec.com
0.0.0.0 11eea703297342a5957f1ae8fabcdda8.a.8.am.eqatec.com
0.0.0.0 24ad0fd84dfc436cac6d14bc7b0b81e5.e.5.am.eqatec.com
0.0.0.0 39eb37a5753d419695c678a439f20ca5.a.5.am.eqatec.com
0.0.0.0 727c3541bbfd47baa93302a447651c6c.6.c.am.eqatec.com
0.0.0.0 881a1e25ef374b5197c567951ba152a1.a.1.am.eqatec.com
0.0.0.0 41925e2602934419b5b8ebb708f577dd.d.d.am.eqatec.com
0.0.0.0 218079b8a24f45aab445c2e8b8aae966.6.6.am.eqatec.com
0.0.0.0 298668311d19459fbabbb7dd8da3a0c3.c.3.am.eqatec.com
0.0.0.0 7520015365784219824a9cf161918145.4.5.am.eqatec.com
0.0.0.0 a.5.am.eqatec.com
0.0.0.0 a.8.am.eqatec.com
0.0.0.0 a.am.eqatec.com
0.0.0.0 academy.telerik.com
0.0.0.0 algoacademy.telerik.com
0.0.0.0 am.eqatec.com
0.0.0.0 analytics.eqatec.com
0.0.0.0 analytics.telerik.com
0.0.0.0 analytics-monitor.eqatec.com
0.0.0.0 android-testing.com
0.0.0.0 api.eqatec.com
0.0.0.0 app.eqatec.com
0.0.0.0 artoftest.com
0.0.0.0 aspnet-scripts.telerikstatic.com
0.0.0.0 aspnet-skins.telerikstatic.com
0.0.0.0 b98311ccf4174614a180cf3f5a376042.4.2.am.eqatec.com
0.0.0.0 betas.telerik.com
0.0.0.0 blogs.telerik.com
0.0.0.0 bower.telerik.com
0.0.0.0 bs1.cdn.telerik.com
0.0.0.0 bs-static.cdn.telerik.com
0.0.0.0 campaigns.telerik.com
0.0.0.0 cdn.kendostatic.com
0.0.0.0 cdn.kendouimobile.com
0.0.0.0 cdn.telerik.com
0.0.0.0 click.telerik.com
0.0.0.0 cname.platform.telerik.com
0.0.0.0 competition.telerik.com
0.0.0.0 converter.telerik.com
0.0.0.0 csharpfundamentals.telerik.com
0.0.0.0 d.am.eqatec.com
0.0.0.0 d.d.am.eqatec.com
0.0.0.0 demos.telerik.com
0.0.0.0 developer.telerik.com
0.0.0.0 devreach.com
0.0.0.0 df0a26c202ba4b06b109a6af47119b6c.6.c.am.eqatec.com
0.0.0.0 digest.telerik.com
0.0.0.0 dl.telerik.com
0.0.0.0 dle.telerik.com
0.0.0.0 docs.telerik.com
0.0.0.0 documentation.telerik.com
0.0.0.0 dojo.telerik.com
0.0.0.0 downloads.academy.telerik.com
0.0.0.0 downloads.cdn.telerik.com
0.0.0.0 dscmig001.com
0.0.0.0 e.5.am.eqatec.com
0.0.0.0 e.a.am.eqatec.com
0.0.0.0 e9e15233b42d484786c4cbee7ef84bd7.d.7.am.eqatec.com
0.0.0.0 ebc8bc47577b4a25b999412e603588e1.e.1.am.eqatec.com
0.0.0.0 emarketing.telerik.com
0.0.0.0 eqatec.com
0.0.0.0 esitefinity.com
0.0.0.0 f633825d19644e418381f8e66c231b31.3.1.am.eqatec.com
0.0.0.0 feedback.telerik.com
0.0.0.0 feeds.telerik.com
0.0.0.0 fiddler.com
0.0.0.0 fiddler2.com
0.0.0.0 fiddlercap.com
0.0.0.0 fiddlertool.com
0.0.0.0 forum.eqatec.com
0.0.0.0 forums.academy.telerik.com
0.0.0.0 frontendcourse.telerik.com
0.0.0.0 ftpeu.telerik.com
0.0.0.0 get.telerik.com
0.0.0.0 getfiddler.com
0.0.0.0 help.telerik.com
0.0.0.0 html5course.telerik.com
0.0.0.0 identity.telerik.com
0.0.0.0 image.telerik.com
0.0.0.0 info.telerik.com
0.0.0.0 iphone-testing.com
0.0.0.0 justcode.telerik.com
0.0.0.0 justdecompile.telerik.com
0.0.0.0 justmock.telerik.com
0.0.0.0 justtrace.telerik.com
0.0.0.0 kendo.cdn.telerik.com
0.0.0.0 kendodataviz.com
0.0.0.0 kendostatic.com
0.0.0.0 kendoui-feedback.telerik.com
0.0.0.0 kendoui-labs.telerik.com
0.0.0.0 kendouimobile.com
0.0.0.0 kendoui-themebuilder.telerik.com
0.0.0.0 mail.vanatec.com
0.0.0.0 mailbg.artoftest.com
0.0.0.0 marketplace.telerik.com
0.0.0.0 minifier.telerik.com
0.0.0.0 mobile-app-testing.com
0.0.0.0 mobiletesting.telerik.com
0.0.0.0 mono.telerik.com
0.0.0.0 mxbg.esitefinity.com
0.0.0.0 my.telerik.com
0.0.0.0 mytelerik.com
0.0.0.0 ngmigrate.telerik.com
0.0.0.0 nuget.telerik.com
0.0.0.0 olapdemo.telerik.com
0.0.0.0 origin.kendostatic.com
0.0.0.0 origin.kendouimobile.com
0.0.0.0 partners.telerik.com
0.0.0.0 platform.telerik.com
0.0.0.0 plugins.telerik.com
0.0.0.0 radrotator.net
0.0.0.0 registry.npm.telerik.com
0.0.0.0 sharepoint.telerik.com
0.0.0.0 skinsassemblybuilder.telerik.com
0.0.0.0 smtpoutusrs01.telerik.com
0.0.0.0 sso.telerik.com
0.0.0.0 start-mapping.net
0.0.0.0 status.telerik.com
0.0.0.0 stop-hacking.com
0.0.0.0 stop-hacking.info
0.0.0.0 stylebuilder.telerik.com
0.0.0.0 support.telerik.com
0.0.0.0 survey.telerik.com
0.0.0.0 tap.cdn.telerik.com
0.0.0.0 telerik.ag
0.0.0.0 telerik.com
0.0.0.0 telerik.com.ag
0.0.0.0 telerik.org
0.0.0.0 telerik.us
0.0.0.0 telerik.vg
0.0.0.0 telerikspace.com
0.0.0.0 telerikstatic.com
0.0.0.0 tfis.telerik.com
0.0.0.0 themebuilder.telerik.com
0.0.0.0 tools.eqatec.com
0.0.0.0 tpdogfood.telerik.com
0.0.0.0 trykendoui.telerik.com
0.0.0.0 tv.telerik.com
0.0.0.0 vanatec.info
0.0.0.0 vanatec.net
0.0.0.0 webvpn.telerik.com
0.0.0.0 wwwuat.telerik.com
0.0.0.0 www.0.9.am.eqatec.com
0.0.0.0 www.0ngk6wviv7u64k49.cname.platform.telerik.com
0.0.0.0 www.1fc66e376eaf4032b374e7b60fbd25ea.e.a.am.eqatec.com
0.0.0.0 www.7efcf298169c4f4dac056e8263bc279f.9.f.am.eqatec.com
0.0.0.0 www.9.f.am.eqatec.com
0.0.0.0 www.9d659d3f069843668016edba84744109.0.9.am.eqatec.com
0.0.0.0 www.11eea703297342a5957f1ae8fabcdda8.a.8.am.eqatec.com
0.0.0.0 www.24ad0fd84dfc436cac6d14bc7b0b81e5.e.5.am.eqatec.com
0.0.0.0 www.39eb37a5753d419695c678a439f20ca5.a.5.am.eqatec.com
0.0.0.0 www.727c3541bbfd47baa93302a447651c6c.6.c.am.eqatec.com
0.0.0.0 www.881a1e25ef374b5197c567951ba152a1.a.1.am.eqatec.com
0.0.0.0 www.41925e2602934419b5b8ebb708f577dd.d.d.am.eqatec.com
0.0.0.0 www.218079b8a24f45aab445c2e8b8aae966.6.6.am.eqatec.com
0.0.0.0 www.298668311d19459fbabbb7dd8da3a0c3.c.3.am.eqatec.com
0.0.0.0 www.7520015365784219824a9cf161918145.4.5.am.eqatec.com
0.0.0.0 www.a.5.am.eqatec.com
0.0.0.0 www.a.8.am.eqatec.com
0.0.0.0 www.a.am.eqatec.com
0.0.0.0 www.academy.telerik.com
0.0.0.0 www.algoacademy.telerik.com
0.0.0.0 www.am.eqatec.com
0.0.0.0 www.analytics.eqatec.com
0.0.0.0 www.analytics.telerik.com
0.0.0.0 www.analytics-monitor.eqatec.com
0.0.0.0 www.android-testing.com
0.0.0.0 www.api.eqatec.com
0.0.0.0 www.app.eqatec.com
0.0.0.0 www.artoftest.com
0.0.0.0 www.aspnet-scripts.telerikstatic.com
0.0.0.0 www.aspnet-skins.telerikstatic.com
0.0.0.0 www.b98311ccf4174614a180cf3f5a376042.4.2.am.eqatec.com
0.0.0.0 www.betas.telerik.com
0.0.0.0 www.blogs.telerik.com
0.0.0.0 www.bower.telerik.com
0.0.0.0 www.bs1.cdn.telerik.com
0.0.0.0 www.bs-static.cdn.telerik.com
0.0.0.0 www.campaigns.telerik.com
0.0.0.0 www.cdn.kendostatic.com
0.0.0.0 www.cdn.kendouimobile.com
0.0.0.0 www.cdn.telerik.com
0.0.0.0 www.click.telerik.com
0.0.0.0 www.cname.platform.telerik.com
0.0.0.0 www.competition.telerik.com
0.0.0.0 www.converter.telerik.com
0.0.0.0 www.csharpfundamentals.telerik.com
0.0.0.0 www.d.am.eqatec.com
0.0.0.0 www.d.d.am.eqatec.com
0.0.0.0 www.demos.telerik.com
0.0.0.0 www.developer.telerik.com
0.0.0.0 www.devreach.com
0.0.0.0 www.df0a26c202ba4b06b109a6af47119b6c.6.c.am.eqatec.com
0.0.0.0 www.digest.telerik.com
0.0.0.0 www.dl.telerik.com
0.0.0.0 www.dle.telerik.com
0.0.0.0 www.docs.telerik.com
0.0.0.0 www.documentation.telerik.com
0.0.0.0 www.dojo.telerik.com
0.0.0.0 www.downloads.academy.telerik.com
0.0.0.0 www.downloads.cdn.telerik.com
0.0.0.0 www.dscmig001.com
0.0.0.0 www.e.5.am.eqatec.com
0.0.0.0 www.e.a.am.eqatec.com
0.0.0.0 www.e9e15233b42d484786c4cbee7ef84bd7.d.7.am.eqatec.com
0.0.0.0 www.ebc8bc47577b4a25b999412e603588e1.e.1.am.eqatec.com
0.0.0.0 www.emarketing.telerik.com
0.0.0.0 www.eqatec.com
0.0.0.0 www.esitefinity.com
0.0.0.0 www.f633825d19644e418381f8e66c231b31.3.1.am.eqatec.com
0.0.0.0 www.feedback.telerik.com
0.0.0.0 www.feeds.telerik.com
0.0.0.0 www.fiddler.com
0.0.0.0 www.fiddler2.com
0.0.0.0 www.fiddlercap.com
0.0.0.0 www.fiddlertool.com
0.0.0.0 www.forum.eqatec.com
0.0.0.0 www.forums.academy.telerik.com
0.0.0.0 www.frontendcourse.telerik.com
0.0.0.0 www.ftpeu.telerik.com
0.0.0.0 www.get.telerik.com
0.0.0.0 www.getfiddler.com
0.0.0.0 www.help.telerik.com
0.0.0.0 www.html5course.telerik.com
0.0.0.0 www.identity.telerik.com
0.0.0.0 www.image.telerik.com
0.0.0.0 www.info.telerik.com
0.0.0.0 www.iphone-testing.com
0.0.0.0 www.justcode.telerik.com
0.0.0.0 www.justdecompile.telerik.com
0.0.0.0 www.justmock.telerik.com
0.0.0.0 www.justtrace.telerik.com
0.0.0.0 www.kendo.cdn.telerik.com
0.0.0.0 www.kendodataviz.com
0.0.0.0 www.kendostatic.com
0.0.0.0 www.kendoui-feedback.telerik.com
0.0.0.0 www.kendoui-labs.telerik.com
0.0.0.0 www.kendouimobile.com
0.0.0.0 www.kendoui-themebuilder.telerik.com
0.0.0.0 www.mail.vanatec.com
0.0.0.0 www.mailbg.artoftest.com
0.0.0.0 www.marketplace.telerik.com
0.0.0.0 www.minifier.telerik.com
0.0.0.0 www.mobile-app-testing.com
0.0.0.0 www.mobiletesting.telerik.com
0.0.0.0 www.mono.telerik.com
0.0.0.0 www.mxbg.esitefinity.com
0.0.0.0 www.my.telerik.com
0.0.0.0 www.mytelerik.com
0.0.0.0 www.ngmigrate.telerik.com
0.0.0.0 www.nuget.telerik.com
0.0.0.0 www.olapdemo.telerik.com
0.0.0.0 www.origin.kendostatic.com
0.0.0.0 www.origin.kendouimobile.com
0.0.0.0 www.partners.telerik.com
0.0.0.0 www.platform.telerik.com
0.0.0.0 www.plugins.telerik.com
0.0.0.0 www.radrotator.net
0.0.0.0 www.registry.npm.telerik.com
0.0.0.0 www.sharepoint.telerik.com
0.0.0.0 www.skinsassemblybuilder.telerik.com
0.0.0.0 www.smtpoutusrs01.telerik.com
0.0.0.0 www.sso.telerik.com
0.0.0.0 www.start-mapping.net
0.0.0.0 www.status.telerik.com
0.0.0.0 www.stop-hacking.com
0.0.0.0 www.stop-hacking.info
0.0.0.0 www.stylebuilder.telerik.com
0.0.0.0 www.support.telerik.com
0.0.0.0 www.survey.telerik.com
0.0.0.0 www.tap.cdn.telerik.com
0.0.0.0 www.telerik.ag
0.0.0.0 telerik-fiddler.s3.amazonaws.com
0.0.0.0 www.telerik.com.ag
0.0.0.0 www.telerik.org
0.0.0.0 www.telerik.us
0.0.0.0 www.telerik.vg
0.0.0.0 www.telerikspace.com
0.0.0.0 www.telerikstatic.com
0.0.0.0 www.tfis.telerik.com
0.0.0.0 www.themebuilder.telerik.com
0.0.0.0 www.tools.eqatec.com
0.0.0.0 www.tpdogfood.telerik.com
0.0.0.0 www.trykendoui.telerik.com
0.0.0.0 www.tv.telerik.com
0.0.0.0 www.vanatec.info
0.0.0.0 www.vanatec.net
0.0.0.0 www.webvpn.telerik.com
0.0.0.0 www.wwwuat.telerik.com
</pre>
</li>

<li>
Run and finish installation process,
close down fiddler.

If you wish to explicit tell the setup-program where to install the file,
specify it with something like that: <code>FiddlerSetup.exe /D=C:\Program Files (x86)\Fiddler</code>,
you should run it from CMD to help addressing the extra-spaces (don't use any inverted-commas).
</li>

<li>
Copy all of the manifest files to the installation folder,
depanding on the version installed it can be either
  <ul>
    <li><code>%LocalAppData%\Programs\Fiddler\</code></li>
    <li><code>C:\Program Files\Fiddler2</code></li>
    <li><code>C:\Program Files (x86)\Fiddler2</code></li>
  </ul>

Apply <a href="https://gist.github.com/eladkarako/d24d5ed3c917ef230b0fc990104f9fe6#file-manifest-prefer-external-side-by-side-file-over-internal-resource-reg">manifest - prefer external side-by-side file over internal-resource.reg</a> and reboot your machine.
</li>

<li>
For each exe-file in the folder, 
right click, choose properties, 
make sure the "unblock" button is disabled (otherwise click it once), 
switch to the compatibility-tab and check-ON "Run this program as an administrator",
click "Change settings for all users", and again check-ON "Run this program as an administrator",
click OK twice closing the dialog.

<img src="resources/1.gif" /><br/>
<img src="resources/2.gif" /><br/>
<img src="resources/3.gif" /><br/>
</li>

<li>
Delete <code>Geoedge.dll</code> from the folder <code>Scripts\</code>.
</li>

<li>
Run fiddler.exe
</li>

<li>
If you've got <code>Get /Book</code> menu-item, click it and select "hide this menu".
</li>

<li>
<pre>
Menu: - Tools, Options.
  TAB "General"
    uncheck <code>Notify me for updates on startup</code>.
    uncheck <code>Offer upgrade to Beta versions</code>.
    uncheck <code>Enable IPv6 (if available)</code>.
    uncheck <code>Participate in the Fiddler Improvement Program</code>.
    check ON: <code>Enable high-resolution timers</code>.
    check ON: <code>Automatically stream audio &amp; video</code>.

  TAB "HTTPS"
    check ON all tabs (allow certificate installation).
    uncheck <code>Check for certificate revocation</code>.
    click the "Protocols" link and set it to: <code><client>;ssl2;ssl3;tls1.0;tls1.1;tls1.2</code>.
    click the "Actions" button on the right and select: <code>Reset All Certificates</code> (click "Allow" for opened dialogs) - this will ensure fresh certificates when upgrading versions.
    
  TAB "Connections"
    check ON <code>Capture FTP requests</code>.
    check ON <code>Allow remote computers to connect</code>.
    check ON <code>Use PAC Script</code> - will fix some connections not shown.

  TAB "Appearance"
    check ON <code>Always show tray icon</code>.

  TAB "Scripting"
    set <code>Language</code> to <code>C#</code>.

  TAB "Performance"
    check ON <code>Run Fiddler at AboveNormal Priority</code>.

  TAB "Tools"
    set <code>Text Editor</code> to <strong>Notepad++</strong>'s exe (for example - <code>D:\Software\Notepad++\notepad++.exe</code>).
    set <code>File Diff Tool</code> to <strong>Beyond Compare</strong>'s exe (for example - <code>C:\Program Files (x86)\Beyond Compare 3\BCompare.exe</code>).
</pre>

Click OK to close the Options dialog,
close down Fiddler and re-open it again.
</li>

<li>
Open your Firefox (not required for Google-Chrome/Chromium), 
open up the options section, on newer version you can visit <code>about:preferences#privacy</code>.
Get to the certificate-manager, "Authorities", and start typing "DO_NOT",
delete all <code>DO_NOT_TRUST_FiddlerRoot</code> certificates.
browse <code>localhost:8888</code>, 
click the <code>FiddlerRoot certificate</code> link (or click here: <a href="http://localhost:8888/FiddlerRoot.cer">http://localhost:8888/FiddlerRoot.cer</a>).
check ON all the check-marks and click OK.

All other browsers are using the PCs own certificate "trust"-engine,
if you have other Mozilla products you may want to try this for them too,
otherwise you won't be able to process or have ANY SSL-secure connection while Fiddler is open.
</li>

<li>
On <code>Rules</code> menu-item, check ON: <code>hide CONNECTs</code>
</li>

<li>
Open script-editor (CTRL+R)
right after <code>OnBeforeResponse</code>
add the following method
</li>



<li>
Avoid the "statistics" panel from being shown, 
set "headers" section by default: 

use CTRL+R to open the script editor, and add/modify this function:<br/>

<pre>
public static void OnBoot(){
  FiddlerApplication.UI.actUpdateInspector(true,true);
  FiddlerApplication.UI.ActivateRequestInspector("HEADERS");
  FiddlerApplication.UI.ActivateResponseInspector("HEADERS");
}
</pre>

if you're using Fiddler ver2 (older then 4.1), 
you should use <code>UI.</code> and not <code>FiddlerApplication.UI.</code>.
</li>
</ol>