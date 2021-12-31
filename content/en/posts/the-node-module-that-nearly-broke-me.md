+++ 
draft = false
date = "2020-05-23"
title = "The node module that nearly broke me"
description = ""
slug = ""
authors = ["Conor Mc Govern"]
tags = ["CompSoc", "howto", "javascript", "LDAP", "NodeJS", "tutorial"]
categories = ["CompSoc", "HowTo"]
externalLink = ""
series = []
translationKey = "the-node-module-that-nearly-broke-me"
+++

LDAP has always been one of those services I really struggled with. Having been developed in 1993 has definitely aged but is so powerful it has stood up against the test of time and aged well. The last few days I have been wrestling with a node module called [LDAPJS](http://ldapjs.org/) It can be used to create a SLAPD server in Node or can be used to as a client to query an existing SLAPD server; this is what I wanted to do.

I need/needed a way to check that an account exists in our directory. Usually in bash this is done by using ldapsearch and I did find a module that seemed to be the Node equivalent [simple-ldap-search](https://github.com/jxjj/simple-ldap-search). I tried to use it but found that the documentation was lacking and I had seen that it was actually just a wrapper on top of LDAPJS and that's where my painful adventure started.

Don't get me wrong but has documentation that I found was as easy to read as a MAN page, but that's probably just me. That's why I wanted to write this, to shed some light on how I actually went about implementing it. Of course all of the code can be found at [this](https://github.com/McGovMan/CompSocAccountManagement) repository anyway.

## Getting started

You'll need this to get started. We're just imported LDAPJS and then creating a client variable that we can use to access methods such as add, modify, search. Note, the TLS options are only necessary if you're planning to run over ldaps:// (the secure method), else you'll be running on ldap:// and port 389.

    var ldap = require('ldapjs'); var client = ldap.createClient({ url: 'ldaps://ldap.example.com:636', reconnect: true, tlsOptions: { host: 'ldap.example.com', port: '636', ca: [fs.readFileSync(.../cert.ca)] } });

The next this to do is create your connection that you can query over using bind(). Just give it an account that can scan the directory and it's password (I'm sure I don't to tell you to not put the password in plaintext in the function).

    client.bind('cn=admin,dc=example.com', 'password', function(err) { if (err) console.log(err); });

Now we can go and make a query on the directory using search. We do need to give a good few more options but some of them can be left out.

First off, the search options.

*   Scope defines from where LDAPJS should consider entries to count, for example: if we want to scan for accounts under ou=users and not accounts under ou=users and in-line in with ou=people; sub just means it scans for entries under the search base defined.
*   Filter defines what the entries have to have to be counted and returned.
*   Attributes allows us to decide what details are returned for SLAPD, for example: we can return the accounts ID, UID, GID, firstname, lastname, you get the gist.

Within the search function we pass in 3 arguments. The search base, DN and search options I mentioned. The entry will be given in res.on('searchEntry'... and accessible via entry.

    var searchOptions = { scope: 'sub', filter: '(uid=conor)', attributes: ['uid'] } client.search(ou=users, dc=example.com, searchOptions, function(err, res) { if (err) { console.log('Error occurred while ldap search'); } else { res.on('searchEntry', function (entry) { // If the member exists in ldap with that username if (entry.object) console.log(member.MemberID + " Exists"); return true; }); // Returns long log on the connection res.on('end', function (result) { console.log('Result is', result); }); } // Member is not in LDAP return false; });

Then don't forget to unbind!

    client.unbind(function(err) { if (err) console.log(err); });

It may not seem it but that took me a few hours to get my head around. I'm glad I stuck at it though because now I have a really good understanding of how LDAP actually communicates. I'm thinking about what else I can use with it.. maybe a discord bot? Stay tuned for more!