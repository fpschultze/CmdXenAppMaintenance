# CmdXenAppMaintenance
Script framework to automate xenapp server maintenance

Back in 2011, I developed a bunch of batch files that build a simple script framework for automated XenApp hotfix installation. My goals were to build a solution that supports the broadest range of XenApp farms as possible on the one hand and to build a "learning" framework that identifies new hotfixes in the source folder tree on its own (and releases the admin from the challenge to script). Therefore I chose Batch scripting and ini files instead of PowerShell and XML. Furthermore my solution either relies on MFCOM (API for legacy XenApp before version 6) nor it uses XenApp PowerShell Cmdlets. It just leverages cmd.exe and some standard commands that you find on every Windows Server with Terminal Services or Remote Desktop Services. In short, the XenApp hotfix deployment framework is designed to update XenApp 4.5/5.0/6.0/6.5 on Windows Server 2003/2003 R2/2008/2008 R2.


Read more: http://www.out-web.net/?p=1212

Disclaimer: I hope that the information in this post is valuable to you. Your use of the information contained in this post, however, is at your sole risk. All information on this post is provided “as is”, without any warranty, whether express or implied, of its accuracy, completeness, fitness for a particular purpose, title or non-infringement, and none of the third-party products or information mentioned in the work are authored, recommended, supported or guaranteed by me. Further, I shall not be liable for any damages you may sustain by using this information, whether direct, indirect, special, incidental or consequential, even if it has been advised of the possibility of such damages
