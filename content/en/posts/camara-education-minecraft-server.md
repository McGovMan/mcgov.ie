+++ 
draft = false
date = "2020-05-19"
title = "Camara Education: Minecraft Server"
description = ""
slug = ""
authors = ["Conor Mc Govern"]
tags = ["CAMARA", "CompSoc", "Minecraft", "System Administration"]
categories = ["CompSoc"]
externalLink = ""
series = []
+++

Eddie Quinn from Camara Ireland messaged the CompSoc Discord. Below is what he said:

> Hey everyone, I'm not a student in NUI but iv been working with ye for a few years a link person to the Youth Work community. I was wondering if I could chat to someone about setting up a Minecraft server. I work as a STEAM Educator at the moment and i think itd be cool if I could get my employer to pay for the set up and then allow youth workers and young people to interact on Minecraft. At the very least it'll give them a brilliant and fun tool to use to engage young people and hopefully after this whole lockdown it'll allow young people who are intimidated by the club for one reason or another to still get the benefit of contact with a youth worker without leaving their comfort zone.  
> Biggest obstacle at the moment is that youth workers are intimidated by online games because of the media fear mongering. If I can get my organisation to host then we can guarantee that only young people and adults with Garda Clearance can be online together.  
> I havent palyed Monecraft since the good old tekkit days so if you have any ideas id love to hear them too.  
> Im also looking at setting up a besiege tournament for young people too.  
> None of this is for profit. Its all just a way to help young people express themselves and get in contact with a trained professional if they so wish.
> 
> <cite>Eddie Quinn 18/05/20</cite>

This sounded incredibly interesting to me. Making a Minecraft server for children to specifically reach out to a youth worker or interact with one.

Currently I don't actually know if we have the resources to give them their own virtual machine so I am going to run their Minecraft server on Itchy, our own games server. I should be able to setup a separate user account so that they can access their own files and manage their own server rather than it being thrown in with ours.

Making the actual Minecraft server actually wasn't that hard, just have to open up a port to the world and run it through that port. We've had to enable whitelisting as only people they want should have the ability to join the server. Currently talking to Eddit about Garda Vetting and making sure we are above board on it.